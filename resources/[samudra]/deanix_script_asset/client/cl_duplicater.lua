local allowedModels = {
    "rmodmi8lb",
    "lhuracant",
    -- "mansm8",
    "silviajdm",
    "m4lb",
    "kuruma2"
}

local duplicatedVehicles = {}
local function isModelAllowed(model)
    for _, m in ipairs(allowedModels) do
        if model == GetHashKey(m) then
            return true
        end
    end
    return false
end

local function duplicateVehicleWithDriver()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped, false)
        local model = GetEntityModel(veh)

        if isModelAllowed(model) then
            local coords = GetEntityCoords(veh)
            local heading = GetEntityHeading(veh)
            local offset = 5.0
            local headingRad = math.rad(heading)
            local spawnX = coords.x + math.sin(headingRad) * -offset
            local spawnY = coords.y + math.cos(headingRad) * -offset
            local spawnZ = coords.z

            local newVeh = CreateVehicle(model, spawnX, spawnY, spawnZ, heading, true, false)
            SetVehicleOnGroundProperly(newVeh)
            SetVehicleColours(newVeh, GetVehicleColours(veh))
            SetVehicleNumberPlateText(newVeh, GetVehicleNumberPlateText(veh))
            SetEntityAsMissionEntity(newVeh, true, true)

            local driverHash = GetHashKey("a_m_m_skater_01")
            RequestModel(driverHash)
            while not HasModelLoaded(driverHash) do
                Citizen.Wait(10)
            end
            local driver = CreatePedInsideVehicle(newVeh, 4, driverHash, -1, true, true)

            TaskVehicleDriveWander(driver, newVeh, 30.0, 786603)
            SetModelAsNoLongerNeeded(driverHash)
            table.insert(duplicatedVehicles, {vehicle = newVeh, driver = driver, owner = PlayerId()})
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 73) then
            duplicateVehicleWithDriver()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        for i = #duplicatedVehicles, 1, -1 do
            local data = duplicatedVehicles[i]
            local veh = data.vehicle
            local driver = data.driver
            local owner = data.owner

            if DoesEntityExist(veh) then
                local ownerPed = GetPlayerPed(owner)
                if ownerPed and DoesEntityExist(ownerPed) then
                    local pCoords = GetEntityCoords(ownerPed)
                    local vCoords = GetEntityCoords(veh)
                    local dist = #(pCoords - vCoords)
                    if dist > 50.0 then
                        if DoesEntityExist(driver) then
                            TaskLeaveVehicle(driver, veh, 0)
                            Citizen.Wait(500)
                            DeletePed(driver)
                        end
                        SetEntityAsMissionEntity(veh, true, true)
                        DeleteVehicle(veh)
                        table.remove(duplicatedVehicles, i)
                    end
                else
                    if DoesEntityExist(driver) then DeletePed(driver) end
                    if DoesEntityExist(veh) then
                        SetEntityAsMissionEntity(veh, true, true)
                        DeleteVehicle(veh)
                    end
                    table.remove(duplicatedVehicles, i)
                end
            else
                if DoesEntityExist(driver) then DeletePed(driver) end
                table.remove(duplicatedVehicles, i)
            end
        end
    end
end)