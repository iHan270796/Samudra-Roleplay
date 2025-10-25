local QBCore = exports['qb-core']:GetCoreObject()
local isWorking = false
local vehicleEntity = nil
local hasWorkClothes = false
local currentServerInfo = nil
local lastStage = nil

local zones = {
    kapas = {},
    benang = {},
    kain = {},
    baju = {}
}

local markerVisible = {
    kapas = {},
    benang = {},
    kain = {},
    baju = {}
}

local currentStage = 'kapas'

local stageColors = {
    kapas = {r = 255, g = 255, b = 0, a = 150},
    benang = {r = 0, g = 200, b = 255, a = 150},
    kain = {r = 255, g = 150, b = 150, a = 150},
    baju = {r = 0, g = 255, b = 0, a = 150}
}

local function Notify(msg, type) QBCore.Functions.Notify(msg, type or 'primary') end

local function lokasigps(stage)
    ClearGpsPlayerWaypoint()
    if stage == 'kapas' then
        local loc = Config.Coords.KapasStations[1]
        SetNewWaypoint(loc.x + 0.0, loc.y + 0.0)
        Notify('GPS diarahkan ke lokasi pengambilan kapas.', 'primary')
    elseif stage == 'benang' then
        local loc = Config.Coords.BenangStations[1]
        SetNewWaypoint(loc.x + 0.0, loc.y + 0.0)
        Notify('GPS diarahkan ke lokasi proses benang.', 'primary')
    else
        ClearGpsPlayerWaypoint()
    end
end

local function UpdateActiveStage()
    if not currentServerInfo or not currentServerInfo.tasks then return end
    local t = currentServerInfo.tasks

    if t.kapas.done < t.kapas.required then
        currentStage = 'kapas'
    elseif t.benang.done < t.benang.required then
        currentStage = 'benang'
    elseif t.kain.done < t.kain.required then
        currentStage = 'kain'
    elseif t.baju.done < t.baju.required then
        currentStage = 'baju'
    else
        currentStage = 'finished'
    end
end

local function ApplyClothes()
    local ped = PlayerPedId()
    local gender = IsPedMale(ped) and 'male' or 'female'

    local animDict = "clothingshirt"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(0) end
    TaskPlayAnim(ped, animDict, "try_shirt_positive_d", 8.0, 1.0, 1000, 49, 0, false, false, false)
    Wait(1000)

    local clothes = Config.WorkClothes[gender]
    if not clothes then return Notify('WorkClothes config error: '..gender, 'error') end

    for k, v in pairs(clothes) do
        if v.component_id and v.drawable and v.texture then
            SetPedComponentVariation(ped, v.component_id, v.drawable, v.texture, 0)
        end
    end

    if clothes.helmet then
        SetPedPropIndex(ped, 0, clothes.helmet.clotheId or 0, clothes.helmet.variation or 0, true)
    end

    hasWorkClothes = true
    Notify('Pakaian kerja dipakai', 'success')
    ClearPedTasks(ped)
end

local function RemoveWorkClothes()
    hasWorkClothes = false
    TriggerEvent("illenium-appearance:client:reloadSkin")
    TriggerEvent("illenium-appearance:ReloadSkin")
    TriggerEvent("fivem-appearance:client:reloadSkin")
    TriggerEvent("fivem-appearance:ReloadSkin")
    Notify('Pakaian kerja dilepas', 'success')
end

local function SpawnWorkVehicle()
    if vehicleEntity and DoesEntityExist(vehicleEntity) then return end
    QBCore.Functions.SpawnVehicle(Config.VehicleModel, function(veh)
        vehicleEntity = veh
        SetVehicleNumberPlateText(veh, "TAILOR"..math.random(1000,9999))
        SetEntityAsMissionEntity(veh, true, true)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    end, Config.Coords.VehicleSpawn, true)
    Notify('Kendaraan kerja dipanggil', 'success')
end

local function TryStoreVehicle()
    if not vehicleEntity or not DoesEntityExist(vehicleEntity) then
        return Notify('Tidak ada kendaraan kerja', 'error')
    end
    local ped = PlayerPedId()
    if #(GetEntityCoords(ped) - Config.Coords.VehicleStore) > 4.5 then
        return Notify('Dekati lokasi penyimpanan kendaraan', 'error')
    end
    QBCore.Functions.DeleteVehicle(vehicleEntity)
    vehicleEntity = nil
    Notify('Kendaraan disimpan', 'success')
end

local function SendHudUpdate(info)
    SendNUIMessage({
        action = 'update',
        tasks = info.tasks
    })
end


local function CloseHud()
    if not Config.UI.taskUI then return end
    SendNUIMessage({ action = 'close' })
end

local function RemoveAllZones()
    for stage, tbl in pairs(zones) do
        for i, zone in pairs(tbl) do
            if zone then
                exports.ox_target:removeZone(zone)
                zones[stage][i] = nil
            end
        end
    end
end

local function StartJob()
    if isWorking then return Notify('Kamu sedang bekerja', 'error') end
    if not hasWorkClothes then return Notify('Pakai pakaian kerja dulu', 'error') end
    currentStage = 'kapas'
    lastStage = nil
    markerVisible = { kapas = {}, benang = {}, kain = {}, baju = {} }
    TriggerServerEvent('tailorjob:server:startJob')
end

local function StopJob()
    if not isWorking then return Notify('Kamu belum bekerja', 'error') end
    isWorking = false
    lastStage = nil
    currentStage = 'kapas'
    currentServerInfo = nil
    for stage, tbl in pairs(markerVisible) do
        for i, _ in pairs(tbl) do markerVisible[stage][i] = false end
    end
    CloseHud()
    RemoveAllZones()
    Notify('Kerja dihentikan', 'primary')
    TriggerServerEvent('tailorjob:server:stopJob')
end

local stageAnims = {
    kapas  = { dict = 'amb@world_human_gardener_plant@male@base', clip = 'base' },
    benang = { dict = 'mini@repair', clip = 'fixing_a_player' },
    kain   = { dict = 'mini@repair', clip = 'fixing_a_player' },
    baju   = { dict = 'mini@repair', clip = 'fixing_a_player' }
}

-- ✅ FIX FINAL: Zone langsung hilang setelah ambil pertama kali
local function DoTask(stage, index)
    if not isWorking then return Notify('Kamu belum mulai kerja', 'error') end
    if not zones[stage] or not zones[stage][index] then return end
    if markerVisible[stage][index] == false then return end
    markerVisible[stage][index] = false

    local pool = stage == 'kapas' and Config.Coords.KapasStations
              or stage == 'benang' and Config.Coords.BenangStations
              or stage == 'kain' and Config.Coords.KainStations
              or stage == 'baju' and Config.Coords.BajuStation

    local ped = PlayerPedId()
    local targetPos = pool[index]
    if not targetPos then return Notify('Lokasi tidak valid', 'error') end
    if #(GetEntityCoords(ped) - vector3(targetPos.x, targetPos.y, targetPos.z)) > 3.0 then
        return Notify('Dekati lokasi tugas', 'error')
    end

    local anim = stageAnims[stage]
    local success = lib.progressBar({
        duration = Config.TaskDuration,
        label = 'Proses Kerja...',
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, combat = true, car = true },
        anim = anim
    })
    if not success then 
        markerVisible[stage][index] = true
        return Notify('Tugas dibatalkan', 'error') 
    end

    exports.ox_target:removeZone(zones[stage][index])
    zones[stage][index] = nil
    TriggerEvent('tailorjob:client:removeMarker', stage, index)
    TriggerServerEvent('tailorjob:server:completeTask', stage)
end

local function CreateTaskZones()
    RemoveAllZones()
    local stage = currentStage
    local pool, label, icon, onSelect

    if stage == 'kapas' then
        pool = Config.Coords.KapasStations
        label = 'Ambil Kapas'
        icon = 'fa-solid fa-tree'
        onSelect = function(i) DoTask('kapas', i) end
    elseif stage == 'benang' then
        pool = Config.Coords.BenangStations
        label = 'Proses Benang'
        icon = 'fa-solid fa-cogs'
        onSelect = function(i) DoTask('benang', i) end
    elseif stage == 'kain' then
        pool = Config.Coords.KainStations
        label = 'Proses Kain'
        icon = 'fa-solid fa-tshirt'
        onSelect = function(i) DoTask('kain', i) end
    elseif stage == 'baju' then
        pool = Config.Coords.BajuStation
        label = 'Jahit Baju'
        icon = 'fa-solid fa-scissors'
        onSelect = function(i) DoTask('baju', i) end
    end

    if pool then
        for i, v in ipairs(pool) do
            local zoneName = ('tailor_%s_%d'):format(stage, i)
            local zoneId = exports.ox_target:addSphereZone({
                name = zoneName,
                coords = v,
                radius = 1.5,
                debug = false,
                options = {
                    {
                        label = label,
                        icon = icon,
                        onSelect = function() onSelect(i) end
                    }
                }
            })
            zones[stage][i] = zoneId
        end
    end
end

RegisterNetEvent('tailorjob:client:updateProgress', function(info)
    currentServerInfo = info
    UpdateActiveStage()

    if currentStage == 'finished' then
        CloseHud()
        isWorking = false
        RemoveAllZones()
        currentServerInfo = nil
        TriggerServerEvent('tailorjob:server:stopJob')
        Notify('Semua stage selesai. Kembalikan kendaraan & hentikan kerja.', 'success')
        return
    end

    SendHudUpdate(info)

    if currentStage ~= lastStage then
        RemoveAllZones()
        CreateTaskZones()
        lastStage = currentStage
        Notify(('Tahap berikutnya dimulai: %s'):format(currentStage), 'success')

        if currentStage == 'benang' then
            lokasigps('benang')
        elseif currentStage == 'kain' or currentStage == 'baju' then
            ClearGpsPlayerWaypoint()
        end
    end
end)

RegisterNetEvent('tailorjob:client:jobStarted', function(info)
    isWorking = true
    lastStage = nil
    currentServerInfo = info
    SendHudUpdate(info)
    SpawnWorkVehicle()
    CreateTaskZones()
    Notify('Kerja dimulai. Cek TASK di HUD.', 'success')
    lokasigps('kapas')
end)

RegisterNetEvent('tailorjob:client:jobStopped', function()
    isWorking = false
    lastStage = nil
    currentServerInfo = nil
    CloseHud()
    RemoveAllZones()
    Notify('Kerja dihentikan', 'primary')
end)

RegisterNetEvent('tailorjob:client:removeMarker', function(stage, index)
    markerVisible[stage][index] = false
end)

CreateThread(function()
    for _, coords in ipairs(Config.Coords.KapasStations) do
        local prop = CreateObject(`prop_tree_maple_02`, coords.x, coords.y, coords.z - 1.0, false, false, false)
        SetEntityHeading(prop, math.random(0, 360) + 0.0)
        FreezeEntityPosition(prop, true)
    end
end)

RegisterNetEvent('pakaibaju:penjahit', function() ApplyClothes() end)
RegisterNetEvent('Kembalikebaju:awal', function() RemoveWorkClothes() end)
RegisterNetEvent('MulaiPekerjaan', function() StartJob() end)
RegisterNetEvent('StopPekerjaan', function() StopJob() end)

CreateThread(function()
    while true do
        local sleep = 1000
        if isWorking and currentServerInfo and currentServerInfo.tasks then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)


            for stage, data in pairs(currentServerInfo.tasks) do
                if stage ~= currentStage then goto continue end
                if data.done < data.required then
                    local pool
                    if stage == 'kapas' then
                        pool = Config.Coords.KapasStations
                    elseif stage == 'benang' then
                        pool = Config.Coords.BenangStations
                    elseif stage == 'kain' then
                        pool = Config.Coords.KainStations
                    elseif stage == 'baju' then
                        pool = Config.Coords.BajuStation
                    end

                    if pool then
                        for i, v in ipairs(pool) do
                            if markerVisible[stage][i] ~= false then
                                local dist = #(coords - vec3(v.x, v.y, v.z))
                                if dist < 30.0 then
                                    sleep = 5

                                    local color = stageColors[stage] or {r=255,g=255,b=255,a=150}
                                    local zOffset = 0.2
                                    if stage == 'Kapas' then
                                        zOffset = 0.2
                                    elseif stage == 'benang' then
                                        zOffset = 2.0
                                    elseif stage == 'kain' then
                                        zOffset = 0.2
                                    elseif stage == 'baju' then
                                        zOffset = 0.2
                                    end
                                    DrawMarker(
                                        Config.Marker.type or 2,
                                        v.x, v.y, v.z + zOffset,
                                        0.0, 0.0, 0.0,
                                        0.0, 0.0, 0.0,
                                        Config.Marker.size.x or 0.4,
                                        Config.Marker.size.y or 0.4,
                                        Config.Marker.size.z or 0.4,
                                        color.r, color.g, color.b, color.a,
                                        true, true, 2, false, false, false, false
                                    )
                                end
                            end
                        end
                    end
                end
                ::continue::
            end
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    local shown = false
    while true do
        local sleep = 1000
        if isWorking and vehicleEntity and DoesEntityExist(vehicleEntity) then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local dist = #(coords - Config.Coords.VehicleStore)

            if dist < 15.0 then
                sleep = 5
                DrawMarker(Config.Marker.type, Config.Coords.VehicleStore.x, Config.Coords.VehicleStore.y, Config.Coords.VehicleStore.z + 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 0, 255, 100, 150, true, true, 2, false, false, false, false)
            end

            if dist < 2.0 then
                if not shown then
                    lib.showTextUI('[E] Simpan Kendaraan Kerja', { position = 'right-center' })
                    shown = true
                end
                if IsControlJustReleased(0, 38) then TryStoreVehicle() end
            else
                if shown then lib.hideTextUI() shown = false end
            end
        else
            if shown then lib.hideTextUI() shown = false end
        end
        Wait(sleep)
    end
end)

AddEventHandler('onResourceStop', function(res)
    if res == GetCurrentResourceName() then
        CloseHud()
        if vehicleEntity and DoesEntityExist(vehicleEntity) then
            QBCore.Functions.DeleteVehicle(vehicleEntity)
        end
        if lib and lib.hideTextUI then lib.hideTextUI() end
    end
end)
