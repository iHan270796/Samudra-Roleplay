RegisterNetEvent('dealerdrugs:startSelling', function()
    local source = source
    local drugToSell = {
        type = '',
        label = '',
        count = 0,
        i = 0,
        price = 0,
    }

    for k, v in pairs(Config.drugs) do
        local item = GetItemLabel(source, k)

        if not item then
            return
        end

        local count = GetItemCount(source, k)
        drugToSell.i = drugToSell.i + 1
        drugToSell.type = k
        drugToSell.label = item

        if count >= 5 then
            drugToSell.count = math.random(1, 5)
        elseif count > 0 then
            drugToSell.count = math.random(1, count)
        end

        if drugToSell.count ~= 0 then
            drugToSell.price = drugToSell.count * v + math.random(1, 300)
            TriggerClientEvent('stasiek_selldrugsv2:findClient', source, drugToSell)
            break
        end

        if TableSizeOf(Config.drugs) == drugToSell.i and drugToSell.count == 0 then
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Drugs',
                description = Config.notify.nodrugs,
                duration = 8000,
                position = 'center-right',
                icon = 'pills'
            })
        end
    end
end)

RegisterServerEvent('stasiek_selldrugsv2:pay', function(drugToSell)
    local src = source
    local count = GetItemCount(src, drugToSell.type)
    local player = GetPlayerFromId(src)

    if count >= drugToSell.count then
        RemoveItem(src, drugToSell.type, drugToSell.count)

        local reward = Config.ItemRewards[drugToSell.type]
        if reward then
            player.Functions.AddItem(reward.item, reward.amount)
        else
            if Config.account == 'money' then
                AddCash(src, drugToSell.price)
            else
                AddAccountMoney(src, Config.account, drugToSell.price)
            end
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Drugs',
            description = Config.notify.nodrugs,
            duration = 8000,
            position = 'center-right',
            icon = 'pills'
        })
    end
end)

RegisterServerEvent('stasiek_selldrugsv2:notifycops', function(drugToSell)
    TriggerClientEvent('ps-dispatch:customAlert', -1, {
        message = "Suspicious activity related to " .. (drugToSell.label or "narcotics"),
        dispatchCode = "10-66",
        code = "10-66",
        icon = "fas fa-capsules",
        priority = 2,
        jobs = { "police", "sheriff" },
        sound = "Alarm_Store",
        sound2 = "DLC_HEIST_HACKING_SNAKE_SOUNDS",
        flash = true,
        scale = 1.2,
        sprite = 140,
        color = 3,
        length = 5,
        coords = drugToSell.coords
    })
end)
