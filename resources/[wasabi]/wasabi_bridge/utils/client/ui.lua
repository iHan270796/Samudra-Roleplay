InputDialogCallback = false
AlertDialogCallback = false
ProgressUICallback = false
SkillCheckCallback = false

local progressUIActive = false

-- Convert FontAwesome icon shorthand to full class names
function FormatIconClass(iconString)
    local iconPrefixes = {
        fas = "fa-solid",
        far = "fa-regular",
        fab = "fa-brands",
        fal = "fa-light",
        fad = "fa-duotone"
    }
    
    -- Check if icon starts with a shorthand prefix
    for shorthand, fullClass in pairs(iconPrefixes) do
        if iconString:match("^" .. shorthand .. " fa%-.+$") then
            return iconString:gsub("^" .. shorthand .. " fa%-", fullClass .. " fa-")
        end
    end
    
    -- Already in correct format (e.g., "fa-solid fa-heart")
    if iconString:match("^fa%-.+ fa%-.+$") then
        return iconString
    end
    
    -- Simple icon name without prefix or spaces - add default fa-solid
    if not iconString:match("%s") then
        return "fa-solid fa-" .. iconString
    end
    
    return iconString
end

-- Convert table keys to numeric indices if they are numbers
function NormalizeTable(data)
    if type(data) == "table" then
        local normalized = {}
        for key, value in pairs(data) do
            local numericKey = tonumber(key)
            if numericKey then
                normalized[numericKey] = value
            end
        end
        return normalized
    end
    return data
end

-- NUI Callbacks
RegisterNUICallback("onExit", function(data, callback)
    if data.onExit then
        data.onExit()
    end
    callback("ok")
end)

RegisterNUICallback("closeMenu", function(data, callback)
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    callback("ok")
end)

RegisterNUICallback("menuEvent", function(data, callback)
    if data.event and data.event ~= "" then
        TriggerEvent(data.event, data.args)
    end
    
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    
    if data.onExit then
        data.onExit()
    end
    
    callback("ok")
end)

RegisterNUICallback("setFocus", function(data, callback)
    SetNuiFocus(data.isFocused, data.isFocused)
    
    if data.isMenu and data.isFocused then
        SetNuiFocusKeepInput(true)
    end
    
    callback("ok")
end)

-- Show notification with custom styling
function ShowNotification(heading, content, notifType, icon, notifId)
    local styleConfig = Config.Notifications.styles[notifType]
    if not styleConfig then
        styleConfig = Config.Notifications.styles.info
    end
    
    if not icon then
        icon = styleConfig.icon
    end
    
    icon = FormatIconClass(icon)
    
    SendNUIMessage({
        component = "notify",
        type = "custom",
        customType = {
            color = styleConfig.color
        },
        heading = heading or "",
        content = content or "",
        icon = icon,
        iconEffect = false,
        iconSize = Config.Notifications.defaults.iconSize,
        position = Config.Notifications.defaults.position,
        time = Config.Notifications.defaults.time,
        color = Config.Notifications.defaults.fontColor,
        sound = Config.Notifications.defaults.sound,
        backgroundColor = Config.Notifications.defaults.backgroundColor,
        id = notifId
    })
end

-- Show menu with options
function ShowMenu(menuData)
    Wait(300)
    
    -- Format icons for each option
    for _, option in ipairs(menuData.options) do
        if option.icon then
            option.icon = FormatIconClass(option.icon)
        end
    end
    
    SendNUIMessage({
        component = "menu",
        title = menuData.title,
        color = menuData.color or false,
        position = menuData.position or false,
        options = menuData.options,
        onExit = menuData.onExit or false
    })
    
    SetNuiFocus(true, false)
    SetNuiFocusKeepInput(true)
end

-- Show context menu (right-click style menu)
function ShowContextMenu(menuData)
    Wait(300)
    
    -- Format icons for each option
    for _, option in ipairs(menuData.options) do
        if option.icon then
            option.icon = FormatIconClass(option.icon)
        end
    end
    
    SendNUIMessage({
        component = "contextMenu",
        title = menuData.title,
        color = menuData.color or false,
        options = menuData.options,
        onExit = menuData.onExit or false
    })
    
    SetNuiFocus(true, true)
end

-- Input dialog callback handler
RegisterNUICallback("inputDialogData", function(data, callback)
    if data and next(data) then
        InputDialogCallback = data
    else
        InputDialogCallback = "nil"
    end
    
    SetNuiFocus(false, false)
    callback("ok")
end)

-- Show input dialog and wait for response
function InputDialog(label, inputFields, color)
    Wait(300)
    
    SendNUIMessage({
        component = "inputDialog",
        label = label,
        data = inputFields,
        color = color or false
    })
    
    SetNuiFocus(true, true)
    
    local result = nil
    while result == nil do
        Wait(5)
        if InputDialogCallback then
            result = InputDialogCallback
            InputDialogCallback = nil
        end
    end
    
    if result and result ~= "nil" then
        result = NormalizeTable(result)
        
        -- Convert empty strings to false
        for i = 1, #result, 1 do
            if result[i] == "" then
                result[i] = false
            end
        end
        
        InputDialogCallback = nil
        return result
    else
        InputDialogCallback = nil
        return nil
    end
end

-- Alert dialog callback handler
RegisterNUICallback("alertDialogData", function(data, callback)
    AlertDialogCallback = data or "nil"
    SetNuiFocus(false, false)
    callback("ok")
end)

-- Show alert/confirmation dialog
function AlertDialog(dialogData)
    Wait(300)
    
    SendNUIMessage({
        component = "alertDialog",
        header = dialogData.header,
        content = dialogData.content,
        centered = dialogData.centered or false,
        cancel = dialogData.cancel or false,
        color = dialogData.color or false
    })
    
    SetNuiFocus(true, true)
    
    local result = nil
    while result == nil do
        Wait(5)
        if AlertDialogCallback then
            result = AlertDialogCallback
            AlertDialogCallback = nil
        end
    end
    
    if result and result ~= "nil" then
        AlertDialogCallback = nil
        return result
    else
        AlertDialogCallback = nil
        return nil
    end
end

-- Show text UI element (like [E] Interact)
function ShowTextUI(message, options)
    if not options then
        options = {}
    end
    
    options.position = options.position or Config.TextUISettings.position or "right-center"
    options.iconColor = options.iconColor or Config.TextUISettings.iconColor or "#ffffff"
    options.textColor = options.textColor or Config.TextUISettings.textColor or "#ffffff"
    options.backgroundColor = options.backgroundColor or Config.TextUISettings.backgroundColor or "#25262B"
    
    Wait(300)
    
    SendNUIMessage({
        component = "textUI",
        message = message,
        options = options
    })
end

-- Hide text UI element
function HideTextUI()
    Wait(300)
    
    SendNUIMessage({
        component = "textUI",
        message = false
    })
end

-- Progress UI callback handler
RegisterNUICallback("progressUIResponse", function(data, callback)
    if data and data.passed then
        ProgressUICallback = data.passed
    else
        ProgressUICallback = "nil"
    end
    callback("ok")
end)

-- Show progress bar with optional animations and props
function ProgressUI(progressData, componentType)
    if progressUIActive then
        return false
    end
    
    Wait(300)
    
    if not componentType then
        componentType = "progressBar"
    end
    
    progressUIActive = true
    
    SendNUIMessage({
        component = componentType,
        label = progressData.label or false,
        duration = progressData.duration,
        color = progressData.color
    })
    
    -- Behavior flags
    local behaviorOptions = {}
    local defaultBehaviors = {
        useWhileDead = true,
        canCancel = true,
        allowRagdoll = true,
        allowSwimming = true,
        allowCuffed = true,
        allowFalling = true
    }
    
    for key, value in pairs(progressData) do
        if defaultBehaviors[key] then
            behaviorOptions[key] = value
        end
    end
    
    local animationLoaded = nil
    local propLoaded = nil
    local createdProps = {}
    local result = nil
    
    while result == nil do
        -- Check behavior conditions
        if behaviorOptions and next(behaviorOptions) and not result then
            for behaviorKey, behaviorEnabled in pairs(behaviorOptions) do
                if not behaviorEnabled then
                    local playerPed = WSB.cache.ped or PlayerPedId()
                    local shouldCancel = false
                    
                    if behaviorKey == "useWhileDead" then
                        shouldCancel = WSB.isPlayerDead()
                    elseif behaviorKey == "canCancel" then
                        shouldCancel = IsControlJustReleased(0, 177) or IsDisabledControlJustReleased(0, 177) or
                                      IsControlJustReleased(0, 73) or IsDisabledControlJustReleased(0, 73)
                    elseif behaviorKey == "allowRagdoll" then
                        shouldCancel = IsPedRagdoll(playerPed)
                    elseif behaviorKey == "allowSwimming" then
                        shouldCancel = IsPedSwimming(playerPed)
                    elseif behaviorKey == "allowCuffed" then
                        shouldCancel = WSB.isPlayerHandcuffed()
                    elseif behaviorKey == "allowFalling" then
                        shouldCancel = IsPedFalling(playerPed)
                    end
                    
                    if shouldCancel and (behaviorKey ~= "canCancel" or behaviorEnabled) then
                        SendNUIMessage({
                            component = componentType,
                            cancelled = true
                        })
                    end
                end
            end
        end
        
        -- Handle disable controls
        if progressData.disable and next(progressData.disable) and not result then
            for disableType, isDisabled in pairs(progressData.disable) do
                if isDisabled then
                    if disableType == "movement" or disableType == "move" or disableType == "all" then
                        WSB.disableKeys()
                    elseif disableType == "car" then
                        if WSB.cache.vehicle then
                            if progressData.anim then
                                ClearPedTasks(WSB.cache.ped or PlayerPedId())
                            end
                            SendNUIMessage({
                                component = componentType,
                                cancelled = true
                            })
                        end
                    elseif disableType == "combat" then
                        WSB.disableKeys(76)
                        DisablePlayerFiring(WSB.cache.playerId, true)
                    elseif disableType == "mouse" then
                        WSB.disableKeys({24, 25})
                    elseif disableType == "sprint" then
                        WSB.disableKeys(21)
                    end
                end
            end
        end
        
        -- Handle animations
        if progressData.anim and not animationLoaded and not result then
            if progressData.anim.scenario then
                TaskStartScenarioInPlace(
                    WSB.cache.ped or PlayerPedId(),
                    progressData.anim.scenario,
                    0,
                    progressData.anim.playEnter ~= false
                )
                animationLoaded = true
            elseif progressData.anim.dict and progressData.anim.clip and not animationLoaded then
                animationLoaded = WSB.stream.animDict(progressData.anim.dict, 5000)
                
                TaskPlayAnim(
                    WSB.cache.ped or PlayerPedId(),
                    progressData.anim.dict,
                    progressData.anim.clip,
                    progressData.anim.blendIn or 3.0,
                    progressData.anim.blendOut or 3.0,
                    progressData.anim.duration or -1,
                    progressData.anim.flag or 49,
                    progressData.anim.playbackRate or 0,
                    progressData.anim.lockX and true or false,
                    progressData.anim.lockY and true or false,
                    progressData.anim.lockZ and true or false
                )
            end
        end
        
        -- Handle props
        if progressData.prop and not result then
            if progressData.prop.model and not propLoaded then
                if WSB.stream.model(progressData.prop.model, 7500) then
                    local playerPed = WSB.cache.ped or PlayerPedId()
                    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 2.0, 0.55))
                    local propData = progressData.prop
                    
                    local propEntity = CreateObjectNoOffset(propData.model, x, y, z, true, false, false)
                    
                    AttachEntityToEntity(
                        propEntity,
                        playerPed,
                        GetPedBoneIndex(playerPed, propData.bone or 60309),
                        propData.pos.x, propData.pos.y, propData.pos.z,
                        propData.rot.x, propData.rot.y, propData.rot.z,
                        true, true, false, true,
                        propData.rotOrder or 0,
                        true
                    )
                    
                    SetModelAsNoLongerNeeded(propData.model)
                    
                    if DoesEntityExist(propEntity) then
                        createdProps[#createdProps + 1] = propEntity
                    end
                    
                    propLoaded = true
                end
            elseif progressData.prop[1] and progressData.prop[1].model and not propLoaded then
                for i = 1, #progressData.prop, 1 do
                    local propData = progressData.prop[i]
                    
                    if WSB.stream.model(propData.model, 7500) then
                        local playerPed = WSB.cache.ped or PlayerPedId()
                        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 2.0, 0.55))
                        
                        local propEntity = CreateObjectNoOffset(propData.model, x, y, z, true, false, false)
                        
                        AttachEntityToEntity(
                            propEntity,
                            playerPed,
                            GetPedBoneIndex(playerPed, propData.bone or 60309),
                            propData.pos.x, propData.pos.y, propData.pos.z,
                            propData.rot.x, propData.rot.y, propData.rot.z,
                            true, true, false, true,
                            propData.rotOrder or 0,
                            true
                        )
                        
                        SetModelAsNoLongerNeeded(propData.model)
                        
                        if DoesEntityExist(propEntity) then
                            createdProps[#createdProps + 1] = propEntity
                        end
                        
                        propLoaded = true
                    end
                end
            end
        end
        
        -- Check for callback result
        if ProgressUICallback then
            result = ProgressUICallback
            ProgressUICallback = nil
        end
        
        Wait(0)
    end
    
    -- Cleanup animations
    if progressData.anim then
        ClearPedTasks(WSB.cache.ped or PlayerPedId())
    end
    
    -- Cleanup props
    if progressData.prop and createdProps and next(createdProps) then
        for i = 1, #createdProps, 1 do
            if DoesEntityExist(createdProps[i]) then
                DeleteEntity(createdProps[i])
            end
        end
    end
    
    progressUIActive = false
    
    if result and result ~= "nil" then
        return result
    else
        return nil
    end
end

-- Skill check callback handler
RegisterNUICallback("skillCheckResult", function(data, callback)
    if data and data.passed then
        SkillCheckCallback = data.passed
    else
        SkillCheckCallback = "nil"
    end
    
    SetNuiFocus(false, false)
    callback("ok")
end)

-- Show skill check minigame
function SkillCheck(difficulty, key, color)
    Wait(300)
    
    SendNUIMessage({
        component = "skillCheck",
        difficulty = difficulty,
        key = key,
        color = color
    })
    
    SetNuiFocus(true, true)
    
    local result = nil
    while result == nil do
        Wait(5)
        if SkillCheckCallback then
            result = SkillCheckCallback
            SkillCheckCallback = nil
        end
    end
    
    SkillCheckCallback = nil
    
    if result and result ~= "nil" then
        return result
    end
    
    return nil
end