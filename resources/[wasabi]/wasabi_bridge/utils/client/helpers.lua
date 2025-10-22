local timeoutQueue = {}
local intervalRegistry = {}

-- Route framework-specific events to wasabi_bridge events
function SwitchHandler(eventName, eventData)
    local eventHandlers = {
        start = function()
            TriggerEvent("wasabi_bridge:initialize", eventData)
        end,
        
        ["esx:setPlayerData"] = function()
            TriggerEvent("wasabi_bridge:setPlayerData", eventData)
        end,
        
        ["QBCore:Player:SetPlayerData"] = function()
            TriggerEvent("wasabi_bridge:setPlayerData", eventData)
        end,
        
        isLoggedIn = function()
            TriggerEvent("wasabi_bridge:playerLoaded", eventData)
        end,
        
        isLoggedOut = function()
            TriggerEvent("wasabi_bridge:onPlayerLogout")
        end,
        
        setJob = function()
            TriggerEvent("wasabi_bridge:setJob", eventData)
        end,
        
        default = function()
            -- Empty default handler
        end
    }
    
    if eventHandlers[eventName] then
        eventHandlers[eventName]()
    else
        eventHandlers.default()
    end
end

-- Export bridge object for other resources
exports("GetBridgeObject", function()
    return WSB
end)

exports("getBridgeObject", function()
    return WSB
end)

-- Set a timeout to execute a callback after a delay
function WSB.setTimeout(delayMs, callback)
    local index = #timeoutQueue + 1
    
    timeoutQueue[index] = {
        time = GetGameTimer() + delayMs,
        cb = callback
    }
    
    return #timeoutQueue
end

-- Clear a timeout by its ID
function WSB.clearTimeout(timeoutId)
    timeoutQueue[timeoutId] = nil
end

-- Trim whitespace from start and end of string
function WSB.trim(text)
    if text then
        return string.gsub(text, "^%s*(.-)%s*$", "%1")
    else
        return nil
    end
end

-- Get bridge version from server
function WSB.getVersion()
    WSB.serverCallback("wasabi_bridge:getVersion", function(version)
        return version
    end)
end

-- Get player identifier from server
function WSB.getIdentifier(source)
    local identifier = WSB.awaitServerCallback("wasabi_bridge:getIdentifier", source or false)
    return identifier or false
end

-- Convert table to formatted string (recursive)
function WSB.dumpTable(data, indentLevel)
    if indentLevel == nil then
        indentLevel = 0
    end
    
    local dataType = type(data)
    
    if dataType == "table" then
        local indent = ""
        for i = 1, indentLevel + 1, 1 do
            indent = indent .. "    "
        end
        
        local output = "{\n"
        
        for key, value in pairs(data) do
            -- Wrap non-numeric keys in quotes
            if type(key) ~= "number" then
                key = "\"" .. key .. "\""
            end
            
            -- Add indentation
            for i = 1, indentLevel, 1 do
                output = output .. "    "
            end
            
            output = output .. "[" .. key .. "] = " .. WSB.dumpTable(value, indentLevel + 1) .. ",\n"
        end
        
        -- Add closing brace indentation
        for i = 1, indentLevel, 1 do
            output = output .. "    "
        end
        
        return output .. "}"
    else
        return tostring(data)
    end
end

-- Client-side event handlers (only run on client)
if not IsDuplicityVersion() then
    AddEventHandler("wasabi_bridge:initialize", function()
        if GetInvokingResource() ~= "wasabi_bridge" then
            return
        end
        
        if WSB.framework == "esx" then
            WSB.playerData = ESX.GetPlayerData()
            WSB.playerLoaded = true
        end
        
        if WSB.framework == "qb" then
            WSB.playerData = QBCore.Functions.GetPlayerData()
            WSB.playerLoaded = true
        end
    end)
    
    AddEventHandler("wasabi_bridge:setPlayerData", function(data)
        if GetInvokingResource() ~= "wasabi_bridge" then
            return
        end
        
        if WSB.framework == "qb" then
            WSB.playerData = data
            return
        end
        
        if WSB.framework == "esx" then
            WSB.playerData[data.key] = data.value
        end
    end)
    
    RegisterNetEvent("wasabi_bridge:playerLoaded", function(playerData)
        WSB.playerData = playerData
        WSB.playerLoaded = true
        
        if WSB.framework == "qb" then
            WSB.playerData = QBCore.Functions.GetPlayerData()
        end
    end)
    
    RegisterNetEvent("wasabi_bridge:onPlayerLogout", function()
        table.wipe(WSB.playerData)
        WSB.playerLoaded = false
    end)
    
    RegisterNetEvent("wasabi_bridge:setJob", function(jobData)
        WSB.playerData.job = jobData
        
        if WSB.framework == "qb" then
            WSB.playerData = QBCore.Functions.GetPlayerData()
        end
    end)
end

-- Send debug message to server console
function WSB.debugPrint(message)
    TriggerServerEvent("wasabi_bridge:debugPrint", message)
end

-- Create an interval that executes a callback repeatedly
function SetInterval(callback, intervalMs, ...)
    if not intervalMs then
        intervalMs = 0
    end
    
    local intervalType = type(intervalMs)
    if intervalType ~= "number" then
        return error(("Interval must be a number. Received %s"):format(json.encode(intervalMs)))
    end
    
    local callbackType = type(callback)
    
    -- Allow updating existing interval
    if callbackType == "number" then
        if intervalRegistry[callback] then
            intervalRegistry[callback] = intervalMs or 0
            return
        end
    end
    
    if callbackType ~= "function" then
        return error(("Callback must be a function. Received %s"):format(callbackType))
    end
    
    -- Store additional arguments
    local args = {...}
    local intervalId = nil
    
    Citizen.CreateThreadNow(function(threadId)
        intervalId = threadId
        intervalRegistry[intervalId] = intervalMs or 0
        
        repeat
            intervalMs = intervalRegistry[intervalId]
            Wait(intervalMs)
            callback(table.unpack(args))
        until intervalMs < 0
        
        intervalRegistry[intervalId] = nil
    end)
    
    return intervalId
end

-- Clear an interval by its ID
function ClearInterval(intervalId)
    local idType = type(intervalId)
    if idType ~= "number" then
        return error(("Interval id must be a number. Received %s"):format(json.encode(intervalId)))
    end
    
    if not intervalRegistry[intervalId] then
        return error(("No interval exists with id %s"):format(intervalId))
    end
    
    intervalRegistry[intervalId] = -1
end

-- Wait for a condition to be true with timeout
function WSB.waitFor(condition, errorMessage, timeoutMs)
    local conditionType = type(timeoutMs)
    if conditionType ~= "number" or not timeoutMs then
        timeoutMs = 1000
    end
    
    local startTime = GetGameTimer()
    local result = condition()
    
    while not result do
        Wait(0)
        
        local elapsedTime = GetGameTimer() - startTime
        if timeoutMs < elapsedTime then
            return error(("%s (waited %.1fms)"):format(errorMessage or "failed to resolve callback", elapsedTime), 2)
        end
        
        result = condition()
    end
    
    return result
end