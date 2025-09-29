local KeyMap = {
    ["E"] = 38, ["G"] = 47, ["F"] = 23, ["H"] = 74,
    ["Y"] = 246, ["U"] = 303, ["L"] = 182, ["K"] = 311,
    ["X"] = 73, ["Z"] = 20
}

local isUIOpen, currentInteraction, currentInteractionId = false, nil, nil
local SyncedNetInteractions = {}
Config.Interactions = {}

local screenW, screenH = GetActiveScreenResolution()
local visibleInteractions = {}

local function getEntityCoordsSafe(ent)
    if DoesEntityExist(ent) then return GetEntityCoords(ent) end
    return nil
end

function AddInteraction(data)
    assert(data.coords, "coords required")
    assert(data.id and data.label and data.icon, "Missing fields")
    assert(data.options and #data.options > 0, "Options required")

    Config.Interactions[data.id] = {
        id = data.id,
        coords = data.coords,
        label = data.label,
        icon = data.icon,
        distance = data.distance or 3.0,
        distancedot = data.distancedot or 8.0,
        options = data.options,
    }
end
exports("AddInteraction", AddInteraction)

-- Add Entity-Based
function AddEntityInteraction(data)
    assert(data.entity and data.id and data.label and data.icon, "Missing entity interaction data")

    CreateThread(function()
        for i = 1, 25 do
            if DoesEntityExist(data.entity) then break end
            Wait(100)
        end

        if not DoesEntityExist(data.entity) then return end

        local netId = NetworkGetNetworkIdFromEntity(data.entity)
        if NetworkDoesEntityExistWithNetworkId(netId) then
            TriggerServerEvent("anes_interaction:registerEntityInteraction", {
                id = data.id,
                label = data.label,
                icon = data.icon,
                netId = netId,
                distance = data.distance or 3.0,
                distancedot = data.distancedot or 8.0,
                options = data.options
            })
        else
            Config.Interactions[data.id] = {
                id = data.id,
                entity = data.entity,
                getCoords = function() return getEntityCoordsSafe(data.entity) end,
                label = data.label,
                icon = data.icon,
                distance = data.distance or 3.0,
                distancedot = data.distancedot or 8.0,
                options = data.options
            }
        end
    end)
end
exports("AddEntityInteraction", AddEntityInteraction)

function RemoveInteraction(id)
    Config.Interactions[id] = nil
    TriggerServerEvent("anes_interaction:removeInteraction", id)
end
exports("RemoveInteraction", RemoveInteraction)

RegisterNetEvent("anes_interaction:syncInteractions", function(interactions)
    SyncedNetInteractions = interactions
end)

RegisterNUICallback("closeUI", function(_, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "hideUI" })
    isUIOpen = false
    currentInteraction = nil
    currentInteractionId = nil
    cb({})
end)

CreateThread(function()
    TriggerServerEvent("anes_interaction:requestInteractions")
end)

CreateThread(function()
    while true do
        local ped = cache.ped or PlayerPedId()
        local coords = GetEntityCoords(ped)
        visibleInteractions = {}

        for id, data in pairs(SyncedNetInteractions) do
            if not Config.Interactions[id] then
                local ent = NetworkGetEntityFromNetworkId(data.netId)
                if DoesEntityExist(ent) then
                    Config.Interactions[id] = {
                        id = id,
                        entity = ent,
                        getCoords = function() return getEntityCoordsSafe(ent) end,
                        label = data.label,
                        icon = data.icon,
                        distance = data.distance or 3.0,
                        distancedot = data.distancedot or 8.0,
                        options = data.options
                    }
                end
            end
        end

        for id, data in pairs(Config.Interactions) do
            local pos = data.getCoords and data.getCoords() or data.coords
            if pos and #(coords - pos) < (data.distancedot or 8.0) + 2.0 then
                visibleInteractions[#visibleInteractions + 1] = { id = id, pos = pos, data = data }
            end
        end

        Wait(2000)
    end
end)

CreateThread(function()
    while true do
        Wait(#visibleInteractions > 0 and 0 or 250)

        if IsPauseMenuActive() or IsNuiFocused() then
            if isUIOpen then
                SendNUIMessage({ action = "hideUI" })
                isUIOpen = false
                currentInteraction = nil
                currentInteractionId = nil
            end
            SendNUIMessage({ action = "hideAllDots" })
            goto continue
        end

        local ped = cache.ped or PlayerPedId()
        local coords = GetEntityCoords(ped)

        local closest, closestDist = nil, math.huge
        local screenX, screenY = nil, nil
        local dotList = {}

        for _, entry in ipairs(visibleInteractions) do
            local data = entry.data
            local pos = entry.pos
            local dist = #(coords - pos)

            if dist < (data.distancedot or 8.0) then
                local onScreen, x, y = World3dToScreen2d(pos.x, pos.y, pos.z + 0.04)
                if onScreen then
                    dotList[#dotList + 1] = { id = data.id, x = x * screenW, y = y * screenH }

                    if dist < (data.distance or 3.0) and dist < closestDist then
                        closest, closestDist = data, dist
                        screenX, screenY = x, y
                    end
                end
            end
        end

        SendNUIMessage(dotList[1] and {
            action = "multiDots", dots = dotList
        } or { action = "hideAllDots" })

        if closest then
            SendNUIMessage({
                action = "rayDot",
                dot = { id = closest.id, x = screenX * screenW, y = screenY * screenH }
            })

            if currentInteractionId ~= closest.id then
                SendNUIMessage({
                    action = "showUI",
                    label = closest.label,
                    icon = closest.icon,
                    options = closest.options
                })
                currentInteraction = closest
                currentInteractionId = closest.id
                isUIOpen = true
            end
        else
            SendNUIMessage({ action = "hideRayDot" })
            if isUIOpen then
                SendNUIMessage({ action = "hideUI" })
                currentInteraction = nil
                currentInteractionId = nil
                isUIOpen = false
            end
        end

        if currentInteraction then
            for _, opt in ipairs(currentInteraction.options) do
                local key = KeyMap[string.upper(opt.actionkey or "E")] or 38
                if IsControlJustReleased(0, key) then
                    local args = opt.args
                    if not opt.canInteract or opt.canInteract(ped, coords, args) then
                        if opt.action then opt.action(ped, coords, args)
                        elseif opt.event then TriggerEvent(opt.event, ped, coords, args)
                        elseif opt.serverEvent then TriggerServerEvent(opt.serverEvent, ped, coords, args)
                        end
                    end
                end
            end
        end

        ::continue::
    end
end)

function AddModelInteraction(model, label, icon, options, distance, dotDistance)
    local function register(ent)
        if DoesEntityExist(ent) and GetEntityModel(ent) == model then
            local id = "model_" .. model .. "_" .. ent
            if not Config.Interactions[id] then
                Config.Interactions[id] = {
                    id = id,
                    entity = ent,
                    getCoords = function() return GetEntityCoords(ent) end,
                    label = label,
                    icon = icon,
                    distance = distance or 2.0,
                    distancedot = dotDistance or 8.0,
                    options = options
                }
            end
        end
    end

    for _, ent in ipairs(GetGamePool("CObject")) do
        register(ent)
    end

    AddEventHandler("entityCreated", function(ent)
        Wait(100)
        register(ent)
    end)
end
exports("AddModelInteraction", AddModelInteraction)


