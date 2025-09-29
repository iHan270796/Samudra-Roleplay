local QBCore = exports['qb-core']:GetCoreObject()

local isFishing = false
local rodEntity = nil

exports('useRod', function(data, slot)
    TriggerEvent('deanix_fishing:useRod')
end)

RegisterNetEvent('deanix_fishing:useRod', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local hasRod = QBCore.Functions.HasItem('fishingrod')
    local hasBait = QBCore.Functions.HasItem('fish_bait')

    if not hasRod or not hasBait then
        lib.notify({title = 'Fishing', description = "Kamu Butuh Umpan!", type = "error"})
        return
    end

    if not exports['deanix_fishingjob']:IsNearWater() then
        lib.notify({title = 'Fishing', description = "Anda Harus Dekat Dengan Air!", type = "error"})
    return
end

    lib.registerContext({
        id = 'fishing_main_menu',
        title = '🎣 Pilih Umpan',
        options = {
            {
                title = '🐟 Gunakan Umpan',
                description = 'Mulai Memancing',
                icon = 'fas fa-fishing-rod',
                event = 'deanix_fishing:startFishing'
            },
            {
                title = '❌ Batal',
                icon = 'fas fa-times'
            }
        }
    })

    lib.showContext('fishing_main_menu')
end)

RegisterNetEvent("deanix_fishing:startFishing", function()
    if isFishing then return end
    isFishing = true

    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local animDict = "amb@world_human_stand_fishing@idle_a"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(0) end

    TaskPlayAnim(ped, animDict, "idle_c", 8.0, -8, -1, 1, 0, false, false, false)

    if rodEntity then DeleteEntity(rodEntity) end

    rodEntity = CreateObject(`prop_fishing_rod_01`, pos.x, pos.y, pos.z, true, true, true)
    AttachEntityToEntity(rodEntity, ped, GetPedBoneIndex(ped, 18905), 0.1, 0.05, 0.0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)

    Wait(math.random(3000, 5000))
    QBCore.Functions.TriggerCallback("deanix_fishing:getFishData", function(fishData)
        local weight = fishData.meta.weight
        local rounds = 3

        if weight <= 1 then
            rounds = 3
        elseif weight <= 2 then
            rounds = 4
        elseif weight <= 3 then
            rounds = 5
        elseif weight <= 4 then
            rounds = 6
        elseif weight <= 7 then
            rounds = 7
        elseif weight <= 8 then
            rounds = 8
        elseif weight <= 9 then
            rounds = 9
        else
            rounds = 10
        end

        TriggerEvent("deanix_fishing:startMinigameWithFish", fishData, rounds)
    end)
end)

RegisterNetEvent("deanix_fishing:checkBaitAndMenu", function()
    local ped = PlayerPedId()

    QBCore.Functions.TriggerCallback("deanix_fishing:hasBait", function(hasBait)
        if hasBait then
            isFishing = false

            lib.registerContext({
                id = 'fishing_bait_menu',
                title = '🎣 Pilih Umpan',
                options = {
                    {
                        title = '🐟 Gunakan Umpan',
                        description = 'Mulai Memancing',
                        icon = 'fas fa-fishing-rod',
                        event = 'deanix_fishing:startFishing'
                    },
                    {
                        title = '❌ Batal',
                        icon = 'fas fa-times',
                        event = 'deanix_fishing:stopFishing'
                    }
                }
            })

            lib.showContext('fishing_bait_menu')
        else
            ClearPedTasks(ped)
            if rodEntity then DeleteEntity(rodEntity) rodEntity = nil end
            isFishing = false
            lib.notify({title = 'Fishing', description = "Kamu Butuh Umpan!", type = "error"})
        end
    end)
end)

RegisterNetEvent("deanix_fishing:stopFishing", function()
    ClearPedTasks(PlayerPedId())
    if rodEntity then DeleteEntity(rodEntity) rodEntity = nil end
    isFishing = false
end)

RegisterNetEvent("deanix_fishing:resetFishing", function()
    isFishing = false
end)