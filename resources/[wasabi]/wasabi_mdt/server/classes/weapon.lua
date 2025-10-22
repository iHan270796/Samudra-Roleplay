
-- Global tables (preserved for external compatibility)
MDTWeapon = {}
Weapons = {}

-- Create a new weapon object and save to database
function MDTWeapon.new(self, weaponData)
    if not weaponData then
        weaponData = {}
    end
    
    -- Validate required fields
    if not weaponData.weapon_type then
        Error("Missing required fields for weapon creation")
        return false
    end
    
    -- Generate serial number if not provided
    weaponData.serial_number = weaponData.serial_number or self:generateSerialNumber()
    
    -- Set default values for optional fields
    weaponData.owner_id = weaponData.owner_id or nil
    weaponData.metadata = weaponData.metadata or {}
    weaponData.created_at = weaponData.created_at or os.time()
    weaponData.updated_at = weaponData.updated_at or os.time()
    
    -- Insert new weapon into database if no ID exists
    if not weaponData.id then
        local insertId = MySQL.insert.await(
            "INSERT INTO wsb_mdt_weapons (serial_number, weapon_type, owner_id, metadata, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)",
            {
                weaponData.serial_number,
                weaponData.weapon_type,
                weaponData.owner_id,
                json.encode(weaponData.metadata),
                weaponData.created_at,
                weaponData.updated_at
            }
        )
        
        weaponData.id = insertId
        
        if not weaponData.id then
            Error("Failed to create weapon in database")
            return false
        end
    else
        -- Loading from database - decode metadata JSON
        weaponData.metadata = json.decode(weaponData.metadata)
    end
    
    -- Set up metatable for OOP behavior
    setmetatable(weaponData, self)
    self.__index = self
    
    -- Store in global Weapons table
    Weapons[weaponData.id] = weaponData
    
    return weaponData
end

-- Generate a unique serial number in format: XX-XXXXXXXX (2 letters, hyphen, 8 alphanumeric)
function MDTWeapon.generateSerialNumber(self)
    local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local serial = ""
    
    -- Generate 2 random letters (A-Z)
    for i = 1, 2 do
        local randomLetter = math.random(26)
        serial = serial .. string.char(64 + randomLetter)
    end
    
    -- Add hyphen separator
    serial = serial .. "-"
    
    -- Generate 8 random alphanumeric characters
    for i = 1, 8 do
        local randomIndex = math.random(#charset)
        serial = serial .. charset:sub(randomIndex, randomIndex)
    end
    
    return serial
end

-- Update weapon fields in database
function MDTWeapon.update(self, updateFields, executeNow)
    local setStatements = {}
    local parameters = {["@id"] = self.id}
    
    -- Build SET clause and parameter bindings
    for fieldName, fieldValue in pairs(updateFields) do
        -- Handle NULL values (when string "null" is passed)
        if fieldValue == "null" then
            table.insert(setStatements, fieldName .. " = NULL")
            self[fieldName] = nil
        else
            table.insert(setStatements, fieldName .. " = @" .. fieldName)
            
            local paramName = "@" .. fieldName
            local paramValue = fieldValue
            
            -- Encode tables as JSON for storage
            if type(fieldValue) == "table" then
                paramValue = json.encode(fieldValue)
            end
            
            parameters[paramName] = paramValue
            self[fieldName] = fieldValue
        end
    end
    
    -- Always update the updated_at timestamp
    self.updated_at = os.time()
    table.insert(setStatements, "updated_at = @updated_at")
    parameters["@updated_at"] = self.updated_at
    
    -- Execute update if requested
    if executeNow then
        local setSql = table.concat(setStatements, ", ")
        local query = "UPDATE wsb_mdt_weapons SET " .. setSql .. " WHERE id = @id"
        return MySQL.update.await(query, parameters)
    end
end

-- Delete a weapon and all associated entities
function MDTWeapon.delete(self)
    -- Delete associated notes
    MDTNote.deleteByEntity("weapon", self.id)
    
    -- Delete from database
    MySQL.query.await("DELETE FROM wsb_mdt_weapons WHERE id = ?", {self.id})
    
    -- Remove from global Weapons table
    Weapons[self.id] = nil
end

-- Get the owner citizen object
function MDTWeapon.getOwner(self)
    if not self.owner_id then
        return nil
    end
    
    return MDTCitizen.get(self.owner_id)
end

-- Get the human-readable label for the weapon type
function MDTWeapon.getWeaponLabel(self)
    for _, weapon in pairs(Config.Weapons) do
        if weapon.name == self.weapon_type then
            return weapon.label
        end
    end
    
    return self.weapon_type
end

-- Get linked entities of a specific type
function MDTWeapon.getLinkedEntities(self, entityType)
    return MDTLinkManager.getLinkedEntities("weapon", self.id, entityType)
end

-- Get all linked evidence for this weapon
function MDTWeapon.getLinkedEvidence(self)
    return self:getLinkedEntities("evidence")
end

-- Convert weapon object to plain table (for API responses)
function MDTWeapon.toTable(self)
    local owner = self:getOwner()
    
    return {
        id = self.id,
        serial_number = self.serial_number,
        weapon_type = self.weapon_type,
        weapon_label = self:getWeaponLabel(),
        owner_id = self.owner_id,
        owner_name = owner and owner:getFullName() or "Unknown",
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at,
        flagged = self.metadata.flagged or false
    }
end

-- Get a single weapon by ID
function MDTWeapon.get(weaponId)
    return Weapons[weaponId]
end

-- Get a weapon by serial number (case-insensitive)
function MDTWeapon.getBySerial(serialNumber)
    serialNumber = serialNumber:upper()
    
    for _, weapon in pairs(Weapons) do
        if weapon.serial_number == serialNumber then
            return weapon
        end
    end
    
    return nil
end

-- Get all weapons as tables
function MDTWeapon.getAll()
    local allWeapons = {}
    
    for _, weapon in pairs(Weapons) do
        table.insert(allWeapons, weapon:toTable())
    end
    
    return allWeapons
end

-- Search weapons by serial number, weapon type, weapon label, or owner name
function MDTWeapon.search(searchQuery)
    local results = {}
    searchQuery = searchQuery:upper()
    
    for _, weapon in pairs(Weapons) do
        local owner = weapon:getOwner()
        local ownerName = owner and owner:getFullName():upper() or "UNKNOWN"
        local weaponLabel = weapon:getWeaponLabel():upper()
        
        -- Check if search query matches any searchable field
        if weapon.serial_number:find(searchQuery) or
           weaponLabel:find(searchQuery) or
           weapon.weapon_type:upper():find(searchQuery) or
           ownerName:find(searchQuery) then
            table.insert(results, weapon:toTable())
        end
    end
    
    return results
end

-- Load all weapons from database on server startup
function MDTWeapon.loadFromDatabase()
    local weapons = MySQL.query.await("SELECT * FROM wsb_mdt_weapons")
    
    if weapons then
        for _, weaponData in pairs(weapons) do
            MDTWeapon:new(weaponData)
        end
    end
end

-- Remove owner from all weapons owned by a specific citizen
function MDTWeapon.removeOwner(ownerId)
    for _, weapon in pairs(Weapons) do
        if weapon.owner_id == ownerId then
            weapon:update({owner_id = nil}, true)
        end
    end
end

-- Create the database table if it doesn't exist
function MDTWeapon.createTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_weapons'")
    
    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_weapons` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `serial_number` VARCHAR(20) NOT NULL UNIQUE,
                `weapon_type` VARCHAR(50) NOT NULL,
                `owner_id` VARCHAR(50) DEFAULT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                `updated_at` INT(11) NOT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_serial` (`serial_number`),
                INDEX `idx_owner` (`owner_id`),
                INDEX `idx_weapon_type` (`weapon_type`),
                CONSTRAINT `fk_weapon_owner` FOREIGN KEY (`owner_id`)
                    REFERENCES `wsb_mdt_citizens`(`identifier`)
                    ON DELETE SET NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])
        
        Success("Table 'wsb_mdt_weapons' has been created.")
        return true
    end
    
    return false
end