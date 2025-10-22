-- Shared callback validation and ownership tracking
local callbackRegistry = {}
local callbackEventFormat = "__wsb_cb_%s"

-- Clean up callbacks when a resource stops
AddEventHandler("onResourceStop", function(resourceName)
    local invokingResource = GetInvokingResource()
    if invokingResource == resourceName then
        return
    end

    for callbackName, ownerResource in pairs(callbackRegistry) do
        if ownerResource == resourceName then
            callbackRegistry[callbackName] = nil
        end
    end
end)

-- Print formatted error with stack trace
function PrintError(errorMsg)
    print(([[
^1SCRIPT ERROR: %s^0
%s]]):format(errorMsg, Citizen.InvokeNative(0xD70AACA7, nil, 0, Citizen.ResultAsString()) or ""))
end

-- Set or validate callback ownership (Global function used by client.lua and server.lua)
function SetValidCallback(callbackName, shouldRegister)
    local resourceName = GetInvokingResource() or "wasabi_bridge"
    local existingOwner = callbackRegistry[callbackName]

    if existingOwner then
        if not shouldRegister then
            callbackRegistry[callbackName] = nil
            return
        end

        if existingOwner == resourceName then
            return
        end

        local errorMsg = ("resource '%s' attempted to overwrite callback '%s' owned by resource '%s'"):format(
            resourceName,
            callbackName,
            existingOwner
        )

        return PrintError(errorMsg)
    end

    callbackRegistry[callbackName] = resourceName
end

-- Check if callback is valid (owned by wasabi_bridge)
function IsCallbackValid(callbackName)
    return callbackRegistry[callbackName] == "wasabi_bridge"
end

-- Handle callback validation requests from client or server
RegisterNetEvent("wasabi_bridge:validateCallback", function(callbackName, bridgeName, callbackId)
    if callbackRegistry[callbackName] then
        return
    end

    local responseEvent = callbackEventFormat:format(bridgeName)
    local gameName = GetGameName()

    if gameName == "fxserver" then
        TriggerClientEvent(responseEvent, source, callbackId, "cb_invalid")
    else
        TriggerServerEvent(responseEvent, callbackId, "cb_invalid")
    end
end)