local newPlayerCountdown = 7200
local onlineTimeTracker = {}

AddEventHandler("playerDropped", function()
    local src = source
    SavePlayerCountdownProgress(src)
end)

AddEventHandler("onResourceStop", function(res)
    if res == GetCurrentResourceName() then
        for src, _ in pairs(onlineTimeTracker) do
            SavePlayerCountdownProgress(src)
        end
    end
end)

RegisterNetEvent("deanix_newplayer:playerLoaded", function()
    local src = source
    local license = GetIdentifier(src, "license")
    if not license then return end

    local result = MySQL.single.await("SELECT played_seconds, finished FROM new_player_data WHERE license = ?", {license})

    if result and result.finished == 1 then return end

    local played = result and result.played_seconds or 0
    local remaining = newPlayerCountdown - played

    if remaining <= 0 then
        MySQL.update.await("UPDATE new_player_data SET finished = 1 WHERE license = ?", {license})
        GiveReward(src)
        return
    end

    if not result then
        MySQL.insert.await("INSERT INTO new_player_data (license, played_seconds, finished) VALUES (?, ?, 0)", {
            license, 0
        })
    end

    onlineTimeTracker[src] = {
        license = license,
        loginTime = os.time(),
        alreadyPlayed = played,
        finished = result and result.finished == 1 or false
    }

    TriggerClientEvent("deanix_newplayer:startCountdown", src, remaining)
end)

function SavePlayerCountdownProgress(src)
    local data = onlineTimeTracker[src]
    if not data then return end

    local now = os.time()
    local playedNow = now - data.loginTime
    local totalPlayed = data.alreadyPlayed + playedNow
    local license = data.license

    MySQL.update.await("UPDATE new_player_data SET played_seconds = ? WHERE license = ?", {
        totalPlayed, license
    })

    if not data.finished and totalPlayed >= newPlayerCountdown then
    MySQL.update.await("UPDATE new_player_data SET finished = 1 WHERE license = ?", {
        license
    })
        GiveReward(src)
    end

    onlineTimeTracker[src] = nil
end

function GiveReward(src)
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddMoney("cash", 100000, "new-player-reward")
        TriggerClientEvent('QBCore:Notify', src, "🎉 Kamu mendapatkan $100000 karena telah menyelesaikan tutorial!", "success")
    end
end

function GetIdentifier(src, idType)
    local ids = GetPlayerIdentifiers(src)
    for _, id in ipairs(ids) do
        if id:find(idType) then
            return id
        end
    end
end
