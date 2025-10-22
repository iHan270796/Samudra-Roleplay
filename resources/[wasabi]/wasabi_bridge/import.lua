-- Check if wasabi_bridge is started
local bridgeState = GetResourceState("wasabi_bridge")
if not bridgeState:find("start") then
    print("^1wasabi_bridge should be started before this resource: " .. GetCurrentResourceName() .. "^0")
    return
end

-- Import bridge object
wsb = exports.wasabi_bridge:GetBridgeObject()

-- Get framework core object (ESX or QBCore)
local FrameworkCore = wsb.getCore()

-- Client-side only initialization
if not IsDuplicityVersion() then
    -- Register cache update listener
    function wsb.onCache(cacheName, callback)
        AddEventHandler("wasabi_bridge:cache:" .. cacheName, callback)
    end
    
    -- Initialize player data when bridge loads
    AddEventHandler("wasabi_bridge:initialize", function()
        if GetInvokingResource() ~= "wasabi_bridge" then
            return
        end
        
        -- QBCore framework
        if FrameworkCore.Functions then
            wsb.playerData = FrameworkCore.Functions.GetPlayerData()
            wsb.playerLoaded = true
        -- ESX framework
        else
            wsb.playerData = FrameworkCore.GetPlayerData()
            wsb.playerLoaded = true
        end
    end)
    
    -- Update player data when changed
    AddEventHandler("wasabi_bridge:setPlayerData", function(data)
        if GetInvokingResource() ~= "wasabi_bridge" then
            return
        end
        
        if wsb.framework == "qb" then
            wsb.playerData = data
            return
        end
        
        if wsb.framework == "esx" then
            wsb.playerData[data.key] = data.value
        end
    end)
    
    -- Update cache values
    AddEventHandler("wasabi_bridge:updateCache", function(cacheKey, cacheValue)
        if GetInvokingResource() ~= "wasabi_bridge" then
            return
        end
        
        wsb.cache[cacheKey] = cacheValue
    end)
    
    -- Handle player loaded event
    RegisterNetEvent("wasabi_bridge:playerLoaded", function(playerData)
        wsb.playerData = playerData
        wsb.playerLoaded = true
        
        if wsb.framework == "qb" then
            wsb.playerData = FrameworkCore.Functions.GetPlayerData()
        end
    end)
    
    -- Handle player logout event
    RegisterNetEvent("wasabi_bridge:onPlayerLogout", function()
        table.wipe(wsb.playerData)
        wsb.playerLoaded = false
    end)
    
    -- Handle job change event
    RegisterNetEvent("wasabi_bridge:setJob", function(jobData)
        wsb.playerData.job = jobData
        
        if wsb.framework == "qb" then
            wsb.playerData = FrameworkCore.Functions.GetPlayerData()
        end
    end)
end