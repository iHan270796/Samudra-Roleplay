-- ============================================
-- GLOBAL STATE
-- ============================================
Officers = {}

-- ============================================
-- INITIALIZATION
-- ============================================
MySQL.ready(function()
    CreateSQLIfNotExist()
    
    MDTPhoto.loadFromDatabase()
    MDTNote.loadFromDatabase()
    MDTAnnouncement.loadFromDatabase()
    MDTCitizen.loadFromDatabase()
    MDTVehicle.loadFromDatabase()
    MDTWeapon.loadFromDatabase()
    MDTProperty.loadFromDatabase()
    MDTEvidence.loadFromDatabase()
    MDTCharge.loadFromDatabase()
    MDTWarrant.loadFromDatabase()
    MDTBOLO.loadFromDatabase()
    MDTIncident.loadFromDatabase()
    MDTCamera.loadFromDatabase()
end)

-- ============================================
-- MDT ITEM REGISTRATION
-- ============================================
if Config.OpenMDT.item.enabled then
    wsb.registerUsableItem(Config.OpenMDT.item.name, function(source, item)
        TriggerClientEvent("wasabi_mdt:openMDT", source)
    end)
end

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================

function SendPermissionError(source, message)
    message = message or _L("no_permission")
    TriggerClientEvent("wasabi_bridge:notify", source, _L("notify_title"), message, "error")
end

function SendSuccessNotification(source, message)
    TriggerClientEvent("wasabi_bridge:notify", source, _L("notify_title"), message, "success")
end

function SendErrorNotification(source, message)
    TriggerClientEvent("wasabi_bridge:notify", source, _L("notify_title"), message, "error")
end

function SendNotification(source, message, notifType)
    TriggerClientEvent("wasabi_bridge:notify", source, _L("notify_title"), message, notifType)
end

function ValidateOfficerAccess(source)
    local identifier = wsb.getIdentifier(source)
    if not identifier then
        return false, nil
    end
    
    if not IsOfficer(identifier) then
        SendPermissionError(source)
        return false, nil
    end
    
    return true, identifier
end

function CheckPermission(source, identifier, permission)
    if not HasPermission(identifier, permission) then
        SendPermissionError(source)
        return false
    end
    return true
end

-- ============================================
-- MDT CORE CALLBACKS
-- ============================================

wsb.registerCallback("wasabi_mdt:openMDT", function(source, data)
    local identifier = wsb.getIdentifier(source)
    if not identifier then
        return false
    end
    
    if not IsOfficer(identifier) then
        SendPermissionError(source)
        return false
    end
    
    local jobData = wsb.getJobData(source)
    local isOfficer = IsOfficer(identifier)
    local jobName = jobData and jobData.name or nil
    
    return isOfficer, jobName
end)

wsb.registerCallback("wasabi_mdt:getMDTDashboard", function(source, data)
    local identifier = wsb.getIdentifier(source)
    if not identifier or not Officers[identifier] then
        return
    end
    
    RefreshOfficers()
    
    local jobData = wsb.getJobData(source)
    
    return {
        officerData = Officers[identifier],
        officers = GetDepartmentOfficers(jobData.name),
        announcements = MDTAnnouncement.getByDepartment(jobData.name),
        activeWarrants = MDTWarrant.getActive(),
        recentIncidents = MDTIncident.getRecent(10)
    }
end)

wsb.registerCallback("wasabi_mdt:setCallsign", function(source, data, callsign)
    local identifier = wsb.getIdentifier(source)
    if not identifier or not Officers[identifier] then
        return false
    end
    
    SetPlayerCallsign(identifier, callsign)
    SendSuccessNotification(source, _L("callsign_set_successfully"))
    return true
end)

wsb.registerCallback("wasabi_mdt:getOfficers", function(source)
    RefreshOfficers()
    
    local jobData = wsb.getJobData(source)
    if not jobData then
        return
    end
    
    return GetDepartmentOfficers(jobData.name)
end)

-- ============================================
-- ANNOUNCEMENT SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:announcementAction", function(source, data, action, params)
    local identifier = wsb.getIdentifier(source)
    local jobData = wsb.getJobData(source)
    
    if action == "create" or action == "edit" or action == "delete" then
        if not CheckPermission(source, identifier, "mdt.announcements." .. action) then
            return false
        end
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        return {
            announcements = MDTAnnouncement.getByDepartment(jobData.name),
            canManage = HasPermission(identifier, "mdt.announcements")
        }
        
    elseif action == "create" then
        local existingAnnouncements = MDTAnnouncement.getByDepartment(jobData.name)
        if table.count(existingAnnouncements) >= Config.Announcements.maxAnnouncements then
            SendErrorNotification(source, _L("max_announcements_reached"))
            return false
        end
        
        local announcement = MDTAnnouncement:new({
            title = params.title,
            content = params.content,
            priority = params.priority or "medium",
            author = wsb.getName(source),
            department = jobData.name,
            expires_at = os.time() + ((params.expireDays or Config.Announcements.defaultExpireDays) * 86400)
        })
        
        if not announcement then
            return false, _L("failed_create_announcement")
        end
        
        success = true
        message = _L("announcement_created")
        resultData = announcement
        
    elseif action == "edit" then
        local announcement = MDTAnnouncement.get(params.id)
        if not announcement then
            return false
        end
        
        if announcement.department ~= jobData.name then
            SendErrorNotification(source, _L("announcement_wrong_department"))
            return false
        end
        
        announcement:update({
            title = params.title,
            content = params.content,
            priority = params.priority or announcement.priority
        }, true)
        
        success = true
        message = _L("announcement_updated")
        
    elseif action == "delete" then
        local announcement = MDTAnnouncement.get(params.id)
        if not announcement then
            return false
        end
        
        if announcement.department ~= jobData.name then
            SendErrorNotification(source, _L("announcement_wrong_department"))
            return false
        end
        
        announcement:delete()
        success = true
        message = _L("announcement_deleted")
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

-- ============================================
-- DUTY TOGGLE
-- ============================================

wsb.registerCallback("wasabi_mdt:toggleDuty", function(source, data)
    local identifier = wsb.getIdentifier(source)
    if not identifier or not Officers[identifier] then
        return false
    end
    
    Officers[identifier].onDuty = not Officers[identifier].onDuty
    
    if Officers[identifier].onDuty then
        Officers[identifier].onDutySince = os.time()
    end
    
    local statusMessage = Officers[identifier].onDuty and _L("now_on_duty") or _L("now_off_duty")
    SendSuccessNotification(source, statusMessage)
    
    return {
        onDuty = Officers[identifier].onDuty
    }
end)

-- ============================================
-- CITIZEN SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:citizenAction", function(source, data, action, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    if action == "create" or action == "edit" or action == "delete" then
        if not CheckPermission(source, identifier, "mdt.citizens." .. action) then
            return false
        end
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        return {
            citizens = MDTCitizen.getAll()
        }
        
    elseif action == "create" then
        local citizen = MDTCitizen:new({
            identifier = params.identifier,
            firstname = params.firstname,
            lastname = params.lastname,
            dob = params.dob,
            phone = params.phone,
            gender = params.gender,
            job = params.job,
            job_grade = params.job_grade or 0
        }, true)
        
        if citizen then
            success = true
            message = _L("citizen_registered")
            resultData = citizen:toTable()
        else
            success = false
            message = _L("failed_register_citizen")
        end
        
    elseif action == "edit" then
        local citizen = MDTCitizen.get(params.identifier)
        if not citizen then
            SendErrorNotification(source, _L("citizen_not_found"))
            return false
        end
        
        citizen:update({
            firstname = params.firstname,
            lastname = params.lastname,
            dob = params.dob,
            phone = params.phone,
            gender = params.gender
        }, true)
        
        success = true
        message = _L("citizen_updated")
        resultData = citizen:toTable()
        
    elseif action == "delete" then
        local citizen = MDTCitizen.get(params.identifier)
        if not citizen then
            return false
        end
        
        citizen:delete()
        success = true
        message = _L("citizen_deleted")
        
    elseif action == "get" then
        local citizen = MDTCitizen.get(params.identifier)
        if citizen then
            return citizen:toTable()
        else
            return false
        end
        
    elseif action == "search" then
        local query = (params and params.query) or ""
        return {
            citizens = MDTCitizen.search(query)
        }
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

wsb.registerCallback("wasabi_mdt:searchPlayers", function(source, data, query)
    return GetPlayersFromDatabase(query)
end)

-- ============================================
-- VEHICLE SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:vehicleAction", function(source, data, action, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    if action == "create" or action == "edit" or action == "delete" then
        if not CheckPermission(source, identifier, "mdt.vehicles." .. action) then
            return false
        end
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        return {
            vehicles = MDTVehicle.getAll()
        }
        
    elseif action == "search" then
        local query = ""
        if type(params) == "table" then
            query = params.query or ""
        elseif type(params) == "string" then
            query = params
        end
        
        return {
            vehicles = MDTVehicle.search(query)
        }
        
    elseif action == "create" then
        if MDTVehicle.getByPlate(params.plate) then
            SendErrorNotification(source, _L("vehicle_already_exists"))
            return false
        end
        
        local vehicle = MDTVehicle:new({
            plate = params.plate,
            model = params.model,
            vehicle_type = params.vehicle_type or "car",
            owner_id = params.owner_id
        })
        
        if vehicle then
            success = true
            message = _L("vehicle_registered")
            resultData = vehicle:toTable()
        else
            success = false
            message = _L("failed_register_vehicle")
        end
        
    elseif action == "edit" then
        local vehicle = MDTVehicle.get(params.id)
        if not vehicle then
            SendErrorNotification(source, _L("vehicle_not_found"))
            return false
        end
        
        if params.plate then
            if params.plate:upper() ~= vehicle.plate then
                if MDTVehicle.getByPlate(params.plate) then
                    SendErrorNotification(source, _L("vehicle_already_exists"))
                    return false
                end
            end
        end
        
        vehicle:update({
            plate = params.plate:upper(),
            model = params.model,
            owner_id = params.owner_id,
            vehicle_type = params.vehicle_type or "car"
        }, true)
        
        success = true
        message = _L("vehicle_updated")
        resultData = vehicle:toTable()
        
    elseif action == "delete" then
        local vehicle = MDTVehicle.get(params.id)
        if not vehicle then
            return false
        end
        
        vehicle:delete()
        success = true
        message = _L("vehicle_deleted")
        
    elseif action == "get" then
        local vehicle = MDTVehicle.get(params.id)
        if vehicle then
            return vehicle:toTable()
        else
            return false
        end
        
    elseif action == "getByPlate" then
        local vehicle = MDTVehicle.getByPlate(params.plate)
        if vehicle then
            return vehicle:toTable()
        else
            return false
        end
        
    elseif action == "toggleFlag" then
        local vehicle = MDTVehicle.get(params.id)
        if not vehicle then
            return false
        end
        
        vehicle.metadata.flagged = params.flagged
        vehicle:update({
            metadata = vehicle.metadata
        }, true)
        
        success = true
        message = params.flagged and _L("vehicle_flagged") or _L("vehicle_unflagged")
        resultData = vehicle:toTable()
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

-- ============================================
-- WEAPON SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:weaponAction", function(source, data, action, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    if action == "create" or action == "edit" or action == "delete" then
        if not CheckPermission(source, identifier, "mdt.weapons." .. action) then
            return false
        end
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        return {
            weapons = MDTWeapon.getAll()
        }
        
    elseif action == "search" then
        return {
            weapons = MDTWeapon.search(params.query or "")
        }
        
    elseif action == "create" then
        if params.serial_number and params.serial_number ~= "" then
            if MDTWeapon.getBySerial(params.serial_number) then
                SendErrorNotification(source, _L("weapon_serial_exists"))
                return false
            end
        end
        
        local weapon = MDTWeapon:new({
            weapon_type = params.weapon_type,
            serial_number = params.serial_number,
            owner_id = params.owner_id
        })
        
        if weapon then
            success = true
            message = _L("weapon_registered")
            resultData = weapon:toTable()
        else
            success = false
            message = _L("failed_register_weapon")
        end
        
    elseif action == "edit" then
        local weapon = MDTWeapon.get(params.id)
        if not weapon then
            SendErrorNotification(source, _L("weapon_not_found"))
            return false
        end
        
        weapon:update({
            weapon_type = params.weapon_type,
            owner_id = params.owner_id
        }, true)
        
        success = true
        message = _L("weapon_updated")
        resultData = weapon:toTable()
        
    elseif action == "delete" then
        local weapon = MDTWeapon.get(params.id)
        if not weapon then
            return false
        end
        
        weapon:delete()
        success = true
        message = _L("weapon_deleted")
        
    elseif action == "toggleFlag" then
        local weapon = MDTWeapon.get(params.id)
        if not weapon then
            return false
        end
        
        weapon.metadata.flagged = params.flagged
        weapon:update({
            metadata = weapon.metadata
        }, true)
        
        success = true
        message = params.flagged and _L("weapon_flagged") or _L("weapon_unflagged")
        resultData = weapon:toTable()
        
    elseif action == "getBySerial" then
        local weapon = MDTWeapon.getBySerial(params.serial)
        if weapon then
            return weapon:toTable()
        else
            return false
        end
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

-- ============================================
-- PROPERTY SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:propertyAction", function(source, data, action, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    if action == "create" or action == "edit" or action == "delete" then
        if not CheckPermission(source, identifier, "mdt.properties." .. action) then
            return false
        end
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        return {
            properties = MDTProperty.getAll()
        }
        
    elseif action == "search" then
        return {
            properties = MDTProperty.search(params.query or "")
        }
        
    elseif action == "create" then
        local property = MDTProperty:new({
            address = params.address,
            property_type = params.property_type,
            owner_id = params.owner_id,
            coords = params.coords
        })
        
        if property then
            success = true
            message = _L("property_registered")
            resultData = property:toTable()
        else
            success = false
            message = _L("failed_register_property")
        end
        
    elseif action == "edit" then
        local property = MDTProperty.get(params.id)
        if not property then
            SendErrorNotification(source, _L("property_not_found"))
            return false
        end
        
        property:update({
            address = params.address,
            property_type = params.property_type,
            owner_id = params.owner_id,
            coords = params.coords
        }, true)
        
        success = true
        message = _L("property_updated")
        resultData = property:toTable()
        
    elseif action == "delete" then
        local property = MDTProperty.get(params.id)
        if not property then
            return false
        end
        
        property:delete()
        success = true
        message = _L("property_deleted")
        
    elseif action == "toggleFlag" then
        local property = MDTProperty.get(params.id)
        if not property then
            return false
        end
        
        property.metadata.flagged = params.flagged
        property:update({
            metadata = property.metadata
        }, true)
        
        success = true
        message = params.flagged and _L("property_flagged") or _L("property_unflagged")
        resultData = property:toTable()
        
    elseif action == "get" then
        local property = MDTProperty.get(params.id)
        if property then
            return property:toTable()
        else
            return false
        end
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

-- ============================================
-- EVIDENCE SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:evidenceAction", function(source, data, action, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    if action == "create" or action == "edit" or action == "delete" then
        if not CheckPermission(source, identifier, "mdt.evidence." .. action) then
            return false
        end
    elseif action == "checkOut" or action == "checkIn" then
        local permissionSuffix = (action == "checkOut") and "checkout" or "checkin"
        if not CheckPermission(source, identifier, "mdt.evidence." .. permissionSuffix) then
            return false
        end
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        return {
            evidence = MDTEvidence.getAll()
        }
        
    elseif action == "search" then
        return {
            evidence = MDTEvidence.search(params.query or "")
        }
        
    elseif action == "get" then
        local evidence = MDTEvidence.get(params.id)
        if evidence then
            return evidence:toTable()
        end
        return false
        
    elseif action == "create" then
        local evidence = MDTEvidence:new({
            evidence_type = params.evidence_type,
            description = params.description,
            notes = params.notes,
            location_found = params.location_found,
            storage_location = params.storage_location,
            collected_by = identifier,
            collected_by_name = wsb.getName(source)
        })
        
        if evidence then
            success = true
            message = _L("evidence_added")
            resultData = evidence:toTable()
        else
            success = false
            message = _L("failed_add_evidence")
        end
        
    elseif action == "edit" then
        local evidence = MDTEvidence.get(params.id)
        if not evidence then
            SendErrorNotification(source, _L("evidence_not_found"))
            return false
        end
        
        evidence:update({
            evidence_type = params.evidence_type,
            description = params.description,
            notes = params.notes,
            location_found = params.location_found,
            storage_location = params.storage_location
        }, true)
        
        success = true
        message = _L("evidence_updated")
        resultData = evidence:toTable()
        
    elseif action == "delete" then
        local evidence = MDTEvidence.get(params.id)
        if not evidence then
            return false
        end
        
        evidence:delete()
        success = true
        message = _L("evidence_deleted")
        
    elseif action == "checkOut" then
        local evidence = MDTEvidence.get(params.id)
        if not evidence then
            return false
        end
        
        evidence:checkOut(identifier, wsb.getName(source), params.notes, params.new_location)
        success = true
        message = _L("evidence_checked_out")
        resultData = evidence:toTable()
        
    elseif action == "checkIn" then
        local evidence = MDTEvidence.get(params.id)
        if not evidence then
            return false
        end
        
        evidence:checkIn(identifier, wsb.getName(source), params.notes, params.new_location)
        success = true
        message = _L("evidence_checked_in")
        resultData = evidence:toTable()
        
    elseif action == "link" then
        local evidence = MDTEvidence.get(params.id)
        if not evidence then
            return false
        end
        
        local metadata = {
            link_type = params.linkType or "involved"
        }
        
        if evidence:linkEntity(params.entityType, params.entityId, identifier, metadata) then
            success = true
            message = _L("entity_linked")
            resultData = evidence:toTable()
        else
            success = false
            message = _L("entity_already_linked")
        end
        
    elseif action == "unlink" then
        local evidence = MDTEvidence.get(params.id)
        if not evidence then
            return false
        end
        
        if evidence:unlinkEntity(params.entityType, params.entityId) then
            success = true
            message = _L("entity_unlinked")
            resultData = evidence:toTable()
        else
            success = false
            message = _L("entity_not_linked")
        end
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

-- ============================================
-- PHOTO SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:photoAction", function(source, data, action, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "checkAvailability" then
        local available, reason = IsPhotoServiceAvailable()
        return {
            available = available,
            reason = reason
        }
        
    elseif action == "take" then
        local available, reason = IsPhotoServiceAvailable()
        if not available then
            SendErrorNotification(source, _L("photo_service_unavailable"))
            if reason then
                print("^1[MDT Photo Service Error]: " .. reason .. "^0")
            end
            return false
        end
        
        local screenshot = TakeScreenshot(source)
        if not screenshot then
            return false, _L("failed_take_photo")
        end
        
        local url = screenshot.url or screenshot
        local storedId = screenshot.id or screenshot
        
        local photo = MDTPhoto:new({
            url = url,
            stored_id = storedId,
            entity_type = params.entity_type,
            entity_id = params.entity_id,
            uploaded_by = identifier,
            uploaded_by_name = wsb.getName(source),
            description = params.description
        })
        
        if photo then
            success = true
            message = _L("photo_taken")
            resultData = photo:toTable()
        else
            success = false
            message = _L("failed_save_photo")
        end
        
    elseif action == "get" then
        return {
            photos = MDTPhoto.getByEntity(params.entity_type, params.entity_id)
        }
        
    elseif action == "update" then
        local photo = MDTPhoto.get(params.id)
        if not photo then
            return false
        end
        
        photo:update({
            description = params.description
        })
        
        success = true
        message = _L("photo_updated")
        resultData = photo:toTable()
        
    elseif action == "delete" then
        local photo = MDTPhoto.get(params.id)
        if not photo then
            return false
        end
        
        photo:delete()
        success = true
        message = _L("photo_deleted")
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

wsb.registerCallback("wasabi_mdt:setEntityAvatar", function(source, data, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    local entity = nil
    
    if params.entityType == "citizen" then
        entity = MDTCitizen.get(params.entityId)
    elseif params.entityType == "vehicle" then
        entity = MDTVehicle.get(params.entityId)
    elseif params.entityType == "property" then
        entity = MDTProperty.get(params.entityId)
    elseif params.entityType == "evidence" then
        entity = MDTEvidence.get(params.entityId)
    end
    
    if not entity then
        return false
    end
    
    if params.remove then
        if entity.removeAvatar then
            entity:removeAvatar()
            SendSuccessNotification(source, _L("avatar_removed_successfully"))
            return true
        end
    else
        if entity.setAvatar then
            entity:setAvatar(params.photoId)
            SendSuccessNotification(source, _L("avatar_set_successfully"))
            return true
        end
    end
    
    return false
end)

wsb.registerCallback("wasabi_mdt:searchVehicles", function(source, data, query)
    return GetVehiclesFromDatabase(query)
end)

-- ============================================
-- ENTITY SEARCH & LINKING
-- ============================================

wsb.registerCallback("wasabi_mdt:searchEntity", function(source, data, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return {}
    end
    
    local results = {}
    local query = params.query or ""
    local entityType = params.type
    
    if entityType == "citizen" then
        results = MDTCitizen.search(query)
    elseif entityType == "vehicle" then
        results = MDTVehicle.search(query)
    elseif entityType == "weapon" then
        results = MDTWeapon.search(query)
    elseif entityType == "property" then
        results = MDTProperty.search(query)
    elseif entityType == "officer" then
        results = SearchOfficers(query)
    elseif entityType == "evidence" then
        results = MDTEvidence.search(query)
    elseif entityType == "charge" then
        results = MDTCharge.search(query)
    end
    
    return results
end)

wsb.registerCallback("wasabi_mdt:linkEntities", function(source, data, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    local metadata = params.metadata or {}
    metadata.link_type = metadata.link_type or "involved"
    
    local linked = MDTLinkManager.createLink(
        params.fromType,
        params.fromId,
        params.toType,
        params.toId,
        identifier,
        metadata
    )
    
    if linked then
        if params.fromType == "incident" and params.toType == "charge" then
            local incident = MDTIncident.get(tonumber(params.fromId))
            if incident then
                incident:calculateTotals()
                
                local charge = MDTCharge.get(tonumber(params.toId))
                if charge then
                    local chargeData = charge:toTable()
                    local incidentData = incident:toTable()
                    local officerInfo = {
                        identifier = identifier,
                        name = wsb.getName(source)
                    }
                    local adjustments = {
                        adjusted_fine = metadata.adjusted_fine,
                        adjusted_jail = metadata.adjusted_jail,
                        fine_reduction = metadata.fine_reduction,
                        jail_reduction = metadata.jail_reduction
                    }
                    
                    TriggerEvent("wasabi_mdt:onChargeLinked", chargeData, incident.primary_citizen, incidentData, officerInfo, adjustments)
                    
                    local targetPlayer = wsb.getPlayerIdFromIdentifier(incident.primary_citizen)
                    if targetPlayer then
                        TriggerClientEvent("wasabi_mdt:onChargeLinked", targetPlayer, chargeData, incident.primary_citizen, incidentData, officerInfo, adjustments)
                    end
                end
            end
        end
        
        SendSuccessNotification(source, _L("entity_linked"))
    else
        SendErrorNotification(source, _L("entity_already_linked"))
    end
    
    return linked
end)

wsb.registerCallback("wasabi_mdt:unlinkEntities", function(source, data, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    local unlinked = MDTLinkManager.removeLink(
        params.fromType,
        params.fromId,
        params.toType,
        params.toId
    )
    
    if unlinked then
        if params.fromType == "incident" and params.toType == "charge" then
            local incident = MDTIncident.get(tonumber(params.fromId))
            if incident then
                incident:calculateTotals()
                
                local charge = MDTCharge.get(tonumber(params.toId))
                if charge then
                    local chargeData = charge:toTable()
                    local incidentData = incident:toTable()
                    local officerInfo = {
                        identifier = identifier,
                        name = wsb.getName(source)
                    }
                    
                    TriggerEvent("wasabi_mdt:onChargeUnlinked", chargeData, incident.primary_citizen, incidentData, officerInfo)
                    
                    local targetPlayer = wsb.getPlayerIdFromIdentifier(incident.primary_citizen)
                    if targetPlayer then
                        TriggerClientEvent("wasabi_mdt:onChargeUnlinked", targetPlayer, chargeData, incident.primary_citizen, incidentData, officerInfo)
                    end
                end
            end
        end
        
        SendSuccessNotification(source, _L("entity_unlinked"))
    else
        SendErrorNotification(source, _L("entity_not_linked"))
    end
    
    return unlinked
end)

wsb.registerCallback("wasabi_mdt:getEntityLinks", function(source, data, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return {}
    end
    
    return MDTLinkManager.getLinkedEntities(params.entityType, params.entityId, params.targetType)
end)

-- ============================================
-- NOTE SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:noteAction", function(source, data, action, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "create" then
        local note = MDTNote:new({
            content = params.content,
            entity_type = params.entity_type,
            entity_id = params.entity_id,
            created_by = identifier,
            created_by_name = wsb.getName(source)
        })
        
        if note then
            success = true
            message = _L("note_added")
            resultData = note:toTable()
        else
            success = false
            message = _L("failed_add_note")
        end
        
    elseif action == "get" then
        return {
            notes = MDTNote.getByEntity(params.entity_type, params.entity_id)
        }
        
    elseif action == "update" then
        local note = MDTNote.get(params.id)
        if not note then
            return false
        end
        
        if note.created_by ~= identifier then
            SendErrorNotification(source, _L("can_only_edit_own_notes"))
            return false
        end
        
        note:update({
            content = params.content
        })
        
        success = true
        message = _L("note_updated")
        resultData = note:toTable()
        
    elseif action == "delete" then
        local note = MDTNote.get(params.id)
        if not note then
            return false
        end
        
        if note.created_by ~= identifier then
            if not IsStaff(source) then
                SendErrorNotification(source, _L("can_only_delete_own_notes"))
                return false
            end
        end
        
        note:delete()
        success = true
        message = _L("note_deleted")
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

wsb.registerCallback("wasabi_mdt:getJobsAndGrades", function(source, data)
    return GetJobsAndGrades()
end)

-- ============================================
-- CHARGE SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:chargeAction", function(source, data, action, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    if action == "create" or action == "edit" or action == "delete" then
        if not CheckPermission(source, identifier, "mdt.charges." .. action) then
            return false
        end
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        local canCreate = HasPermission(identifier, "mdt.charges.create")
        local canEdit = HasPermission(identifier, "mdt.charges.edit")
        local canDelete = HasPermission(identifier, "mdt.charges.delete")
        
        return {
            charges = MDTCharge.getAll(),
            canManage = canCreate or canEdit or canDelete,
            canCreate = canCreate,
            canEdit = canEdit,
            canDelete = canDelete
        }
        
    elseif action == "search" then
        return {
            charges = MDTCharge.search(params.query or "")
        }
        
    elseif action == "getByCategory" then
        return {
            charges = MDTCharge.getByCategory(params.category)
        }
        
    elseif action == "create" then
        local charge = MDTCharge:new({
            title = params.title,
            description = params.description,
            jail_time = params.jail_time,
            fine = params.fine,
            category = params.category,
            created_by = identifier,
            created_by_name = wsb.getName(source)
        })
        
        if charge then
            success = true
            message = _L("charge_created")
            resultData = charge:toTable()
        else
            success = false
            message = _L("failed_create_charge")
        end
        
    elseif action == "edit" then
        local charge = MDTCharge.get(params.id)
        if not charge then
            SendErrorNotification(source, _L("charge_not_found"))
            return false
        end
        
        charge:update({
            title = params.title,
            description = params.description,
            jail_time = params.jail_time,
            fine = params.fine,
            category = params.category
        }, true)
        
        success = true
        message = _L("charge_updated")
        resultData = charge:toTable()
        
    elseif action == "delete" then
        local charge = MDTCharge.get(params.id)
        if not charge then
            return false
        end
        
        charge:delete()
        success = true
        message = _L("charge_deleted")
        
    elseif action == "get" then
        local charge = MDTCharge.get(params.id)
        if charge then
            return charge:toTable()
        else
            return false
        end
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

-- ============================================
-- GLOBAL SEARCH
-- ============================================

wsb.registerCallback("wasabi_mdt:globalSearch", function(source, data, query)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return {}
    end
    
    if not query or query == "" then
        return {}
    end
    
    local results = {
        citizens = {},
        vehicles = {},
        weapons = {},
        properties = {},
        charges = {},
        evidence = {},
        warrants = {},
        bolos = {},
        incidents = {}
    }
    
    local citizenResults = MDTCitizen.search(query)
    for i, citizen in ipairs(citizenResults) do
        if i <= 5 then
            table.insert(results.citizens, citizen)
        end
    end
    
    local vehicleResults = MDTVehicle.search(query)
    for i, vehicle in ipairs(vehicleResults) do
        if i <= 5 then
            table.insert(results.vehicles, vehicle)
        end
    end
    
    local weaponResults = MDTWeapon.search(query)
    for i, weapon in ipairs(weaponResults) do
        if i <= 5 then
            table.insert(results.weapons, weapon)
        end
    end
    
    local propertyResults = MDTProperty.search(query)
    for i, property in ipairs(propertyResults) do
        if i <= 5 then
            table.insert(results.properties, property)
        end
    end
    
    local chargeResults = MDTCharge.search(query)
    for i, charge in ipairs(chargeResults) do
        if i <= 5 then
            table.insert(results.charges, charge)
        end
    end
    
    local evidenceResults = MDTEvidence.search(query)
    for i, evidence in ipairs(evidenceResults) do
        if i <= 5 then
            table.insert(results.evidence, evidence)
        end
    end
    
    local warrantResults = MDTWarrant.search(query)
    for i, warrant in ipairs(warrantResults) do
        if i <= 5 then
            table.insert(results.warrants, warrant)
        end
    end
    
    local boloResults = MDTBOLO.search(query)
    for i, bolo in ipairs(boloResults) do
        if i <= 5 then
            table.insert(results.bolos, bolo)
        end
    end
    
    local incidentResults = MDTIncident.search(query)
    for i, incident in ipairs(incidentResults) do
        if i <= 5 then
            table.insert(results.incidents, incident)
        end
    end
    
    return results
end)

-- ============================================
-- BOLO SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:boloAction", function(source, data, action, params)
    local playerName = wsb.getName(source)
    local identifier = wsb.getIdentifier(source)
    
    if not playerName or not identifier then
        return false
    end
    
    local hasAccess = IsOfficer(identifier)
    if not hasAccess then
        SendPermissionError(source)
        return false
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        return {
            bolos = MDTBOLO.getAll()
        }
        
    elseif action == "getActive" then
        return {
            bolos = MDTBOLO.getActive()
        }
        
    elseif action == "search" then
        return {
            bolos = MDTBOLO.search(params.query or "")
        }
        
    elseif action == "getByPlate" then
        return {
            bolos = MDTBOLO.getByPlate(params.plate or "")
        }
        
    elseif action == "create" then
        local vehicleId = nil
        if params.plate then
            local vehicle = MDTVehicle.getByPlate(params.plate)
            if vehicle then
                vehicleId = vehicle.id
            end
        end
        
        local bolo = MDTBOLO:new({
            title = params.title,
            description = params.description,
            vehicle_id = vehicleId,
            plate = params.plate,
            issued_by = identifier,
            issued_by_name = wsb.getName(source)
        })
        
        if bolo then
            success = true
            message = _L("bolo_created")
            resultData = bolo:toTable()
        else
            success = false
            message = _L("failed_create_bolo")
        end
        
    elseif action == "resolve" then
        local bolo = MDTBOLO.get(params.id)
        if not bolo then
            SendErrorNotification(source, _L("bolo_not_found"))
            return false
        end
        
        if bolo.status ~= "active" then
            SendErrorNotification(source, _L("bolo_not_active"))
            return false
        end
        
        bolo:resolve(identifier, wsb.getName(source))
        success = true
        message = _L("bolo_resolved_msg")
        resultData = bolo:toTable()
        
    elseif action == "edit" then
        local bolo = MDTBOLO.get(params.id)
        if not bolo then
            return false
        end
        
        bolo:update({
            title = params.title,
            description = params.description
        }, true)
        
        success = true
        message = _L("bolo_updated")
        resultData = bolo:toTable()
        
    elseif action == "expire" then
        local bolo = MDTBOLO.get(params.id)
        if not bolo then
            return false
        end
        
        bolo:expire()
        success = true
        message = _L("bolo_expired_msg")
        resultData = bolo:toTable()
        
    elseif action == "delete" then
        local bolo = MDTBOLO.get(params.id)
        if not bolo then
            return false
        end
        
        bolo:delete()
        success = true
        message = _L("bolo_deleted")
        
    elseif action == "get" then
        local bolo = MDTBOLO.get(params.id)
        if bolo then
            local boloData = bolo:toTable()
            boloData.notes = bolo:getNotes()
            return boloData
        end
        return false
        
    elseif action == "addNote" then
        local bolo = MDTBOLO.get(params.id)
        if not bolo then
            return false
        end
        
        local note = bolo:addNote(params.content, identifier, playerName)
        if note then
            success = true
            message = _L("note_added")
            resultData = note:toTable()
        else
            success = false
            message = _L("failed_add_note")
        end
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

-- ============================================
-- WARRANT SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:warrantAction", function(source, data, action, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    if action == "create" or action == "serve" or action == "cancel" then
        if not CheckPermission(source, identifier, "mdt.warrants." .. action) then
            return false
        end
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        local canCreate = HasPermission(identifier, "mdt.warrants.create")
        local canServe = HasPermission(identifier, "mdt.warrants.serve")
        local canCancel = HasPermission(identifier, "mdt.warrants.cancel")
        
        return {
            warrants = MDTWarrant.getAll(),
            canManage = canCreate or canServe or canCancel,
            canCreate = canCreate,
            canServe = canServe,
            canCancel = canCancel
        }
        
    elseif action == "getActive" then
        return {
            warrants = MDTWarrant.getActive()
        }
        
    elseif action == "search" then
        return {
            warrants = MDTWarrant.search(params.query or "")
        }
        
    elseif action == "create" then
        local citizen = MDTCitizen.get(params.citizen_id)
        if not citizen then
            SendErrorNotification(source, _L("citizen_not_found"))
            return false
        end
        
        local warrant = MDTWarrant:new({
            title = params.title,
            description = params.description,
            citizen_id = params.citizen_id,
            property_id = params.property_id,
            issued_by = identifier,
            issued_by_name = wsb.getName(source)
        })
        
        if warrant then
            if params.charge_ids and type(params.charge_ids) == "table" then
                for _, chargeId in ipairs(params.charge_ids) do
                    warrant:linkCharge(chargeId, identifier)
                end
            end
            
            success = true
            message = _L("warrant_created")
            resultData = warrant:toTable()
        else
            success = false
            message = _L("failed_create_warrant")
        end
        
    elseif action == "serve" then
        local warrant = MDTWarrant.get(params.id)
        if not warrant then
            SendErrorNotification(source, _L("warrant_not_found"))
            return false
        end
        
        if warrant.status ~= "active" then
            SendErrorNotification(source, _L("warrant_not_active"))
            return false
        end
        
        warrant:serve(identifier, wsb.getName(source))
        success = true
        message = _L("warrant_served")
        resultData = warrant:toTable()
        
    elseif action == "cancel" then
        local warrant = MDTWarrant.get(params.id)
        if not warrant then
            SendErrorNotification(source, _L("warrant_not_found"))
            return false
        end
        
        if warrant.status ~= "active" then
            SendErrorNotification(source, _L("warrant_not_active"))
            return false
        end
        
        warrant:cancel()
        success = true
        message = _L("warrant_cancelled_msg")
        resultData = warrant:toTable()
        
    elseif action == "get" then
        local warrant = MDTWarrant.get(params.id)
        if warrant then
            local warrantData = warrant:toTable()
            warrantData.notes = warrant:getNotes()
            return warrantData
        else
            return false
        end
        
    elseif action == "getByCitizen" then
        return {
            warrants = MDTWarrant.getByCitizen(params.citizen_id)
        }
        
    elseif action == "linkCharge" then
        local warrant = MDTWarrant.get(params.id)
        if not warrant then
            return false
        end
        
        if warrant:linkCharge(params.charge_id, identifier) then
            success = true
            message = _L("charge_linked")
        else
            success = false
            message = _L("charge_already_linked")
        end
        
    elseif action == "unlinkCharge" then
        local warrant = MDTWarrant.get(params.id)
        if not warrant then
            return false
        end
        
        if warrant:unlinkCharge(params.charge_id) then
            success = true
            message = _L("charge_unlinked")
        else
            success = false
            message = _L("charge_not_linked")
        end
        
    elseif action == "addNote" then
        local warrant = MDTWarrant.get(params.id)
        if not warrant then
            return false
        end
        
        local note = warrant:addNote(params.content, identifier, wsb.getName(source))
        if note then
            success = true
            message = _L("note_added")
            resultData = note:toTable()
        else
            success = false
            message = _L("failed_add_note")
        end
        
    elseif action == "edit" then
        local warrant = MDTWarrant.get(params.id)
        if not warrant then
            return false
        end
        
        warrant:update({
            title = params.title,
            description = params.description
        }, true)
        
        success = true
        message = _L("warrant_updated")
        resultData = warrant:toTable()
        
    elseif action == "delete" then
        local warrant = MDTWarrant.get(params.id)
        if not warrant then
            return false
        end
        
        warrant:delete()
        success = true
        message = _L("warrant_deleted")
        
    elseif action == "link" then
        local warrant = MDTWarrant.get(params.id)
        if not warrant then
            return false
        end
        
        local metadata = {
            link_type = params.linkType or "involved"
        }
        
        if warrant:linkEntity(params.entityType, params.entityId, identifier, metadata) then
            success = true
            message = _L("entity_linked")
            resultData = warrant:toTable()
        else
            success = false
            message = _L("entity_already_linked")
        end
        
    elseif action == "unlink" then
        local warrant = MDTWarrant.get(params.id)
        if not warrant then
            return false
        end
        
        if warrant:unlinkEntity(params.entityType, params.entityId) then
            success = true
            message = _L("entity_unlinked")
            resultData = warrant:toTable()
        else
            success = false
            message = _L("entity_not_linked")
        end
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

-- ============================================
-- CAMERA SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:placeCamera", function(source, data, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    if not CheckPermission(source, identifier, "mdt.cameras.place") then
        return false
    end
    
    local jobData = wsb.getJobData(source)
    local playerName = wsb.getName(source)
    
    local camera = MDTCamera:new({
        name = params.name,
        location = params.location,
        coords = params.coords,
        rotation = params.rotation,
        model = params.model or "prop_cctv_cam_01a",
        departments = params.departments or {jobData.name},
        created_by = identifier,
        created_by_name = playerName
    }, true)
    
    if camera then
        SendSuccessNotification(source, _L("camera_placed"))
        return camera.id
    else
        SendErrorNotification(source, _L("failed_place_camera"))
        return false
    end
end)

wsb.registerCallback("wasabi_mdt:cameraAction", function(source, data, action, params)
    if action == "getAllCameras" then
        return MDTCamera.getAll()
    end
    
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    local jobData = wsb.getJobData(source)
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        return {
            cameras = MDTCamera.getByDepartment(jobData.name),
            canManage = HasPermission(identifier, "mdt.cameras.manage"),
            canPlace = HasPermission(identifier, "mdt.cameras.place"),
            canRepair = HasPermission(identifier, "mdt.cameras.repair")
        }
        
    elseif action == "getCameraById" then
        local cameraId = params.id or params
        cameraId = tonumber(cameraId) or cameraId
        
        local camera = MDTCamera.get(cameraId)
        if camera then
            return camera:toTable()
        end
        return nil
        
    elseif action == "create" then
        if not CheckPermission(source, identifier, "mdt.cameras.place") then
            return false
        end
        
        local playerName = wsb.getName(source)
        local camera = MDTCamera:new({
            name = params.name,
            location = params.location,
            coords = params.coords,
            rotation = params.rotation,
            departments = params.departments or {jobData.name},
            created_by = identifier,
            created_by_name = playerName
        }, true)
        
        if camera then
            success = true
            message = _L("camera_placed")
            resultData = camera:toTable()
        else
            success = false
            message = _L("failed_place_camera")
        end
        
    elseif action == "edit" then
        if not CheckPermission(source, identifier, "mdt.cameras.manage") then
            return false
        end
        
        local camera = MDTCamera.get(params.id)
        if not camera then
            return false
        end
        
        camera:update({
            name = params.name,
            location = params.location,
            departments = params.departments
        }, true)
        
        success = true
        message = _L("camera_updated")
        resultData = camera:toTable()
        
    elseif action == "delete" then
        if not CheckPermission(source, identifier, "mdt.cameras.manage") then
            return false
        end
        
        local camera = MDTCamera.get(params.id)
        if not camera then
            return false
        end
        
        camera:delete()
        success = true
        message = _L("camera_deleted")
        
    elseif action == "repair" then
        if not CheckPermission(source, identifier, "mdt.cameras.repair") then
            return false
        end
        
        local camera = MDTCamera.get(params.id)
        if not camera then
            return false
        end
        
        camera:repair()
        success = true
        message = _L("camera_repaired")
        resultData = camera:toTable()
        
    elseif action == "view" then
        local camera = MDTCamera.get(params.id)
        if not camera then
            return false
        end
        
        if not camera:canAccess(identifier) then
            SendErrorNotification(source, _L("no_camera_access"))
            return false
        end
        
        TriggerClientEvent("wasabi_mdt:viewCamera", source, camera:toTable())
        return true
        
    elseif action == "getNearby" then
        local playerCoords = GetEntityCoords(GetPlayerPed(source))
        
        return {
            cameras = MDTCamera.getNearby({
                x = playerCoords.x,
                y = playerCoords.y,
                z = playerCoords.z
            }, 100.0)
        }
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

-- ============================================
-- INCIDENT SYSTEM
-- ============================================

wsb.registerCallback("wasabi_mdt:incidentAction", function(source, data, action, params)
    local hasAccess, identifier = ValidateOfficerAccess(source)
    if not hasAccess then
        return false
    end
    
    if action == "create" or action == "edit" or action == "delete" then
        if not CheckPermission(source, identifier, "mdt.incidents." .. action) then
            return false
        end
    end
    
    local success = nil
    local message = nil
    local resultData = nil
    
    if action == "getAll" then
        return {
            incidents = MDTIncident.getAll()
        }
        
    elseif action == "getOpen" then
        return {
            incidents = MDTIncident.getOpen()
        }
        
    elseif action == "search" then
        return {
            incidents = MDTIncident.search(params.query or "")
        }
        
    elseif action == "get" then
        local incident = MDTIncident.get(params.id)
        if incident then
            return incident:toTable()
        end
        return false
        
    elseif action == "create" then
        local hasManualPermission = HasPermission(identifier, "mdt.incidents.manual")
        
        local incident = MDTIncident:new({
            title = params.title,
            description = params.description,
            location = params.location,
            primary_citizen = params.primary_citizen,
            created_by = identifier,
            created_by_name = wsb.getName(source),
            total_fine = params.total_fine or 0,
            total_jail_time = params.total_jail_time or 0,
            fine_reduction = params.fine_reduction or 0,
            jail_reduction = params.jail_reduction or 0,
            manual_fine = hasManualPermission and params.manual_fine or false,
            manual_jail = hasManualPermission and params.manual_jail or false,
            max_fine = params.max_fine,
            max_jail = params.max_jail
        })
        
        if incident then
            success = true
            message = _L("incident_created")
            resultData = incident:toTable()
        else
            success = false
            message = _L("failed_create_incident")
        end
        
    elseif action == "edit" then
        local incident = MDTIncident.get(params.id)
        if not incident then
            return false
        end
        
        local hasManualPermission = HasPermission(identifier, "mdt.incidents.manual")
        
        local updateData = {
            title = params.title,
            description = params.description,
            location = params.location,
            primary_citizen = params.primary_citizen,
            total_fine = params.total_fine,
            total_jail_time = params.total_jail_time,
            fine_reduction = params.fine_reduction,
            jail_reduction = params.jail_reduction,
            max_fine = params.max_fine,
            max_jail = params.max_jail
        }
        
        if hasManualPermission then
            updateData.manual_fine = params.manual_fine
            updateData.manual_jail = params.manual_jail
        end
        
        incident:update(updateData, true)
        success = true
        message = _L("incident_updated")
        resultData = incident:toTable()
        
    elseif action == "delete" then
        local incident = MDTIncident.get(params.id)
        if not incident then
            return false
        end
        
        incident:delete()
        success = true
        message = _L("incident_deleted")
        
    elseif action == "close" then
        local incident = MDTIncident.get(params.id)
        if not incident then
            return false
        end
        
        incident:close(identifier, wsb.getName(source))
        success = true
        message = _L("incident_closed_msg")
        resultData = incident:toTable()
        
    elseif action == "reopen" then
        local incident = MDTIncident.get(params.id)
        if not incident then
            return false
        end
        
        incident:reopen()
        success = true
        message = _L("incident_reopened")
        resultData = incident:toTable()
        
    elseif action == "linkCharge" then
        local incident = MDTIncident.get(params.id)
        if not incident then
            return false
        end
        
        local metadata = {}
        if params.adjusted_fine then metadata.adjusted_fine = params.adjusted_fine end
        if params.adjusted_jail then metadata.adjusted_jail = params.adjusted_jail end
        if params.fine_reduction then metadata.fine_reduction = params.fine_reduction end
        if params.jail_reduction then metadata.jail_reduction = params.jail_reduction end
        
        if incident:linkCharge(params.charge_id, identifier, metadata) then
            incident:calculateTotals()
            
            local charge = MDTCharge.get(params.charge_id)
            if charge then
                local chargeData = charge:toTable()
                local incidentData = incident:toTable()
                local officerInfo = {
                    identifier = identifier,
                    name = wsb.getName(source)
                }
            end
            
            success = true
            message = _L("charge_linked")
            resultData = incident:toTable()
        else
            success = false
            message = _L("charge_already_linked")
        end
        
    elseif action == "unlinkCharge" then
        local incident = MDTIncident.get(params.id)
        if not incident then
            return false
        end
        
        if incident:unlinkCharge(params.charge_id) then
            incident:calculateTotals()
            
            local charge = MDTCharge.get(params.charge_id)
            if charge then
                local chargeData = charge:toTable()
                local incidentData = incident:toTable()
                local officerInfo = {
                    identifier = identifier,
                    name = wsb.getName(source)
                }
            end
            
            success = true
            message = _L("charge_unlinked")
            resultData = incident:toTable()
        else
            success = false
            message = _L("charge_not_linked")
        end
        
    elseif action == "updateChargeAdjustment" then
        local incident = MDTIncident.get(params.id)
        if not incident then
            return false
        end
        
        incident:unlinkCharge(params.charge_id)
        
        local metadata = {}
        if params.adjusted_fine then metadata.adjusted_fine = params.adjusted_fine end
        if params.adjusted_jail then metadata.adjusted_jail = params.adjusted_jail end
        if params.fine_reduction then metadata.fine_reduction = params.fine_reduction end
        if params.jail_reduction then metadata.jail_reduction = params.jail_reduction end
        
        incident:linkCharge(params.charge_id, identifier, metadata)
        incident:calculateTotals()
        
        success = true
        message = _L("charge_adjustment_updated")
        resultData = incident:toTable()
        
    elseif action == "calculateTotals" then
        local incident = MDTIncident.get(params.id)
        if not incident then
            return false
        end
        
        local totalFine, totalJail = incident:calculateTotals()
        success = true
        resultData = {
            total_fine = totalFine,
            total_jail_time = totalJail
        }
        
    elseif action == "addNote" then
        local incident = MDTIncident.get(params.id)
        if not incident then
            return false
        end
        
        local note = incident:addNote(params.content, identifier, wsb.getName(source))
        if note then
            success = true
            message = _L("note_added")
            resultData = note:toTable()
        else
            success = false
            message = _L("failed_add_note")
        end
        
    elseif action == "getByCitizen" then
        return {
            incidents = MDTIncident.getByCitizen(params.citizen_id)
        }
    end
    
    if message then
        SendNotification(source, message, success and "success" or "error")
    end
    
    return resultData or success
end)

-- ============================================
-- VEHICLE DATABASE SEARCH
-- ============================================

wsb.registerCallback("wasabi_mdt:searchVehicles", function(source, data, params)
    local query = params.query or ""
    local vehicles = GetVehiclesFromDatabase(query)
    
    for _, vehicle in ipairs(vehicles) do
        local vehicleType = nil
        
        for _, vType in ipairs(Config.VehicleTypes) do
            if vType.type == "car" then
                vehicleType = vType
                break
            end
        end
        
        vehicle.vehicleType = (vehicleType and vehicleType.type) or "car"
        vehicle.vehicleTypeLabel = (vehicleType and vehicleType.label) or "Car"
        vehicle.displayName = vehicle.model
    end
    
    return vehicles
end)

-- ============================================
-- EVENT HANDLERS
-- ============================================

RegisterNetEvent("wasabi_mdt:refreshOfficer", function(officerData)
    local identifier = wsb.getIdentifier(source)
    
    if not IsOfficer(identifier) then
        if Officers[identifier] then
            Officers[identifier] = nil
        end
    end
    
    AddOfficer(identifier, officerData)
end)

RegisterNetEvent("wasabi_mdt:replaceCamera", function(cameraData)
    local identifier = wsb.getIdentifier(source)
    
    if identifier and HasPermission(identifier, "mdt.cameras.manage") then
        local camera = MDTCamera.get(cameraData.id)
        if not camera then
            SendErrorNotification(source, _L("camera_not_found"))
            return
        end
        
        camera:update({
            coords = cameraData.coords,
            rotation = cameraData.rotation,
            location = cameraData.location
        }, true)
        
        TriggerClientEvent("wasabi_mdt:cameraReplaced", -1, camera:toTable())
        SendSuccessNotification(source, _L("camera_repositioned"))
    else
        SendPermissionError(source)
    end
end)

AddEventHandler("playerDropped", function(reason)
    local identifier = wsb.getIdentifier(source)
    
    if identifier and Officers[identifier] then
        Officers[identifier] = nil
    end
end)

-- ============================================
-- EXPORTS
-- ============================================

exports("GetAnnouncement", function(id)
    return MDTAnnouncement.get(id)
end)

exports("GetAllAnnouncements", function()
    return MDTAnnouncement.getAll()
end)

exports("GetAnnouncementsByDepartment", function(department)
    return MDTAnnouncement.getByDepartment(department)
end)

exports("CreateAnnouncement", function(data)
    return MDTAnnouncement:new(data)
end)

exports("GetBOLO", function(id)
    return MDTBOLO.get(id)
end)

exports("GetAllBOLOs", function()
    return MDTBOLO.getAll()
end)

exports("GetActiveBOLOs", function()
    return MDTBOLO.getActive()
end)

exports("CreateBOLO", function(data)
    return MDTBOLO:new(data)
end)

exports("GetCamera", function(id)
    return MDTCamera.get(id)
end)

exports("GetAllCameras", function()
    return MDTCamera.getAll()
end)

exports("GetCamerasByDepartment", function(department)
    return MDTCamera.getByDepartment(department)
end)

exports("CreateCamera", function(data)
    return MDTCamera:new(data)
end)

exports("GetCharge", function(id)
    return MDTCharge.get(id)
end)

exports("GetAllCharges", function()
    return MDTCharge.getAll()
end)

exports("GetChargesByCategory", function(category)
    return MDTCharge.getByCategory(category)
end)

exports("CreateCharge", function(data)
    return MDTCharge:new(data)
end)

exports("GetCitizen", function(identifier)
    return MDTCitizen.get(identifier)
end)

exports("CreateCitizen", function(data)
    return MDTCitizen:new(data)
end)

exports("SearchCitizens", function(query)
    return MDTCitizen.search(query)
end)

exports("CreateDispatch", function(data)
    return MDTDispatch:new(data)
end)

exports("GetActiveDispatches", function()
    return ActiveDispatches
end)

exports("GetEvidence", function(id)
    return MDTEvidence.get(id)
end)

exports("GetAllEvidence", function()
    return MDTEvidence.getAll()
end)

exports("CreateEvidence", function(data)
    return MDTEvidence:new(data)
end)

exports("GetIncident", function(id)
    return MDTIncident.get(id)
end)

exports("GetAllIncidents", function()
    return MDTIncident.getAll()
end)

exports("GetIncidentsByCitizen", function(citizenId)
    return MDTIncident.getByCitizen(citizenId)
end)

exports("GetRecentIncidents", function(limit)
    return MDTIncident.getRecent(limit)
end)

exports("CreateIncident", function(data)
    return MDTIncident:new(data)
end)

exports("GetNote", function(id)
    return MDTNote.get(id)
end)

exports("CreateNote", function(data)
    return MDTNote:new(data)
end)

exports("GetPhoto", function(id)
    return MDTPhoto.get(id)
end)

exports("CreatePhoto", function(data)
    return MDTPhoto:new(data)
end)

exports("GetProperty", function(id)
    return MDTProperty.get(id)
end)

exports("GetAllProperties", function()
    return MDTProperty.getAll()
end)

exports("CreateProperty", function(data)
    return MDTProperty:new(data)
end)

exports("SearchProperties", function(query)
    return MDTProperty.search(query)
end)

exports("GetVehicle", function(id)
    return MDTVehicle.get(id)
end)

exports("GetVehicleByPlate", function(plate)
    return MDTVehicle.getByPlate(plate)
end)

exports("CreateVehicle", function(data)
    return MDTVehicle:new(data)
end)

exports("SearchVehicles", function(query)
    return MDTVehicle.search(query)
end)

exports("GetWarrant", function(id)
    return MDTWarrant.get(id)
end)

exports("GetAllWarrants", function()
    return MDTWarrant.getAll()
end)

exports("GetActiveWarrants", function()
    return MDTWarrant.getActive()
end)

exports("GetWarrantsByCitizen", function(citizenId)
    return MDTWarrant.getByCitizen(citizenId)
end)

exports("CreateWarrant", function(data)
    return MDTWarrant:new(data)
end)

exports("GetWeapon", function(id)
    return MDTWeapon.get(id)
end)

exports("GetWeaponBySerial", function(serial)
    return MDTWeapon.getBySerial(serial)
end)

exports("CreateWeapon", function(data)
    return MDTWeapon:new(data)
end)

exports("SearchWeapons", function(query)
    return MDTWeapon.search(query)
end)

exports("IsOfficer", IsOfficer)
exports("HasPermission", HasPermission)

exports("GetOfficers", function()
    return Officers
end)

exports("GetDepartmentOfficers", GetDepartmentOfficers)
exports("RefreshOfficers", RefreshOfficers)

exports("LinkEntityToIncident", function(incidentId, entityType, entityId, metadata)
    local incident = MDTIncident.get(incidentId)
    if incident then
        return incident:linkEntity(entityType, entityId, metadata)
    end
    return false
end)

exports("UnlinkEntityFromIncident", function(incidentId, entityType, entityId)
    local incident = MDTIncident.get(incidentId)
    if incident then
        return incident:unlinkEntity(entityType, entityId)
    end
    return false
end)

exports("LinkEntityToWarrant", function(warrantId, entityType, entityId, identifier, metadata)
    local warrant = MDTWarrant.get(warrantId)
    if warrant then
        return warrant:linkEntity(entityType, entityId, identifier, metadata)
    end
    return false
end)

exports("UnlinkEntityFromWarrant", function(warrantId, entityType, entityId)
    local warrant = MDTWarrant.get(warrantId)
    if warrant then
        return warrant:unlinkEntity(entityType, entityId)
    end
    return false
end)

exports("LinkEntityToEvidence", function(evidenceId, entityType, entityId, metadata)
    local evidence = MDTEvidence.get(evidenceId)
    if evidence then
        return evidence:linkEntity(entityType, entityId, metadata)
    end
    return false
end)

exports("UnlinkEntityFromEvidence", function(evidenceId, entityType, entityId)
    local evidence = MDTEvidence.get(evidenceId)
    if evidence then
        return evidence:unlinkEntity(entityType, entityId)
    end
    return false
end)