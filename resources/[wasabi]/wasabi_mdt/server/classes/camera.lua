-- ============================================
-- MDT Camera System
-- Manages security camera placements and access
-- ============================================

MDTCamera = {}
Cameras = {}

-- ============================================
-- HELPER FUNCTIONS
-- ============================================

function DecodeJSONField(field)
    if type(field) == "string" then
        return json.decode(field) or field
    end
    return field
end

-- ============================================
-- CONSTRUCTOR & CORE METHODS
-- ============================================

function CreateNewCamera(self, cameraData, shouldCreate)
    if not cameraData then
        cameraData = {}
    end

    if not cameraData.name or not cameraData.coords then
        Error("Missing required fields for camera creation")
        return false
    end

    cameraData.location = cameraData.location or "Unknown Location"
    cameraData.rotation = cameraData.rotation or {x = 0.0, y = 0.0, z = 0.0}
    cameraData.departments = cameraData.departments or {"all"}
    cameraData.model = cameraData.model or "prop_cctv_cam_01a"
    cameraData.metadata = cameraData.metadata or {}
    cameraData.created_at = cameraData.created_at or os.time()
    cameraData.updated_at = cameraData.updated_at or os.time()

    if shouldCreate then
        local success, insertId = pcall(function()
            return MySQL.insert.await(
                "INSERT INTO wsb_mdt_cameras (name, location, coords, rotation, departments, model, metadata, created_by, created_by_name, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
                {
                    cameraData.name,
                    cameraData.location,
                    json.encode(cameraData.coords),
                    json.encode(cameraData.rotation),
                    json.encode(cameraData.departments),
                    cameraData.model,
                    cameraData.metadata and json.encode(cameraData.metadata) or "{}",
                    cameraData.created_by,
                    cameraData.created_by_name,
                    cameraData.created_at,
                    cameraData.updated_at
                }
            )
        end)

        if not success then
            Error("Database error: " .. tostring(insertId))
            return false
        end

        if not insertId or insertId == 0 then
            Error("Failed to create camera in database")
            return false
        end

        cameraData.id = insertId
    else
        cameraData.coords = DecodeJSONField(cameraData.coords)
        cameraData.rotation = DecodeJSONField(cameraData.rotation)
        cameraData.metadata = DecodeJSONField(cameraData.metadata)
        cameraData.departments = DecodeJSONField(cameraData.departments)
    end

    setmetatable(cameraData, self)
    self.__index = self

    Cameras[cameraData.id] = cameraData

    if shouldCreate then
        TriggerClientEvent("wasabi_mdt:spawnCamera", -1, cameraData:toTable())
    end

    return cameraData
end

MDTCamera.new = CreateNewCamera

function UpdateCamera(self, updates, shouldSave)
    local updateFields = {}
    local parameters = {}

    for fieldName, fieldValue in pairs(updates) do
        if fieldValue == "null" then
            table.insert(updateFields, fieldName .. " = NULL")
            self[fieldName] = nil
        else
            table.insert(updateFields, fieldName .. " = ?")

            if type(fieldValue) == "table" then
                table.insert(parameters, json.encode(fieldValue))
            else
                table.insert(parameters, fieldValue)
            end

            self[fieldName] = fieldValue
        end
    end

    self.updated_at = os.time()
    table.insert(updateFields, "updated_at = ?")
    table.insert(parameters, self.updated_at)
    table.insert(parameters, self.id)

    if shouldSave then
        local updateQuery = "UPDATE wsb_mdt_cameras SET " .. 
            table.concat(updateFields, ", ") .. " WHERE id = ?"
        
        local success = MySQL.update.await(updateQuery, parameters)

        if success then
            TriggerClientEvent("wasabi_mdt:updateCamera", -1, self.id, updates)
        end

        return success
    end
end

MDTCamera.update = UpdateCamera

function DeleteCamera(self)
    TriggerClientEvent("wasabi_mdt:removeCamera", -1, self.id)

    MySQL.query.await("DELETE FROM wsb_mdt_cameras WHERE id = ?", {self.id})

    Cameras[self.id] = nil
end

MDTCamera.delete = DeleteCamera

-- ============================================
-- PERMISSION CHECKS
-- ============================================

function CanAccessCamera(self, identifier)
    local playerId = wsb.getPlayerIdFromIdentifier(identifier)
    local jobData = wsb.getJobData(playerId)

    if not jobData then
        return false
    end

    if self.departments and table.contains(self.departments, "all") then
        return HasPermission(identifier, "mdt.cameras.view")
    end

    if self.departments and table.contains(self.departments, jobData.name) then
        return HasPermission(identifier, "mdt.cameras.view")
    end

    return false
end

MDTCamera.canAccess = CanAccessCamera

function CanManageCamera(self, identifier)
    return HasPermission(identifier, "mdt.cameras.manage")
end

MDTCamera.canManage = CanManageCamera

-- ============================================
-- DATA EXPORT
-- ============================================

function ConvertCameraToTable(self)
    return {
        id = self.id,
        name = self.name,
        location = self.location,
        coords = self.coords,
        rotation = self.rotation,
        departments = self.departments,
        model = self.model,
        metadata = self.metadata,
        created_by = self.created_by,
        created_by_name = self.created_by_name,
        created_at = self.created_at,
        updated_at = self.updated_at
    }
end

MDTCamera.toTable = ConvertCameraToTable

-- ============================================
-- RETRIEVAL FUNCTIONS
-- ============================================

function GetCameraById(cameraId)
    return Cameras[cameraId]
end

MDTCamera.get = GetCameraById

function GetAllCameras()
    local allCameras = {}

    for _, camera in pairs(Cameras) do
        table.insert(allCameras, camera:toTable())
    end

    return allCameras
end

MDTCamera.getAll = GetAllCameras

function GetCamerasByDepartment(departmentName)
    local departmentCameras = {}

    for _, camera in pairs(Cameras) do
        if camera.departments and 
           (table.contains(camera.departments, departmentName) or 
            table.contains(camera.departments, "all")) then
            table.insert(departmentCameras, camera:toTable())
        end
    end

    return departmentCameras
end

MDTCamera.getByDepartment = GetCamerasByDepartment

function GetActiveCameras()
    local activeCameras = {}

    for _, camera in pairs(Cameras) do
        if camera.status == "active" then
            table.insert(activeCameras, camera:toTable())
        end
    end

    return activeCameras
end

MDTCamera.getActive = GetActiveCameras

function GetNearbyCameras(coords, maxDistance)
    local nearbyCameras = {}

    for _, camera in pairs(Cameras) do
        local cameraPosition = vector3(camera.coords.x, camera.coords.y, camera.coords.z)
        local checkPosition = vector3(coords.x, coords.y, coords.z)
        local distance = #(cameraPosition - checkPosition)

        if distance <= maxDistance then
            table.insert(nearbyCameras, camera:toTable())
        end
    end

    return nearbyCameras
end

MDTCamera.getNearby = GetNearbyCameras

-- ============================================
-- DATABASE MANAGEMENT
-- ============================================

function LoadCamerasFromDatabase()
    local success, cameras = pcall(function()
        return MySQL.query.await("SELECT * FROM wsb_mdt_cameras")
    end)

    if not success then
        Error("Failed to load cameras: " .. tostring(cameras))
        return
    end

    if cameras and #cameras > 0 then
        for _, cameraData in ipairs(cameras) do
            MDTCamera:new(cameraData)
        end
    end

    Debug("Loaded " .. table.count(Cameras) .. " cameras from database")
end

MDTCamera.loadFromDatabase = LoadCamerasFromDatabase

function CreateCamerasTable()
    local tableExists = MySQL.query.await("SHOW TABLES LIKE 'wsb_mdt_cameras'")

    if #tableExists == 0 then
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `wsb_mdt_cameras` (
                `id` int(11) NOT NULL AUTO_INCREMENT,
                `name` varchar(100) NOT NULL,
                `location` varchar(255) DEFAULT NULL,
                `coords` text NOT NULL,
                `rotation` text NOT NULL,
                `departments` text DEFAULT '["all"]',
                `model` varchar(100) DEFAULT 'prop_cctv_cam_01a',
                `metadata` text DEFAULT '{}',
                `created_by` varchar(50) DEFAULT NULL,
                `created_by_name` varchar(100) DEFAULT NULL,
                `created_at` int(11) DEFAULT NULL,
                `updated_at` int(11) DEFAULT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]])

        Success("Table 'wsb_mdt_cameras' has been created.")
        return true
    end

    return false
end

MDTCamera.createTable = CreateCamerasTable