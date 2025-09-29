local QBCore = exports['qb-core']:GetCoreObject()
local lastRobberyTime = {}
local AuthorizedHackers = {}
local bankProgressServer = {}

RegisterNetEvent("deanix_robfleecabank:RemoveItem", function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.RemoveItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
    end
end)

RegisterNetEvent("deanix_robfleecabank:server:GiveReward", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local item = Config.Reward.Item or "markedbills"
    local min = Config.Reward.Money.min or 1
    local max = Config.Reward.Money.max or 3
    local amount = math.random(min, max)

    Player.Functions.AddItem(item, amount)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent("deanix_robfleecabank:SetRobberyTime", function(bankId)
    lastRobberyTime[bankId] = os.time()
    TriggerClientEvent("deanix_robfleecabank:client:SetCooldowns", -1, lastRobberyTime)
    SetTimeout(Config.Cooldown * 1000, function()
    lastRobberyTime[bankId] = nil
    bankProgressServer[bankId] = nil -- ⬅️ Reset status uang diambil
    TriggerClientEvent("deanix_robfleecabank:ResetBankProgress", -1, bankId)
    TriggerClientEvent("deanix_robfleecabank:client:SetCooldowns", -1, lastRobberyTime)
    end)
end)

RegisterNetEvent("deanix_robfleecabank:server:OpenVaultDoor", function(bankId)
    TriggerClientEvent("deanix_robfleecabank:client:OpenVaultDoor", -1, bankId)
end)

function GetPoliceCount()
    local players = QBCore.Functions.GetPlayers()
    local count = 0
    for _, playerId in pairs(players) do
        local Player = QBCore.Functions.GetPlayer(playerId)
        if Player and Player.PlayerData.job.name == "police" then
            count = count + 1
        end
    end
    return count
end

lib.callback.register("deanix_robfleecabank:CanStartRobbery", function(source, bankId)
    local now = os.time()
    local lastTime = lastRobberyTime[bankId] or 0
    local cooldown = Config.Cooldown

    if now - lastTime < cooldown then
        local remaining = cooldown - (now - lastTime)
        return false, remaining
    else
        return true
    end
end)

lib.callback.register("deanix_robfleecabank:GetPoliceCount", function(source)
    local count = 0
    for _, player in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(player)
        if Player and Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            count = count + 1
        end
    end
    return count
end)

RegisterNetEvent("deanix_robfleecabank:server:SetMoneyTaken", function(bankId)
    local src = source
    if not bankId then return end

    bankProgressServer[bankId] = bankProgressServer[bankId] or {}

    if bankProgressServer[bankId].moneyTaken then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Bank Fleeca',
            description = 'Uang sudah diambil!',
            type = 'error'
        })
        return
    end

    bankProgressServer[bankId].moneyTaken = true
    TriggerEvent("deanix_robfleecabank:server:GiveReward", src)
    TriggerClientEvent("deanix_robfleecabank:client:UpdateBankProgress", -1, bankId, bankProgressServer[bankId])
end)


lib.callback.register("deanix_robfleecabank:server:GetBankProgress", function(source, bankId)
    return bankProgressServer[bankId] or {}
end)

RegisterNetEvent("deanix_robfleecabank:server:AuthorizeHacker", function(doorId)
    local src = source

    if not AuthorizedHackers[doorId] then
        AuthorizedHackers[doorId] = {}
    end

    AuthorizedHackers[doorId][src] = true

    SetTimeout(60000, function() -- 60 detik
        if AuthorizedHackers[doorId] then
            AuthorizedHackers[doorId][src] = nil
        end
    end)
end)

exports('IsHackerAuthorized', function(playerId, doorId)
    return AuthorizedHackers[doorId] and AuthorizedHackers[doorId][playerId]
end)
