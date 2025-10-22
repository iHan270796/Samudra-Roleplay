-- Callback storage and state management
local activeCallbacks = {}
local cooldownTimers = {}
local callbackEventFormat = "__wsb_cb_%s"
local callbackTimeout = GetConvarInt("wsb:callbackTimeout", 300000)

-- Initialize global Callback table
Callback = {}

-- Register network event for receiving callback responses
RegisterNetEvent(callbackEventFormat:format("wasabi_bridge"), function(callbackId, ...)
    local responseSource = source
    if responseSource == "" then
        return
    end

    local callback = activeCallbacks[callbackId]
    if not callback then
        return
    end

    activeCallbacks[callbackId] = nil
    callback(...)
end)

-- Check if action can be performed based on cooldown
function CheckCooldown(eventName, cooldownMs)
    if not cooldownMs then
        return true
    end

    if type(cooldownMs) == "number" and cooldownMs > 0 then
        local currentTime = GetGameTimer()
        local lastUsed = cooldownTimers[eventName] or 0

        if currentTime < lastUsed then
            return false
        end

        cooldownTimers[eventName] = currentTime + cooldownMs
    end

    return true
end

-- Generate unique callback ID
function GenerateCallbackId(eventName)
    local callbackId
    repeat
        callbackId = ("%s:%s"):format(eventName, math.random(0, 100000))
    until not activeCallbacks[callbackId]
    return callbackId
end

-- Core callback trigger function
function TriggerCallback(mode, eventName, cooldownMs, responseHandler, ...)
    if not CheckCooldown(eventName, cooldownMs) then
        return
    end

    local callbackId = GenerateCallbackId(eventName)

    -- Validate callback exists on server
    TriggerServerEvent("wasabi_bridge:validateCallback", eventName, "wasabi_bridge", callbackId)

    -- Send callback request to server
    TriggerServerEvent(callbackEventFormat:format(eventName), "wasabi_bridge", callbackId, ...)

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
    __call = function(self, eventName, cooldownMs, responseHandler, ...)
        if not responseHandler then
            warn(("callback '%s' called without a callback function, this will be deprecated in the future"):format(eventName))
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

        return TriggerCallback(self, eventName, cooldownMs, responseHandler, ...)
    end
})

-- Await response from callback (synchronous mode)
function Callback.awaitResponse(eventName, cooldownMs, ...)
    return TriggerCallback(nil, eventName, cooldownMs, false, ...)
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

-- Register a callback handler on the client
function Callback.register(eventName, handler)
    local event = callbackEventFormat:format(eventName)

    SetValidCallback(eventName, true)

    RegisterNetEvent(event, function(originEvent, responseKey, ...)
        TriggerServerEvent(
            callbackEventFormat:format(originEvent),
            responseKey,
            HandleCallbackError(pcall(handler, ...))
        )
    end)
end