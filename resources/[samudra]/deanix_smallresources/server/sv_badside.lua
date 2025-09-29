RegisterNetEvent('gang:server:registerGangStash', function(stashId, label)
    exports.ox_inventory:RegisterStash(stashId, label, 100, 1000000)
    TriggerClientEvent('ox_inventory:openInventory', source, 'stash', {
        id = stashId,
        label = label
    })
end)