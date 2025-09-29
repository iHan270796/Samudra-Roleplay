local QBCore = exports['qb-core']:GetCoreObject()
local Config = Config or {}

RegisterNetEvent('deanix_moneywash:startWashing', function(itemName, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local rate = Config.MoneyWashRates[itemName]
    if not rate then return end
    local item = Player.Functions.GetItemByName(itemName)

    if item and item.amount >= amount then
        Player.Functions.RemoveItem(itemName, amount)

        local reward = amount * rate
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove', amount)
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Sedang mencuci uang...',
            type = 'success'
        })
        TriggerClientEvent('deanix_moneywash:addToQueue', src, reward)
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Tidak cukup item ' .. itemName,
            type = 'error'
        })
    end
end)

RegisterNetEvent('deanix_moneywash:giveCash', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if amount and amount > 0 then
        Player.Functions.AddMoney("cash", amount)
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Kamu menerima $' .. amount .. ' uang bersih',
            type = 'success'
        })
    end
end)

QBCore.Functions.CreateCallback('deanix_moneywash:tryStartWash', function(source, cb, itemName, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local rate = Config.MoneyWashRates[itemName]
    if not rate then return cb(false) end

    local item = Player.Functions.GetItemByName(itemName)

    if item and item.amount >= amount then
        Player.Functions.RemoveItem(itemName, amount)

        local reward = amount * rate
        cb(true, reward)

        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemName], 'remove', amount)
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Sedang mencuci uang...',
            type = 'success',
            icon = 'fas fa-money-bill-wave'
        })
    else
        cb(false)
       TriggerClientEvent('ox_lib:notify', source, {
            title = 'Tidak cukup item ' .. itemName,
            type = 'error',
            icon = 'fas fa-box-open'
        })
    end
end)

QBCore.Functions.CreateCallback('deanix_moneywash:checkMarkedBills', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local hasMarkedBills = false

    if Player then
        local item = Player.Functions.GetItemByName("markedbills")
        if item and item.amount and item.amount > 0 then
            hasMarkedBills = true
        end
    end

    cb(hasMarkedBills)
end)
