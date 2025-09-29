local QBCore = exports['qb-core']:GetCoreObject()
local isUiOpen = false

-- Buka UI
RegisterNetEvent('deanix_moneywash:openUI', function()
    if isUiOpen then return end

    QBCore.Functions.TriggerCallback('deanix_moneywash:checkMarkedBills', function(hasMarkedBills)
        isUiOpen = true
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "open",
            hasMarkedBills = hasMarkedBills,
            washRates = Config.MoneyWashRates,
            washDuration = Config.WashDuration
        })
    end)
end)

RegisterNetEvent('deanix_moneywash:addToQueue', function(amount)
    SendNUIMessage({
        action = "addToQueue",
        amount = amount
    })
end)

-- CreateThread(function()
--     for _, loc in pairs(Config.MoneyWashLocations) do
--         exports['qb-target']:AddBoxZone("moneywash_zone", loc, 1.5, 1.5, {
--             name = "moneywash_zone",
--             heading = 0,
--             debugPoly = false,
--             minZ = loc.z - 1.0,
--             maxZ = loc.z + 1.0,
--         }, {
--             options = {
--                 {
--                     icon = "fas fa-money-bill-wave",
--                     label = "Cuci Uang Merah",
--                     action = function()
--                         TriggerEvent("deanix_moneywash:openUI")
--                     end,
--                 },
--             },
--             distance = 2.0
--         })
--     end
-- end)

CreateThread(function()
    for _, loc in pairs(Config.MoneyWashLocations) do
        exports.ox_target:addBoxZone({
            coords = loc,
            size = vec3(1.5, 1.5, 2.0), -- panjang, lebar, tinggi
            rotation = 0,
            debug = false,
            options = {
                {
                    name = 'moneywash_zone',
                    icon = 'fas fa-money-bill-wave',
                    label = 'Cuci Uang Merah',
                    onSelect = function()
                        TriggerEvent("deanix_moneywash:openUI")
                    end
                }
            }
        })
    end
end)


RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    isUiOpen = false
    cb({})
end)

RegisterNUICallback('takeCash', function(data, cb)
    local amount = tonumber(data.amount or 0)
    if amount > 0 then
        TriggerServerEvent('deanix_moneywash:giveCash', amount)
    end
    cb({})
end)

RegisterNUICallback("playWashAnim", function(_, cb)
    local player = PlayerPedId()
    RequestAnimDict("amb@prop_human_bum_bin@idle_b")
    while not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b") do
        Wait(10)
    end
    TaskPlayAnim(player, "amb@prop_human_bum_bin@idle_b", "idle_d", 8.0, -8.0, -1, 1, 0, false, false, false)
    cb({})
end)

RegisterNUICallback("stopWashAnim", function(_, cb)
    ClearPedTasks(PlayerPedId())
    cb({})
end)

RegisterNUICallback("cancelWash", function(_, cb)
    ClearPedTasks(PlayerPedId())
    cb({})
end)

RegisterNUICallback('startWash', function(data, cb)
    local itemName = data.item
    local amount = tonumber(data.amount or 0)

    if itemName and amount >= Config.MinAmount then
        QBCore.Functions.TriggerCallback('deanix_moneywash:tryStartWash', function(success, reward)
            if success then
                SendNUIMessage({
                    action = "addToQueue",
                    item = itemName,
                    amount = amount,
                    reward = reward
                })
            else
                lib.notify({
                    title = 'Tidak cukup item untuk dicuci!',
                    type = 'error'
                })
            end

            cb({
                success = success,
                reward = reward
            })
        end, itemName, amount)
    else
        lib.notify({
            title = 'Jumlah terlalu kecil!',
            type = 'error'
        })
        cb({ success = false })
    end
end)