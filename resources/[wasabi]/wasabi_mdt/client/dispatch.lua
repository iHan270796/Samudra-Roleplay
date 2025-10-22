-- ============================================
-- WASABI MDT DISPATCH SYSTEM
-- Handles dispatch notifications, panic buttons, and active dispatch tracking
-- ============================================

-- Global State
local activeDispatch = nil
local pendingDispatchNotification = nil
local isPanicAlertActive = false
local lastPanicButtonPress = 0
local isPanicCooldownActive = false
local isDispatchHudVisible = false
local isDispatchHudFocused = false

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================

function SetWaypointToDispatch(coords)
    if not coords then return end
    
    SetNewWaypoint(coords.x, coords.y)
    TriggerEvent("wasabi_bridge:notify", _L("notify_title"), _L("waypoint_set_to_dispatch"), "info")
end

function CalculateDistanceToDispatch(coords)
    local playerCoords = GetEntityCoords(wsb.cache.ped)
    local targetCoords = vector3(coords.x, coords.y, coords.z)
    local distance = #(playerCoords - targetCoords)
    return math.floor(distance)
end

function PlayDispatchSound(priority)
    if priority >= 4 then
        PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", true)
        Wait(300)
        PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", true)
        Wait(300)
        PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", true)
    elseif priority >= 2 then
        PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", true)
    else
        PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", true)
    end
end

function PlayPanicEffects()
    CreateThread(function()
        for i = 0, 4 do
            StartScreenEffect("DeathFailOut", 500, false)
            Wait(500)
            StopScreenEffect("DeathFailOut")
            Wait(200)
        end
    end)
    
    CreateThread(function()
        for i = 1, 3 do
            PlaySoundFrontend(-1, "CHALLENGE_UNLOCKED", "HUD_AWARDS", true)
            Wait(1000)
        end
    end)
end

function UpdateKeybinds()
    local keybinds = {
        toggleHud = Config.DispatchKeybinds.toggleDispatchHud.key,
        toggleFocus = Config.DispatchKeybinds.toggleDispatchFocus.key
    }
    
    ToVue("updateKeybinds", {keybinds = keybinds})
end

-- ============================================
-- NUI CALLBACKS
-- ============================================

RegisterNUICallback("dispatchAction", function(data, cb)
    if data.action == "accept" then
        TriggerServerEvent("wasabi_mdt:acceptDispatch", data.dispatchId)
        cb(true)
        
    elseif data.action == "decline" then
        TriggerServerEvent("wasabi_mdt:declineDispatch", data.dispatchId)
        cb(true)
        
    elseif data.action == "updateStatus" then
        TriggerServerEvent("wasabi_mdt:updateDispatchStatus", data.dispatchId, data.status)
        cb(true)
        
    elseif data.action == "delete" then
        local result = wsb.awaitServerCallback("wasabi_mdt:dispatchAction", "delete", data.dispatchId)
        cb(result)
        
    elseif data.action == "requestBackup" then
        TriggerServerEvent("wasabi_mdt:requestDispatchBackup", data.dispatchId)
        cb(true)
        
    elseif data.action == "getActive" then
        local dispatches = wsb.awaitServerCallback("wasabi_mdt:dispatchAction", "getAll")
        cb(dispatches or {})
        
    elseif data.action == "create" then
        local result = wsb.awaitServerCallback("wasabi_mdt:dispatchAction", "create", data.dispatch)
        cb(result or false)
        
    else
        cb(false)
    end
end)

RegisterNUICallback("unassignDispatch", function(dispatchId, cb)
    TriggerServerEvent("wasabi_mdt:unassignDispatch", dispatchId)
    cb(true)
end)

RegisterNUICallback("toggleDispatchHud", function(data, cb)
    isDispatchHudVisible = data.visible
    
    if not data.visible then
        isDispatchHudFocused = false
        
        if not MDTOpen then
            SetNuiFocus(false, false)
            SetNuiFocusKeepInput(false)
        end
    end
    
    cb(true)
end)

RegisterNUICallback("closeDispatchHud", function(data, cb)
    isDispatchHudVisible = false
    isDispatchHudFocused = false
    
    if not MDTOpen then
        SetNuiFocus(false, false)
        SetNuiFocusKeepInput(false)
    end
    
    ToVue("toggleDispatchHud", {visible = false, focused = false})
    cb(true)
end)

RegisterNUICallback("focusDispatchHud", function(data, cb)
    isDispatchHudFocused = data.focused
    
    if not MDTOpen then
        SetNuiFocus(data.focused, data.focused)
        SetNuiFocusKeepInput(false)
    end
    
    cb(true)
end)

RegisterNUICallback("panicButton", function(data, cb)
    local currentTime = GetGameTimer()
    local timeSinceLastPanic = currentTime - lastPanicButtonPress
    
    if timeSinceLastPanic < 30000 then
        TriggerEvent("wasabi_bridge:notify", _L("notify_title"), _L("panic_cooldown"), "error")
        cb(false)
        return
    end
    
    lastPanicButtonPress = currentTime
    isPanicCooldownActive = true
    
    SetTimeout(300000, function()
        isPanicCooldownActive = false
    end)
    
    TriggerServerEvent("wasabi_mdt:triggerPanic")
    cb(true)
end)

-- ============================================
-- NETWORK EVENT HANDLERS
-- ============================================

RegisterNetEvent("wasabi_mdt:receiveDispatch", function(dispatch)
    if not dispatch then return end
    
    dispatch.distance = CalculateDistanceToDispatch(dispatch.coords)
    
    PlayDispatchSound(dispatch.priority)
    
    ToVue("showDispatchNotification", {
        dispatch = dispatch,
        timeout = 15000
    })
    
    if not isDispatchHudVisible then
        isDispatchHudVisible = true
        isDispatchHudFocused = false
        
        if not MDTOpen then
            SetNuiFocus(false, false)
            SetNuiFocusKeepInput(true)
        end
        
        UpdateKeybinds()
    end
    
    pendingDispatchNotification = {
        dispatch = dispatch,
        timestamp = GetGameTimer()
    }
end)

RegisterNetEvent("wasabi_mdt:dispatchAccepted", function(dispatchId, coords)
    if pendingDispatchNotification and pendingDispatchNotification.dispatch.id == dispatchId then
        pendingDispatchNotification = nil
    end
    
    SetWaypointToDispatch(coords)
    
    activeDispatch = {
        id = dispatchId,
        coords = coords,
        startTime = GetGameTimer()
    }
    
    ToVue("dispatchAccepted", {dispatchId = dispatchId})
    TriggerEvent("wasabi_bridge:notify", _L("notify_title"), _L("dispatch_accepted"), "success")
end)

RegisterNetEvent("wasabi_mdt:dispatchDeclined", function(dispatchId)
    if pendingDispatchNotification and pendingDispatchNotification.dispatch.id == dispatchId then
        pendingDispatchNotification = nil
    end
    
    ToVue("dispatchDeclined", {dispatchId = dispatchId})
end)

RegisterNetEvent("wasabi_mdt:dispatchUpdated", function(dispatch)
    ToVue("updateDispatch", {dispatch = dispatch})
    
    if activeDispatch and activeDispatch.id == dispatch.id then
        if dispatch.coords then
            if activeDispatch.coords.x ~= dispatch.coords.x or activeDispatch.coords.y ~= dispatch.coords.y then
                activeDispatch.coords = dispatch.coords
                SetWaypointToDispatch(dispatch.coords)
            end
        end
    end
end)

RegisterNetEvent("wasabi_mdt:dispatchDeleted", function(dispatchId)
    if activeDispatch and activeDispatch.id == dispatchId then
        activeDispatch = nil
    end
    
    ToVue("dispatchDeleted", {dispatchId = dispatchId})
end)

RegisterNetEvent("wasabi_mdt:receivePanicAlert", function(panicData)
    isPanicAlertActive = true
    
    PlayPanicEffects()
    ToVue("panicAlert", panicData)
    
    if panicData.coords then
        SetWaypointToDispatch(panicData.coords)
    end
    
    SetTimeout(30000, function()
        isPanicAlertActive = false
        ToVue("clearPanicAlert", {})
    end)
end)

RegisterNetEvent("wasabi_mdt:panicActivated", function()
    isPanicCooldownActive = true
    
    SetTimeout(300000, function()
        isPanicCooldownActive = false
    end)
end)

-- ============================================
-- POSITION UPDATE THREAD
-- ============================================

CreateThread(function()
    while true do
        Wait(5000)
        
        if activeDispatch or isPanicCooldownActive then
            local playerCoords = GetEntityCoords(wsb.cache.ped)
            
            TriggerServerEvent("wasabi_mdt:updateOfficerPosition", {
                x = playerCoords.x,
                y = playerCoords.y,
                z = playerCoords.z
            })
            
            if activeDispatch then
                local distance = CalculateDistanceToDispatch(activeDispatch.coords)
                
                if distance < 50 then
                    ToVue("arrivedAtScene", {dispatchId = activeDispatch.id})
                end
            end
        end
    end
end)

-- ============================================
-- KEYBIND COMMANDS
-- ============================================

if Config.DispatchKeybinds.panicButton.enabled then
    RegisterCommand("panic", function()
        wsb.serverCallback("wasabi_mdt:canPanic", function(canPanic)
            if not canPanic then return end
            
            local currentTime = GetGameTimer()
            local timeSinceLastPanic = currentTime - lastPanicButtonPress
            
            if timeSinceLastPanic < 30000 then
                TriggerEvent("wasabi_bridge:notify", _L("notify_title"), _L("panic_cooldown"), "error")
                return
            end
            
            lastPanicButtonPress = currentTime
            isPanicCooldownActive = true
            
            SetTimeout(300000, function()
                isPanicCooldownActive = false
            end)
            
            TriggerServerEvent("wasabi_mdt:triggerPanic")
        end)
    end, false)
    
    RegisterKeyMapping(
        "panic",
        Config.DispatchKeybinds.panicButton.description or _L("panic_button"),
        Config.DispatchKeybinds.panicButton.device,
        Config.DispatchKeybinds.panicButton.key
    )
end

if Config.DispatchKeybinds.toggleDispatchHud.enabled then
    RegisterCommand("toggledispatch", function()
        wsb.serverCallback("wasabi_mdt:canToggleDispatch", function(canToggle)
            if not canToggle then return end
            
            isDispatchHudVisible = not isDispatchHudVisible
            
            if isDispatchHudVisible then
                isDispatchHudFocused = false
                
                if not MDTOpen then
                    SetNuiFocus(false, false)
                    SetNuiFocusKeepInput(true)
                end
            else
                isDispatchHudFocused = false
                
                if not MDTOpen then
                    SetNuiFocus(false, false)
                    SetNuiFocusKeepInput(false)
                end
            end
            
            ToVue("toggleDispatchHud", {
                visible = isDispatchHudVisible,
                focused = isDispatchHudFocused
            })
            
            if isDispatchHudVisible then
                UpdateKeybinds()
            end
        end)
    end, false)
    
    RegisterKeyMapping(
        "toggledispatch",
        Config.DispatchKeybinds.toggleDispatchHud.description or _L("toggle_dispatch_hud"),
        Config.DispatchKeybinds.toggleDispatchHud.device,
        Config.DispatchKeybinds.toggleDispatchHud.key
    )
end

if Config.DispatchKeybinds.toggleDispatchFocus.enabled then
    RegisterCommand("toggledispatchfocus", function()
        if isDispatchHudVisible then
            isDispatchHudFocused = not isDispatchHudFocused
            
            if not MDTOpen then
                SetNuiFocus(isDispatchHudFocused, isDispatchHudFocused)
                SetNuiFocusKeepInput(false)
            end
            
            ToVue("setDispatchFocus", {focused = isDispatchHudFocused})
        end
    end, false)
    
    RegisterKeyMapping(
        "toggledispatchfocus",
        Config.DispatchKeybinds.toggleDispatchFocus.description or "Toggle Dispatch HUD Focus",
        Config.DispatchKeybinds.toggleDispatchFocus.device,
        Config.DispatchKeybinds.toggleDispatchFocus.key
    )
end