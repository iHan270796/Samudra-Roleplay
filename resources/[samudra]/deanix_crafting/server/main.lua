local QBCore = exports['qb-core']:GetCoreObject()

function RemoveCraftingMaterials(src, itemName, amount)
    local recipe = Config.Recipes[itemName]
    if not recipe then return false end

    for _, req in pairs(recipe.materials) do
        local count = exports.ox_inventory:GetItemCount(src, req.item)
        if count < (req.amount * amount) then
            return false
        end
    end

    for _, req in pairs(recipe.materials) do
        local totalAmount = req.amount * amount
        exports.ox_inventory:RemoveItem(src, req.item, totalAmount)
        Wait(150)
    end

    return true
end

RegisterServerEvent('deanix_crafting:server:craftItem', function(itemName, amount, requirements)
    local src = source
    itemName = itemName:match("^%s*(.-)%s*$")

    for _, req in ipairs(requirements) do
        local count = exports.ox_inventory:GetItemCount(src, req.item)
        if count < (req.amount * amount) then
            TriggerClientEvent('ox_lib:notify', src, {
                description = 'Bahan tidak mencukupi untuk crafting.',
                type = 'error'
            })
            return
        end
    end

    for _, req in ipairs(requirements) do
        local totalAmount = req.amount * amount
        exports.ox_inventory:RemoveItem(src, req.item, totalAmount)
        Wait(200)
    end

    exports.ox_inventory:AddItem(src, itemName, amount)

    local recipe = Config.Recipes[itemName]
    if recipe then
        local xpGain = (recipe.xp_gain or 10) * amount
        TriggerEvent('deanix_crafting:addXP', src, xpGain)
    end

    TriggerClientEvent('ox_lib:notify', src, {
        description = 'Berhasil membuat ' .. ((QBCore.Shared.Items[itemName] and QBCore.Shared.Items[itemName].label) or itemName),
        type = 'success'
    })
end)

RegisterNetEvent("deanix_crafting:failCrafting", function(data)
    local src = source
    local item = (data.item or ""):match("^%s*(.-)%s*$")
    local amount = data.amount or 1
    local recipe = Config.Recipes[item]
    if not recipe then return end

    local success = true

    for _, req in pairs(recipe.materials) do
        local count = exports.ox_inventory:GetItemCount(src, req.item)
        if count < (req.amount * amount) then
            success = false
            break
        end
    end

    if success then
        for _, req in pairs(recipe.materials) do
            local totalAmount = req.amount * amount
            exports.ox_inventory:RemoveItem(src, req.item, totalAmount)
            Wait(150)
        end

        TriggerClientEvent('ox_lib:notify', src, {
            description = "Crafting gagal. Bahan tetap terpakai.",
            type = 'error'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            description = "Bahan tidak berhasil dikurangi (server error).",
            type = 'error'
        })
    end
end)

RegisterServerEvent('deanix_crafting:addXP', function(playerId, amount)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return end

    local meta = Player.PlayerData.metadata
    meta["crafting_exp"] = (meta["crafting_exp"] or 0) + amount

    if meta["crafting_exp"] > Config.MaxXP then
        meta["crafting_exp"] = Config.MaxXP
        TriggerClientEvent('ox_lib:notify', playerId, {
            description = "XP Crafting untuk mencapai level maksimum telah tercapai!",
            type = 'error'
        })
    else
        TriggerClientEvent('ox_lib:notify', playerId, {
            title = 'Crafting',
            description = 'Mendapatkan +' .. amount .. ' XP Crafting!',
            type = 'success'
        })
    end

    Player.Functions.SetMetaData("crafting_exp", meta["crafting_exp"])
end)

QBCore.Functions.CreateCallback('deanix_crafting:getXP', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb(0) end

    local meta = Player.PlayerData.metadata
    local xp = meta["crafting_exp"] or 0
    cb(xp)
end)
