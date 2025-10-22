-- ============================================
-- WASABI MDT MAIN CLIENT
-- Central client-side script for MDT system
-- ============================================

MDTOpen = false

local shotsFiredCooldown = false
local departmentList = {}
local allowedPedTypes = {
    [0] = true,
    [1] = true,
    [2] = true,
    [3] = true,
    [28] = true
}

-- ============================================
-- BUILD DEPARTMENT LIST
-- ============================================

for departmentName, _ in pairs(Config.Departments) do
    departmentList[#departmentList + 1] = departmentName
end

-- ============================================
-- COMMAND REGISTRATION
-- ============================================

if Config.OpenMDT.command.enabled then
    if Config.OpenMDT.command.cmd then
        RegisterCommand(Config.OpenMDT.command.cmd, function(source, args, rawCommand)
            OpenMDT()
        end)
        
        TriggerEvent("chat:addSuggestion", "/" .. Config.OpenMDT.command.cmd, _L("open_mdt_suggestion"))
        
        if Config.OpenMDT.command.keybind then
            RegisterKeyMapping(
                Config.OpenMDT.command.cmd,
                _L("open_mdt_suggestion"),
                "keyboard",
                Config.OpenMDT.command.keybind
            )
        end
    else
        Error("Command name is not set for mdt, but is enabled in config.lua")
    end
end

-- ============================================
-- SHOTS FIRED DETECTION SYSTEM
-- ============================================

if Config.Alerts.shots_fired.enabled then
    AddEventHandler("CEventShockingGunshotFired", function(entities)
        if not entities or #entities == 0 then return end
        if shotsFiredCooldown then return end
        if wsb.hasGroup(departmentList) then return end
        
        for i = 1, #entities do
            local entity = entities[i]
            
            if entity ~= wsb.cache.ped then
                if not IsPedDeadOrDying(entity, false) then
                    local pedType = GetPedType(entity)
                    
                    if not allowedPedTypes[pedType] then
                        if not IsPedCurrentWeaponSilenced(wsb.cache.ped) then
                            local entityCoords = GetEntityCoords(entity)
                            
                            SendPremadeDispatch("shots_fired", {
                                location = GetStreetName(),
                                coords = {
                                    x = entityCoords.x,
                                    y = entityCoords.y,
                                    z = entityCoords.z
                                }
                            })
                            
                            shotsFiredCooldown = true
                            
                            SetTimeout(Config.Alerts.shots_fired.timeout, function()
                                shotsFiredCooldown = false
                            end)
                            
                            return
                        end
                    end
                end
            end
        end
    end)
end

-- ============================================
-- NETWORK EVENT HANDLERS
-- ============================================

wsb.registerCallback("wasabi_mdt:getStreetName", GetStreetName)

RegisterNetEvent("wasabi_bridge:setJob", function()
    TriggerServerEvent("wasabi_mdt:refreshOfficer", GetStreetName())
end)

RegisterNetEvent("wasabi_mdt:openMDT", OpenMDT)

RegisterNetEvent("wasabi_mdt:updateOfficerCallsign", function(officerData)
    if not officerData then return end
    
    SendNUIMessage({
        action = "updateOfficerCallsign",
        officer = officerData
    })
end)

-- ============================================
-- NUI CALLBACKS - DASHBOARD & OFFICERS
-- ============================================

RegisterNUICallback("getMDTDashboard", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:getMDTDashboard"))
end)

RegisterNUICallback("getOfficers", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:getOfficers"))
end)

RegisterNUICallback("setCallsign", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:setCallsign", data.callsign))
end)

RegisterNUICallback("toggleDuty", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:toggleDuty"))
end)

-- ============================================
-- NUI CALLBACKS - ANNOUNCEMENTS
-- ============================================

RegisterNUICallback("announcementAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:announcementAction", data.action, data))
end)

-- ============================================
-- NUI CALLBACKS - SEARCH & ENTITIES
-- ============================================

RegisterNUICallback("searchPlayers", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:searchPlayers", data.query))
end)

RegisterNUICallback("citizenAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:citizenAction", data.action, data))
end)

RegisterNUICallback("vehicleAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:vehicleAction", data.action, data))
end)

RegisterNUICallback("weaponAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:weaponAction", data.action, data))
end)

RegisterNUICallback("propertyAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:propertyAction", data.action, data))
end)

RegisterNUICallback("searchVehicles", function(data, cb)
    local vehicles = wsb.awaitServerCallback("wasabi_mdt:searchVehicles", data.query)
    local processedVehicles = {}
    
    for index, vehicle in ipairs(vehicles) do
        local modelHash = vehicle.model
        
        if type(modelHash) == "string" then
            modelHash = joaat(modelHash)
        end
        
        local displayName = GetDisplayNameFromVehicleModel(modelHash)
        
        if displayName and displayName ~= "CARNOTFOUND" then
            local firstChar = displayName:sub(1, 1):upper()
            local restOfName = displayName:sub(2):lower()
            displayName = firstChar .. restOfName
        else
            displayName = vehicle.model
        end
        
        local vehicleClass = GetVehicleTypeFromClass(modelHash)
        local vehicleTypeLabel = vehicleClass
        
        for _, vehicleType in ipairs(Config.VehicleTypes) do
            if vehicleType.type == vehicleClass then
                vehicleTypeLabel = vehicleType.label
                break
            end
        end
        
        processedVehicles[index] = {
            plate = vehicle.plate,
            model = vehicle.model,
            displayName = displayName,
            vehicleType = vehicleClass,
            vehicleTypeLabel = vehicleTypeLabel,
            isRegistered = vehicle.isRegistered
        }
    end
    
    cb(processedVehicles)
end)

RegisterNUICallback("searchEntity", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:searchEntity", data))
end)

RegisterNUICallback("globalSearch", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:globalSearch", data))
end)

-- ============================================
-- NUI CALLBACKS - ENTITY RELATIONSHIPS
-- ============================================

RegisterNUICallback("linkEntities", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:linkEntities", data))
end)

RegisterNUICallback("unlinkEntities", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:unlinkEntities", data))
end)

RegisterNUICallback("getEntityLinks", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:getEntityLinks", data))
end)

-- ============================================
-- NUI CALLBACKS - EVIDENCE & PHOTOS
-- ============================================

RegisterNUICallback("evidenceAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:evidenceAction", data.action, data))
end)

RegisterNUICallback("photoAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:photoAction", data.action, data))
end)

RegisterNUICallback("setEntityAvatar", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:setEntityAvatar", data))
end)

-- ============================================
-- NUI CALLBACKS - NOTES
-- ============================================

RegisterNUICallback("noteAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:noteAction", data.action, data))
end)

-- ============================================
-- NUI CALLBACKS - LEGAL DOCUMENTS
-- ============================================

RegisterNUICallback("chargeAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:chargeAction", data.action, data))
end)

RegisterNUICallback("warrantAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:warrantAction", data.action, data))
end)

RegisterNUICallback("boloAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:boloAction", data.action, data))
end)

RegisterNUICallback("incidentAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:incidentAction", data.action, data))
end)

-- ============================================
-- NUI CALLBACKS - CAMERAS
-- ============================================

RegisterNUICallback("cameraAction", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:cameraAction", data.action, data))
end)

RegisterNUICallback("startCameraPlacement", function(data, cb)
    SetNuiFocus(false, false)
    StartCameraPlacement()
    cb(true)
end)

RegisterNUICallback("placeCameraConfirm", function(data, cb)
    TriggerServerEvent("wasabi_mdt:placeCamera", data)
    cb(true)
end)

-- ============================================
-- NUI CALLBACKS - UTILITIES
-- ============================================

RegisterNUICallback("getCurrentLocation", function(data, cb)
    cb(GetCurrentLocation())
end)

RegisterNUICallback("setWaypoint", function(data, cb)
    if data.coords then
        SetNewWaypoint(data.coords.x, data.coords.y)
        TriggerEvent("wasabi_bridge:notify", _L("notify_title"), _L("set_waypoint_success"), "success")
        cb(true)
    else
        cb(false)
    end
end)

RegisterNUICallback("getJobsAndGrades", function(data, cb)
    cb(wsb.awaitServerCallback("wasabi_mdt:getJobsAndGrades"))
end)

RegisterNUICallback("fetchLocales", function(data, cb)
    if not Locales or not Locales[Config.Locale] then
        print("Locales not found!")
        return
    end
    
    cb(Locales[Config.Locale])
end)

RegisterNUICallback("fetchConfig", function(data, cb)
    cb(Config)
end)

-- ============================================
-- EXPORTS
-- ============================================

exports("OpenMDT", OpenMDT)
exports("CreateDispatch", CreateDispatch)
exports("SendPremadeDispatch", SendPremadeDispatch)

-- ============================================
-- INITIALIZATION
-- ============================================

CreateThread(function()
    while not wsb.playerLoaded do
        Wait(500)
    end
    
    TriggerServerEvent("wasabi_mdt:refreshOfficer", GetStreetName())
end)
