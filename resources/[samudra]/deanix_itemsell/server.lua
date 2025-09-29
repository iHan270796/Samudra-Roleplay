local QBCore = exports['qb-core']:GetCoreObject()

local SellPrices = {}

for _, category in pairs(Config.SellItems) do
    for _, item in ipairs(category) do
        SellPrices[item.name] = item.price
    end
end

RegisterNetEvent("deanix_itemsell:sellItem", function(data)
    local src = source
    local itemName = data.name
    local quantity = tonumber(data.quantity)
    local label = data.label or itemName
    local price = SellPrices[itemName]

    if not itemName or not quantity or quantity <= 0 or not price then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Item Jual',
            description = 'Data penjualan tidak valid.',
            type = 'error' -- atau 'success'
        })
        return
    end

    local hasAmount = exports.ox_inventory:Search(src, "count", itemName)

    if hasAmount < quantity then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Item Jual',
            description = 'Jumlah item tidak cukup.',
            type = 'error' -- atau 'success'
        })
        return
    end

    local duration = 3000
    TriggerClientEvent("deanix_itemsell:playProgress", src, label, duration)
    Wait(duration)

    local removed = exports.ox_inventory:RemoveItem(src, itemName, quantity)
    if not removed then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Item Jual',
            description = 'Gagal menghapus item.',
            type = 'error' -- atau 'success'
        })
        return
    end

    local total = price * quantity

    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddMoney("cash", total, "item-sell")
    end
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Item Jual',
        description = ("Berhasil menjual %sx %s seharga $%s"):format(quantity, label, total),
        type = 'success'
    })
end)

lib.callback.register("deanix_itemsell:getInventory", function(source)
    local items = exports.ox_inventory:GetInventoryItems(source)  -- FIXED HERE
    local result = {}

    for _, item in pairs(items or {}) do
        local price = SellPrices[item.name]
        if price then
            table.insert(result, {
                name = item.name,
                label = item.label or item.name,
                amount = item.count,
                price = price
            })
        end
    end

    return result
end)
