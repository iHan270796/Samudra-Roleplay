RegisterNetEvent('charger:server:startCharging', function()
    local src = source
    local hasItem = exports.ox_inventory:Search(src, 'count', 'charger_hp') > 0

    if not hasItem then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = '⚠️ Anda Tidak Punya Charger HP'
        })
        return
    end
    TriggerClientEvent('charger:client:startCharging', src)
end)
