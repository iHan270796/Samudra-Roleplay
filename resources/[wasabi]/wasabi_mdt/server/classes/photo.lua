-- Global tables (preserved for external compatibility)
MDTPhoto = {}
Photos = {}

-- Create a new photo object and save to database
function MDTPhoto.new(self, photoData)
    if not photoData then
        photoData = {}
    end
    
    -- Validate required fields
    if not (photoData.url and photoData.stored_id and photoData.entity_type and 
            photoData.entity_id and photoData.uploaded_by) then
        Error("Missing required fields for photo creation")
        return false
    end
    
    -- Set default values for optional fields
    photoData.uploaded_by_name = photoData.uploaded_by_name or "Unknown"
    photoData.description = photoData.description or ""
    photoData.metadata = photoData.metadata or {}
    photoData.created_at = photoData.created_at or os.time()
    
    -- Insert new photo into database if no ID exists
    if not photoData.id then
        local insertId = MySQL.insert.await([[
            INSERT INTO wsb_mdt_photos
            (url, stored_id, entity_type, entity_id, uploaded_by, uploaded_by_name,
             description, metadata, created_at)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ]], {
            photoData.url,
            photoData.stored_id,
            photoData.entity_type,
            photoData.entity_id,
            photoData.uploaded_by,
            photoData.uploaded_by_name,
            photoData.description,
            json.encode(photoData.metadata),
            photoData.created_at
        })
        
        photoData.id = insertId
        
        if not photoData.id then
            Error("Failed to create photo in database")
            return false
        end
    else
        -- Loading from database - decode metadata JSON
        photoData.metadata = json.decode(photoData.metadata)
    end
    
    -- Set up metatable for OOP behavior
    setmetatable(photoData, self)
    self.__index = self
    
    -- Store in global Photos table
    Photos[photoData.id] = photoData
    
    return photoData
end

-- Delete a photo from cloud storage and database
function MDTPhoto.delete(self)
    -- Delete from cloud storage asynchronously
    CreateThread(function()
        local success = DeleteImageFromCloud(self.stored_id)
        if not success then
            Error("Failed to delete image from cloud storage: " .. self.stored_id)
        end
    end)
    
    -- Delete from database
    MySQL.query.await("DELETE FROM wsb_mdt_photos WHERE id = ?", {self.id})
    
    -- Remove from global Photos table
    Photos[self.id] = nil
end

-- Update photo fields in database
function MDTPhoto.update(self, updateFields)
    local setStatements = {}
    local parameters = {["@id"] = self.id}
    
    -- Build SET clause and parameter bindings
    for fieldName, fieldValue in pairs(updateFields) do
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
    
    -- Execute update if there are fields to update
    if #setStatements > 0 then
        local setSql = table.concat(setStatements, ", ")
        local query = "UPDATE wsb_mdt_photos SET " .. setSql .. " WHERE id = @id"
        MySQL.update.await(query, parameters)
    end
end

-- Convert photo object to plain table (for API responses)
function MDTPhoto.toTable(self)
    return {
        id = self.id,
        url = self.url,
        entity_type = self.entity_type,
        entity_id = self.entity_id,
        uploaded_by = self.uploaded_by,
        uploaded_by_name = self.uploaded_by_name,
        description = self.description,
        metadata = self.metadata,
        created_at = self.created_at
    }
end

-- Get all photos for a specific entity (e.g., "player:12345" or "incident:42")
function MDTPhoto.getByEntity(entityType, entityId)
    local entityPhotos = {}
    
    for photoId, photo in pairs(Photos) do
        if photo.entity_type == entityType and 
           tostring(photo.entity_id) == tostring(entityId) then
            table.insert(entityPhotos, photo:toTable())
        end
    end
    
    return entityPhotos
end

-- Get a single photo by ID
function MDTPhoto.get(photoId)
    return Photos[photoId]
end

-- Load all photos from database on server startup
function MDTPhoto.loadFromDatabase()
    local photos = MySQL.query.await("SELECT * FROM wsb_mdt_photos")
    
    if photos then
        for _, photoData in pairs(photos) do
            MDTPhoto:new(photoData)
        end
    end
end

-- Delete all photos associated with a specific entity
function MDTPhoto.deleteByEntity(entityType, entityId)
    local photosToDelete = {}
    
    -- Collect photos that match the entity
    for photoId, photo in pairs(Photos) do
        if photo.entity_type == entityType and 
           tostring(photo.entity_id) == tostring(entityId) then
            table.insert(photosToDelete, photo)
        end
    end
    
    -- Delete each photo
    for _, photo in ipairs(photosToDelete) do
        photo:delete()
    end
    
    return #photosToDelete
end

-- Create the database table if it doesn't exist
function MDTPhoto.createTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_photos'")
    
    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_photos` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `url` VARCHAR(500) NOT NULL,
                `stored_id` VARCHAR(100) NOT NULL,
                `entity_type` VARCHAR(50) NOT NULL,
                `entity_id` VARCHAR(50) NOT NULL,
                `uploaded_by` VARCHAR(50) NOT NULL,
                `uploaded_by_name` VARCHAR(100) NOT NULL,
                `description` VARCHAR(255) DEFAULT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_entity` (`entity_type`, `entity_id`),
                INDEX `idx_uploaded_by` (`uploaded_by`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])
        
        Success("Table 'wsb_mdt_photos' has been created.")
        return true
    end
    
    return false
end