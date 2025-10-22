-- ============================================
-- MDT Announcements System
-- ============================================

MDTAnnouncement = {}
Announcements = {}

-- ============================================
-- CONSTRUCTOR & OBJECT METHODS
-- ============================================

function CreateNewAnnouncement(self, announcementData)
    if not announcementData then
        announcementData = {}
    end

    if not announcementData.department or not announcementData.title then
        Error("Missing required fields for announcement creation")
        return false
    end

    announcementData.title = announcementData.title or "Untitled"
    announcementData.content = announcementData.content or ""
    announcementData.priority = announcementData.priority or "medium"
    announcementData.created_at = announcementData.created_at or os.time()
    announcementData.expires_at = announcementData.expires_at or 
        (os.time() + (Config.Announcements.defaultExpireDays * 86400))
    announcementData.author = announcementData.author or "System"

    if not announcementData.id then
        local insertId = MySQL.insert.await(
            "INSERT INTO wsb_mdt_announcements (title, content, priority, author, department, created_at, expires_at) VALUES (?, ?, ?, ?, ?, ?, ?)",
            {
                announcementData.title,
                announcementData.content,
                announcementData.priority,
                announcementData.author,
                announcementData.department,
                announcementData.created_at,
                announcementData.expires_at
            }
        )

        announcementData.id = insertId

        if not announcementData.id then
            Error("Failed to create announcement in database")
            return false
        end
    end

    setmetatable(announcementData, self)
    self.__index = self

    Announcements[announcementData.id] = announcementData

    return announcementData
end

MDTAnnouncement.new = CreateNewAnnouncement

function UpdateAnnouncement(self, updates, shouldSave)
    local updateFields = {}
    local parameters = {["@id"] = self.id}

    for fieldName, fieldValue in pairs(updates) do
        if fieldValue == "null" then
            table.insert(updateFields, fieldName .. " = NULL")
            self[fieldName] = nil
        else
            table.insert(updateFields, fieldName .. " = @" .. fieldName)
            
            local paramKey = "@" .. fieldName
            local encodedValue = fieldValue

            if type(fieldValue) == "table" or 
               type(fieldValue) == "vector4" or 
               type(fieldValue) == "vector3" then
                encodedValue = json.encode(fieldValue)
            end

            parameters[paramKey] = encodedValue
            self[fieldName] = fieldValue
        end
    end

    if shouldSave then
        local updateQuery = "UPDATE wsb_mdt_announcements SET " .. 
            table.concat(updateFields, ", ") .. " WHERE id = @id"
        
        return MySQL.update.await(updateQuery, parameters)
    end
end

MDTAnnouncement.update = UpdateAnnouncement

function DeleteAnnouncement(self)
    MySQL.query.await("DELETE FROM wsb_mdt_announcements WHERE id = ?", {self.id})
    Announcements[self.id] = nil
end

MDTAnnouncement.delete = DeleteAnnouncement

-- ============================================
-- RETRIEVAL FUNCTIONS
-- ============================================

function GetAnnouncementById(announcementId)
    return Announcements[announcementId]
end

MDTAnnouncement.get = GetAnnouncementById

function GetAllActiveAnnouncements()
    local activeAnnouncements = {}
    local currentTime = os.time()

    for announcementId, announcement in pairs(Announcements) do
        if announcement.expires_at > currentTime then
            activeAnnouncements[announcementId] = announcement
        end
    end

    return activeAnnouncements
end

MDTAnnouncement.getAll = GetAllActiveAnnouncements

function GetAnnouncementsByDepartment(departmentName)
    local departmentAnnouncements = {}
    local currentTime = os.time()

    for announcementId, announcement in pairs(Announcements) do
        if announcement.department == departmentName and announcement.expires_at > currentTime then
            departmentAnnouncements[announcementId] = announcement
        end
    end

    return departmentAnnouncements
end

MDTAnnouncement.getByDepartment = GetAnnouncementsByDepartment

-- ============================================
-- DATABASE MANAGEMENT
-- ============================================

function LoadAnnouncementsFromDatabase()
    local currentTime = os.time()
    
    local activeAnnouncements = MySQL.query.await(
        "SELECT * FROM wsb_mdt_announcements WHERE expires_at > ?",
        {currentTime}
    )

    if activeAnnouncements then
        for _, announcementData in pairs(activeAnnouncements) do
            MDTAnnouncement:new(announcementData)
        end
    end

    MySQL.query.await(
        "DELETE FROM wsb_mdt_announcements WHERE expires_at <= ?",
        {currentTime}
    )
end

MDTAnnouncement.loadFromDatabase = LoadAnnouncementsFromDatabase

function CreateAnnouncementsTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_announcements'")

    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_announcements` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `title` varchar(255) NOT NULL,
                `content` text NOT NULL,
                `priority` varchar(50) DEFAULT 'medium',
                `author` varchar(100) NOT NULL,
                `department` varchar(50) NOT NULL,
                `created_at` int(11) NOT NULL,
                `expires_at` int(11) NOT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        Success("Table 'wsb_mdt_announcements' has been created.")
        return true
    end

    return false
end

MDTAnnouncement.createTable = CreateAnnouncementsTable