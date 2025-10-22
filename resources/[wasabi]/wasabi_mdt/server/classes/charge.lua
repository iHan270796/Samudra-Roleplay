-- ============================================
-- MDT Charges System
-- Manages criminal charges and penalties
-- ============================================

MDTCharge = {}
Charges = {}

-- ============================================
-- CONSTRUCTOR & CORE METHODS
-- ============================================

function CreateNewCharge(self, chargeData)
    if not chargeData then
        chargeData = {}
    end

    if not chargeData.title or not chargeData.description then
        Error("Missing required fields for charge creation")
        return false
    end

    chargeData.jail_time = chargeData.jail_time or 0
    chargeData.fine = chargeData.fine or 0
    chargeData.category = chargeData.category or "misdemeanor"
    chargeData.created_by = chargeData.created_by or "system"
    chargeData.created_by_name = chargeData.created_by_name or "System"
    chargeData.metadata = chargeData.metadata or {}
    chargeData.created_at = chargeData.created_at or os.time()
    chargeData.updated_at = chargeData.updated_at or os.time()

    if not chargeData.id then
        chargeData.id = MySQL.insert.await([[
INSERT INTO wsb_mdt_charges
            (title, description, jail_time, fine, category, created_by, created_by_name,
             metadata, created_at, updated_at)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)]], {
            chargeData.title,
            chargeData.description,
            chargeData.jail_time,
            chargeData.fine,
            chargeData.category,
            chargeData.created_by,
            chargeData.created_by_name,
            json.encode(chargeData.metadata),
            chargeData.created_at,
            chargeData.updated_at
        })

        if not chargeData.id then
            Error("Failed to create charge in database")
            return false
        end
    else
        chargeData.metadata = json.decode(chargeData.metadata)
    end

    setmetatable(chargeData, self)
    self.__index = self

    Charges[chargeData.id] = chargeData

    return chargeData
end

MDTCharge.new = CreateNewCharge

function DeleteCharge(self)
    MySQL.query.await("DELETE FROM wsb_mdt_charges WHERE id = ?", {self.id})

    Charges[self.id] = nil
end

MDTCharge.delete = DeleteCharge

function UpdateCharge(self, updates, shouldSave)
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
        local updateQuery = "UPDATE wsb_mdt_charges SET " .. 
            table.concat(updateFields, ", ") .. " WHERE id = @id"
        MySQL.update.await(updateQuery, parameters)
    end
end

MDTCharge.update = UpdateCharge

-- ============================================
-- DATA EXPORT
-- ============================================

function ConvertChargeToTable(self)
    return {
        id = self.id,
        title = self.title,
        description = self.description,
        jail_time = self.jail_time,
        fine = self.fine,
        category = self.category,
        created_by = self.created_by,
        created_by_name = self.created_by_name,
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at
    }
end

MDTCharge.toTable = ConvertChargeToTable

-- ============================================
-- RETRIEVAL FUNCTIONS
-- ============================================

function GetAllCharges()
    local allCharges = {}

    for _, charge in pairs(Charges) do
        table.insert(allCharges, charge:toTable())
    end

    table.sort(allCharges, function(a, b)
        return string.lower(a.title) < string.lower(b.title)
    end)

    return allCharges
end

MDTCharge.getAll = GetAllCharges

function SearchCharges(searchQuery)
    local results = {}
    local lowerQuery = string.lower(searchQuery)

    for _, charge in pairs(Charges) do
        local titleMatch = string.find(string.lower(charge.title), lowerQuery)
        local descriptionMatch = string.find(string.lower(charge.description), lowerQuery)
        local categoryMatch = string.find(string.lower(charge.category), lowerQuery)

        if titleMatch or descriptionMatch or categoryMatch then
            table.insert(results, charge:toTable())
        end
    end

    table.sort(results, function(a, b)
        return string.lower(a.title) < string.lower(b.title)
    end)

    return results
end

MDTCharge.search = SearchCharges

function GetChargesByCategory(categoryName)
    local categoryCharges = {}

    for _, charge in pairs(Charges) do
        if charge.category == categoryName then
            table.insert(categoryCharges, charge:toTable())
        end
    end

    table.sort(categoryCharges, function(a, b)
        return string.lower(a.title) < string.lower(b.title)
    end)

    return categoryCharges
end

MDTCharge.getByCategory = GetChargesByCategory

function GetChargeById(chargeId)
    return Charges[chargeId]
end

MDTCharge.get = GetChargeById

-- ============================================
-- DATABASE MANAGEMENT
-- ============================================

function LoadChargesFromDatabase()
    local charges = MySQL.query.await("SELECT * FROM wsb_mdt_charges")

    if charges then
        for _, chargeData in pairs(charges) do
            MDTCharge:new(chargeData)
        end
    end
end

MDTCharge.loadFromDatabase = LoadChargesFromDatabase

function CreateChargesTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_charges'")

    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_charges` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `title` VARCHAR(255) NOT NULL,
                `description` TEXT NOT NULL,
                `jail_time` INT(11) NOT NULL DEFAULT 0,
                `fine` INT(11) NOT NULL DEFAULT 0,
                `category` VARCHAR(50) NOT NULL DEFAULT 'misdemeanor',
                `created_by` VARCHAR(50) NOT NULL,
                `created_by_name` VARCHAR(100) NOT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                `updated_at` INT(11) NOT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_category` (`category`),
                INDEX `idx_title` (`title`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        Success("Table 'wsb_mdt_charges' has been created.")
        return true
    end

    return false
end

MDTCharge.createTable = CreateChargesTable