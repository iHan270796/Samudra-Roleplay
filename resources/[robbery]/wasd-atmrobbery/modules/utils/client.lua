---
--[[ Contains client-side helper functions. ]]
---

local Utils = {}

--- Custom notifications with options.
---@param title string
---@param type 'inform'|'error'|'success'|'warning'
---@param duration number
---@param description string
function Utils.Notify(title, type, duration, description)
    lib.notify({
        title = title,
        description = description,
        duration = duration,
        position = 'top-right',
        type = type,
    })
end

--[[ Show the TextUI window ]]
function Utils.ShowTextUI(text, options)
    lib.showTextUI(text, options)
end

--[[ Hide the TextUI window ]]
function Utils.HideTextUI()
    lib.hideTextUI()
end

function Utils.TriggerPoliceAlert()
    -- ? Use your own alert dispatch script export/event
end

---Creates an object with the specified params
---@param model string
---@param coords vector3
---@param rotation vector3
---@param freeze boolean
---@param isNetwork boolean
---@param doorFlag boolean
---@return integer
function Utils.CreateObject(model, coords, rotation, freeze, isNetwork, doorFlag)
    if freeze == nil then freeze = true end
    if isNetwork == nil then isNetwork = false end
    if doorFlag == nil then doorFlag = false end
    lib.requestModel(model)
    local object = CreateObject(model, coords.x, coords.y, coords.z, isNetwork, isNetwork, doorFlag)
    SetEntityCoords(object, coords.x, coords.y, coords.z, false, false, false, true)
    if rotation then
        SetEntityRotation(object, rotation.x, rotation.y, rotation.z, 2, false)
    end
    FreezeEntityPosition(object, freeze)
    SetModelAsNoLongerNeeded(model)
    return object
end

function Utils.WaitForEntityWithNetworkId(networkId)
    if NetworkDoesEntityExistWithNetworkId(networkId) then return true end

    local startTime = GetGameTimer()

    while GetGameTimer() - startTime < 5000 do
        if NetworkDoesEntityExistWithNetworkId(networkId) then
            return true
        end
        Citizen.Wait(0)
    end
    return false
end

function Utils.debug(...)
    if not Config.debug then return end
    lib.print.info(...)
end

return Utils
