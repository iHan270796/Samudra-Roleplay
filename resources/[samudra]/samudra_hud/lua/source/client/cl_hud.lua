local playerData
local speedMultiplier = Config.HudSettings.UseMPH and 2.23694 or 3.6
local showingHUD = true
local health = 0
local armor = 0
local isTalking = false
local talkingOnRadio = false
local onRadio = false
local onPhone = false
local voiceRange = 2
local stats = {}
local vehicleStats = {}
local lastFuelUpdate = 0
local lastFuelCheck = nil
local lastCrossroadUpdate = 0
local lastCrossroadCheck = nil
local bool1 = Config.HudSettings.HudAlwaysOn

local crosshairenabled = Config.HudSettings.CrosshairEnabled

function updateStats()
    if bool1 then
        stats.oxygen = math.ceil(GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10) 
        if stats.oxygen < 1 then
            stats.oxygen = 1 
        end  
        SendNUIMessage({
            action = 'updateStats',
            data = {
                showing = IsPauseMenuActive() == false and showingHUD or false,
                health = health,
                armor = armor,
                isTalking = isTalking,
                talkingOnRadio = talkingOnRadio,
                onRadio = onRadio,
                onPhone = onPhone,
                voiceRange = voiceRange,
                stats = stats,
                crosshairenabled = crosshairenabled,
            }
        })
    end
end

local function ToggleHud(bool)
    stats.oxygen = math.ceil(GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10) 
    if stats.oxygen < 1 then
        stats.oxygen = 1 
    end  
    SendNUIMessage({
        action = 'updateStats',
        data ={
            showing = bool,
            health = health,
            armor = armor,
            isTalking = isTalking,
            talkingOnRadio = talkingOnRadio,
            onRadio = onRadio,
            onPhone = onPhone,
            voiceRange = voiceRange,
            stats = stats,
            crosshairenabled = crosshairenabled,
        }
    })
    bool1 = bool
end

exports("ToggleHud", ToggleHud)

local function updateVehicleStats()
    if not cache.vehicle then return end
    local veh = cache.vehicle
    SendNUIMessage({
        action = 'updateVehicle', 
        data = {
            showing = IsPauseMenuActive() == false and showingHUD or false,
            rpm = GetVehicleCurrentRpm(veh),
            speed = math.ceil(GetEntitySpeed(veh) * speedMultiplier),
            fuel = vehicleStats.fuel,
            engineOn = vehicleStats.engineOn,
            beltOn = vehicleStats.beltOn,
            mph = Config.HudSettings.UseMPH,
        }
    })
end

local function getFuelLevel(vehicle)
    local updateTick = GetGameTimer()
    if (updateTick - lastFuelUpdate) > 2000 then
        lastFuelUpdate = updateTick
        lastFuelCheck = math.floor(Config.HudSettings.GetFuel(vehicle))
    end
    return lastFuelCheck
end

local function getCrossroads()
    local updateTick = GetGameTimer()
    if updateTick - lastCrossroadUpdate > 1500 then
        local pos = GetEntityCoords(cache.ped)
        local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
        lastCrossroadUpdate = updateTick
        local street1 = GetStreetNameFromHashKey(street1)
        local street2 = GetStreetNameFromHashKey(street2)
        if street2 then
            lastCrossroadCheck = street1..' x '..street2
        else
            lastCrossroadCheck = street1
        end
    end
    return lastCrossroadCheck
end

local directions = {"N", "NE", "E", "SE", "S", "SW", "W", "NW", "N"}
local function getCardinalDirection(heading)
    local index = math.floor(((heading % 360) + 22.5) / 45) + 1
    return directions[index]
end

local function loadMap()
    CreateThread(function()
        Wait(50)
        local defaultAspectRatio = 1920 / 1080
        local resolutionX, resolutionY = GetActiveScreenResolution()
        local aspectRatio = resolutionX / resolutionY
        local minimapOffset = 0
        if aspectRatio > defaultAspectRatio then
            minimapOffset = ((defaultAspectRatio - aspectRatio) / 3.6) - 0.008
        end
        lib.requestStreamedTextureDict('sk_minimap')
        SetMinimapClipType(1)
        AddReplaceTexture('platform:/textures/graphics', 'radarmasksm', 'sk_minimap', 'radarmasksm')
        AddReplaceTexture('platform:/textures/graphics', 'radarmask1g', 'sk_minimap', 'radarmasksm')
        SetMinimapComponentPosition('minimap', 'L', 'B', 0.0 + minimapOffset, -0.047, 0.1638, 0.183)
        SetMinimapComponentPosition('minimap_mask', 'L', 'B', 0.0 + minimapOffset, 0.0, 0.128, 0.20)
        SetMinimapComponentPosition('minimap_blur', 'L', 'B', -0.01 + minimapOffset, 0.025, 0.262, 0.300)
        SetBlipAlpha(GetNorthRadarBlip(), 0)
        SetMinimapClipType(1)
        SetBigmapActive(true, false)
        SetBigmapActive(false, false)
        SetStreamedTextureDictAsNoLongerNeeded('sk_minimap')
    end)
end


local function vehicleStressLoop(veh)
    CreateThread(function()
        while veh == cache.vehicle do
            local vehClass = GetVehicleClass(veh)
            local speed = GetEntitySpeed(veh) * speedMultiplier
            local stressSpeed
            if vehClass == 8 then -- Motorcycle exception for seatbelt
                stressSpeed = Config.Settings.StressSettings.MinimumSpeed
            else
                stressSpeed = vehicleStats.beltOn and Config.Settings.StressSettings.MinimumSpeed or Config.Settings.StressSettings.UnbuckledSpeed
            end
            if speed >= stressSpeed then
                TriggerServerEvent('samudra_hud:GainStress', math.random(1, 3))
            end
            Wait(10000)
        end
    end)
end

local function vehicleLoop(veh)
    if Config.Settings.NoHudVehicles[GetEntityModel(veh)] then return end
    if Config.Settings.StressSettings.StressUsage.Driving then
        vehicleStressLoop(veh)
    end
    CreateThread(function()
        while veh == cache.vehicle do
            SendNUIMessage({
                action = 'compasstick',
                data  = {
                    direction = getCardinalDirection(GetGameplayCamRot(0).z),
                    roads = getCrossroads(),
                    zone = GetLabelText(GetNameOfZone(GetEntityCoords(cache.ped))),
                },
            })
            updateVehicleStats()

            local dist = 0 
            local showmiles = false 
            if IsWaypointActive() then
                showmiles = true 
                dist = (#(GetEntityCoords(PlayerPedId()) - GetBlipCoords(GetFirstBlipInfoId(8))) / 1000) * 0.715 -- quick conversion maff
            else
                showmiles = false 
                dist = 0
            end
            SendNUIMessage({
                action = 'milesmark',
                data  = {
                    show = showmiles,
                    distance = dist,
                },
            })

            Wait(50)
        end
        SendNUIMessage({
            action = 'updateVehicle', 
            data = {showing = false, rpm = 0, speed = 0}
        })
    end)
end

local function holdingWeaponLoop()
    CreateThread(function()
        while cache.weapon do
            if IsPedShooting(cache.ped) and not Config.Settings.StressSettings.WeaponWhitelist[cache.weapon] then
                if math.random() < Config.Settings.StressSettings.ShootingStressChance then
                    TriggerServerEvent('samudra_hud:GainStress', math.random(1, 3))
                end
            end
            Wait(0)
        end
    end)
end

local toggled = false
local function holdingWeaponLoopCrosshair()
    Citizen.CreateThread(function()
        while cache.weapon do
            local ped = PlayerPedId()
            Wait(10)
            if crosshairenabled then
                local carcam = GetFollowVehicleCamViewMode()
                local cam = GetFollowPedCamViewMode()
                -- Check if the player is armed
                if IsPedArmed(ped, 4) then
                    -- Check if the player is free aiming
                    if IsPlayerFreeAiming(PlayerId()) then
                        -- Check camera mode and whether the player is in a vehicle
                        if cam == 4 and not IsPedInAnyVehicle(ped, false) then
                            if toggled then
                                toggled = false
                                SendNUIMessage({ action = 'crosshair', data = {showing = toggled}})
                            end
                        else
                            if not toggled then
                                toggled = true
                                SendNUIMessage({ action = 'crosshair', data = {showing = toggled}})
                            end
                        end
                    else
                        -- If not free aiming, disable the crosshair
                        if toggled then
                            toggled = false
                            SendNUIMessage({ action = 'crosshair', data = {showing = toggled}})
                        end
                    end
                else
                    -- If the player is not armed, disable the crosshair
                    if toggled then
                        toggled = false
                        SendNUIMessage({ action = 'crosshair', data = {showing = toggled}})
                    end
                end
            end
        end
    end)
end



lib.onCache('vehicle', function(value) if value then vehicleLoop(value) end end)
lib.onCache('weapon', function(hash)
    if not Config.Settings.StressSettings.StressUsage.Shooting then return end
    if hash then
        if cache.weapon then
            cache.weapon = false
            Wait(1000)
        end
        holdingWeaponLoop()
        holdingWeaponLoopCrosshair()
    end
end)

local function GetBlurIntensity(stresslevel)
    for _, v in pairs(Config.Settings.StressSettings.Intensity) do
        if stresslevel >= v.Min and stresslevel <= v.Max then
            return v.Intensity
        end
    end
    return 1500
end

local function GetEffectInterval(stresslevel)
    for _, v in pairs(Config.Settings.StressSettings.EffectInterval) do
        if stresslevel >= v.Min and stresslevel <= v.Max then
            return v.Intensity
        end
    end
    return 60000
end

CreateThread(function()
    while true do
        stats.stress = stats.stress or 0
        local effectInterval = GetEffectInterval(stats.stress)
        if stats.stress >= 100 then
            local BlurIntensity = GetBlurIntensity(stats.stress)
            local FallRepeat = math.random(2, 4)
            local RagdollTimeout = FallRepeat * 1750
            TriggerScreenblurFadeIn(1000.0)
            Wait(BlurIntensity)
            TriggerScreenblurFadeOut(1000.0)
            if not IsPedRagdoll(cache.ped) and IsPedOnFoot(cache.ped) and not IsPedSwimming(cache.ped) then
                SetPedToRagdollWithFall(cache.ped, RagdollTimeout, RagdollTimeout, 1, GetEntityForwardVector(cache.ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end
            Wait(1000)
            for _ = 1, FallRepeat, 1 do
                Wait(750)
                DoScreenFadeOut(200)
                Wait(1000)
                DoScreenFadeIn(200)
                TriggerScreenblurFadeIn(1000.0)
                Wait(BlurIntensity)
                TriggerScreenblurFadeOut(1000.0)
            end
        elseif stats.stress >= Config.Settings.StressSettings.ScreenShake.MinStressForShake then
            local BlurIntensity = GetBlurIntensity(stats.stress)
            TriggerScreenblurFadeIn(1000.0)
            Wait(BlurIntensity)
            TriggerScreenblurFadeOut(1000.0)
        end
        Wait(effectInterval)
    end
end)

CreateThread(function()
    while true do   
        Wait(500)
        local ped = cache.ped
        local playerId = cache.playerId
        health = math.floor((GetEntityHealth(ped) - 100)/(GetEntityMaxHealth(ped) - 100)*100)
        local isDead = IsEntityDead(ped) or false
        if isDead then health = 0 end
        armor = GetPedArmour(ped)
        isTalking = NetworkIsPlayerTalking(playerId) == 1
        onRadio = Bridge.OnRadio()
        onPhone = Bridge.OnPhone()
        --parachute = GetPedParachuteState(ped)   Maybe...?
        --if IsEntityInWater(ped) then
            -- oxygen = GetPlayerUnderwaterTimeRemaining(playerId) * 10
        --end         
        if cache.vehicle and not IsThisModelABicycle(cache.vehicle) then
            vehicleStats.fuel = getFuelLevel(cache.vehicle)
            vehicleStats.engine = (GetVehicleEngineHealth(cache.vehicle) / 10) < 50
            vehicleStats.engineOn = GetIsVehicleEngineRunning(cache.vehicle)
            DisplayRadar(true)
        else
            DisplayRadar(Config.HudSettings.MinimapVisibleWhileWalking)
        end
        updateStats()
    end
end)

CreateThread(function()
    while true do
        Wait(250)
        if cache.vehicle and not IsThisModelABicycle(cache.vehicle) then
            loadMap()
            break
        end
    end
end)

AddEventHandler("playerSpawned", function()
    loadMap()
end)

CreateThread(function()
    local minimap = RequestScaleformMovie('minimap')
    if not HasScaleformMovieLoaded(minimap) then
        RequestScaleformMovie(minimap)
        while not HasScaleformMovieLoaded(minimap) do
            Wait(1)
        end
    end
    while true do 
        Wait(0)
        BeginScaleformMovieMethod(minimap, "HIDE_SATNAV")
        EndScaleformMovieMethod()
        SetRadarZoom(1000) 
    end
end)

RegisterNetEvent(Bridge.Events.OnPlayerLoaded, function()
    Wait(2000)
    playerData = Bridge.GetPlayerData()
    stats.hunger = playerData.hunger
    stats.thirst = playerData.thirst
    stats.stress = playerData.stress
end)

RegisterNetEvent(Bridge.Events.PlayerUnload, function()
    playerData = {}
end)

RegisterNetEvent(Bridge.Events.SetPlayerData, function(val)
    playerData = val
    stats.hunger = playerData.metadata.hunger
    stats.thirst = playerData.metadata.thirst
    stats.stress = playerData.metadata.stress6
end)

AddEventHandler(Bridge.Events.ESXOnly.StatusOnTick, function(data)
    for i = 1, #data do
        if data[i].name == "thirst" then
            stats.thirst = math.floor(data[i].percent)
        end
        if data[i].name == "hunger" then
            stats.hunger = math.floor(data[i].percent)
        end
        ESX.TriggerServerCallback("samudra_hud:RetrieveStress", function(stress)
            stats.stress = stress
        end)
        Wait(1000)
        TriggerEvent("hud:client:UpdateNeeds", stats.hunger, stats.thirst)
        TriggerEvent("samudra_hud:RecieveStress", stats.stress)
    end
end)


RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst) -- Triggered in qb-core
    stats.hunger = newHunger
    stats.thirst = newThirst
end)

RegisterNetEvent('samudra_hud:RecieveStress', function(newStress) -- Add this event with adding stress elsewhere
    stats.stress = newStress
end)

AddEventHandler("pma-voice:setTalkingMode", function(mode)
    voiceRange = tonumber(mode)
    updateStats()
end)

AddEventHandler("pma-voice:radioActive", function(radioTalking)
    talkingOnRadio = radioTalking
    updateStats()
end)

RegisterNetEvent('seatbelt:client:ToggleSeatbelt', function() -- Triggered in smallresources
    vehicleStats.beltOn = not vehicleStats.beltOn
    if vehicleStats.beltOn then
        Bridge.Notify("Seatbelt On!", "success", 5000)
    else
        Bridge.Notify("Seatbelt Off!", "error", 5000)
    end
    updateVehicleStats()
end)

RegisterNetEvent('hud:client:ToggleShowSeatbelt', function()
    vehicleStats.beltOn = not vehicleStats.beltOn
    updateVehicleStats()
end)