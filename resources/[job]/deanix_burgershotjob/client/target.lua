local QBCore = exports['qb-core']:GetCoreObject()
local hasWashedHands = false

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    hasWashedHands = false
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    hasWashedHands = false
end)


Citizen.CreateThread(function()
        exports.ox_target:addBoxZone({
        coords = vec3(-1197.5, -902.78, 13.0), -- titik tengah Z
        size = vec3(1.5, 1.5, 4.0), -- panjang X, Y, tinggi Z
        rotation = 0.0,
        debug = false,
        name = 'burgershot_washhands',
        options = {
            {
                label = 'Wash Hands',
                icon = 'fas fa-hand-sparkles',
                groups = 'bahamas', -- sama fungsi dengan job di qb-target
                onSelect = function()
                    local playerPed = PlayerPedId()
                    TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                    QBCore.Functions.Progressbar("wash_hands", "Washing hands...", 2500, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        ClearPedTasks(playerPed)
                        hasWashedHands = true
                        lib.notify({
                            title = 'Bahamas',
                            description = 'Your hands are clean!',
                            type = 'success'
                        })
                    end)
                end
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = vec3(-1386.11, -608.2, 30.32),
        size = vec3(1.5, 1.5, 4.0),
        rotation = 35.0,
        debug = false,
        name = 'burgershot_bahan_zone',
        options = {
            {
                label = 'Access Food Ingredients',
                icon = 'fas fa-box-open',
                groups = 'bahamas',
                onSelect = function()
                    local player = QBCore.Functions.GetPlayerData()

                    if player.job.name ~= "bahamas" or not player.job.onduty then
                        lib.notify({
                            title = 'Bahamas',
                            description = 'You must be On Duty to access!',
                            type = 'error'
                        })
                        return
                    end

                    if player.job.grade.level < 2 then
                        lib.notify({
                            title = 'Bahamas',
                            description = 'You must be at least in the Senior Chef job to use this!',
                            type = 'error'
                        })
                        return
                    end

                    -- if not hasWashedHands then
                    --     lib.notify({
                    --         title = 'Bahamas',
                    --         description = 'Wash your hands first!',
                    --         type = 'error'
                    --     })
                    --     return
                    -- end

                    TriggerEvent("deanix_burgershot:openBahanUI")
                end
            }
        }
   })
    exports.ox_target:addBoxZone({
        coords = vec3(-1389.1, -608.38, 30.4),
        size = vec3(1.5, 1.5, 4.0),
        rotation = 0.0,
        debug = false,
        name = 'burgershot_crafting_minuman',
        options = {
            {
                label = 'Buat Minuman',
                icon = 'fas fa-kitchen-set',
                groups = 'bahamas',
                onSelect = function()
                    local player = QBCore.Functions.GetPlayerData()

                    if player.job.name ~= "bahamas" or not player.job.onduty then
                        lib.notify({
                            title = 'Bahamas',
                            description = 'You must be On Duty to Cook!',
                            type = 'error'
                        })
                        return
                    end

                    if player.job.grade.level < 2 then
                        lib.notify({
                            title = 'Bahamas',
                            description = 'You must be at least in the Senior Chef job to use this!',
                            type = 'error'
                        })
                        return
                    end

                    -- if not hasWashedHands then
                    --     lib.notify({
                    --         title = 'Bahamas',
                    --         description = 'Wash your hands first!',
                    --         type = 'error'
                    --     })
                    --     return
                    -- end
                    TriggerEvent("deanix_crafting:client:burgershot2")
                end
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = vec3(-1391.08, -608.76, 30.46),
        size = vec3(1.5, 1.5, 4.0),
        rotation = 0.0,
        debug = false,
        name = 'burgershot_crafting',
        options = {
            {
                label = 'Buat Makanan',
                icon = 'fas fa-kitchen-set',
                groups = 'bahamas',
                onSelect = function()
                    local player = QBCore.Functions.GetPlayerData()

                    if player.job.name ~= "bahamas" or not player.job.onduty then
                        lib.notify({
                            title = 'Bahamas',
                            description = 'You must be On Duty to Cook!',
                            type = 'error'
                        })
                        return
                    end

                    if player.job.grade.level < 2 then
                        lib.notify({
                            title = 'Bahamas',
                            description = 'You must be at least in the Senior Chef job to use this!',
                            type = 'error'
                        })
                        return
                    end

                    -- if not hasWashedHands then
                    --     lib.notify({
                    --         title = 'Bahamas',
                    --         description = 'Wash your hands first!',
                    --         type = 'error'
                    --     })
                    --     return
                    -- end
                    TriggerEvent("deanix_crafting:client:openJobCrafting")
                end
            }
        }
    })

    exports.ox_target:addBoxZone({
        coords = vec3(-1384.45, -590.51, 30.3),
        size = vec3(1.5, 1.5, 4.0),
        rotation = 0.0,
        debug = false,
        name = 'burgershot_duty_zone',
        options = {
            {
                label = 'Toggle Duty',
                icon = 'fas fa-sign-in-alt',
                groups = 'bahamas',
                onSelect = function()
                    TriggerServerEvent("QBCore:ToggleDuty")
                end
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = vec3(-1389.7, -605.56, 30.49),
        size = vec3(1.5, 1.5, 4.0), -- minZ 11.0, maxZ 15.0 -> tinggi 4.0
        rotation = 0.0,
        debug = false,
        name = 'Burgershot_katalog',
        options = {
            {
                label = 'Food Catalogue',
                icon = 'fas fa-sign-in-alt',
                onSelect = function()
                    TriggerEvent("deanix_burgershot:openCustomerMenu")
                end
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = vec3(-1383.8, -595.85, 30.32),
        size = vec3(1.5, 1.5, 4.0), -- minZ 11.0, maxZ 15.0
        rotation = 0.0,
        debug = false,
        name = 'Burgershot_stash',
        options = {
            {
                label = 'Stash',
                icon = 'fas fa-sign-in-alt',
                onSelect = function()
                    local player = QBCore.Functions.GetPlayerData()

                    if player.job.name ~= "bahamas" or not player.job.onduty then
                        lib.notify({description = "You have to be on duty to open the safe!", type = "error"})
                        return
                    end

                    -- if not hasWashedHands then
                    --     lib.notify({description = "Wash your hands first!", type = "error"})
                    --     return
                    -- end

                    TriggerEvent("deanix_burgershot:stash")
                end
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = vec3(-1366.83, -612.36, 30.19),
        size = vec3(1.5, 1.5, 4.0), -- minZ 11.0, maxZ 15.0
        rotation = 0.0,
        debug = false,
        name = 'Burgershot_pakaian',
        options = {
            {
                label = 'Wardrobe',
                icon = 'fas fa-shirt',
                onSelect = function()
                    local player = QBCore.Functions.GetPlayerData()

                    if player.job.name ~= "bahamas" or not player.job.onduty then
                        lib.notify({description = "You have to be on duty to open the safe!", type = "error"})
                        return
                    end

                    -- if not hasWashedHands then
                    --     lib.notify({description = "Wash your hands first!", type = "error"})
                    --      return
                    -- end

                    TriggerEvent("illenium-appearance:client:OpenClothingRoom")
                end
            }
        }
    })

    --dj
    exports.ox_target:addBoxZone({
        coords = vec3(-1380.22, -629.07, 30.49),
        size = vec3(1.5, 1.5, 4.0), -- minZ 11.0, maxZ 15.0
        rotation = 0.0,
        debug = false,
        name = 'Bahamas_Dj',
        options = {
            {
                label = 'DJ',
                icon = 'fas fa-music',
                onSelect = function()
                    local player = QBCore.Functions.GetPlayerData()

                    if player.job.name ~= "bahamas" or not player.job.onduty then
                        lib.notify({description = "You have to be on duty to open the safe!", type = "error"})
                        return
                    end

                    -- if not hasWashedHands then
                    --     lib.notify({description = "Wash your hands first!", type = "error"})
                    --      return
                    -- end

                    TriggerEvent("wasabi_boombox:interactStatic", "bahamas_dj", vec3(-1380.22, -629.07, 30.49))
                end
            }
        }
    })

    exports.ox_target:addBoxZone({
        coords = vec3(-1394.86, -609.58, 30.4),
        size = vec3(1.5, 1.5, 4.0), -- minZ 11.0, maxZ 15.0
        rotation = 0.0,
        debug = false,
        name = 'Daftar_pesanan_burgershot',
        options = {
            {
                label = "Order List",
                icon = "fas fa-sign-in-alt",
                groups = "bahamas", -- set job restriction langsung di ox_target
                onSelect = function()
                    TriggerEvent("deanix_burgershot:openPegawaiOrders")
                end
            },
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
    exports['anes_interaction']:AddInteraction({
        id = "BurgershotTray",
        label = "Take Orders Here",
        icon = "fas fa-box", -- Font Awesome icon
        coords = vec3(-1191.97, -897.68, 14.18),
        distance = 2.0,       -- distance to interact
        distancedot = 1.5,   -- distance to show floating dot
        options = {
            {
                actionlabel = "Open Menu",
                actionkey = "E",
                event = "deanix_burgershot:tray", -- triggers client event
            },
        }
    })
end)
