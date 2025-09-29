local QBCore = exports['qb-core']:GetCoreObject()

function OpenSellUI(sellType)
    lib.callback('deanix_itemsell:getInventory', false, function(inventory)
        local itemsToSend = {}
        local categoryItems = Config.SellItems[sellType] or {}

        for _, configItem in ipairs(categoryItems) do
            local foundAmount = 0

            for _, invItem in ipairs(inventory) do
                if invItem.name == configItem.name then
                    foundAmount = invItem.amount or invItem.count or 0
                    break
                end
            end

            table.insert(itemsToSend, {
                name = configItem.name,
                label = configItem.label,
                price = configItem.price,
                amount = foundAmount,
            })
        end

        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "openSellUI",
            items = itemsToSend
        })
    end)
end

RegisterNUICallback('sellQueueItem', function(data, cb)
    TriggerServerEvent("deanix_itemsell:sellItem", data)
    cb({})
end)

RegisterNUICallback('notify', function(data, cb)
    lib.notify({
        title = data.message or "Notifikasi",
        type = data.type or "inform" -- 'success', 'error', 'info'
    })
    cb({})
end)


RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)

RegisterNetEvent("jualbarang:hasilkerja", function ()
    OpenSellUI("mining")
end)
RegisterNetEvent("jualbarang:Haram", function ()
    OpenSellUI("drugs")
end)
RegisterNetEvent("jualbarang:HasilMancing", function ()
    OpenSellUI("fishjob")
end)

RegisterNetEvent("deanix_itemsell:playProgress", function(itemLabel, duration)
    local playerPed = PlayerPedId()
    RequestAnimDict("mp_common")
    while not HasAnimDictLoaded("mp_common") do Wait(10) end
    TaskPlayAnim(playerPed, "mp_common", "givetake1_a", 8.0, -8.0, duration, 48, 0, false, false, false)

    QBCore.Functions.Progressbar("selling_item", "Menjual " .. itemLabel .. "...", duration, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(playerPed)
    end, function()
        ClearPedTasks(playerPed)
        TriggerEvent("deanix_itemsell:sellCancelled")
    end)
end)

RegisterNetEvent("deanix_itemsell:sellCancelled", function()
    SendNUIMessage({
        action = "saleCancelled"
    })
end)
