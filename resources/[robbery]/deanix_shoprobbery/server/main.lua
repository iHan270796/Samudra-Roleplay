local QBCore = exports['qb-core']:GetCoreObject()
local lastRobbery = {}
local activeCodes = {}
local function GetPoliceCount()
    local count = 0
    for _, playerId in pairs(QBCore.Functions.GetPlayers()) do
        local player = QBCore.Functions.GetPlayer(playerId)
        if player and Config.PoliceJobs[player.PlayerData.job.name] then
            count = count + 1
        end
    end
    return count
end

QBCore.Functions.CreateCallback('deanix_shoprobbery:canRob', function(source, cb, zoneId)
    local cops = GetPoliceCount()
    local now = os.time()

    if cops < Config.RequiredCops then
        cb(false, 'Polisi tidak cukup!')
        return
    end

    if lastRobbery[zoneId] and (now - lastRobbery[zoneId]) < (Config.Cooldown * 60) then
    local secondsLeft = (Config.Cooldown * 60) - (now - lastRobbery[zoneId])
    local minutesLeft = math.ceil(secondsLeft / 60)

    cb(false, 'Kasir ini baru saja dibobol, tunggu ' .. minutesLeft .. ' menit')
        return
    end

    cb(true)
end)

QBCore.Functions.CreateCallback("deanix_shoprobbery:checkCode", function(source, cb, inputCode, zoneId)
    local correctCode = activeCodes[zoneId]

    if correctCode and inputCode == correctCode then
        cb(true)
        activeCodes[zoneId] = nil
    else
        cb(false)
    end
end)

RegisterNetEvent("deanix_shoprobbery:generateCode", function(zoneId)
    local src = source
    local code = tostring(math.random(1000, 9999))
    activeCodes[zoneId] = code
    TriggerClientEvent("deanix_shoprobbery:receiveCode", src, code, zoneId)
end)

RegisterNetEvent('deanix_shoprobbery:setLastRobbery', function(zoneId)
    lastRobbery[zoneId] = os.time()
end)

RegisterNetEvent('deanix_shoprobbery:giveReward', function()
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player then
        player.Functions.AddItem(Config.RewardItem, Config.RewardAmount)
        TriggerClientEvent('ox_lib:notify', src, {
            description = "Kamu mendapatkan uang rampokan!",
            icon = 'fa-solid fa-sack-dollar',
            type = 'success'
        })
    end
end)

RegisterNetEvent('deanix_shoprobbery:removeItem', function(item)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player then
        player.Functions.RemoveItem(item, 1)
        TriggerClientEvent('ox_lib:notify', src, {
            description = "Item hilang karena gagal.",
            icon = 'fa-solid fa-xmark',
            type = 'error'
        })
    end
end)