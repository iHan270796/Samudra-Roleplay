-- Global tables (preserved for external compatibility)
MDTProperty = {}
Properties = {}

-- Create a new property object and save to database
function MDTProperty.new(self, propertyData)
    if not propertyData then
        propertyData = {}
    end
    
    -- Validate required fields
    if not (propertyData.address and propertyData.property_type) then
        Error("Missing required fields for property creation")
        return false
    end
    
    -- Set default values for optional fields
    propertyData.owner_id = propertyData.owner_id or nil
    propertyData.coords = propertyData.coords or {x = 0.0, y = 0.0, z = 0.0}
    propertyData.metadata = propertyData.metadata or {}
    propertyData.created_at = propertyData.created_at or os.time()
    propertyData.updated_at = propertyData.updated_at or os.time()
    
    -- Encode coords for database storage
    local coordsJson = propertyData.coords
    if type(propertyData.coords) == "table" then
        coordsJson = json.encode(propertyData.coords)
    end
    
    -- Insert new property into database if no ID exists
    if not propertyData.id then
        local insertId = MySQL.insert.await(
            "INSERT INTO wsb_mdt_properties (address, property_type, owner_id, coords, metadata, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)",
            {
                propertyData.address,
                propertyData.property_type,
                propertyData.owner_id,
                coordsJson,
                json.encode(propertyData.metadata),
                propertyData.created_at,
                propertyData.updated_at
            }
        )
        
        propertyData.id = insertId
        
        if not propertyData.id then
            Error("Failed to create property in database")
            return false
        end
    else
        -- Loading from database - decode JSON fields
        propertyData.coords = json.decode(propertyData.coords)
        propertyData.metadata = json.decode(propertyData.metadata)
    end
    
    -- Set up metatable for OOP behavior
    setmetatable(propertyData, self)
    self.__index = self
    
    -- Store in global Properties table
    Properties[propertyData.id] = propertyData
    
    return propertyData
end

-- Update property fields in database
function MDTProperty.update(self, updateFields, executeNow)
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
        local query = "UPDATE wsb_mdt_properties SET " .. setSql .. " WHERE id = @id"
        return MySQL.update.await(query, parameters)
    end
end

-- Delete a property and all associated entities
function MDTProperty.delete(self)
    -- Delete associated photos and notes
    MDTPhoto.deleteByEntity("property", self.id)
    MDTNote.deleteByEntity("property", self.id)
    
    -- Delete from database
    MySQL.query.await("DELETE FROM wsb_mdt_properties WHERE id = ?", {self.id})
    
    -- Remove from global Properties table
    Properties[self.id] = nil
end

-- Get the owner citizen object
function MDTProperty.getOwner(self)
    if not self.owner_id then
        return nil
    end
    
    return MDTCitizen.get(self.owner_id)
end

-- Get the human-readable label for the property type
function MDTProperty.getPropertyLabel(self)
    for _, propertyType in pairs(Config.PropertyTypes) do
        if propertyType.type == self.property_type then
            return propertyType.label
        end
    end
    
    return self.property_type
end

-- Set the avatar photo for this property
function MDTProperty.setAvatar(self, photoId)
    self.metadata.avatarPhotoId = photoId
    self:update({metadata = self.metadata}, true)
end

-- Remove the avatar photo from this property
function MDTProperty.removeAvatar(self)
    self.metadata.avatarPhotoId = nil
    self:update({metadata = self.metadata}, true)
end

-- Get linked entities of a specific type
function MDTProperty.getLinkedEntities(self, entityType)
    return MDTLinkManager.getLinkedEntities("property", self.id, entityType)
end

-- Get all linked evidence for this property
function MDTProperty.getLinkedEvidence(self)
    return self:getLinkedEntities("evidence")
end

-- Get the avatar photo object
function MDTProperty.getAvatar(self)
    if not self.metadata.avatarPhotoId then
        return nil
    end
    
    local photo = MDTPhoto.get(self.metadata.avatarPhotoId)
    return photo and photo:toTable() or nil
end

-- Convert property object to plain table (for API responses)
function MDTProperty.toTable(self)
    local owner = self:getOwner()
    
    return {
        id = self.id,
        address = self.address,
        property_type = self.property_type,
        property_label = self:getPropertyLabel(),
        owner_id = self.owner_id,
        owner_name = owner and owner:getFullName() or "Unknown",
        coords = self.coords,
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at,
        flagged = self.metadata.flagged or false,
        photos = MDTPhoto.getByEntity("property", self.id),
        avatar = self:getAvatar()
    }
end

-- Get a single property by ID
function MDTProperty.get(propertyId)
    return Properties[propertyId]
end

-- Get all properties as tables
function MDTProperty.getAll()
    local allProperties = {}
    
    for _, property in pairs(Properties) do
        table.insert(allProperties, property:toTable())
    end
    
    return allProperties
end

-- Search properties by address, type, or owner name
function MDTProperty.search(searchQuery)
    local results = {}
    searchQuery = searchQuery:lower()
    
    for _, property in pairs(Properties) do
        local owner = property:getOwner()
        local ownerName = owner and owner:getFullName():lower() or "unknown"
        local propertyLabel = property:getPropertyLabel():lower()
        local address = property.address:lower()
        
        -- Check if search query matches any searchable field
        if address:find(searchQuery) or
           propertyLabel:find(searchQuery) or
           property.property_type:lower():find(searchQuery) or
           ownerName:find(searchQuery) then
            table.insert(results, property:toTable())
        end
    end
    
    return results
end

-- Load all properties from database on server startup
function MDTProperty.loadFromDatabase()
    local properties = MySQL.query.await("SELECT * FROM wsb_mdt_properties")
    
    if properties then
        for _, propertyData in pairs(properties) do
            MDTProperty:new(propertyData)
        end
    end
end

-- Remove owner from all properties owned by a specific citizen
function MDTProperty.removeOwner(ownerId)
    for _, property in pairs(Properties) do
        if property.owner_id == ownerId then
            property:update({owner_id = nil}, true)
        end
    end
end

-- Create the database table if it doesn't exist
function MDTProperty.createTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_properties'")
    
    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_properties` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `address` VARCHAR(255) NOT NULL,
                `property_type` VARCHAR(50) NOT NULL,
                `owner_id` VARCHAR(50) DEFAULT NULL,
                `coords` JSON DEFAULT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                `updated_at` INT(11) NOT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_address` (`address`),
                INDEX `idx_owner` (`owner_id`),
                INDEX `idx_type` (`property_type`),
                CONSTRAINT `fk_property_owner` FOREIGN KEY (`owner_id`)
                    REFERENCES `wsb_mdt_citizens`(`identifier`)
                    ON DELETE SET NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])
        
        Success("Table 'wsb_mdt_properties' has been created.")
        return true
    end
    
    return false
end