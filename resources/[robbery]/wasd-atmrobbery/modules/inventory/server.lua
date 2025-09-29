local Inventory = {}

function Inventory.GiveItem(source, itemName, count)
    local xPlayer = server.GetPlayer(source)
    if shared.GetFrameworkName() == 'esx' then
        return xPlayer.addInventoryItem(itemName, count)
    elseif shared.GetFrameworkName() == 'qb' then
        return xPlayer.Functions.AddItem(itemName, count)
    elseif shared.GetFrameworkName() == 'qbx' then
        return xPlayer.Functions.AddItem(itemName, count)
    end
    return false
end

function Inventory.RemoveItem(source, itemName, count)
    local xPlayer = server.GetPlayer(source)
    if shared.GetFrameworkName() == 'esx' then
        return xPlayer.removeInventoryItem(itemName, count)
    elseif shared.GetFrameworkName() == 'qb' then
        return xPlayer.Functions.RemoveItem(itemName, count)
    elseif shared.GetFrameworkName() == 'qbx' then
        return xPlayer.Functions.RemoveItem(itemName, count)
    end
    return false
end

function Inventory.HasItem(source, itemName, amount)
    amount = amount or 1
    local xPlayer = server.GetPlayer(source)

    local count = 0
    local item = nil

    if shared.GetFrameworkName() == 'esx' then
        item = xPlayer.hasItem(itemName)
    else --[[ QB or QBOX ]]
        item = xPlayer.Functions.GetItemByName(itemName)
    end
    if item then
        count = item.amount or item.count or 0
    end
    return count >= amount
end

return Inventory
