-- MDT Note System
-- Global tables (used by other files)
MDTNote = {}
Notes = {}

-- Creates a new note or loads existing note from data
function MDTNote.new(self, noteData)
    if not noteData then
        noteData = {}
    end

    -- Validate required fields
    if not (noteData.content and noteData.entity_type and noteData.entity_id and noteData.created_by) then
        Error("Missing required fields for note creation")
        return false
    end

    -- Set defaults for optional fields
    noteData.created_by_name = noteData.created_by_name or "Unknown"
    noteData.metadata = noteData.metadata or {}
    noteData.created_at = noteData.created_at or os.time()
    noteData.updated_at = noteData.updated_at or os.time()

    -- If no ID exists, this is a new note - insert into database
    if not noteData.id then
        local insertId = MySQL.insert.await([[
INSERT INTO wsb_mdt_notes
            (content, entity_type, entity_id, created_by, created_by_name,
             metadata, created_at, updated_at)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)]], {
            noteData.content,
            noteData.entity_type,
            noteData.entity_id,
            noteData.created_by,
            noteData.created_by_name,
            json.encode(noteData.metadata),
            noteData.created_at,
            noteData.updated_at
        })
        
        noteData.id = insertId

        if not noteData.id then
            Error("Failed to create note in database")
            return false
        end
    else
        -- Loading existing note from database - decode metadata
        noteData.metadata = json.decode(noteData.metadata)
    end

    -- Set up metatable for OOP functionality
    setmetatable(noteData, self)
    self.__index = self

    -- Store in global Notes table
    Notes[noteData.id] = noteData

    return noteData
end

-- Deletes this note from database and memory
function MDTNote.delete(self)
    MySQL.query.await("DELETE FROM wsb_mdt_notes WHERE id = ?", {self.id})
    Notes[self.id] = nil
end

-- Updates note fields with provided data
function MDTNote.update(self, updates)
    local setStatements = {}
    local parameters = {["@id"] = self.id}

    -- Build SQL SET clauses and parameters
    for fieldName, newValue in pairs(updates) do
        table.insert(setStatements, fieldName .. " = @" .. fieldName)
        
        local paramKey = "@" .. fieldName
        local paramValue = newValue
        
        -- Encode tables as JSON
        if type(newValue) == "table" then
            paramValue = json.encode(newValue)
        end
        
        parameters[paramKey] = paramValue
        self[fieldName] = newValue
    end

    -- Update the timestamp
    self.updated_at = os.time()
    table.insert(setStatements, "updated_at = @updated_at")
    parameters["@updated_at"] = self.updated_at

    -- Execute update if there are changes
    if #setStatements > 0 then
        local setClause = table.concat(setStatements, ", ")
        local query = "UPDATE wsb_mdt_notes SET " .. setClause .. " WHERE id = @id"
        MySQL.update.await(query, parameters)
    end
end

-- Converts note object to plain table
function MDTNote.toTable(self)
    return {
        id = self.id,
        content = self.content,
        entity_type = self.entity_type,
        entity_id = self.entity_id,
        created_by = self.created_by,
        created_by_name = self.created_by_name,
        metadata = self.metadata,
        created_at = self.created_at,
        updated_at = self.updated_at
    }
end

-- Retrieves all notes for a specific entity, sorted by creation date (newest first)
function MDTNote.getByEntity(entityType, entityId)
    local entityNotes = {}

    for noteId, note in pairs(Notes) do
        if note.entity_type == entityType and tostring(note.entity_id) == tostring(entityId) then
            table.insert(entityNotes, note:toTable())
        end
    end

    -- Sort by created_at descending (newest first)
    table.sort(entityNotes, function(a, b)
        return a.created_at > b.created_at
    end)

    return entityNotes
end

-- Gets a note by its ID
function MDTNote.get(noteId)
    return Notes[noteId]
end

-- Loads all notes from database into memory
function MDTNote.loadFromDatabase()
    local allNotes = MySQL.query.await("SELECT * FROM wsb_mdt_notes")
    
    if allNotes then
        for _, noteData in pairs(allNotes) do
            MDTNote:new(noteData)
        end
    end
end

-- Deletes all notes for a specific entity
function MDTNote.deleteByEntity(entityType, entityId)
    local notesToDelete = {}

    -- Find all matching notes
    for noteId, note in pairs(Notes) do
        if note.entity_type == entityType and tostring(note.entity_id) == tostring(entityId) then
            table.insert(notesToDelete, note)
        end
    end

    -- Delete each note
    for _, note in ipairs(notesToDelete) do
        note:delete()
    end

    return #notesToDelete
end

-- Creates the database table if it doesn't exist
function MDTNote.createTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_notes'")
    
    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_notes` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `content` TEXT NOT NULL,
                `entity_type` VARCHAR(50) NOT NULL,
                `entity_id` VARCHAR(50) NOT NULL,
                `created_by` VARCHAR(50) NOT NULL,
                `created_by_name` VARCHAR(100) NOT NULL,
                `metadata` LONGTEXT,
                `created_at` INT(11) NOT NULL,
                `updated_at` INT(11) NOT NULL,
                PRIMARY KEY (`id`),
                INDEX `idx_entity` (`entity_type`, `entity_id`),
                INDEX `idx_created_by` (`created_by`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])
        
        Success("Table 'wsb_mdt_notes' has been created.")
        return true
    end
    
    return false
end