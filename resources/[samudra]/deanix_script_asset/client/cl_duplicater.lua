-- Thread untuk cek kontrol manual
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        -- 0 = InputGroup (keyboard & controller), 73 = INPUT_VEH_HEADLIGHT (X)
        if IsControlJustReleased(0, 73) then
            duplicateVehicleWithDriver()
        end
    end
end)

-- Daftar mobil yang bisa di-duplicate
local allowedModels = {
    "rmodmi8lb",
    "lhuracant",
    "mansm8",
    "silviajdm",
    "m4lb"
}

-- List vehicle duplicate beserta info owner
local duplicatedVehicles = {}

-- Cek apakah model mobil di daftar allowed
local function isModelAllowed(model)
    for _, m in ipairs(allowedModels) do
        if model == GetHashKey(m) then
            return true
        end
    end
    return false
end

-- Fungsi duplicate & spawn AI driver
function duplicateVehicleWithDriver()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped, false)
        local model = GetEntityModel(veh)

        if isModelAllowed(model) then
            local coords = GetEntityCoords(veh)
            local heading = GetEntityHeading(veh)

            -- Spawn di belakang kendaraan
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
            
            -- Spawn ped NPC driver
            local driverHash = GetHashKey("a_m_m_skater_01")
            RequestModel(driverHash)
            while not HasModelLoaded(driverHash) do
                Citizen.Wait(10)
            end
            local driver = CreatePedInsideVehicle(newVeh, 4, driverHash, -1, true, true)

            -- NPC mengemudi secara AI
            TaskVehicleDriveWander(driver, newVeh, 30.0, 786603)
            SetModelAsNoLongerNeeded(driverHash)

            -- Simpan info owner
            table.insert(duplicatedVehicles, {vehicle = newVeh, driver = driver, owner = PlayerId()})
        end
    end
end

-- Loop untuk auto delete kendaraan & driver jika owner menjauh
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000) -- cek tiap 2 detik
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
                    if dist > 50.0 then -- jarak >50 meter
                        -- Driver keluar dulu
                        if DoesEntityExist(driver) then
                            TaskLeaveVehicle(driver, veh, 0)
                            Citizen.Wait(500)
                            DeletePed(driver)
                        end
                        -- Hapus kendaraan
                        SetEntityAsMissionEntity(veh, true, true)
                        DeleteVehicle(veh)
                        table.remove(duplicatedVehicles, i)
                    end
                else
                    -- Jika owner tidak ada, tetap hapus
                    if DoesEntityExist(driver) then DeletePed(driver) end
                    if DoesEntityExist(veh) then
                        SetEntityAsMissionEntity(veh, true, true)
                        DeleteVehicle(veh)
                    end
                    table.remove(duplicatedVehicles, i)
                end
            else
                -- Hapus driver jika kendaraan sudah hilang
                if DoesEntityExist(driver) then DeletePed(driver) end
                table.remove(duplicatedVehicles, i)
            end
        end
    end
end)
