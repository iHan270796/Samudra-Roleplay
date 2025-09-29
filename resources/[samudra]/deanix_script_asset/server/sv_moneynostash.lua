local hookId = exports.ox_inventory:registerHook('swapItems', function(payload)
    if payload.toType == 'stash' then return false end
    if payload.toType == 'trunk' then return false end
    if payload.toType == 'glovebox' then return false end
    if payload.fromType == 'stash' then return false end
    if payload.fromType == 'trunk' then return false end
    if payload.fromType == 'glovebox' then return false end
    return true
end, {
    print = false,
    itemFilter = {money = true},
})