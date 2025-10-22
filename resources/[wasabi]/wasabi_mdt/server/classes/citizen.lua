-- ============================================
-- MDT Citizens System
-- Manages citizen profiles and records
-- ============================================

MDTCitizen = {}
Citizens = {}

-- ============================================
-- HELPER FUNCTIONS
-- ============================================

function GenerateCitizenIdentifier(self)
    return "citizen:" .. math.random(100000, 999999) .. os.time()
end

MDTCitizen.generateIdentifier = GenerateCitizenIdentifier

function GenerateFingerprint(self)
    local characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local fingerprint = ""

    for i = 1, 10 do
        local randomIndex = math.random(#characters)
        fingerprint = fingerprint .. characters:sub(randomIndex, randomIndex)
    end

    return fingerprint
end

MDTCitizen.generateFingerprint = GenerateFingerprint

-- ============================================
-- CONSTRUCTOR & CORE METHODS
-- ============================================

function CreateNewCitizen(self, citizenData, shouldCreate)
    if not citizenData then
        citizenData = {}
    end

    if not citizenData.firstname or not citizenData.lastname then
        Error("Missing required fields for citizen creation")
        return false
    end

    citizenData.identifier = citizenData.identifier or self:generateIdentifier()
    citizenData.dob = citizenData.dob or "Unknown"
    citizenData.phone = citizenData.phone or "Unknown"
    citizenData.gender = citizenData.gender or "other"
    citizenData.job = citizenData.job or nil
    citizenData.job_grade = citizenData.job_grade or 0
    citizenData.fingerprint = citizenData.fingerprint or self:generateFingerprint()
    citizenData.metadata = citizenData.metadata or {}
    citizenData.created_at = citizenData.created_at or os.time()
    citizenData.updated_at = citizenData.updated_at or os.time()

    if shouldCreate then
        local success = MySQL.insert.await(
            "INSERT INTO wsb_mdt_citizens (identifier, firstname, lastname, dob, phone, gender, job, job_grade, fingerprint, metadata, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            {
                citizenData.identifier,
                citizenData.firstname,
                citizenData.lastname,
                citizenData.dob,
                citizenData.phone,
                citizenData.gender,
                citizenData.job,
                citizenData.job_grade,
                citizenData.fingerprint,
                json.encode(citizenData.metadata),
                citizenData.created_at,
                citizenData.updated_at
            }
        )

        if not success then
            Error("Failed to create citizen in database")
            return false
        end
    else
        citizenData.metadata = json.decode(citizenData.metadata)
    end

    setmetatable(citizenData, self)
    self.__index = self

    Citizens[citizenData.identifier] = citizenData

    return citizenData
end

MDTCitizen.new = CreateNewCitizen

function UpdateCitizen(self, updates, shouldSave)
    local updateFields = {}
    local parameters = {["@identifier"] = self.identifier}

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
        local updateQuery = "UPDATE wsb_mdt_citizens SET " .. 
            table.concat(updateFields, ", ") .. " WHERE identifier = @identifier"
        return MySQL.update.await(updateQuery, parameters)
    end
end

MDTCitizen.update = UpdateCitizen

function DeleteCitizen(self)
    MDTPhoto.deleteByEntity("citizen", self.identifier)
    MDTNote.deleteByEntity("citizen", self.identifier)
    MDTVehicle.removeOwner(self.identifier)
    MDTWeapon.removeOwner(self.identifier)
    MDTProperty.removeOwner(self.identifier)

    MySQL.query.await("DELETE FROM wsb_mdt_citizens WHERE identifier = ?", {self.identifier})

    Citizens[self.identifier] = nil
end

MDTCitizen.delete = DeleteCitizen

-- ============================================
-- CITIZEN INFO METHODS
-- ============================================

function GetFullName(self)
    return self.firstname .. " " .. self.lastname
end

MDTCitizen.getFullName = GetFullName

function HasActiveWarrant(self)
    return false
end

MDTCitizen.hasActiveWarrant = HasActiveWarrant

-- ============================================
-- AVATAR MANAGEMENT
-- ============================================

function SetCitizenAvatar(self, photoId)
    self.metadata.avatarPhotoId = photoId
    self:update({metadata = self.metadata}, true)
end

MDTCitizen.setAvatar = SetCitizenAvatar

function GetCitizenAvatar(self)
    if not self.metadata.avatarPhotoId then
        return nil
    end

    local photo = MDTPhoto.get(self.metadata.avatarPhotoId)
    return (photo and photo:toTable()) or nil
end

MDTCitizen.getAvatar = GetCitizenAvatar

function RemoveCitizenAvatar(self)
    self.metadata.avatarPhotoId = nil
    self:update({metadata = self.metadata}, true)
end

MDTCitizen.removeAvatar = RemoveCitizenAvatar

-- ============================================
-- ENTITY LINKING
-- ============================================

function GetLinkedEntities(self, entityType)
    return MDTLinkManager.getLinkedEntities("citizen", self.identifier, entityType)
end

MDTCitizen.getLinkedEntities = GetLinkedEntities

function GetLinkedEvidence(self)
    return self:getLinkedEntities("evidence")
end

MDTCitizen.getLinkedEvidence = GetLinkedEvidence

-- ============================================
-- DATA EXPORT
-- ============================================

function ConvertCitizenToTable(self)
    local jobLabel = "Unknown"
    if self.job then
        jobLabel = GetJobLabel(self.job) or "Unknown"
    end

    local jobGradeLabel = "Unknown"
    if self.job and self.job_grade then
        jobGradeLabel = GetJobGradeLabel(self.job, self.job_grade) or "Unknown"
    end

    return {
        identifier = self.identifier,
        name = self:getFullName(),
        firstname = self.firstname,
        lastname = self.lastname,
        dob = self.dob,
        phone = self.phone,
        gender = self.gender,
        fingerprint = self.fingerprint,
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at,
        job = self.job,
        job_label = jobLabel,
        job_grade = self.job_grade,
        job_grade_label = jobGradeLabel,
        hasWarrant = self:hasActiveWarrant(),
        photos = MDTPhoto.getByEntity("citizen", self.identifier),
        avatar = self:getAvatar()
    }
end

MDTCitizen.toTable = ConvertCitizenToTable

-- ============================================
-- RETRIEVAL FUNCTIONS
-- ============================================

function GetCitizenById(citizenId)
    return Citizens[citizenId]
end

MDTCitizen.get = GetCitizenById

function GetAllCitizens()
    local allCitizens = {}

    for _, citizen in pairs(Citizens) do
        table.insert(allCitizens, citizen:toTable())
    end

    return allCitizens
end

MDTCitizen.getAll = GetAllCitizens

function SearchCitizens(searchQuery)
    local results = {}
    local lowerQuery = string.lower(searchQuery)

    for _, citizen in pairs(Citizens) do
        local fullName = string.lower(citizen.firstname .. " " .. citizen.lastname)
        local isMatch = false

        if string.find(string.lower(citizen.firstname), lowerQuery) then
            isMatch = true
        elseif string.find(string.lower(citizen.lastname), lowerQuery) then
            isMatch = true
        elseif string.find(fullName, lowerQuery) then
            isMatch = true
        elseif string.find(string.lower(citizen.identifier), lowerQuery) then
            isMatch = true
        elseif citizen.phone and string.find(string.lower(citizen.phone), lowerQuery) then
            isMatch = true
        elseif citizen.fingerprint and string.find(string.lower(citizen.fingerprint), lowerQuery) then
            isMatch = true
        end

        if isMatch then
            table.insert(results, citizen:toTable())
        end
    end

    return results
end

MDTCitizen.search = SearchCitizens

-- ============================================
-- DATABASE MANAGEMENT
-- ============================================

function LoadCitizensFromDatabase()
    local citizens = MySQL.query.await("SELECT * FROM wsb_mdt_citizens")

    if citizens then
        for _, citizenData in pairs(citizens) do
            MDTCitizen:new(citizenData)
        end
    end
end

MDTCitizen.loadFromDatabase = LoadCitizensFromDatabase

function CreateCitizensTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_citizens'")

    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_citizens` (
                `identifier` VARCHAR(50) NOT NULL PRIMARY KEY,
                `firstname` VARCHAR(50) NOT NULL,
                `lastname` VARCHAR(50) NOT NULL,
                `dob` VARCHAR(20) NOT NULL DEFAULT 'Unknown',
                `phone` VARCHAR(20) NOT NULL DEFAULT 'Unknown',
                `gender` VARCHAR(10) NOT NULL DEFAULT 'other',
                `job` VARCHAR(50) DEFAULT NULL,
                `job_grade` INT(11) DEFAULT 0,
                `fingerprint` VARCHAR(50) NOT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                `updated_at` INT(11) NOT NULL,
                INDEX `idx_name` (`firstname`, `lastname`),
                INDEX `idx_fingerprint` (`fingerprint`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        Success("Table 'wsb_mdt_citizens' has been created.")
        return true
    end

    return false
end

MDTCitizen.createTable = CreateCitizensTable