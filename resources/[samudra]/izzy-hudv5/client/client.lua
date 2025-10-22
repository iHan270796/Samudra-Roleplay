-- Main client-side HUD functionality
-- Handles initialization, status updates, and UI management

-- Math function aliases for cleaner code
local mathFloor = math.floor
local mathRandom = math.random
local mathCeil = math.ceil
local mathRound = math.round

-- Global state management
current = {
    initialized = false,
    inVehicle = false,
    settings = {},
    stress = 0,
    sound = nil,
    screen = { x = 0, y = 0 }
}

-- Send message to React UI
function SendReactMessage(action, data)
    SendNUIMessage({
        action = action,
        data = data
    })
end

-- Initialize HUD system
function initialize()
    Wait(1000)
    
    -- Set screen resolution
    local resolutionX, resolutionY = GetActiveScreenResolution()
    current.screen.x = resolutionX
    current.screen.y = resolutionY
    
    izzy.debug("Langs initializing!")
    SendReactMessage("setLang", cfg.locales[cfg.locale])
    izzy.debug("Langs initialized!")
    
    Wait(100)
    izzy.debug("Server details and player settings initializing!")
    
    -- Load player settings
    local settings = cfg.defaultSettings
    local savedSettings = GetResourceKvpString("settings")
    if savedSettings then
        local decodedSettings = json.decode(savedSettings)
        if decodedSettings then
            settings = decodedSettings
        end
    end
    
    -- Initialize status colors if using default settings
    if not savedSettings then
        for _, status in pairs(cfg.status) do
            settings.statusColors[status.name] = {
                primary = cfg.colors[status.color] and cfg.colors[status.color].primary or "#FFFFFF",
                secondary = cfg.colors[status.color] and cfg.colors[status.color].secondary or "#FFFFFF"
            }
        end
    end
    
    -- Send server data to UI
    SendReactMessage("setData", {
        serverName = cfg.serverName,
        serverDesc = cfg.serverDesc,
        colors = cfg.colors,
        notifyColors = cfg.notifyColors,
        notifyPosition = cfg.notifyPosition,
        useMinimapBorder = cfg.useMinimapBorder,
        showLocation = cfg.showLocation,
        showCompass = cfg.showCompass,
        showTopInfos = cfg.showTopInfos
    })
    
    Wait(500)
    current.settings = settings
    Wait(500)
    SendReactMessage("setData", settings)
    
    izzy.debug("Server details and player settings initialized!")
    Wait(100)
    current.initialized = true
    SendReactMessage("setDisplay", current.initialized)
    Wait(100)
    
    -- Initialize status values
    izzy.debug("Status initializing!")
    for i = 1, #cfg.status do
        cfg.status[i].value = getStatus(cfg.status[i].name)
    end
    SendReactMessage("setStatus", cfg.status)
    izzy.debug("Status initialized!")
    
    Wait(100)
    izzy.debug("Top infos initializing!")
    for i = 1, #cfg.topInfos do
        cfg.topInfos[i] = getTopInfo(cfg.topInfos[i])
    end
    SendReactMessage("setTopInfos", cfg.topInfos)
    izzy.debug("Top infos initialized!")
    
    Wait(100)
    map(current.settings.mapStyle)
    
    -- Get initial stress level
    izzy.triggerCallback("izzy-hudv5:getStress", function(stress)
        current.stress = stress
    end)
end

-- Unload HUD data
function unloadData()
    current.initialized = false
    SendReactMessage("setDisplay", current.initialized)
    DisplayRadar(0)
end

-- Main status update thread
CreateThread(function()
    SetNuiFocus(false)
    DisplayRadar(0)
    
    while true do
        if current.initialized then
            local playerPed = PlayerPedId()
            local selectedWeapon = GetSelectedPedWeapon(playerPed)
            local voiceState = getVoiceState()
            local isInWater = IsEntityInWater(playerPed)
            
            -- Update status values
            for i = 1, #cfg.status do
                local status = cfg.status[i]
                
                if status.name == "mic" then
                    status.active = voiceState.talking
                elseif status.name == "stamina" then
                    if isInWater then
                        if status.label ~= status.inWaterLabel then
                            status.label = status.inWaterLabel
                            status.secondLabel = status.label
                        end
                    else
                        if status.label == status.inWaterLabel then
                            status.label = status.secondLabel
                            status.secondLabel = ""
                        end
                    end
                end
                
                status.value = mathFloor(getStatus(status.name))
            end
            
            -- Handle weapon display
            if selectedWeapon and selectedWeapon ~= -1569615261 then
                local weaponData = izzy.weapons[selectedWeapon]
                if weaponData then
                    local ammoInClip, maxAmmo = GetAmmoInClip(playerPed, selectedWeapon)
                    local totalAmmo = GetAmmoInPedWeapon(playerPed, selectedWeapon) - ammoInClip
                    
                    SendReactMessage("setWeapon", {
                        current = ammoInClip,
                        total = totalAmmo,
                        name = weaponData.name and weaponData.name:lower() or "WEAPON_ASSAULTRIFLE",
                        label = weaponData.label or "Assault Rifle"
                    })
                end
            else
                SendReactMessage("setWeapon", {})
            end
            
            -- Configure radar
            SetRadarBigmapEnabled(false, false)
            SetRadarZoom(cfg.minimapScale)
            SendReactMessage("setStatus", cfg.status)
        end
        
        Wait(cfg.statusInterval)
    end
end)

-- Top info update thread
CreateThread(function()
    while true do
        if current.initialized then
            -- Update top info values
            for i = 1, #cfg.topInfos do
                cfg.topInfos[i] = getTopInfo(cfg.topInfos[i])
            end
            
            SendReactMessage("setTopInfos", cfg.topInfos)
            SendReactMessage("setVisibility", not IsPauseMenuActive())
            
            -- Handle radar visibility
            if current.settings.cinematic then
                DisplayRadar(0)
            else
                if current.settings.mapVisibility == "always" or current.inVehicle then
                    DisplayRadar(1)
                end
            end
        end
        
        Wait(cfg.topInfosInterval)
    end
end)

-- Location update system
local lastLocationUpdate = 0
local currentLocation = {}

function getLocationData(playerPed)
    local currentTime = GetGameTimer()
    local timeDiff = currentTime - lastLocationUpdate
    
    if timeDiff > 1500 then
        local coords = GetEntityCoords(playerPed)
        local streetHash, crossingHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        lastLocationUpdate = currentTime
        
        currentLocation = {
            GetStreetNameFromHashKey(streetHash),
            GetStreetNameFromHashKey(crossingHash)
        }
    end
    
    return currentLocation
end

-- Location update thread
CreateThread(function()
    local lastHeading = 1
    
    while true do
        if current.initialized then
            local camRot = GetGameplayCamRot(0)
            local heading = tostring(mathFloor((camRot.z + 360.0) % 360.0))
            if heading == "360" then heading = "0" end
            
            local locationData = getLocationData(PlayerPedId())
            SendReactMessage("setLocation", {
                inVehicle = current.inVehicle,
                street = locationData[1] .. " " .. locationData[2],
                heading = heading == lastHeading or not heading and lastHeading or heading,
                direction = getDirection()
            })
        end
        
        Wait(cfg.locationInterval)
    end
end)


-- Settings command
-- RegisterCommand(cfg.settingsCommand, function()
    -- SendReactMessage("setSettingsDisplay", true)
    -- SetNuiFocus(true, true)
-- end)

izzy.registerKeyMap({
    command = "hud",
    key = "I",
    description = "Open Hud",
    }, function()
    SendReactMessage("setSettingsDisplay", true)
    SetNuiFocus(true, true)
end)

-- Notification system
function addNotification(type, title, message, duration)
    SendReactMessage("addNotification", {
        type = (type == "error" and "error") or (type == "success" and "success") or "inform",
        str = message,
        duration = duration or 5000,
        title = title
    })
end

-- Export notification function
exports("addNotification", addNotification)

-- Register notification event
RegisterNetEvent("izzy-hudv5:client:addNotification", addNotification)

-- Test notification command
RegisterCommand("notify", function()
    addNotification("success", "Izzy", "Shop")
    Wait(100)
    addNotification("inform", "Izzy", "Shop")
    Wait(100)
    addNotification("error", "Izzy", "Shop")
end)

-- NUI Callbacks
RegisterNUICallback("saveSettings", function(data, cb)
    addNotification("success", izzy._t("success"), izzy._t("successfulySave"))
    SetResourceKvp("settings", json.encode(current.settings))
    cb({ "ok" })
end)

RegisterNUICallback("updateData", function(data, cb)
    for key, value in pairs(data) do
        current.settings[key] = value
        if key == "mapVisibility" or key == "mapStyle" then
            map(current.settings.mapStyle)
        end
    end
    cb({ "ok" })
end)

RegisterNUICallback("defaultAll", function(data, cb)
    local defaultSettings = cfg.defaultSettings
    
    -- Reset status colors
    for _, status in pairs(cfg.status) do
        defaultSettings.statusColors[status.name] = {
            primary = cfg.colors[status.color] and cfg.colors[status.color].primary or "#FFFFFF",
            secondary = cfg.colors[status.color] and cfg.colors[status.color].secondary or "#FFFFFF"
        }
    end
    
    defaultSettings.statusSize = 100
    defaultSettings.carhudSize = 100
    current.settings = defaultSettings
    SendReactMessage("setData", defaultSettings)
    cb({ "ok" })
end)

RegisterNUICallback("getStatus", function(data, cb)
    cb(cfg.status)
end)

RegisterNUICallback("getKeybinds", function(data, cb)
    cb(cfg.keybinds)
end)

RegisterNUICallback("close", function(data, cb)
    SendReactMessage("setSettingsDisplay", false)
    SendReactMessage("setModDisplay", false)
    SendReactMessage("setMusicDisplay", "mini")
    SetNuiFocus(false, false)
    cb({ "ok" })
end)