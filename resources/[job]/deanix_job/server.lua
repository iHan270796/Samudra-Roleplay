local QBCore = exports['qb-core']:GetCoreObject()

----------------------
-- === MINING === --
----------------------

RegisterServerEvent("deanix_mining:giveStone", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        Player.Functions.AddItem("stone", 1)
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Mining',
            description = 'Kamu mendapatkan batu hasil tambang',
            type = 'success'
        })
    end
end)

RegisterServerEvent("deanix_mining:breakDrill", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        local drillSlot = Player.Functions.GetItemByName("drill")
        if drillSlot then
            if drillSlot.info and drillSlot.info.durability then
                drillSlot.info.durability = drillSlot.info.durability - 1
            else
                Player.Functions.RemoveItem("drill", 1, drillSlot.slot)
            end
        end
    end
end)

RegisterServerEvent("deanix_mining:washStone", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if Player.Functions.RemoveItem("stone", 1) then
        Player.Functions.AddItem("batu_bersih", 1)
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Mining',
            description = 'Kamu berhasil mencuci batu menjadi batu bersih',
            type = 'success'
        })
    end
end)

RegisterServerEvent("deanix_mining:smeltStone", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if Player.Functions.RemoveItem("batu_bersih", 1) then
        local possibleRewards = { "tembaga", "besi", "emas", "diamon" }

        for i = #possibleRewards, 2, -1 do
            local j = math.random(i)
            possibleRewards[i], possibleRewards[j] = possibleRewards[j], possibleRewards[i]
        end

        local totalRewards = math.random(2, 3)
        local givenRewards = {}
        for i = 1, totalRewards do
            local reward = possibleRewards[i]
            local amount = math.random(1, 2)

            Player.Functions.AddItem(reward, amount)
            table.insert(givenRewards, "x" .. amount .. " " .. QBCore.Shared.Items[reward].label)
            Wait(500)
        end

        local rewardText = table.concat(givenRewards, ", ")
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Mining',
            description = 'Kamu mendapatkan: ' .. rewardText,
            type = 'success'
        })
    end
end)

-------------------------
-- === LUMBERJACK === --
-------------------------

RegisterServerEvent("deanix_mining:giveWood", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local amount = math.random(1, 3)
    Player.Functions.AddItem("kayu", amount)
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Lumberjack',
        description = 'Kamu mendapatkan x' .. amount .. ' kayu.',
        type = 'success'
    })
end)

RegisterServerEvent("deanix_mining:breakAxe", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player then
        local axeSlot = Player.Functions.GetItemByName("axe")
        if axeSlot then
            if axeSlot.info and axeSlot.info.durability then
                axeSlot.info.durability = axeSlot.info.durability - 1
            else
                Player.Functions.RemoveItem("axe", 1, axeSlot.slot)
            end
        end
    end
end)

RegisterServerEvent("deanix_mining:processWood", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if Player.Functions.RemoveItem("kayu", 1) then
        local jumlahPapan = math.random(1, 2)
        local jumlahKulit = math.random(1, 2)

        Player.Functions.AddItem("papan_kayu", jumlahPapan)
        Player.Functions.AddItem("kulit_kayu", jumlahKulit)

        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Lumberjack',
            description = 'Kayu diolah menjadi x' .. jumlahPapan .. 'papan dan x' .. jumlahKulit .. ' kulit kayu.',
            type = 'error'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Lumberjack',
            description = '"Kamu tidak memiliki kayu untuk diproses.',
            type = 'error'
        })
    end
end)
