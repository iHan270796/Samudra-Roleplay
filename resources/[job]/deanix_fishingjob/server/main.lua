local QBCore = exports['qb-core']:GetCoreObject()
local fishTypes = {
    { label = "Jack Smelt", item = "jacksmelt", weight = {1, 2} },
    { label = "Brown Trout", item = "brown_trout", weight = {1, 3} },
    { label = "Stick Leback", item = "stickleback", weight = {2, 5} },
    { label = "Sun Fish", item = "sunfish", weight = {3, 6} },
    { label = "Blue Gill", item = "bluegill", weight = {5, 10} },
    { label = "Rock Fish", item = "rockfish", weight = {8, 10} }
}

local validFishItems = {
    ["jacksmelt"] = true,
    ["brown_trout"] = true,
    ["stickleback"] = true,
    ["sunfish"] = true,
    ["bluegill"] = true,
    ["rockfish"] = true,
}

RegisterNetEvent("deanix_fishing:reward", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fish = fishTypes[math.random(#fishTypes)]
    local weight = math.random(fish.weight[1]*10, fish.weight[2]*10) / 10
    local meta = { weight = weight }

    TriggerClientEvent("deanix_fishing:showFish", src, {
        label = fish.label,
        item = fish.item,
        meta = meta
    })
end)

RegisterNetEvent("deanix_fishing:removeBait", function()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName('fish_bait') then
        Player.Functions.RemoveItem('fish_bait', 1)
    end
end)

RegisterNetEvent("deanix_fishing:addFish", function(item, meta)
    local Player = QBCore.Functions.GetPlayer(source)
    local weight = tonumber(meta and meta.weight)

    if validFishItems[item] and weight and weight > 0 and weight <= 10 then
        if not Player.Functions.AddItem(item, 1, false, meta) then
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Inventory Full!',
                type = 'error'
            })
        end
    else
        print("[Fishing] Invalid fish data received:", json.encode({item=item, meta=meta}))
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Invalid fish data',
            type = 'error'
        })
    end
end)



QBCore.Functions.CreateCallback("deanix_fishing:hasBait", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local bait = Player.Functions.GetItemByName('fish_bait')
    cb(bait ~= nil and bait.amount > 0)
end)

QBCore.Functions.CreateCallback("deanix_fishing:getFishData", function(_, cb)
    local fish = fishTypes[math.random(#fishTypes)]
    local weight = math.random(fish.weight[1]*10, fish.weight[2]*10) / 10
    local meta = { weight = weight }
    cb({
        label = fish.label,
        item = fish.item,
        meta = meta
    })
end)
