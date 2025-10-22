-- ============================================
-- MDT Dispatch System
-- ============================================

-- Global storage tables (accessed by other files)
ActiveDispatches = {}
ActivePanicAlerts = {}
OfficerPositions = {}

-- ============================================
-- HELPER FUNCTIONS
-- ============================================

-- Broadcast event to all on-duty officers (with optional department/grade filter)
function BroadcastToOnDutyOfficers(eventName, eventData, departmentFilter, minGrade)
    for identifier, officerData in pairs(Officers) do
        if officerData.onDuty then
            local playerId = wsb.getPlayerIdFromIdentifier(identifier)
            local jobData = wsb.getJobData(identifier)

            local shouldSend = true

            if departmentFilter and jobData.name ~= departmentFilter then
                shouldSend = false
            end

            if minGrade and not (jobData.grade >= minGrade) then
                shouldSend = false
            end

            if shouldSend then
                TriggerClientEvent(eventName, playerId, eventData)
            end
        end
    end
end

-- Get list of on-duty officers eligible for a dispatch based on departments
function GetEligibleOfficers(dispatchData)
    local eligibleOfficers = {}

    for identifier, officerData in pairs(Officers) do
        if officerData.onDuty then
            local playerId = wsb.getPlayerIdFromIdentifier(identifier)
            
            if playerId then
                local isEligible = false

                if not dispatchData.departments or dispatchData.departments == "all" then
                    isEligible = true
                else
                    local jobData = wsb.getJobData(playerId)
                    
                    if jobData then
                        if type(dispatchData.departments) == "string" then
                            if jobData.name == dispatchData.departments then
                                isEligible = true
                            end
                        elseif type(dispatchData.departments) == "table" then
                            for _, allowedDepartment in ipairs(dispatchData.departments) do
                                if jobData.name == allowedDepartment then
                                    isEligible = true
                                    break
                                end
                            end
                        end
                    end
                end

                if isEligible then
                    table.insert(eligibleOfficers, {
                        identifier = identifier,
                        name = officerData.name,
                        src = playerId
                    })
                end
            end
        end
    end

    return eligibleOfficers
end

-- ============================================
-- DISPATCH MANAGEMENT FUNCTIONS
-- ============================================

-- Create a new dispatch
function CreateDispatch(playerId, identifier, p, dispatchInfo)
    if not HasPermission(identifier, "mdt.dispatch.create") then
        TriggerClientEvent("wasabi_bridge:notify", playerId, 
            _L("notify_title"), _L("no_permission"), "error")
        return false
    end

    local newDispatch = MDTDispatch:new({
        type = dispatchInfo.type,
        title = dispatchInfo.title,
        description = dispatchInfo.description,
        location = dispatchInfo.location,
        coords = dispatchInfo.coords,
        priority = dispatchInfo.priority,
        created_by = identifier,
        created_by_name = wsb.getName(playerId),
        departments = dispatchInfo.departments or "all"
    })

    if not newDispatch then
        return false
    end

    ActiveDispatches[newDispatch.id] = newDispatch

    local eligibleOfficers = GetEligibleOfficers(newDispatch)

    for _, officer in ipairs(eligibleOfficers) do
        TriggerClientEvent("wasabi_mdt:receiveDispatch", officer.src, newDispatch:toTable())
    end

    TriggerClientEvent("wasabi_bridge:notify", playerId, 
        _L("notify_title"), _L("dispatch_created"), "success")

    return newDispatch.id
end

-- Get all active dispatches (sorted by priority and creation time)
function GetAllDispatches(playerId, identifier)
    local dispatchList = {}

    for _, dispatch in pairs(ActiveDispatches) do
        table.insert(dispatchList, dispatch:toTable())
    end

    table.sort(dispatchList, function(a, b)
        if a.priority ~= b.priority then
            return a.priority > b.priority
        end
        return a.created_at > b.created_at
    end)

    return dispatchList
end

-- Delete a dispatch
function DeleteDispatch(playerId, identifier, dispatchId)
    if not HasPermission(identifier, "mdt.dispatch.delete") then
        TriggerClientEvent("wasabi_bridge:notify", playerId, 
            _L("notify_title"), _L("no_permission"), "error")
        return false
    end

    if not ActiveDispatches[dispatchId] then
        return false
    end

    ActiveDispatches[dispatchId] = nil

    BroadcastToOnDutyOfficers("wasabi_mdt:dispatchDeleted", dispatchId)

    TriggerClientEvent("wasabi_bridge:notify", playerId, 
        _L("notify_title"), _L("dispatch_deleted"), "success")

    return true
end

-- ============================================
-- CALLBACK REGISTRATIONS
-- ============================================

wsb.registerCallback("wasabi_mdt:canPanic", function(source, cb)
    local identifier = wsb.getIdentifier(source)
    return HasPermission(identifier, "mdt.panic.trigger")
end)

wsb.registerCallback("wasabi_mdt:canToggleDispatch", function(source, cb)
    local identifier = wsb.getIdentifier(source)
    return HasPermission(identifier, "mdt.dispatch.view")
end)

wsb.registerCallback("wasabi_mdt:dispatchAction", function(source, cb, action, data)
    local identifier = wsb.getIdentifier(source)

    if not IsOfficer(identifier) then
        return false
    end

    if action == "create" then
        return CreateDispatch(source, identifier, p, data.dispatch or data)
    elseif action == "getAll" or action == "getActive" then
        return GetAllDispatches(source, identifier)
    elseif action == "delete" then
        return DeleteDispatch(source, identifier, data)
    elseif action == "getData" then
        return GetDispatchData()
    else
        return false
    end
end)

-- ============================================
-- EVENT HANDLERS
-- ============================================

RegisterServerEvent("wasabi_mdt:acceptDispatch")
AddEventHandler("wasabi_mdt:acceptDispatch", function(dispatchId)
    local playerId = source
    local identifier = wsb.getIdentifier(playerId)
    local playerName = wsb.getName(playerId)

    if not playerName or not identifier then
        return
    end

    local dispatch = ActiveDispatches[dispatchId]
    if not dispatch then
        TriggerClientEvent("wasabi_bridge:notify", playerId, 
            _L("notify_title"), _L("dispatch_not_found"), "error")
        return
    end

    local assigned = dispatch:assign(identifier, playerName)

    if assigned then
        TriggerClientEvent("wasabi_mdt:dispatchAccepted", playerId, dispatchId, dispatch.coords)
        BroadcastToOnDutyOfficers("wasabi_mdt:dispatchUpdated", dispatch:toTable())
        TriggerClientEvent("wasabi_bridge:notify", playerId, 
            _L("notify_title"), _L("dispatch_accepted"), "success")
    else
        TriggerClientEvent("wasabi_bridge:notify", playerId, 
            _L("notify_title"), _L("already_assigned"), "error")
    end
end)

RegisterServerEvent("wasabi_mdt:declineDispatch")
AddEventHandler("wasabi_mdt:declineDispatch", function(dispatchId)
    local playerId = source
    TriggerClientEvent("wasabi_mdt:dispatchDeclined", playerId, dispatchId)
end)

RegisterServerEvent("wasabi_mdt:updateDispatchStatus")
AddEventHandler("wasabi_mdt:updateDispatchStatus", function(dispatchId, newStatus)
    local playerId = source
    local identifier = wsb.getIdentifier(playerId)

    local dispatch = ActiveDispatches[dispatchId]
    if not dispatch then
        return
    end

    if newStatus == "completed" then
        dispatch:complete(identifier)
    elseif newStatus == "pending" then
        dispatch:reopen()
    else
        dispatch:updateOfficerStatus(identifier, newStatus)
    end

    BroadcastToOnDutyOfficers("wasabi_mdt:dispatchUpdated", dispatch:toTable())
end)

RegisterServerEvent("wasabi_mdt:unassignDispatch")
AddEventHandler("wasabi_mdt:unassignDispatch", function(dispatchId)
    local playerId = source
    local identifier = wsb.getIdentifier(playerId)

    local dispatch = ActiveDispatches[dispatchId]
    if not dispatch then
        TriggerClientEvent("wasabi_bridge:notify", playerId, 
            _L("notify_title"), _L("dispatch_not_found"), "error")
        return
    end

    local unassigned = dispatch:unassign(identifier)

    if unassigned then
        if next(dispatch.assigned_officers) == nil then
            dispatch.status = "pending"
        end

        BroadcastToOnDutyOfficers("wasabi_mdt:dispatchUpdated", dispatch:toTable())
        TriggerClientEvent("wasabi_bridge:notify", playerId, 
            _L("notify_title"), _L("dispatch_unassigned"), "info")
    else
        TriggerClientEvent("wasabi_bridge:notify", playerId, 
            _L("notify_title"), _L("not_assigned_to_dispatch"), "error")
    end
end)

RegisterServerEvent("wasabi_mdt:requestDispatchBackup")
AddEventHandler("wasabi_mdt:requestDispatchBackup", function(dispatchId)
    local playerId = source
    local playerName = wsb.getName(playerId)

    if not playerName then
        return
    end

    local dispatch = ActiveDispatches[dispatchId]
    if not dispatch then
        return
    end

    dispatch.priority = math.min(5, dispatch.priority + 1)
    dispatch.metadata.backupRequested = true
    dispatch.metadata.backupRequestedBy = playerName
    dispatch.metadata.backupRequestedAt = os.time()

    local broadcastData = dispatch:toTable()
    broadcastData.title = "[BACKUP REQUESTED] " .. broadcastData.title

    BroadcastToOnDutyOfficers("wasabi_mdt:receiveDispatch", broadcastData)

    TriggerClientEvent("wasabi_bridge:notify", playerId, 
        _L("notify_title"), _L("backup_requested"), "success")
end)

RegisterServerEvent("wasabi_mdt:updateOfficerPosition")
AddEventHandler("wasabi_mdt:updateOfficerPosition", function(coords)
    local playerId = source
    local playerName = wsb.getName(playerId)
    local identifier = wsb.getIdentifier(playerId)

    if not playerName or not identifier then
        return
    end

    OfficerPositions[identifier] = {
        coords = coords,
        name = playerName,
        updated_at = os.time()
    }

    if ActivePanicAlerts[identifier] then
        local panicDispatchId = ActivePanicAlerts[identifier].dispatch_id
        local panicDispatch = ActiveDispatches[panicDispatchId]

        if panicDispatch then
            panicDispatch.coords = coords
            ActivePanicAlerts[identifier].coords = coords

            BroadcastToOnDutyOfficers("wasabi_mdt:dispatchUpdated", panicDispatch:toTable())
        end
    end
end)

RegisterServerEvent("wasabi_mdt:triggerPanic")
AddEventHandler("wasabi_mdt:triggerPanic", function()
    local playerId = source
    local playerName = wsb.getName(playerId)
    local identifier = wsb.getIdentifier(playerId)
    local coords = GetEntityCoords(GetPlayerPed(playerId))

    if not playerName or not identifier then
        return
    end

    local panicDispatch = MDTDispatch:new({
        type = "panic",
        title = "PANIC BUTTON ACTIVATED",
        description = string.format("Officer %s has activated their panic button!", playerName),
        location = "Officer Location",
        coords = {x = coords.x, y = coords.y, z = coords.z},
        priority = 5,
        created_by = identifier,
        created_by_name = playerName
    })

    if panicDispatch then
        ActiveDispatches[panicDispatch.id] = panicDispatch

        ActivePanicAlerts[identifier] = {
            dispatch_id = panicDispatch.id,
            officer_name = playerName,
            coords = {x = coords.x, y = coords.y, z = coords.z},
            timestamp = os.time()
        }

        for officerIdentifier, officerData in pairs(Officers) do
            if officerData.onDuty then
                local officerPlayerId = wsb.getPlayerIdFromIdentifier(officerIdentifier)
                
                if officerPlayerId then
                    TriggerClientEvent("wasabi_mdt:receiveDispatch", playerId, panicDispatch:toTable())

                    if officerPlayerId ~= playerId then
                        TriggerClientEvent("wasabi_mdt:receivePanicAlert", officerPlayerId, {
                            officer_name = playerName,
                            coords = {x = coords.x, y = coords.y, z = coords.z},
                            dispatch_id = panicDispatch.id
                        })
                    end
                end
            end
        end

        TriggerClientEvent("wasabi_bridge:notify", playerId, 
            _L("notify_title"), _L("panic_activated"), "error")
    end
end)

RegisterServerEvent("wasabi_mdt:createExternalDispatch")
AddEventHandler("wasabi_mdt:createExternalDispatch", function(dispatchData)
    local externalDispatch = MDTDispatch:new({
        type = dispatchData.type or "disturbance",
        title = dispatchData.title or "External Dispatch",
        description = dispatchData.description or "",
        location = dispatchData.location or "Unknown",
        coords = dispatchData.coords,
        priority = dispatchData.priority or 2,
        created_by = "system",
        created_by_name = "System",
        departments = dispatchData.departments or "all"
    })

    if externalDispatch then
        ActiveDispatches[externalDispatch.id] = externalDispatch

        local eligibleOfficers = GetEligibleOfficers(externalDispatch)

        for _, officer in ipairs(eligibleOfficers) do
            TriggerClientEvent("wasabi_mdt:receiveDispatch", officer.src, externalDispatch:toTable())
        end
    end
end)

-- ============================================
-- CLEANUP & MAINTENANCE
-- ============================================

-- AddEventHandler("playerDropped", function(reason)
--     local identifier = wsb.getIdentifier(source)

--     OfficerPositions[identifier] = nil
--     ActivePanicAlerts[identifier] = nil

--     for dispatchId, dispatch in pairs(ActiveDispatches) do
--         dispatch:unassign(identifier)
--     end
-- end)

AddEventHandler("playerDropped", function(reason)
    local identifier = wsb.getIdentifier(source)
    if not identifier then return end

    OfficerPositions[identifier] = nil
    ActivePanicAlerts[identifier] = nil

    for dispatchId, dispatch in pairs(ActiveDispatches) do
        dispatch:unassign(identifier)
    end
end)


-- Cleanup thread: runs every 5 minutes to remove old dispatches
CreateThread(function()
    while true do
        Wait(300000)

        local currentTime = os.time()

        for dispatchId, dispatch in pairs(ActiveDispatches) do
            if dispatch.status == "completed" then
                if dispatch.completed_at and (currentTime - dispatch.completed_at) > 1800 then
                    ActiveDispatches[dispatchId] = nil
                end
            end

            if dispatch.status == "pending" then
                if (currentTime - dispatch.created_at) > 3600 then
                    ActiveDispatches[dispatchId] = nil
                    BroadcastToOnDutyOfficers("wasabi_mdt:dispatchDeleted", dispatchId)
                end
            end
        end

        for identifier, panicData in pairs(ActivePanicAlerts) do
            if (currentTime - panicData.timestamp) > 600 then
                ActivePanicAlerts[identifier] = nil
            end
        end
    end
end)

-- Get all dispatch data (for external integrations)
function GetDispatchData()
    local data = {
        dispatches = {},
        officerPositions = OfficerPositions
    }

    for _, dispatch in pairs(ActiveDispatches) do
        table.insert(data.dispatches, dispatch:toTable())
    end

    return data
end