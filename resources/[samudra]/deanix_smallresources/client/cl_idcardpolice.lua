local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    exports.ox_target:addBoxZone({
        coords = vec3(1758.09, 3652.19, 35.49),
        size = vec3(1.0, 1.0, 3.0),
        rotation = 0, 
        debug = false,
        options = {
            {
                name = 'give_license',
                icon = 'fas fa-id-card',
                label = 'Berikan Lisensi',
                groups = 'pemerintah',
                onSelect = function(data)
                    TriggerEvent('police:openLicenseMenu')
                end
            }
        },
        distance = 1.5
    })
    exports.ox_target:addBoxZone({
        coords = vec3(442.28, -981.24, 30.71),
        size = vec3(1.0, 1.0, 3.0),
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'give_license',
                icon = 'fas fa-id-card',
                label = 'Berikan Lisensi',
                groups = 'police',
                onSelect = function(data)
                    TriggerEvent('police:openLicenseMenu2')
                end
            }
        },
        distance = 1.5
    })
end)

RegisterNetEvent("police:openLicenseMenu", function()
    lib.registerContext({
        id = 'police_license_menu',
        title = '🎫 Menu Lisensi Pemerintah',
        options = {
            {
                title = '🎫 Beri ID Card',
                description = 'Berikan ID Card ke warga',
                event = 'police:giveLicense',
                args = { type = "id_card" }
            }
        }
    })
    lib.showContext('police_license_menu')
end)

RegisterNetEvent("police:openLicenseMenu2", function()
    lib.registerContext({
        id = 'police_license_menu',
        title = '🎫 Menu Lisensi Polisi',
        options = {
            {
                title = '🚗 Beri Driver License A',
                description = 'Berikan SIM ke warga',
                event = 'police:giveLicense2',
                args = { type = "driver_license" }
            },
            {
                title = '🚗 Beri Driver License B',
                description = 'Berikan SIM ke warga',
                event = 'police:giveLicense2',
                args = { type = "driver_licenseb" }
            },
            {
                title = '🚗 Beri Driver License C',
                description = 'Berikan SIM ke warga',
                event = 'police:giveLicense2',
                args = { type = "driver_licensec" }
            },
            {
                title = '🔫 Beri Weapon License',
                description = 'Berikan Lisensi Senjata ke warga',
                event = 'police:giveLicense2',
                args = { type = "weaponlicense" }
            },
            {
                title = '🐗 Beri Hunting License',
                description = 'Berikan Lisensi Berburu ke warga',
                event = 'police:giveLicense2',
                args = { type = "licensehunting" }
            }
        }
    })
    lib.showContext('police_license_menu')
end)

RegisterNetEvent("police:giveLicense", function(data)
    local input = lib.inputDialog('Masukkan ID Pemain', {
        { type = "number", label = "Player ID", required = true, icon = 'id-card' }
    })

    if not input or not input[1] then return end

    local targetId = tonumber(input[1])
    if targetId then
        TriggerServerEvent("police:server:giveLicense", targetId, data.type)
    else
        QBCore.Functions.Notify("ID tidak valid!", "error")
    end
end)

RegisterNetEvent("police:giveLicense2", function(data)
    local input = lib.inputDialog('Masukkan ID Pemain', {
        { type = "number", label = "Player ID", required = true, icon = 'id-card' }
    })

    if not input or not input[1] then return end

    local targetId = tonumber(input[1])
    if targetId then
        TriggerServerEvent("police:server:giveLicense2", targetId, data.type)
    else
        QBCore.Functions.Notify("ID tidak valid!", "error")
    end
end)

