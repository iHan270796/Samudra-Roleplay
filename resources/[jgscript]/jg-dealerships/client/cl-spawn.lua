local function GetVehicleType(modelHash)
    local vehicleType = nil
    local vehicleClass = GetVehicleClassFromName(modelHash)
    if IsThisModelACar(modelHash) then
        vehicleType = "automobile"
    elseif IsThisModelABicycle(modelHash) then
        vehicleType = "bike"
    elseif IsThisModelABike(modelHash) then
        vehicleType = "bike"
    elseif IsThisModelABoat(modelHash) then
        vehicleType = "boat"
    elseif IsThisModelAHeli(modelHash) then
        vehicleType = "heli"
    elseif IsThisModelAPlane(modelHash) then
        vehicleType = "plane"
    elseif IsThisModelAQuadbike(modelHash) then
        vehicleType = "automobile"
    elseif IsThisModelATrain(modelHash) then
        vehicleType = "train"
    elseif vehicleClass == 5 then
        vehicleType = "automobile"
    elseif vehicleClass == 14 then
        vehicleType = "submarine"
    elseif vehicleClass == 16 then
        vehicleType = "heli"
    else
        vehicleType = "trailer"
    end
    return vehicleType
end
local function ApplyVehicleProperties(vehicle, properties)
    if properties then
        if type(properties) == "table" then
            DebugPrint("ApplyVehicleProperties - Applying color:", "debug", properties.colour)
            SetVehicleColour(vehicle, properties.colour)
            SetVehicleNumberPlateText(vehicle, properties.plate)
        end
    end
    Framework.Client.VehicleSetFuel(vehicle, 100.0)
    return not NetworkGetEntityIsNetworked(vehicle)
end
local function ValidateAndRequestModel(spawnCode, plate)
    local modelHash = ConvertModelToHash(spawnCode)
    local vehicleType = GetVehicleType(modelHash)
    if not IsModelInCdimage(modelHash) then
        Framework.Client.Notify("Vehicle model does not exist - contact an admin", "error")
        print(string.format("^1Vehicle model %s does not exist", spawnCode))
        return false
    end
    local hasSeats = GetVehicleModelNumberOfSeats(modelHash) > 0
    if plate and plate ~= "" then
        if not IsValidGTAPlate(plate) then
            Framework.Client.Notify("This vehicle's plate is invalid (hit F8 for more details)", "error")
            print(string.format("^1This vehicle is trying to spawn with the plate '%s' which is invalid for a GTA vehicle plate", plate:upper()))
            print("^1Vehicle plates must be 8 characters long maximum, and can contain ONLY numbers, letters and spaces")
            return false
        end
    end
    lib.requestModel(modelHash, 60000)
    if IsPedRagdoll(cache.ped) then
        Framework.Client.Notify("You are currently in a ragdoll state", "error")
        SetModelAsNoLongerNeeded(modelHash)
        return false
    end
    return modelHash, vehicleType, hasSeats
end
local function SetupVehicle(vehicle, vehicleId, modelHash, warpIntoVehicle, plate, properties, giveKeys)
    if not vehicle or vehicle == 0 then
        Framework.Client.Notify("Could not spawn vehicle - hit F8 for details", "error")
        print("^1Vehicle does not exist (vehicle = 0)")
        return false
    end
    
    -- Prevent vehicle from despawning
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetVehRadioStation(vehicle, "OFF")
    
    if IsPedRagdoll(cache.ped) then
        Framework.Client.Notify("You are currently in a ragdoll state", "error")
        SetModelAsNoLongerNeeded(modelHash)
        return false
    end
    if warpIntoVehicle then
        ClearPedTasks(cache.ped)
        local success = pcall(function()
            lib.waitFor(function()
                if GetPedInVehicleSeat(vehicle, -1) == cache.ped then
                    return true
                end
                TaskWarpPedIntoVehicle(cache.ped, vehicle, -1)
            end, nil, 5000)
        end)
        if not success then
            print("^1[ERROR] Could not warp you into the vehicle^0")
            return false
        end
    end
    if plate and plate ~= "" then
        SetVehicleNumberPlateText(vehicle, plate)
    end
    if properties then
        if type(properties) == "table" then
            ApplyVehicleProperties(vehicle, properties)
        end
    end
    if GetResourceState("brazzers-fakeplates") == "started" then
        local fakePlate = lib.callback.await("jg-dealerships:server:brazzers-get-fakeplate-from-plate", false, plate)
        if fakePlate then
            plate = fakePlate
            SetVehicleNumberPlateText(vehicle, fakePlate)
        end
    end
    if not plate or plate == "" then
        plate = Framework.Client.GetPlate(vehicle)
    end
    if not plate or plate == "" then
        print("^1[ERROR] The game thinks the vehicle has no plate - absolutely no idea how you've managed this")
        return false
    end
    Entity(vehicle).state:set("vehicleid", vehicleId, true)
    Framework.Client.VehicleGiveKeys(plate, vehicle, giveKeys)
    return true
end
local function OnServerVehicleCreated(netId, coords, warpIntoVehicle, modelHash, vehicleId, plate, properties, giveKeys)
    SetModelAsNoLongerNeeded(modelHash)
    if not netId then
        Framework.Client.Notify("Could not spawn vehicle - hit F8 for details", "error")
        print("^1Server returned false for netId")
        return false
    end
    lib.waitFor(function()
        if NetworkDoesNetworkIdExist(netId) then
            if NetworkDoesEntityExistWithNetworkId(netId) then
                return true
            end
        end
    end, "Timed out while waiting for a server-setter netId to exist on client", 10000)
    local vehicle = NetToVeh(netId)
    lib.waitFor(function()
        if DoesEntityExist(vehicle) then
            return true
        end
    end, "Timed out while waiting for a server-setter vehicle to exist on client", 10000)
    if coords then
        SetEntityCoords(cache.ped, coords.x, coords.y, coords.z, false, false, false, false)
    end
    local success = SetupVehicle(vehicle, vehicleId, modelHash, warpIntoVehicle, plate, properties, giveKeys)
    if not success then
        DeleteEntity(vehicle)
        return false
    end
    return true
end
local function CreateVehicleLocal(modelHash, coords, plate, isNetwork)
    lib.requestModel(modelHash, 60000)
    local vehicle = CreateVehicle(modelHash, coords.x, coords.y, coords.z, coords.w, isNetwork or false, isNetwork or false)
    lib.waitFor(function()
        if DoesEntityExist(vehicle) then
            return true
        end
    end, "Timed out while trying to spawn in vehicle (client)", 10000)
    
    -- Prevent vehicle from despawning
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetVehRadioStation(vehicle, "OFF")
    SetModelAsNoLongerNeeded(modelHash)
    
    if plate and plate ~= "" then
        SetVehicleNumberPlateText(vehicle, plate)
    end
    return vehicle
end
function SpawnVehicleClient(vehicleId, spawnCode, plate, coords, warpIntoVehicle, properties, giveKeys)
    if Config.SpawnVehiclesWithServerSetter then
        print("^1This function is disabled as client spawning is enabled")
        return false
    end
    local modelHash, vehicleType, hasSeats = ValidateAndRequestModel(spawnCode, plate)
    if not modelHash then
        return false
    end
    local vehicle = CreateVehicleLocal(modelHash, coords, plate, true)
    if not vehicle then
        return false
    end
    local success = SetupVehicle(vehicle, vehicleId, modelHash, hasSeats and warpIntoVehicle, plate, properties, giveKeys)
    if not success then
        DeleteEntity(vehicle)
        return false
    end
    return vehicle
end
AddStateBagChangeHandler("vehInit", "", function(bagName, key, value)
    if not value then
        return
    end
    local entity = GetEntityFromStateBagName(bagName)
    if entity == 0 then
        return
    end
    lib.waitFor(function()
        return not IsEntityWaitingForWorldCollision(entity)
    end)
    if NetworkGetEntityOwner(entity) ~= cache.playerId then
        return
    end
    local state = Entity(entity).state
    SetVehicleOnGroundProperly(entity)
    SetTimeout(0, function()
        state:set("vehInit", nil, true)
    end)
end)
AddStateBagChangeHandler("dealershipVehCreatedApplyProps", "", function(bagName, key, value)
    if not value then
        return
    end
    local entity = GetEntityFromStateBagName(bagName)
    if entity == 0 then
        return
    end
    SetTimeout(0, function()
        local state = Entity(entity).state
        local attempts = 0
        while attempts < 10 do
            if NetworkGetEntityOwner(entity) == cache.playerId then
                local success = ApplyVehicleProperties(entity, value)
                if success then
                    state:set("dealershipVehCreatedApplyProps", nil, true)
                    break
                end
            end
            attempts = attempts + 1
            Wait(100)
        end
    end)
end)
lib.callback.register("jg-dealerships:client:req-vehicle-and-get-spawn-details", ValidateAndRequestModel)
lib.callback.register("jg-dealerships:client:on-server-vehicle-created", OnServerVehicleCreated)
