local QBCore = exports['qb-core']:GetCoreObject()
local historyList = {}
local historyPegawai = {}
local historyCustomer = {}

RegisterNetEvent('deanix_burgershot:stash', function()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)

    exports.ox_inventory:openInventory('stash', {
        id = 'bahamasstash',
        label = 'Bahamas Stash',
        slots = 50 
    })
end)

RegisterNetEvent('deanix_burgershot:tray', function()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)

    exports.ox_inventory:openInventory('stash', {
        id = 'bahamastray',
        label = 'Tray',
        slots = 5 
    })
end)

RegisterNetEvent("deanix_burgershot:openBahanUI", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openUI",
        makananList = Config.Makanan,
        history = historyPegawai
    })
end)

RegisterNetEvent("deanix_burgershot:queueFinished", function(history, playerName)
    historyPegawai = {}
    for _, item in ipairs(history) do
        table.insert(historyPegawai, item)
    end
    SendNUIMessage({
        action = "queueDone",
        history = historyPegawai,
        playerName = playerName
    })
end)

RegisterNetEvent("deanix_burgershot:customerHistory", function(history, playerName)
    historyCustomer = {}
    for _, item in ipairs(history) do
        table.insert(historyCustomer, item)
    end
    SendNUIMessage({
        action = "queueDoneCustomer",
        history = historyCustomer,
        playerName = playerName
    })
end)

RegisterNetEvent("deanix_burgershot:openCustomerMenu", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openCustomerKatalog",
        history = historyCustomer
    })
end)

RegisterNetEvent("deanix_burgershot:openPegawaiOrders", function()
    QBCore.Functions.TriggerCallback("deanix_burgershot:getPegawaiOrders", function(orderList)
        if not orderList or #orderList == 0 then
            lib.registerContext({
                id = 'burgershot_orders',
                title = '📋 Order List',
                options = {
                    {
                        title = 'No orders have been received yet',
                        icon = 'ban',
                        disabled = true,
                    }
                }
            })
            lib.showContext('burgershot_orders')
            return
        end

        local options = {
            {
                title = '📋 Order List',
                description = 'Click one to take your order',
                icon = 'list',
                disabled = true
            }
        }

        for _, order in pairs(orderList) do
            table.insert(options, {
                title = order.label,
                description = 'Click to see details and grab it',
                icon = 'utensils',
                onSelect = function()
                    TriggerEvent("deanix_burgershot:ambilOrderPegawai", {
                        id = order.id,
                        data = order.metadata
                    })
                end
            })
        end

        lib.registerContext({
            id = 'burgershot_orders',
            title = '📋 Order List',
            options = options
        })

        lib.showContext('burgershot_orders')
    end)
end)

RegisterNetEvent("deanix_burgershot:ambilOrderPegawai", function(data)
    local info = data.data
    local id = data.id

    lib.notify({
        title = 'Order #' .. id .. ' Taken',
        type = 'success',
        icon = 'fa-solid fa-receipt'
    })

    TriggerServerEvent("deanix_burgershot:takePegawaiOrder", id)

    lib.registerContext({
        id = 'burgershot_orders',
        title = '📋 Order List',
        options = {
            {
                title = 'Waiting for new orders...',
                icon = 'clock',
                disabled = true
            }
        }
    })

    lib.showContext('burgershot_orders')
end)

RegisterNUICallback("getCustomerMenu", function(_, cb)
    QBCore.Functions.TriggerCallback("deanix_burgershot:getMenu", function(makananList)
        cb({ makananList = makananList })
    end)
end)


RegisterNUICallback("confirmCustomerOrder", function(data, cb)
    TriggerServerEvent("deanix_burgershot:confirmOrder", data.items)
    cb({ status = "ok" })
    SetNuiFocus(false, false)
end)


RegisterNUICallback("processBayar", function(data, cb)
    local ped = PlayerPedId()
    local items = data.items
    TriggerServerEvent("deanix_burgershot:bayarItem", items)
    cb({ status = "ok" })
end)

RegisterNUICallback("closeUI", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)
