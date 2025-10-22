-- Global tables (preserved for external compatibility)
MDTWarrant = {}
Warrants = {}

-- Create a new warrant object and save to database
function MDTWarrant.new(self, warrantData)
    if not warrantData then
        warrantData = {}
    end
    
    -- Validate required fields
    if not (warrantData.title and warrantData.description and warrantData.citizen_id) then
        Error("Missing required fields for warrant creation")
        return false
    end
    
    -- Set default values for optional fields
    warrantData.status = warrantData.status or "active"
    warrantData.issued_by = warrantData.issued_by or "system"
    warrantData.issued_by_name = warrantData.issued_by_name or "System"
    warrantData.metadata = warrantData.metadata or {}
    warrantData.created_at = warrantData.created_at or os.time()
    warrantData.updated_at = warrantData.updated_at or os.time()
    
    -- Insert new warrant into database if no ID exists
    if not warrantData.id then
        local fieldNames = {}
        local placeholders = {}
        local values = {}
        
        -- Helper function to add a field to the insert statement
        function addField(fieldName, fieldValue, encodeAsJson)
            table.insert(fieldNames, fieldName)
            table.insert(placeholders, "?")
            
            if encodeAsJson then
                table.insert(values, json.encode(fieldValue))
            else
                table.insert(values, fieldValue)
            end
        end
        
        -- Add required fields
        addField("title", warrantData.title)
        addField("description", warrantData.description)
        addField("citizen_id", warrantData.citizen_id)
        
        -- Add optional property_id if present
        if warrantData.property_id ~= nil then
            addField("property_id", warrantData.property_id)
        end
        
        -- Add standard fields
        addField("status", warrantData.status)
        addField("issued_by", warrantData.issued_by)
        addField("issued_by_name", warrantData.issued_by_name)
        
        -- Add optional served_by fields if present
        if warrantData.served_by ~= nil then
            addField("served_by", warrantData.served_by)
        end
        
        if warrantData.served_by_name ~= nil then
            addField("served_by_name", warrantData.served_by_name)
        end
        
        -- Add metadata as JSON
        addField("metadata", warrantData.metadata, true)
        
        -- Add timestamps
        addField("created_at", warrantData.created_at)
        addField("updated_at", warrantData.updated_at)
        
        -- Add optional served_at if present
        if warrantData.served_at ~= nil then
            addField("served_at", warrantData.served_at)
        end
        
        -- Build dynamic INSERT query
        local query = string.format(
            "INSERT INTO wsb_mdt_warrants (%s) VALUES (%s)",
            table.concat(fieldNames, ", "),
            table.concat(placeholders, ", ")
        )
        
        local insertId = MySQL.insert.await(query, values)
        warrantData.id = insertId
        
        if not warrantData.id then
            Error("Failed to create warrant in database")
            return false
        end
    else
        -- Loading from database - decode metadata JSON
        warrantData.metadata = json.decode(warrantData.metadata)
    end
    
    -- Set up metatable for OOP behavior
    setmetatable(warrantData, self)
    self.__index = self
    
    -- Store in global Warrants table
    Warrants[warrantData.id] = warrantData
    
    return warrantData
end

-- Delete a warrant and all associated links
function MDTWarrant.delete(self)
    -- Remove all entity links
    MDTLinkManager.removeAllLinks("warrant", self.id)
    
    -- Delete from database
    MySQL.query.await("DELETE FROM wsb_mdt_warrants WHERE id = ?", {self.id})
    
    -- Remove from global Warrants table
    Warrants[self.id] = nil
end

-- Update warrant fields in database
function MDTWarrant.update(self, updateFields, executeNow)
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
    
    -- Always update the updated_at timestamp
    self.updated_at = os.time()
    table.insert(setStatements, "updated_at = @updated_at")
    parameters["@updated_at"] = self.updated_at
    
    -- Execute update if requested
    if executeNow then
        if #setStatements > 0 then
            local setSql = table.concat(setStatements, ", ")
            local query = "UPDATE wsb_mdt_warrants SET " .. setSql .. " WHERE id = @id"
            MySQL.update.await(query, parameters)
        end
    end
end

-- Mark warrant as served by an officer
function MDTWarrant.serve(self, servedBy, servedByName)
    self:update({
        status = "served",
        served_by = servedBy,
        served_by_name = servedByName,
        served_at = os.time()
    }, true)
end

-- Cancel a warrant
function MDTWarrant.cancel(self)
    self:update({status = "cancelled"}, true)
end

-- Link a charge to this warrant
function MDTWarrant.linkCharge(self, chargeId, linkData, metadata)
    local linkMetadata = {
        link_type = "charge"
    }
    
    -- Merge metadata if provided
    if metadata then
        for key, value in pairs(metadata) do
            linkMetadata[key] = value
        end
    end
    
    return MDTLinkManager.createLink("warrant", self.id, "charge", chargeId, linkData, linkMetadata)
end

-- Unlink a charge from this warrant
function MDTWarrant.unlinkCharge(self, chargeId)
    return MDTLinkManager.removeLink("warrant", self.id, "charge", chargeId)
end

-- Get all charges linked to this warrant
function MDTWarrant.getLinkedCharges(self)
    local linkedEntities = MDTLinkManager.getLinkedEntities("warrant", self.id, "charge")
    local charges = {}
    
    for _, entity in ipairs(linkedEntities) do
        local charge = MDTCharge.get(tonumber(entity.id))
        if charge then
            table.insert(charges, charge:toTable())
        end
    end
    
    return charges
end

-- Add a note to this warrant
function MDTWarrant.addNote(self, content, createdBy, createdByName)
    return MDTNote:new({
        content = content,
        entity_type = "warrant",
        entity_id = tostring(self.id),
        created_by = createdBy,
        created_by_name = createdByName
    })
end

-- Get all notes for this warrant
function MDTWarrant.getNotes(self)
    return MDTNote.getByEntity("warrant", tostring(self.id))
end

-- Link any entity to this warrant
function MDTWarrant.linkEntity(self, entityType, entityId, linkData, metadata)
    return MDTLinkManager.createLink("warrant", self.id, entityType, entityId, linkData, metadata)
end

-- Unlink any entity from this warrant
function MDTWarrant.unlinkEntity(self, entityType, entityId)
    return MDTLinkManager.removeLink("warrant", self.id, entityType, entityId)
end

-- Get linked entities of a specific type
function MDTWarrant.getLinkedEntities(self, entityType)
    return MDTLinkManager.getLinkedEntities("warrant", self.id, entityType)
end

-- Check if this warrant is linked to a specific entity
function MDTWarrant.isLinkedTo(self, entityType, entityId)
    return MDTLinkManager.isLinked("warrant", self.id, entityType, entityId)
end

-- Convert warrant to full table with all linked entities (heavy operation)
function MDTWarrant.toTable(self)
    local result = {
        id = self.id,
        title = self.title,
        description = self.description,
        citizen_id = self.citizen_id,
        property_id = self.property_id,
        status = self.status,
        issued_by = self.issued_by,
        issued_by_name = self.issued_by_name,
        served_by = self.served_by,
        served_by_name = self.served_by_name,
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at,
        served_at = self.served_at
    }
    
    -- Add citizen information
    local citizen = MDTCitizen.get(self.citizen_id)
    if citizen then
        result.citizen_name = citizen.firstname .. " " .. citizen.lastname
        result.citizen_dob = citizen.dob
    end
    
    -- Add property information if linked
    if self.property_id then
        local property = MDTProperty.get(self.property_id)
        if property then
            result.property_address = property.address
        end
    end
    
    -- Get all linked entities
    local linkedEntities = self:getLinkedEntities()
    
    -- Categorize linked entities by type
    local categorized = {
        charges = {},
        citizens = {},
        properties = {},
        officers = {}
    }
    
    for _, entity in ipairs(linkedEntities) do
        if entity.type == "charge" then
            table.insert(categorized.charges, {
                charge = entity.data,
                metadata = entity.metadata,
                link_id = entity.link_id
            })
        elseif entity.type == "citizen" then
            table.insert(categorized.citizens, {
                citizen = entity.data,
                metadata = entity.metadata,
                link_id = entity.link_id
            })
        elseif entity.type == "property" then
            table.insert(categorized.properties, {
                property = entity.data,
                metadata = entity.metadata,
                link_id = entity.link_id
            })
        elseif entity.type == "officer" then
            table.insert(categorized.officers, {
                officer = entity.data,
                metadata = entity.metadata,
                link_id = entity.link_id
            })
        end
    end
    
    result.linked_charges = categorized.charges
    result.linked_citizens = categorized.citizens
    result.linked_properties = categorized.properties
    result.linked_officers = categorized.officers
    
    return result
end

-- Convert warrant to lightweight table without linked entities (faster)
function MDTWarrant.toTableLight(self)
    local result = {
        id = self.id,
        title = self.title,
        description = self.description,
        citizen_id = self.citizen_id,
        property_id = self.property_id,
        status = self.status,
        issued_by = self.issued_by,
        issued_by_name = self.issued_by_name,
        served_by = self.served_by,
        served_by_name = self.served_by_name,
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at,
        served_at = self.served_at
    }
    
    -- Add citizen information
    local citizen = MDTCitizen.get(self.citizen_id)
    if citizen then
        result.citizen_name = citizen.firstname .. " " .. citizen.lastname
        result.citizen_dob = citizen.dob
    end
    
    -- Add property information if linked
    if self.property_id then
        local property = MDTProperty.get(self.property_id)
        if property then
            result.property_address = property.address
        end
    end
    
    return result
end

-- Get all warrants sorted by creation date (newest first)
function MDTWarrant.getAll()
    local allWarrants = {}
    
    for _, warrant in pairs(Warrants) do
        table.insert(allWarrants, warrant:toTable())
    end
    
    table.sort(allWarrants, function(a, b)
        return a.created_at > b.created_at
    end)
    
    return allWarrants
end

-- Get all active warrants sorted by creation date (newest first)
function MDTWarrant.getActive()
    local activeWarrants = {}
    
    for _, warrant in pairs(Warrants) do
        if warrant.status == "active" then
            table.insert(activeWarrants, warrant:toTable())
        end
    end
    
    table.sort(activeWarrants, function(a, b)
        return a.created_at > b.created_at
    end)
    
    return activeWarrants
end

-- Get all warrants for a specific citizen
function MDTWarrant.getByCitizen(citizenId)
    local citizenWarrants = {}
    
    for _, warrant in pairs(Warrants) do
        if warrant.citizen_id == citizenId then
            table.insert(citizenWarrants, warrant:toTable())
        end
    end
    
    table.sort(citizenWarrants, function(a, b)
        return a.created_at > b.created_at
    end)
    
    return citizenWarrants
end

-- Get all active warrants for a specific citizen
function MDTWarrant.getActiveByCitizen(citizenId)
    local activeWarrants = {}
    
    for _, warrant in pairs(Warrants) do
        if warrant.citizen_id == citizenId and warrant.status == "active" then
            table.insert(activeWarrants, warrant:toTable())
        end
    end
    
    table.sort(activeWarrants, function(a, b)
        return a.created_at > b.created_at
    end)
    
    return activeWarrants
end

-- Search warrants by title, description, citizen name, or property address
function MDTWarrant.search(searchQuery)
    local results = {}
    local queryLower = string.lower(searchQuery)
    
    for _, warrant in pairs(Warrants) do
        local warrantLight = warrant:toTableLight()
        
        -- Search across multiple fields
        if string.find(string.lower(warrant.title or ""), queryLower) or
           string.find(string.lower(warrant.description or ""), queryLower) or
           string.find(string.lower(warrantLight.citizen_name or ""), queryLower) or
           string.find(string.lower(warrantLight.property_address or ""), queryLower) then
            table.insert(results, warrantLight)
        end
    end
    
    table.sort(results, function(a, b)
        return a.created_at > b.created_at
    end)
    
    return results
end

-- Get a single warrant by ID
function MDTWarrant.get(warrantId)
    return Warrants[warrantId]
end

-- Load all warrants from database on server startup
function MDTWarrant.loadFromDatabase()
    local warrants = MySQL.query.await("SELECT * FROM wsb_mdt_warrants")
    
    if warrants then
        for _, warrantData in pairs(warrants) do
            MDTWarrant:new(warrantData)
        end
    end
end

-- Create the database table if it doesn't exist
function MDTWarrant.createTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_warrants'")
    
    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_warrants` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `title` VARCHAR(255) NOT NULL,
                `description` TEXT NOT NULL,
                `citizen_id` VARCHAR(50) NOT NULL,
                `property_id` INT(11) DEFAULT NULL,
                `status` VARCHAR(50) NOT NULL DEFAULT 'active',
                `issued_by` VARCHAR(50) NOT NULL,
                `issued_by_name` VARCHAR(100) NOT NULL,
                `served_by` VARCHAR(50) DEFAULT NULL,
                `served_by_name` VARCHAR(100) DEFAULT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                `updated_at` INT(11) NOT NULL,
                `served_at` INT(11) DEFAULT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_citizen` (`citizen_id`),
                INDEX `idx_property` (`property_id`),
                INDEX `idx_status` (`status`),
                INDEX `idx_created` (`created_at`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])
        
        Success("Table 'wsb_mdt_warrants' has been created.")
        return true
    end
    
    return false
end