-- ============================================
-- MDT Evidence System
-- Manages evidence with chain of custody tracking
-- ============================================

MDTEvidence = {}
Evidence = {}

-- ============================================
-- HELPER FUNCTIONS
-- ============================================

function GenerateEvidenceNumber(self)
    local count = MySQL.scalar.await("SELECT COUNT(*) FROM wsb_mdt_evidence") or 0
    return string.format("EV-%06d", count + 1)
end

MDTEvidence.generateEvidenceNumber = GenerateEvidenceNumber

-- ============================================
-- CONSTRUCTOR & CORE METHODS
-- ============================================

function CreateNewEvidence(self, evidenceData)
    if not evidenceData then
        evidenceData = {}
    end

    if not evidenceData.evidence_type or not evidenceData.description or not evidenceData.collected_by then
        Error("Missing required fields for evidence creation")
        return false
    end

    evidenceData.evidence_number = evidenceData.evidence_number or self:generateEvidenceNumber()
    evidenceData.notes = evidenceData.notes or ""
    evidenceData.location_found = evidenceData.location_found or "Unknown"
    evidenceData.storage_location = evidenceData.storage_location or "Evidence Room"
    evidenceData.status = evidenceData.status or "checked_in"
    evidenceData.collected_by_name = evidenceData.collected_by_name or "Unknown Officer"
    evidenceData.metadata = evidenceData.metadata or {}
    evidenceData.created_at = evidenceData.created_at or os.time()
    evidenceData.updated_at = evidenceData.updated_at or os.time()

    if not evidenceData.id then
        evidenceData.id = MySQL.insert.await([[
INSERT INTO wsb_mdt_evidence
            (evidence_number, evidence_type, description, notes, location_found,
             storage_location, status, collected_by, collected_by_name, metadata,
             created_at, updated_at)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)]], {
            evidenceData.evidence_number,
            evidenceData.evidence_type,
            evidenceData.description,
            evidenceData.notes,
            evidenceData.location_found,
            evidenceData.storage_location,
            evidenceData.status,
            evidenceData.collected_by,
            evidenceData.collected_by_name,
            json.encode(evidenceData.metadata),
            evidenceData.created_at,
            evidenceData.updated_at
        })

        if not evidenceData.id then
            Error("Failed to create evidence in database")
            return false
        end

        self:addChainOfCustodyEntry(
            evidenceData.id,
            evidenceData.collected_by,
            evidenceData.collected_by_name,
            "collected",
            "Evidence collected"
        )
    else
        evidenceData.metadata = json.decode(evidenceData.metadata)
    end

    setmetatable(evidenceData, self)
    self.__index = self

    Evidence[evidenceData.id] = evidenceData

    return evidenceData
end

MDTEvidence.new = CreateNewEvidence

function UpdateEvidence(self, updates, shouldSave)
    local updateFields = {}
    local parameters = {["@id"] = self.id}

    for fieldName, fieldValue in pairs(updates) do
        if fieldValue == "null" then
            table.insert(updateFields, fieldName .. " = NULL")
            self[fieldName] = nil
        else
            table.insert(updateFields, fieldName .. " = @" .. fieldName)

            local encodedValue = fieldValue
            if type(fieldValue) == "table" then
                encodedValue = json.encode(fieldValue)
            end

            parameters["@" .. fieldName] = encodedValue
            self[fieldName] = fieldValue
        end
    end

    self.updated_at = os.time()
    table.insert(updateFields, "updated_at = @updated_at")
    parameters["@updated_at"] = self.updated_at

    if shouldSave then
        local updateQuery = "UPDATE wsb_mdt_evidence SET " .. 
            table.concat(updateFields, ", ") .. " WHERE id = @id"
        return MySQL.update.await(updateQuery, parameters)
    end
end

MDTEvidence.update = UpdateEvidence

function DeleteEvidence(self)
    MDTPhoto.deleteByEntity("evidence", self.id)

    MySQL.query.await("DELETE FROM wsb_mdt_evidence_custody WHERE evidence_id = ?", {self.id})

    MySQL.query.await(
        "DELETE FROM wsb_mdt_entity_links WHERE (from_type = ? AND from_id = ?) OR (to_type = ? AND to_id = ?)",
        {"evidence", tostring(self.id), "evidence", tostring(self.id)}
    )

    MySQL.query.await("DELETE FROM wsb_mdt_evidence WHERE id = ?", {self.id})

    Evidence[self.id] = nil
end

MDTEvidence.delete = DeleteEvidence

-- ============================================
-- CHAIN OF CUSTODY TRACKING
-- ============================================

function AddChainOfCustodyEntry(self, evidenceId, officerIdentifier, officerName, action, notes)
    return MySQL.insert.await([[
INSERT INTO wsb_mdt_evidence_custody
        (evidence_id, officer_identifier, officer_name, action, notes, timestamp)
        VALUES (?, ?, ?, ?, ?, ?)]], {
        evidenceId,
        officerIdentifier,
        officerName,
        action,
        notes,
        os.time()
    })
end

MDTEvidence.addChainOfCustodyEntry = AddChainOfCustodyEntry

function GetChainOfCustody(self)
    local custody = MySQL.query.await([[
SELECT * FROM wsb_mdt_evidence_custody
        WHERE evidence_id = ?
        ORDER BY timestamp DESC]], {self.id})

    return custody or {}
end

MDTEvidence.getChainOfCustody = GetChainOfCustody

function CheckOutEvidence(self, officerId, officerName, notes, newStorageLocation)
    self:update({
        status = "checked_out",
        storage_location = newStorageLocation or self.storage_location
    }, true)

    self:addChainOfCustodyEntry(self.id, officerId, officerName, "checked_out", notes)
end

MDTEvidence.checkOut = CheckOutEvidence

function CheckInEvidence(self, officerId, officerName, notes, newStorageLocation)
    self:update({
        status = "checked_in",
        storage_location = newStorageLocation or self.storage_location
    }, true)

    self:addChainOfCustodyEntry(self.id, officerId, officerName, "checked_in", notes)
end

MDTEvidence.checkIn = CheckInEvidence

-- ============================================
-- ENTITY LINKING
-- ============================================

function LinkEntityToEvidence(self, entityType, entityId, citizenId, metadata)
    return MDTLinkManager.createLink("evidence", self.id, entityType, entityId, citizenId, metadata)
end

MDTEvidence.linkEntity = LinkEntityToEvidence

function UnlinkEntityFromEvidence(self, entityType, entityId)
    return MDTLinkManager.removeLink("evidence", self.id, entityType, entityId)
end

MDTEvidence.unlinkEntity = UnlinkEntityFromEvidence

function GetLinkedEntities(self, entityType)
    return MDTLinkManager.getLinkedEntities("evidence", self.id, entityType)
end

MDTEvidence.getLinkedEntities = GetLinkedEntities

function IsEvidenceLinkedTo(self, entityType, entityId)
    return MDTLinkManager.isLinked("evidence", self.id, entityType, entityId)
end

MDTEvidence.isLinkedTo = IsEvidenceLinkedTo

-- ============================================
-- AVATAR MANAGEMENT
-- ============================================

function SetEvidenceAvatar(self, photoId)
    self.metadata.avatarPhotoId = photoId
    self:update({metadata = self.metadata}, true)
end

MDTEvidence.setAvatar = SetEvidenceAvatar

function RemoveEvidenceAvatar(self)
    self.metadata.avatarPhotoId = nil
    self:update({metadata = self.metadata}, true)
end

MDTEvidence.removeAvatar = RemoveEvidenceAvatar

function GetEvidenceAvatar(self)
    if not self.metadata.avatarPhotoId then
        return nil
    end

    local photo = MDTPhoto.get(self.metadata.avatarPhotoId)
    return (photo and photo:toTable()) or nil
end

MDTEvidence.getAvatar = GetEvidenceAvatar

-- ============================================
-- DATA EXPORT
-- ============================================

function ConvertEvidenceToTable(self)
    local allLinkedEntities = self:getLinkedEntities()
    local categorizedLinks = {
        citizens = {},
        vehicles = {},
        weapons = {},
        properties = {},
        officers = {}
    }

    for _, linkedEntity in ipairs(allLinkedEntities) do
        if linkedEntity.type == "citizen" then
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
        elseif linkedEntity.type == "weapon" then
            table.insert(categorizedLinks.weapons, {
                weapon = linkedEntity.data,
                metadata = linkedEntity.metadata,
                link_id = linkedEntity.link_id
            })
        elseif linkedEntity.type == "property" then
            table.insert(categorizedLinks.properties, {
                property = linkedEntity.data,
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

    return {
        id = self.id,
        evidence_number = self.evidence_number,
        evidence_type = self.evidence_type,
        description = self.description,
        notes = self.notes,
        location_found = self.location_found,
        storage_location = self.storage_location,
        status = self.status,
        collected_by = self.collected_by,
        collected_by_name = self.collected_by_name,
        collecting_officer = {
            identifier = self.collected_by,
            name = self.collected_by_name
        },
        metadata = self.metadata,
        avatar = self:getAvatar(),
        created_at = self.created_at,
        updated_at = self.updated_at,
        chain_of_custody = self:getChainOfCustody(),
        photos = MDTPhoto.getByEntity("evidence", self.id),
        linked_citizens = categorizedLinks.citizens,
        linked_vehicles = categorizedLinks.vehicles,
        linked_weapons = categorizedLinks.weapons,
        linked_properties = categorizedLinks.properties,
        linked_officers = categorizedLinks.officers
    }
end

MDTEvidence.toTable = ConvertEvidenceToTable

function ConvertEvidenceToTableLight(self)
    return {
        id = self.id,
        evidence_number = self.evidence_number,
        evidence_type = self.evidence_type,
        description = self.description,
        notes = self.notes,
        location_found = self.location_found,
        storage_location = self.storage_location,
        status = self.status,
        collected_by = self.collected_by,
        collected_by_name = self.collected_by_name,
        collecting_officer = {
            identifier = self.collected_by,
            name = self.collected_by_name
        },
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at
    }
end

MDTEvidence.toTableLight = ConvertEvidenceToTableLight

-- ============================================
-- RETRIEVAL FUNCTIONS
-- ============================================

function GetEvidenceById(evidenceId)
    return Evidence[evidenceId]
end

MDTEvidence.get = GetEvidenceById

function GetAllEvidence()
    local allEvidence = {}

    for _, evidence in pairs(Evidence) do
        table.insert(allEvidence, evidence:toTable())
    end

    return allEvidence
end

MDTEvidence.getAll = GetAllEvidence

function SearchEvidence(searchQuery)
    local results = {}
    local lowerQuery = string.lower(searchQuery)

    for _, evidence in pairs(Evidence) do
        local numberMatch = string.find(string.lower(evidence.evidence_number), lowerQuery)
        local descriptionMatch = string.find(string.lower(evidence.description), lowerQuery)
        local notesMatch = string.find(string.lower(evidence.notes), lowerQuery)
        local locationMatch = string.find(string.lower(evidence.location_found), lowerQuery)

        if numberMatch or descriptionMatch or notesMatch or locationMatch then
            table.insert(results, evidence:toTableLight())
        end
    end

    return results
end

MDTEvidence.search = SearchEvidence

-- ============================================
-- DATABASE MANAGEMENT
-- ============================================

function LoadEvidenceFromDatabase()
    local evidence = MySQL.query.await("SELECT * FROM wsb_mdt_evidence")

    if evidence then
        for _, evidenceData in pairs(evidence) do
            MDTEvidence:new(evidenceData)
        end
    end
end

MDTEvidence.loadFromDatabase = LoadEvidenceFromDatabase

function CreateEvidenceTables()
    local evidenceTableCreated = false
    local custodyTableCreated = false

    local evidenceExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_evidence'")

    if #evidenceExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_evidence` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `evidence_number` VARCHAR(20) NOT NULL UNIQUE,
                `evidence_type` VARCHAR(50) NOT NULL,
                `description` VARCHAR(255) NOT NULL,
                `notes` TEXT,
                `location_found` VARCHAR(255) NOT NULL,
                `storage_location` VARCHAR(255) NOT NULL,
                `status` VARCHAR(20) NOT NULL DEFAULT 'checked_in',
                `collected_by` VARCHAR(50) NOT NULL,
                `collected_by_name` VARCHAR(100) NOT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                `updated_at` INT(11) NOT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_evidence_number` (`evidence_number`),
                INDEX `idx_type` (`evidence_type`),
                INDEX `idx_status` (`status`),
                INDEX `idx_collected_by` (`collected_by`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        Success("Table 'wsb_mdt_evidence' has been created.")
        evidenceTableCreated = true
    end

    local custodyExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_evidence_custody'")

    if #custodyExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_evidence_custody` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `evidence_id` int(11) NOT NULL,
                `officer_identifier` VARCHAR(50) NOT NULL,
                `officer_name` VARCHAR(100) NOT NULL,
                `action` VARCHAR(50) NOT NULL,
                `notes` TEXT,
                `timestamp` INT(11) NOT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_evidence_id` (`evidence_id`),
                INDEX `idx_officer` (`officer_identifier`),
                CONSTRAINT `fk_custody_evidence` FOREIGN KEY (`evidence_id`)
                    REFERENCES `wsb_mdt_evidence`(`id`)
                    ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        Success("Table 'wsb_mdt_evidence_custody' has been created.")
        custodyTableCreated = true
    end

    return evidenceTableCreated or custodyTableCreated
end

MDTEvidence.createTable = CreateEvidenceTables