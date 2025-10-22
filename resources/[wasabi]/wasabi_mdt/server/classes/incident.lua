-- ============================================
-- MDT Incidents System
-- Manages police incident reports with entity linking
-- ============================================

MDTIncident = {}
Incidents = {}

-- ============================================
-- CONSTRUCTOR & CORE METHODS
-- ============================================

function CreateNewIncident(self, incidentData)
    if not incidentData then
        incidentData = {}
    end

    if not incidentData.title or not incidentData.created_by then
        Error("Missing required fields for incident creation")
        return false
    end

    incidentData.incident_number = incidentData.incident_number or self:generateIncidentNumber()
    incidentData.description = incidentData.description or ""
    incidentData.location = incidentData.location or "Unknown"
    incidentData.status = incidentData.status or "open"
    incidentData.created_by_name = incidentData.created_by_name or "Unknown Officer"
    incidentData.total_fine = incidentData.total_fine or 0
    incidentData.total_jail_time = incidentData.total_jail_time or 0
    incidentData.fine_reduction = incidentData.fine_reduction or 0
    incidentData.jail_reduction = incidentData.jail_reduction or 0
    incidentData.max_fine = incidentData.max_fine or 0
    incidentData.manual_fine = incidentData.manual_fine or false
    incidentData.manual_jail = incidentData.manual_jail or false
    incidentData.max_jail = incidentData.max_jail or 0
    incidentData.metadata = incidentData.metadata or {}
    incidentData.created_at = incidentData.created_at or os.time()
    incidentData.updated_at = incidentData.updated_at or os.time()

    if not incidentData.id then
        local fieldNames = {
            "incident_number", "title", "description", "location", "status",
            "created_by", "created_by_name", "total_fine", "total_jail_time",
            "fine_reduction", "jail_reduction", "manual_fine", "manual_jail",
            "max_fine", "max_jail", "metadata", "created_at", "updated_at"
        }

        local fieldValues = {
            incidentData.incident_number,
            incidentData.title,
            incidentData.description,
            incidentData.location,
            incidentData.status,
            incidentData.created_by,
            incidentData.created_by_name,
            incidentData.total_fine,
            incidentData.total_jail_time,
            incidentData.fine_reduction,
            incidentData.jail_reduction,
            incidentData.manual_fine and 1 or 0,
            incidentData.manual_jail and 1 or 0,
            incidentData.max_fine,
            incidentData.max_jail,
            json.encode(incidentData.metadata),
            incidentData.created_at,
            incidentData.updated_at
        }

        if incidentData.primary_citizen ~= nil and incidentData.primary_citizen ~= "null" then
            table.insert(fieldNames, "primary_citizen")
            table.insert(fieldValues, incidentData.primary_citizen)
        end

        if incidentData.closed_by ~= nil and incidentData.closed_by ~= "null" then
            table.insert(fieldNames, "closed_by")
            table.insert(fieldValues, incidentData.closed_by)
        end

        if incidentData.closed_by_name ~= nil and incidentData.closed_by_name ~= "null" then
            table.insert(fieldNames, "closed_by_name")
            table.insert(fieldValues, incidentData.closed_by_name)
        end

        if incidentData.closed_at ~= nil and incidentData.closed_at ~= "null" then
            table.insert(fieldNames, "closed_at")
            table.insert(fieldValues, incidentData.closed_at)
        end

        local placeholders = {}
        for i = 1, #fieldNames do
            table.insert(placeholders, "?")
        end

        local insertQuery = string.format(
            "INSERT INTO wsb_mdt_incidents (%s) VALUES (%s)",
            table.concat(fieldNames, ", "),
            table.concat(placeholders, ", ")
        )

        incidentData.id = MySQL.insert.await(insertQuery, fieldValues)

        if not incidentData.id then
            Error("Failed to create incident in database")
            return false
        end
    else
        incidentData.metadata = json.decode(incidentData.metadata)
        incidentData.manual_fine = incidentData.manual_fine == 1
        incidentData.manual_jail = incidentData.manual_jail == 1
    end

    setmetatable(incidentData, self)
    self.__index = self

    Incidents[incidentData.id] = incidentData

    return incidentData
end

MDTIncident.new = CreateNewIncident

function GenerateIncidentNumber(self)
    local count = MySQL.scalar.await("SELECT COUNT(*) FROM wsb_mdt_incidents") or 0
    return string.format("INC-%06d", count + 1)
end

MDTIncident.generateIncidentNumber = GenerateIncidentNumber

function UpdateIncident(self, updates, shouldSave)
    local updateFields = {}
    local parameters = {["@id"] = self.id}

    for fieldName, fieldValue in pairs(updates) do
        if fieldValue == "null" then
            table.insert(updateFields, fieldName .. " = NULL")
            self[fieldName] = nil
        else
            table.insert(updateFields, fieldName .. " = @" .. fieldName)

            if fieldName == "manual_fine" or fieldName == "manual_jail" then
                parameters["@" .. fieldName] = fieldValue and 1 or 0
            else
                local encodedValue = fieldValue
                if type(fieldValue) == "table" then
                    encodedValue = json.encode(fieldValue)
                end
                parameters["@" .. fieldName] = encodedValue
            end

            self[fieldName] = fieldValue
        end
    end

    self.updated_at = os.time()
    table.insert(updateFields, "updated_at = @updated_at")
    parameters["@updated_at"] = self.updated_at

    if shouldSave then
        local updateQuery = "UPDATE wsb_mdt_incidents SET " .. 
            table.concat(updateFields, ", ") .. " WHERE id = @id"
        return MySQL.update.await(updateQuery, parameters)
    end
end

MDTIncident.update = UpdateIncident

function DeleteIncident(self)
    MDTNote.deleteByEntity("incident", tostring(self.id))

    MySQL.query.await(
        "DELETE FROM wsb_mdt_entity_links WHERE (from_type = ? AND from_id = ?) OR (to_type = ? AND to_id = ?)",
        {"incident", tostring(self.id), "incident", tostring(self.id)}
    )

    MySQL.query.await("DELETE FROM wsb_mdt_incidents WHERE id = ?", {self.id})

    Incidents[self.id] = nil
end

MDTIncident.delete = DeleteIncident

function CloseIncident(self, closedById, closedByName)
    self:update({
        status = "closed",
        closed_by = closedById,
        closed_by_name = closedByName,
        closed_at = os.time()
    }, true)
end

MDTIncident.close = CloseIncident

function ReopenIncident(self)
    self:update({
        status = "open",
        closed_by = "null",
        closed_by_name = "null",
        closed_at = "null"
    }, true)
end

MDTIncident.reopen = ReopenIncident

-- ============================================
-- CHARGE MANAGEMENT
-- ============================================

function LinkChargeToIncident(self, chargeId, citizenId, metadata)
    metadata = metadata or {}
    metadata.link_type = "charge"

    return MDTLinkManager.createLink("incident", self.id, "charge", chargeId, citizenId, metadata)
end

MDTIncident.linkCharge = LinkChargeToIncident

function UnlinkChargeFromIncident(self, chargeId)
    return MDTLinkManager.removeLink("incident", self.id, "charge", chargeId)
end

MDTIncident.unlinkCharge = UnlinkChargeFromIncident

function GetLinkedCharges(self)
    local linkedCharges = MDTLinkManager.getLinkedEntities("incident", self.id, "charge")
    local chargesWithMetadata = {}

    for _, linkedEntity in ipairs(linkedCharges) do
        local charge = MDTCharge.get(tonumber(linkedEntity.id))

        if charge then
            local chargeTable = charge:toTable()

            if linkedEntity.metadata then
                if linkedEntity.metadata.adjusted_fine then
                    chargeTable.adjusted_fine = linkedEntity.metadata.adjusted_fine
                end
                if linkedEntity.metadata.adjusted_jail then
                    chargeTable.adjusted_jail = linkedEntity.metadata.adjusted_jail
                end
                if linkedEntity.metadata.fine_reduction then
                    chargeTable.fine_reduction = linkedEntity.metadata.fine_reduction
                end
                if linkedEntity.metadata.jail_reduction then
                    chargeTable.jail_reduction = linkedEntity.metadata.jail_reduction
                end
            end

            chargeTable.link_id = linkedEntity.link_id
            chargeTable.link_metadata = linkedEntity.metadata

            table.insert(chargesWithMetadata, chargeTable)
        end
    end

    return chargesWithMetadata
end

MDTIncident.getLinkedCharges = GetLinkedCharges

function CalculateIncidentTotals(self)
    local charges = self:getLinkedCharges()
    local totalFine = 0
    local totalJailTime = 0

    for _, charge in ipairs(charges) do
        totalFine = totalFine + (charge.fine or 0)
        totalJailTime = totalJailTime + (charge.jail_time or 0)
    end

    self.total_fine = math.floor(totalFine)
    self.total_jail_time = math.floor(totalJailTime)

    self:update({
        total_fine = self.total_fine,
        total_jail_time = self.total_jail_time
    }, true)

    return self.total_fine, self.total_jail_time
end

MDTIncident.calculateTotals = CalculateIncidentTotals

-- ============================================
-- ENTITY LINKING (Generic)
-- ============================================

function LinkEntityToIncident(self, entityType, entityId, citizenId, metadata)
    return MDTLinkManager.createLink("incident", self.id, entityType, entityId, citizenId, metadata)
end

MDTIncident.linkEntity = LinkEntityToIncident

function UnlinkEntityFromIncident(self, entityType, entityId)
    return MDTLinkManager.removeLink("incident", self.id, entityType, entityId)
end

MDTIncident.unlinkEntity = UnlinkEntityFromIncident

function GetLinkedEntities(self, entityType)
    return MDTLinkManager.getLinkedEntities("incident", self.id, entityType)
end

MDTIncident.getLinkedEntities = GetLinkedEntities

function IsIncidentLinkedTo(self, entityType, entityId)
    return MDTLinkManager.isLinked("incident", self.id, entityType, entityId)
end

MDTIncident.isLinkedTo = IsIncidentLinkedTo

-- ============================================
-- NOTES MANAGEMENT
-- ============================================

function AddNoteToIncident(self, content, createdById, createdByName)
    return MDTNote:new({
        content = content,
        entity_type = "incident",
        entity_id = tostring(self.id),
        created_by = createdById,
        created_by_name = createdByName
    })
end

MDTIncident.addNote = AddNoteToIncident

function GetIncidentNotes(self)
    return MDTNote.getByEntity("incident", tostring(self.id))
end

MDTIncident.getNotes = GetIncidentNotes

-- ============================================
-- DATA EXPORT METHODS
-- ============================================

function ConvertIncidentToTable(self)
    local allLinkedEntities = self:getLinkedEntities()
    local categorizedLinks = {
        charges = {},
        citizens = {},
        vehicles = {},
        evidence = {},
        officers = {}
    }

    for _, linkedEntity in ipairs(allLinkedEntities) do
        if linkedEntity.type == "charge" then
            local charge = MDTCharge.get(tonumber(linkedEntity.id))
            if charge then
                local chargeTable = charge:toTable()
                chargeTable.link_metadata = linkedEntity.metadata
                chargeTable.link_id = linkedEntity.link_id
                table.insert(categorizedLinks.charges, chargeTable)
            end
        elseif linkedEntity.type == "citizen" then
            table.insert(categorizedLinks.citizens, {
                citizen = linkedEntity.data,
                metadata = linkedEntity.metadata,
                link_id = linkedEntity.link_id
            })
        elseif linkedEntity.type == "vehicle" then
            table.insert(categorizedLinks.vehicles, {
                vehicle = linkedEntity.data,
                metadata = linkedEntity.metadata,
                link_id = linkedEntity.link_id
            })
        elseif linkedEntity.type == "evidence" then
            table.insert(categorizedLinks.evidence, {
                evidence = linkedEntity.data,
                metadata = linkedEntity.metadata,
                link_id = linkedEntity.link_id
            })
        elseif linkedEntity.type == "officer" then
            table.insert(categorizedLinks.officers, {
                officer = linkedEntity.data,
                metadata = linkedEntity.metadata,
                link_id = linkedEntity.link_id
            })
        end
    end

    local primaryCitizenData = nil
    if self.primary_citizen then
        local primaryCitizen = MDTCitizen.get(self.primary_citizen)
        if primaryCitizen then
            primaryCitizenData = primaryCitizen:toTable()
        end
    end

    return {
        id = self.id,
        incident_number = self.incident_number,
        title = self.title,
        description = self.description,
        location = self.location,
        status = self.status,
        primary_citizen = self.primary_citizen,
        primary_citizen_data = primaryCitizenData,
        created_by = self.created_by,
        created_by_name = self.created_by_name,
        closed_by = self.closed_by,
        closed_by_name = self.closed_by_name,
        total_fine = self.total_fine,
        total_jail_time = self.total_jail_time,
        fine_reduction = self.fine_reduction,
        jail_reduction = self.jail_reduction,
        manual_fine = self.manual_fine,
        manual_jail = self.manual_jail,
        max_fine = self.max_fine,
        max_jail = self.max_jail,
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at,
        closed_at = self.closed_at,
        notes = self:getNotes(),
        linked_charges = categorizedLinks.charges,
        linked_citizens = categorizedLinks.citizens,
        linked_vehicles = categorizedLinks.vehicles,
        linked_evidence = categorizedLinks.evidence,
        linked_officers = categorizedLinks.officers
    }
end

MDTIncident.toTable = ConvertIncidentToTable

function ConvertIncidentToTableLight(self)
    local primaryCitizenData = nil
    if self.primary_citizen then
        local primaryCitizen = MDTCitizen.get(self.primary_citizen)
        if primaryCitizen then
            primaryCitizenData = primaryCitizen:toTable()
        end
    end

    return {
        id = self.id,
        incident_number = self.incident_number,
        title = self.title,
        description = self.description,
        location = self.location,
        status = self.status,
        primary_citizen = self.primary_citizen,
        primary_citizen_data = primaryCitizenData,
        created_by = self.created_by,
        created_by_name = self.created_by_name,
        closed_by = self.closed_by,
        closed_by_name = self.closed_by_name,
        total_fine = self.total_fine,
        total_jail_time = self.total_jail_time,
        fine_reduction = self.fine_reduction,
        jail_reduction = self.jail_reduction,
        manual_fine = self.manual_fine,
        manual_jail = self.manual_jail,
        max_fine = self.max_fine,
        max_jail = self.max_jail,
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at,
        closed_at = self.closed_at
    }
end

MDTIncident.toTableLight = ConvertIncidentToTableLight

-- ============================================
-- RETRIEVAL FUNCTIONS
-- ============================================

function GetIncidentById(incidentId)
    return Incidents[incidentId]
end

MDTIncident.get = GetIncidentById

function GetAllIncidents()
    local allIncidents = {}

    for _, incident in pairs(Incidents) do
        table.insert(allIncidents, incident:toTable())
    end

    table.sort(allIncidents, function(a, b)
        return a.created_at > b.created_at
    end)

    return allIncidents
end

MDTIncident.getAll = GetAllIncidents

function GetOpenIncidents()
    local openIncidents = {}

    for _, incident in pairs(Incidents) do
        if incident.status == "open" or incident.status == "pending" then
            table.insert(openIncidents, incident:toTable())
        end
    end

    table.sort(openIncidents, function(a, b)
        return a.created_at > b.created_at
    end)

    return openIncidents
end

MDTIncident.getOpen = GetOpenIncidents

function GetRecentIncidents(limit)
    limit = limit or 10

    local allIncidents = {}

    for _, incident in pairs(Incidents) do
        table.insert(allIncidents, incident:toTable())
    end

    table.sort(allIncidents, function(a, b)
        return a.created_at > b.created_at
    end)

    local recentIncidents = {}
    for i = 1, math.min(limit, #allIncidents) do
        recentIncidents[i] = allIncidents[i]
    end

    return recentIncidents
end

MDTIncident.getRecent = GetRecentIncidents

function GetIncidentsByCitizen(citizenId)
    local citizenIncidents = {}

    for _, incident in pairs(Incidents) do
        if incident.primary_citizen == citizenId or incident:isLinkedTo("citizen", citizenId) then
            table.insert(citizenIncidents, incident:toTable())
        end
    end

    table.sort(citizenIncidents, function(a, b)
        return a.created_at > b.created_at
    end)

    return citizenIncidents
end

MDTIncident.getByCitizen = GetIncidentsByCitizen

function SearchIncidents(searchQuery)
    local results = {}
    local lowerQuery = string.lower(searchQuery)

    for _, incident in pairs(Incidents) do
        local incidentNumberMatch = string.find(string.lower(incident.incident_number), lowerQuery)
        local titleMatch = string.find(string.lower(incident.title), lowerQuery)
        local descriptionMatch = string.find(string.lower(incident.description), lowerQuery)
        local locationMatch = string.find(string.lower(incident.location), lowerQuery)

        if incidentNumberMatch or titleMatch or descriptionMatch or locationMatch then
            table.insert(results, incident:toTableLight())
        end
    end

    return results
end

MDTIncident.search = SearchIncidents

-- ============================================
-- DATABASE MANAGEMENT
-- ============================================

function LoadIncidentsFromDatabase()
    local incidents = MySQL.query.await("SELECT * FROM wsb_mdt_incidents")

    if incidents then
        for _, incidentData in pairs(incidents) do
            MDTIncident:new(incidentData)
        end
    end
end

MDTIncident.loadFromDatabase = LoadIncidentsFromDatabase

function CreateIncidentsTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_incidents'")

    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_incidents` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `incident_number` VARCHAR(20) NOT NULL UNIQUE,
                `title` VARCHAR(255) NOT NULL,
                `description` TEXT,
                `location` VARCHAR(255),
                `status` VARCHAR(20) NOT NULL DEFAULT 'open',
                `primary_citizen` VARCHAR(50) DEFAULT NULL,
                `created_by` VARCHAR(50) NOT NULL,
                `created_by_name` VARCHAR(100) NOT NULL,
                `closed_by` VARCHAR(50) DEFAULT NULL,
                `closed_by_name` VARCHAR(100) DEFAULT NULL,
                `total_fine` INT(11) NOT NULL DEFAULT 0,
                `total_jail_time` INT(11) NOT NULL DEFAULT 0,
                `fine_reduction` INT(11) NOT NULL DEFAULT 0,
                `jail_reduction` INT(11) NOT NULL DEFAULT 0,
                `manual_fine` TINYINT(1) NOT NULL DEFAULT 0,
                `manual_jail` TINYINT(1) NOT NULL DEFAULT 0,
                `max_fine` INT(11) DEFAULT NULL,
                `max_jail` INT(11) DEFAULT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                `updated_at` INT(11) NOT NULL,
                `closed_at` INT(11) DEFAULT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_incident_number` (`incident_number`),
                INDEX `idx_status` (`status`),
                INDEX `idx_primary_citizen` (`primary_citizen`),
                INDEX `idx_created_by` (`created_by`),
                INDEX `idx_created_at` (`created_at`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        Success("Table 'wsb_mdt_incidents' has been created.")
        return true
    end

    return false
end

MDTIncident.createTable = CreateIncidentsTable