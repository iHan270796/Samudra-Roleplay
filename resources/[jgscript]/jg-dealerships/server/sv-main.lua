math.randomseed(os.time())

function GenerateUuid()
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    return string.gsub(template, "[xy]", function(c)
        local v = (c == "x") and math.random(0, 15) or math.random(8, 11)
        return string.format("%x", v)
    end)
end
function GetNearbyPlayers(source, coords, distance, includeSelf)
    local players = {}
    
    -- Get all players and check distance manually since lib.getNearbyPlayers might not work server-side
    local allPlayers = GetPlayers()
    
    for _, playerId in ipairs(allPlayers) do
        playerId = tonumber(playerId)
        
        -- Skip self if not included
        if not includeSelf and source == playerId then
            goto continue
        end
        
        -- Get player ped and coords
        local ped = GetPlayerPed(playerId)
        if ped and DoesEntityExist(ped) then
            local playerCoords = GetEntityCoords(ped)
            local dist = #(coords - playerCoords)
            
            if dist <= distance then
                local playerInfo = Framework.Server.GetPlayerInfo(playerId)
                players[#players + 1] = {
                    id = playerId,
                    identifier = Framework.Server.GetPlayerIdentifier(playerId),
                    name = playerInfo and playerInfo.name or "Unknown"
                }
            end
        end
        
        ::continue::
    end
    
    DebugPrint(string.format("Found %s nearby players", #players), "debug", players)
    return players
end
function GetCurrentDealershipLocation(playerCoords)
    local closestDealership = nil
    local closestDistance = -1
    for dealershipId, dealershipData in pairs(Config.DealershipLocations) do
        local showroomCoords = dealershipData.openShowroom.coords
        local distance = #(playerCoords - vector3(showroomCoords.x, showroomCoords.y, showroomCoords.z))
        if closestDistance == -1 or closestDistance > distance then
            closestDealership = dealershipId
            closestDistance = distance
        end
    end
    return closestDealership, closestDistance
end
RegisterNetEvent("jg-dealerships:server:exit-bucket", function()
    local src = source
    SetPlayerRoutingBucket(src, 0)
    print(string.format("Restart: emegency player %s breakout to bucket 0", src))
end)
RegisterNetEvent("jg-dealerships:server:notify-other-player", function(targetPlayer, ...)
    TriggerClientEvent("jg-dealerships:client:notify", targetPlayer, ...)
end)

-- Define InitOrderProcessingThread as a placeholder
-- The actual implementation is in sv-management.lua
function InitOrderProcessingThread()
    -- This function will be overridden by sv-management.lua
    -- It's defined here to prevent nil value error during startup
end

AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    InitSQL()
    for dealershipId, _ in pairs(Config.DealershipLocations) do
        MySQL.insert.await("INSERT IGNORE INTO dealership_data (name, balance) VALUES(?, 0)", {dealershipId})
    end
    local hashkeyColumn = MySQL.query.await("SHOW COLUMNS FROM dealership_vehicles LIKE 'hashkey'")
    if #hashkeyColumn == 0 then
        MySQL.query.await("ALTER TABLE dealership_vehicles ADD hashkey VARCHAR(100)")
    end
    local vehiclesWithoutHashkey = MySQL.query.await("SELECT spawn_code FROM dealership_vehicles WHERE hashkey IS NULL")
    for _, vehicle in pairs(vehiclesWithoutHashkey) do
        MySQL.update.await("UPDATE dealership_vehicles SET hashkey = ? WHERE spawn_code = ?", {
            GetHashKey(vehicle.spawn_code),
            vehicle.spawn_code
        })
    end
    InitFinanceThread()
    InitOrderProcessingThread()
end)
