local isCharging = false

RegisterNetEvent('charger:client:startCharging', function()
    if isCharging then
        lib.notify({ type = 'error', description = 'Already charging!' })
        return
    end

    if not exports.yseries then
        lib.notify({ type = 'error', description = 'Phone system not loaded!' })
        return
    end

    local success = lib.progressBar({
        duration = 5000,
        label = 'Memasang Charger HP...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            combat = true
        },
        anim = {
            dict = 'amb@prop_human_parking_meter@female@idle_a',
            clip = 'idle_a_female'
        }
    })

    if success then
        exports.yseries:StartCharging()
        lib.notify({ type = 'success', description = '🔋 Charging started...' })
        isCharging = true
    else
        lib.notify({ type = 'error', description = 'Cancelled charging.' })
    end
end)

RegisterNetEvent('charger:client:stopCharging', function()
    if not isCharging then
        lib.notify({ type = 'error', description = 'Not charging!' })
        return
    end

    exports.yseries:StopCharging()
    lib.notify({ type = 'info', description = '⚡ Charger Di Batalkan.' })
    isCharging = false
end)



CreateThread(function()
    exports.ox_target:addBoxZone({
        name = 'charger_mechanic',
        coords = vec3(30.34, 6537.82, 37.92),
        size = vec3(1.5, 1, 2),
        rotation = 71,
        debug = false,
        options = {
            {
                icon = 'fa-solid fa-plug',
                label = 'Charging Phone',
                distance = 2,
                onSelect = function()
                    TriggerServerEvent('charger:server:startCharging')
                end
            },
            {
                name = 'stop_phone_charger',
                icon = 'fa-solid fa-plug-circle-xmark',
                label = 'Stop Charging',
                onSelect = function()
                    TriggerEvent('charger:client:stopCharging')
                end
            }
        }
    })
    exports.ox_target:addBoxZone({
        name = 'charger_badside1',
        coords = vec3(984.66, -93.98, 74.77),
        size = vec3(1.5, 1, 2),
        rotation = 71,
        debug = false,
        options = {
            {
                icon = 'fa-solid fa-plug',
                label = 'Charging Phone',
                distance = 4,
                onSelect = function()
                    TriggerServerEvent('charger:server:startCharging')
                end
            },
            {
                name = 'stop_phone_charger',
                icon = 'fa-solid fa-plug-circle-xmark',
                label = 'Stop Charging',
                onSelect = function()
                    TriggerEvent('charger:client:stopCharging')
                end
            }
        }
    })
end)