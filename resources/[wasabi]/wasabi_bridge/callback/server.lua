-- Server-side callback storage and state management
local activeCallbacks = {}
local callbackEventFormat = "__wsb_cb_%s"
local callbackTimeout = GetConvarInt("wsb:callbackTimeout", 300000)
local registeredEvents = {}
local eventHandlers = {}

-- Initialize global Callback table
Callback = {}

-- Register network event for receiving callback responses from clients
RegisterNetEvent(callbackEventFormat:format("wasabi_bridge"), function(callbackId, ...)
    local callback = activeCallbacks[callbackId]
    if not callback then
        return
    end

    activeCallbacks[callbackId] = nil
    callback(...)
end)

-- Generate unique callback ID for server-to-client communication
function GenerateCallbackId(eventName, targetPlayerId)
    local callbackId
    repeat
        callbackId = ("%s:%s:%s"):format(eventName, math.random(0, 100000), targetPlayerId)
    until not activeCallbacks[callbackId]
    return callbackId
end

-- Core callback trigger function (server to specific client)
function TriggerClientCallback(mode, eventName, targetPlayerId, responseHandler, ...)
    assert(DoesPlayerExist(targetPlayerId), ("target playerId '%s' does not exist"):format(targetPlayerId))

    local callbackId = GenerateCallbackId(eventName, targetPlayerId)

    -- Validate callback exists on client
    TriggerClientEvent("wasabi_bridge:validateCallback", targetPlayerId, eventName, "wasabi_bridge", callbackId)

    -- Send callback request to client
    TriggerClientEvent(callbackEventFormat:format(eventName), targetPlayerId, "wasabi_bridge", callbackId, ...)

    -- Setup promise for async handling
    local callbackPromise = not responseHandler and promise.new()

    -- Register callback response handler
    activeCallbacks[callbackId] = function(response, ...)
        if response == "cb_invalid" then
            local errorMsg = ("callback '%s' does not exist"):format(eventName)

            if callbackPromise then
                return callbackPromise:reject(errorMsg)
            end
            error(errorMsg)
        end

        local results = {response, ...}

        if callbackPromise then
            return callbackPromise:resolve(results)
        end

        if responseHandler then
            responseHandler(table.unpack(results))
        end
    end

    -- Handle async mode with timeout
    if callbackPromise then
        SetTimeout(callbackTimeout, function()
            callbackPromise:reject(("callback event '%s' timed out"):format(callbackId))
        end)

        return table.unpack(Citizen.Await(callbackPromise))
    end
end

-- Setup metatable to make Callback callable
setmetatable(Callback, {
    __call = function(self, eventName, targetPlayerId, responseHandler, ...)
        if not responseHandler then
            warn(("callback '%s' called without a callback function, this will cause the server to hang until the client responds"):format(eventName))
        else
            local handlerType = type(responseHandler)

            -- Check for callable tables
            if handlerType == "table" then
                local meta = getmetatable(responseHandler)
                if meta and meta.__call then
                    handlerType = "function"
                end
            end

            assert(handlerType == "function", ("expected argument 3 to have type 'function' (received %s)"):format(handlerType))
        end

        return TriggerClientCallback(self, eventName, targetPlayerId, responseHandler, ...)
    end
})

-- Await response from callback (synchronous mode)
function Callback.awaitResponse(eventName, targetPlayerId, ...)
    return TriggerClientCallback(nil, eventName, targetPlayerId, false, ...)
end

-- Error handling wrapper for callback execution
function HandleCallbackError(success, errorMsg, ...)
    if not success then
        if errorMsg then
            print(([[
^1SCRIPT ERROR: %s^0
%s]]):format(errorMsg, Citizen.InvokeNative(0xD70AACA7, nil, 0, Citizen.ResultAsString()) or ""))
        end
        return false
    end

    return errorMsg, ...
end

-- Register a callback handler on the server
function Callback.register(eventName, handler)
    local event = callbackEventFormat:format(eventName)

    SetValidCallback(eventName, true)

    -- Remove existing handler if present
    if eventHandlers[event] then
        RemoveEventHandler(eventHandlers[event])
    end

    -- Register new event handler
    eventHandlers[event] = AddEventHandler(event, function(originEvent, responseKey, ...)
        local clientSource = source
        
        TriggerClientEvent(
            callbackEventFormat:format(originEvent),
            clientSource,
            responseKey,
            HandleCallbackError(pcall(handler, clientSource, ...))
        )
    end)

    -- Register network event if not already registered
    if not registeredEvents[event] then
        registeredEvents[event] = true
        RegisterNetEvent(event)
    end
end