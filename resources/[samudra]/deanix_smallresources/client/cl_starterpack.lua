local QBCore = exports['qb-core']:GetCoreObject()
local Config = require 'c_starterpack'
local pedSpawned = false
local StarterpackPed = nil
local StarterpackZone = nil

RegisterNetEvent('rst-starterpack:client:claimStarterpack', function(targetGender)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local model = GetEntityModel(PlayerPedId())
    local playerGender = (model == GetHashKey("mp_f_freemode_01")) and 1 or 0

    -- Validasi gender
    if playerGender ~= targetGender then
        local npcName = (targetGender == 0) and "Hanya Untuk" or "Hanya-Untuk"
        lib.notify({
                description ="Menu Ini " .. npcName .. " Karakter " .. ((targetGender == 0) and "Laki-Laki" or "Perempuan") .. ".",
                type = 'error'
            })
        return
    end

    if PlayerData.metadata["starterpack"] then
        lib.notify({
            description = "Anda sudah mengklaim Starterpack!",
            type = 'error'
        })
    else
        lib.notify({
            description = "Starterpack berhasil diklaim. Periksa kendaraan di garasi Eclipse Boulevard.",
            type = 'success'
        })
        TriggerServerEvent('rst-starterpack:server:claimStarterpack', targetGender)
    end
end)

RegisterNetEvent('rst-starterpack:client:chooseVehicleMenu', function(targetGender)
    local PlayerData = QBCore.Functions.GetPlayerData()
    local model = GetEntityModel(PlayerPedId())
    local playerGender = (model == GetHashKey("mp_f_freemode_01")) and 1 or 0

    -- Cegah salah gender
    if playerGender ~= targetGender then
        lib.notify({
            title = 'Starterpack',
            description = "Kendaraan starterpack ini hanya tersedia untuk" .. ((targetGender == 0) and "Laki-Laki" or "Perempuan") .. ".",
            type = 'error'
        })
        return
    end

    if not PlayerData.metadata["starterpack"] then
        lib.notify({ title = 'Starterpack', description = "Anda belum mengklaim Starterpack Yang Pertama!", type = 'error' })
        return
    end

    if PlayerData.metadata["starterpack2"] then
        lib.notify({ title = 'Starterpack', description = "Anda telah memilih kendaraan Starterpack ke-2 Anda.", type = 'error' })
        return
    end

    local vehicleList = (playerGender == 0) and Config.ChooseVehicleMale or Config.ChooseVehicleFemale

    local menu = {
        id = 'starterpack_vehicle_menu',
        title = 'Choose Starterpack Vehicle',
        options = {}
    }

    for _, veh in pairs(vehicleList) do
        table.insert(menu.options, {
            title = veh.label,
            description = 'Vehicle Starterpack 2',
            icon = 'car',
            image = veh.image,
            onSelect = function()
                TriggerEvent('rst-starterpack:client:confirmVehicle', { model = veh.model })
            end
        })
    end

    lib.registerContext(menu)
    lib.showContext('starterpack_vehicle_menu')
end)


RegisterNetEvent('rst-starterpack:client:confirmVehicle', function(data)
    TriggerServerEvent("rst-starterpack:server:giveChosenVehicle", data.model)
end)

