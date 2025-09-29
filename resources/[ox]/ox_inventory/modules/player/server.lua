local armour <const> = {
    armour = 60,
    armourr = 85,
    heavy_armour = 100
}

local bagsFilter     = {}

for i = 1, #BagsArray, 1 do
    bagsFilter[BagsArray[i]] = true
end

local armourFilter = {}

for i = 1, #ArmourArray, 1 do
    armourFilter[ArmourArray[i]] = true
end

function OnItemSwap(utilType, payload)
    if utilType == 'armor' then
        if payload.fromSlot.metadata and not payload.fromSlot.metadata.armour then
            payload.fromSlot.metadata.armour = armour[payload.fromSlot.name]
            exports[cache.resource]:SetMetadata(payload.fromInventory, payload.fromSlot.slot,
                payload.fromSlot.metadata)
        end
    end
end

exports[cache.resource]:registerHook('swapItems', function(payload)
    if payload.toType == 'player' then
        local toSlot = type(payload.toSlot) == "table" and payload.toSlot.slot or payload.toSlot
        local slot = UtilsSlot[toSlot]
        if slot then
            local item = slot.item
            if item then
                if type(item) == 'string' and payload.fromSlot.name ~= slot.item then
                    return false, TriggerClientEvent('ox_lib:notify', payload.source,
                        { type = 'error', description = 'you cannot swap items with this slot' })
                elseif type(item) == 'table' then
                    for i = 1, #item, 1 do
                        if item[i] == payload.fromSlot.name then
                            goto continue
                        end
                    end

                    return false, TriggerClientEvent('ox_lib:notify', payload.source,
                        { type = 'error', description = 'you cannot swap items with this slot' })
                end

                ::continue::
                OnItemSwap(slot.type, payload)
            end
        end

        if type(payload.fromSlot) == "table" and type(payload.toSlot) == "table" then
            for key, value in pairs(UtilsSlot) do
                if value.type then
                    if (IsItemType(payload.fromSlot, value.type) and IsItemType(payload.toSlot, value.type)) then
                        return false
                    end
                end
            end
            return false
        end
    end
end, {
    typeFilter = {
        player = true,
        container = true,
    }
})

exports[cache.resource]:registerHook('swapItems', function(payload)
    if payload.toType == 'player' and payload.source then
        TriggerClientEvent('ox_inventory:openInventory', payload.source)
        Wait(500)
        TriggerClientEvent('ox_inventory:openInventory', payload.source)
    end
end, {
    itemFilter = bagsFilter,
})

exports[cache.resource]:registerHook('createItem', function(payload)
    local metadata = payload.metadata or {}
    if not metadata.armour then
        metadata.armour = armour[payload.item.name]
        metadata.durability = metadata.armour
        return metadata
    end
end, {
    itemFilter = armourFilter,
})

exports[cache.resource]:registerHook('swapItems', function(payload)
    if payload.toType == 'player' and payload.source then
        if IsItemType(payload.fromSlot, 'armor') then
            local ped = GetPlayerPed(payload.source)
            SetPedArmour(ped, 0)
        end
    end
end, {
    itemFilter = armourFilter,
})


RegisterNetEvent('ox_inventory:server:UpdateArmour', function()
    local source = source

    local armours = exports[cache.resource]:Search(source, 'slots', ArmourArray)

    for k, v in pairs(armours) do
        for i = 1, #v, 1 do
            local item = v[i]
            if IsItemType(item, 'armor') then
                local metadata = item.metadata or {}
                local pedArmour = GetPedArmour(GetPlayerPed(source))
                metadata.armour = pedArmour
                metadata.durability = pedArmour
                exports[cache.resource]:SetMetadata(source, item.slot, metadata)
                exports[cache.resource]:SetDurability(source, item.slot, pedArmour)
            end
        end
    end
end)
