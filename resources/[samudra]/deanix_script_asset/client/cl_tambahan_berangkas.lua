RegisterNetEvent('Mechanic:tambahan_stash', function()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)

    exports.ox_inventory:openInventory('stash', {
        id = 'mechanicstash',
        label = 'Mechanic Stash',
        slots = 500
    })
end)

CreateThread(function()
    exports.ox_target:addBoxZone({
        name = 'Berangkas_mekanik',
        coords = vec3(24.6, 6538.68, 37.69),
        size = vec3(1.5, 1, 2),
        rotation = 71,
        debug = false,
        options = {
            {
                icon = 'fas fa-sign-in-alt',
                label = 'Berangkas',
                groups = "mechanic",
                distance = 2,
                onSelect = function()
                    TriggerEvent("Mechanic:tambahan_stash")
                end
            }
        }
    })
end)