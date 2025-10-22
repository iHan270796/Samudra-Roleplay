-- ============================================
-- MDT BOLO System (Be On the Lookout)
-- Manages vehicle and suspect alerts
-- ============================================

MDTBOLO = {}
BOLOs = {}

-- ============================================
-- CONSTRUCTOR & CORE METHODS
-- ============================================

function CreateNewBOLO(self, boloData)
    if not boloData then
        boloData = {}
    end

    if not boloData.title or not boloData.description then
        Error("Missing required fields for BOLO creation")
        return false
    end

    boloData.status = boloData.status or "active"
    boloData.issued_by = boloData.issued_by or "system"
    boloData.issued_by_name = boloData.issued_by_name or "System"
    boloData.metadata = boloData.metadata or {}
    boloData.created_at = boloData.created_at or os.time()
    boloData.updated_at = boloData.updated_at or os.time()

    if not boloData.id then
        boloData.id = MySQL.insert.await([[
INSERT INTO wsb_mdt_bolos
            (title, description, vehicle_id, plate, status, issued_by, issued_by_name,
             resolved_by, resolved_by_name, metadata, created_at, updated_at, resolved_at)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)]], {
            boloData.title,
            boloData.description,
            boloData.vehicle_id,
            boloData.plate,
            boloData.status,
            boloData.issued_by,
            boloData.issued_by_name,
            boloData.resolved_by,
            boloData.resolved_by_name,
            json.encode(boloData.metadata),
            boloData.created_at,
            boloData.updated_at,
            boloData.resolved_at
        })

        if not boloData.id then
            Error("Failed to create BOLO in database")
            return false
        end
    else
        boloData.metadata = json.decode(boloData.metadata)
    end

    setmetatable(boloData, self)
    self.__index = self

    BOLOs[boloData.id] = boloData

    return boloData
end

MDTBOLO.new = CreateNewBOLO

function DeleteBOLO(self)
    MDTNote.deleteByEntity("bolo", tostring(self.id))

    MySQL.query.await("DELETE FROM wsb_mdt_bolos WHERE id = ?", {self.id})

    BOLOs[self.id] = nil
end

MDTBOLO.delete = DeleteBOLO

function UpdateBOLO(self, updates, shouldSave)
    local updateFields = {}
    local parameters = {["@id"] = self.id}

    for fieldName, fieldValue in pairs(updates) do
        table.insert(updateFields, fieldName .. " = @" .. fieldName)

        local encodedValue = fieldValue
        if type(fieldValue) == "table" then
            encodedValue = json.encode(fieldValue)
        end

        parameters["@" .. fieldName] = encodedValue
        self[fieldName] = fieldValue
    end

    self.updated_at = os.time()
    table.insert(updateFields, "updated_at = @updated_at")
    parameters["@updated_at"] = self.updated_at

    if shouldSave and #updateFields > 0 then
        local updateQuery = "UPDATE wsb_mdt_bolos SET " .. 
            table.concat(updateFields, ", ") .. " WHERE id = @id"
        MySQL.update.await(updateQuery, parameters)
    end
end

MDTBOLO.update = UpdateBOLO

function ResolveBOLO(self, resolvedById, resolvedByName)
    self:update({
        status = "resolved",
        resolved_by = resolvedById,
        resolved_by_name = resolvedByName,
        resolved_at = os.time()
    }, true)
end

MDTBOLO.resolve = ResolveBOLO

function ExpireBOLO(self)
    self:update({
        status = "expired"
    }, true)
end

MDTBOLO.expire = ExpireBOLO

-- ============================================
-- NOTES MANAGEMENT
-- ============================================

function AddNoteToBOLO(self, content, createdById, createdByName)
    return MDTNote:new({
        content = content,
        entity_type = "bolo",
        entity_id = tostring(self.id),
        created_by = createdById,
        created_by_name = createdByName
    })
end

MDTBOLO.addNote = AddNoteToBOLO

function GetBOLONotes(self)
    return MDTNote.getByEntity("bolo", tostring(self.id))
end

MDTBOLO.getNotes = GetBOLONotes

-- ============================================
-- DATA EXPORT
-- ============================================

function ConvertBOLOToTable(self)
    local boloTable = {
        id = self.id,
        title = self.title,
        description = self.description,
        vehicle_id = self.vehicle_id,
        plate = self.plate,
        status = self.status,
        issued_by = self.issued_by,
        issued_by_name = self.issued_by_name,
        resolved_by = self.resolved_by,
        resolved_by_name = self.resolved_by_name,
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at,
        resolved_at = self.resolved_at
    }

    if self.vehicle_id then
        local vehicle = MDTVehicle.get(self.vehicle_id)
        
        if vehicle then
            boloTable.vehicle_model = vehicle.model
            
            local owner = vehicle:getOwner()
            boloTable.vehicle_owner = (owner and owner:getFullName()) or "Unknown"
        end
    end

    return boloTable
end

MDTBOLO.toTable = ConvertBOLOToTable

-- ============================================
-- RETRIEVAL FUNCTIONS
-- ============================================

function GetAllBOLOs()
    local allBOLOs = {}

    for _, bolo in pairs(BOLOs) do
        table.insert(allBOLOs, bolo:toTable())
    end

    table.sort(allBOLOs, function(a, b)
        return a.created_at > b.created_at
    end)

    return allBOLOs
end

MDTBOLO.getAll = GetAllBOLOs

function GetActiveBOLOs()
    local activeBOLOs = {}

    for _, bolo in pairs(BOLOs) do
        if bolo.status == "active" then
            table.insert(activeBOLOs, bolo:toTable())
        end
    end

    table.sort(activeBOLOs, function(a, b)
        return a.created_at > b.created_at
    end)

    return activeBOLOs
end

MDTBOLO.getActive = GetActiveBOLOs

function GetBOLOsByVehicle(vehicleId)
    local vehicleBOLOs = {}

    for _, bolo in pairs(BOLOs) do
        if bolo.vehicle_id == vehicleId then
            table.insert(vehicleBOLOs, bolo:toTable())
        end
    end

    table.sort(vehicleBOLOs, function(a, b)
        return a.created_at > b.created_at
    end)

    return vehicleBOLOs
end

MDTBOLO.getByVehicle = GetBOLOsByVehicle

function GetBOLOsByPlate(plateNumber)
    local plateBOLOs = {}
    plateNumber = plateNumber:upper()

    for _, bolo in pairs(BOLOs) do
        if bolo.plate and bolo.plate:upper() == plateNumber then
            table.insert(plateBOLOs, bolo:toTable())
        end
    end

    table.sort(plateBOLOs, function(a, b)
        return a.created_at > b.created_at
    end)

    return plateBOLOs
end

MDTBOLO.getByPlate = GetBOLOsByPlate

function SearchBOLOs(searchQuery)
    local results = {}
    local lowerQuery = string.lower(searchQuery)

    for _, bolo in pairs(BOLOs) do
        local boloTable = bolo:toTable()

        local titleMatch = string.find(string.lower(bolo.title or ""), lowerQuery)
        local descriptionMatch = string.find(string.lower(bolo.description or ""), lowerQuery)
        local plateMatch = bolo.plate and string.find(string.lower(bolo.plate), lowerQuery)
        local vehicleModelMatch = boloTable.vehicle_model and 
            string.find(string.lower(boloTable.vehicle_model), lowerQuery)

        if titleMatch or descriptionMatch or plateMatch or vehicleModelMatch then
            table.insert(results, boloTable)
        end
    end

    table.sort(results, function(a, b)
        return a.created_at > b.created_at
    end)

    return results
end

MDTBOLO.search = SearchBOLOs

function GetBOLOById(boloId)
    return BOLOs[boloId]
end

MDTBOLO.get = GetBOLOById

-- ============================================
-- DATABASE MANAGEMENT
-- ============================================

function LoadBOLOsFromDatabase()
    local bolos = MySQL.query.await("SELECT * FROM wsb_mdt_bolos")

    if bolos then
        for _, boloData in pairs(bolos) do
            MDTBOLO:new(boloData)
        end
    end
end

MDTBOLO.loadFromDatabase = LoadBOLOsFromDatabase

function CreateBOLOsTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_bolos'")

    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_bolos` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `title` VARCHAR(255) NOT NULL,
                `description` TEXT NOT NULL,
                `vehicle_id` INT(11) DEFAULT NULL,
                `plate` VARCHAR(50) DEFAULT NULL,
                `status` VARCHAR(50) NOT NULL DEFAULT 'active',
                `issued_by` VARCHAR(50) NOT NULL,
                `issued_by_name` VARCHAR(100) NOT NULL,
                `resolved_by` VARCHAR(50) DEFAULT NULL,
                `resolved_by_name` VARCHAR(100) DEFAULT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                `updated_at` INT(11) NOT NULL,
                `resolved_at` INT(11) DEFAULT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_vehicle` (`vehicle_id`),
                INDEX `idx_plate` (`plate`),
                INDEX `idx_status` (`status`),
                INDEX `idx_created` (`created_at`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        Success("Table 'wsb_mdt_bolos' has been created.")
        return true
    end

    return false
end

MDTBOLO.createTable = CreateBOLOsTable