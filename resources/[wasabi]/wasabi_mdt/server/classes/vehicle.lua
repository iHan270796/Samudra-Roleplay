-- Global tables (preserved for external compatibility)
MDTVehicle = {}
Vehicles = {}

-- Create a new vehicle object and save to database
function MDTVehicle.new(self, vehicleData)
    if not vehicleData then
        vehicleData = {}
    end
    
    -- Validate required fields
    if not (vehicleData.plate and vehicleData.model) then
        Error("Missing required fields for vehicle creation")
        return false
    end
    
    -- Normalize plate to uppercase
    vehicleData.plate = vehicleData.plate:upper()
    
    -- Set default values for optional fields
    vehicleData.owner_id = vehicleData.owner_id or nil
    vehicleData.metadata = vehicleData.metadata or {}
    vehicleData.created_at = vehicleData.created_at or os.time()
    vehicleData.updated_at = vehicleData.updated_at or os.time()
    vehicleData.vehicle_type = vehicleData.vehicle_type or "car"
    
    -- Insert new vehicle into database if no ID exists
    if not vehicleData.id then
        local insertId = MySQL.insert.await(
            "INSERT INTO wsb_mdt_vehicles (plate, model, vehicle_type, owner_id, metadata, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)",
            {
                vehicleData.plate,
                vehicleData.model,
                vehicleData.vehicle_type,
                vehicleData.owner_id,
                json.encode(vehicleData.metadata),
                vehicleData.created_at,
                vehicleData.updated_at
            }
        )
        
        vehicleData.id = insertId
        
        if not vehicleData.id then
            Error("Failed to create vehicle in database")
            return false
        end
    else
        -- Loading from database - decode metadata JSON
        vehicleData.metadata = json.decode(vehicleData.metadata)
    end
    
    -- Set up metatable for OOP behavior
    setmetatable(vehicleData, self)
    self.__index = self
    
    -- Store in global Vehicles table
    Vehicles[vehicleData.id] = vehicleData
    
    return vehicleData
end

-- Update vehicle fields in database
function MDTVehicle.update(self, updateFields, executeNow)
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
        local query = "UPDATE wsb_mdt_vehicles SET " .. setSql .. " WHERE id = @id"
        return MySQL.update.await(query, parameters)
    end
end

-- Delete a vehicle and all associated entities
function MDTVehicle.delete(self)
    -- Delete associated photos and notes
    MDTPhoto.deleteByEntity("vehicle", self.id)
    MDTNote.deleteByEntity("vehicle", self.id)
    
    -- Delete from database
    MySQL.query.await("DELETE FROM wsb_mdt_vehicles WHERE id = ?", {self.id})
    
    -- Remove from global Vehicles table
    Vehicles[self.id] = nil
end

-- Get the owner citizen object
function MDTVehicle.getOwner(self)
    if not self.owner_id then
        return nil
    end
    
    return MDTCitizen.get(self.owner_id)
end

-- Set the avatar photo for this vehicle
function MDTVehicle.setAvatar(self, photoId)
    self.metadata.avatarPhotoId = photoId
    self:update({metadata = self.metadata}, true)
end

-- Remove the avatar photo from this vehicle
function MDTVehicle.removeAvatar(self)
    self.metadata.avatarPhotoId = nil
    self:update({metadata = self.metadata}, true)
end

-- Get the avatar photo object
function MDTVehicle.getAvatar(self)
    if not self.metadata.avatarPhotoId then
        return nil
    end
    
    local photo = MDTPhoto.get(self.metadata.avatarPhotoId)
    return photo and photo:toTable() or nil
end

-- Get the human-readable label for the vehicle type
function MDTVehicle.getVehicleTypeLabel(self)
    for _, vehicleType in pairs(Config.VehicleTypes) do
        if vehicleType.type == self.vehicle_type then
            return vehicleType.label
        end
    end
    
    return self.vehicle_type
end

-- Convert vehicle object to plain table (for API responses)
function MDTVehicle.toTable(self)
    local owner = self:getOwner()
    
    return {
        id = self.id,
        plate = self.plate,
        model = self.model,
        owner_id = self.owner_id,
        owner_name = owner and owner:getFullName() or "Unknown",
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at,
        hasWarrants = self:hasActiveWarrants(),
        flagged = self.metadata.flagged or false,
        photos = MDTPhoto.getByEntity("vehicle", self.id),
        avatar = self:getAvatar(),
        vehicle_type = self.vehicle_type,
        vehicle_type_label = self:getVehicleTypeLabel()
    }
end

-- Check if vehicle has active warrants (stub implementation)
function MDTVehicle.hasActiveWarrants(self)
    return false
end

-- Get linked entities of a specific type
function MDTVehicle.getLinkedEntities(self, entityType)
    return MDTLinkManager.getLinkedEntities("vehicle", self.id, entityType)
end

-- Get all linked evidence for this vehicle
function MDTVehicle.getLinkedEvidence(self)
    return self:getLinkedEntities("evidence")
end

-- Get a single vehicle by ID
function MDTVehicle.get(vehicleId)
    return Vehicles[vehicleId]
end

-- Get a vehicle by license plate (case-insensitive)
function MDTVehicle.getByPlate(plate)
    plate = plate:upper()
    
    for _, vehicle in pairs(Vehicles) do
        if vehicle.plate:upper() == plate then
            return vehicle
        end
    end
    
    return nil
end

-- Get all vehicles as tables
function MDTVehicle.getAll()
    local allVehicles = {}
    
    for _, vehicle in pairs(Vehicles) do
        table.insert(allVehicles, vehicle:toTable())
    end
    
    return allVehicles
end

-- Search vehicles by plate, model, or owner name
function MDTVehicle.search(searchQuery)
    local results = {}
    
    -- Default to empty string if no query provided
    if not searchQuery or type(searchQuery) ~= "string" then
        searchQuery = ""
    end
    
    searchQuery = searchQuery:upper()
    
    for _, vehicle in pairs(Vehicles) do
        local owner = vehicle:getOwner()
        local ownerName = owner and owner:getFullName():upper() or "UNKNOWN"
        
        -- Check if search query matches any searchable field
        if vehicle.plate:find(searchQuery) or
           vehicle.model:upper():find(searchQuery) or
           ownerName:find(searchQuery) then
            table.insert(results, vehicle:toTable())
        end
    end
    
    return results
end

-- Load all vehicles from database on server startup
function MDTVehicle.loadFromDatabase()
    local vehicles = MySQL.query.await("SELECT * FROM wsb_mdt_vehicles")
    
    if vehicles then
        for _, vehicleData in pairs(vehicles) do
            MDTVehicle:new(vehicleData)
        end
    end
end

-- Remove owner from all vehicles owned by a specific citizen
function MDTVehicle.removeOwner(ownerId)
    for _, vehicle in pairs(Vehicles) do
        if vehicle.owner_id == ownerId then
            vehicle:update({owner_id = nil}, true)
        end
    end
end

-- Create the database table if it doesn't exist
function MDTVehicle.createTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_vehicles'")
    
    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_vehicles` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `plate` VARCHAR(20) NOT NULL UNIQUE,
                `model` VARCHAR(50) NOT NULL,
                `vehicle_type` VARCHAR(50) DEFAULT 'car',
                `owner_id` VARCHAR(50) DEFAULT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                `updated_at` INT(11) NOT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_plate` (`plate`),
                INDEX `idx_owner` (`owner_id`),
                INDEX `idx_vehicle_type` (`vehicle_type`),
                CONSTRAINT `fk_vehicle_owner` FOREIGN KEY (`owner_id`)
                    REFERENCES `wsb_mdt_citizens`(`identifier`)
                    ON DELETE SET NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])
        
        Success("Table 'wsb_mdt_vehicles' has been created.")
        return true
    end
    
    return false
end