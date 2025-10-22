-- ============================================
-- MDT Dispatch Class
-- Defines dispatch call object structure
-- ============================================

MDTDispatch = {}
local DispatchCounter = 0

-- ============================================
-- CONSTRUCTOR
-- ============================================

function CreateNewDispatch(self, dispatchData)
    if not dispatchData then
        dispatchData = {}
    end

    if not dispatchData.type or not dispatchData.title or not dispatchData.coords then
        Error("Missing required fields for dispatch creation")
        return false
    end

    DispatchCounter = DispatchCounter + 1
    dispatchData.id = string.format("DISP-%04d", DispatchCounter)

    dispatchData.description = dispatchData.description or ""
    dispatchData.location = dispatchData.location or "Unknown Location"
    dispatchData.priority = dispatchData.priority or 1
    dispatchData.status = dispatchData.status or "pending"
    dispatchData.created_by_name = dispatchData.created_by_name or "System"
    dispatchData.created_at = os.time()
    dispatchData.assigned_officers = dispatchData.assigned_officers or {}
    dispatchData.departments = dispatchData.departments or "all"
    dispatchData.metadata = dispatchData.metadata or {}

    setmetatable(dispatchData, self)
    self.__index = self

    return dispatchData
end

MDTDispatch.new = CreateNewDispatch

-- ============================================
-- UPDATE METHODS
-- ============================================

function UpdateDispatch(self, updates)
    for fieldName, fieldValue in pairs(updates) do
        self[fieldName] = fieldValue
    end

    self.updated_at = os.time()
end

MDTDispatch.update = UpdateDispatch

-- ============================================
-- OFFICER ASSIGNMENT
-- ============================================

function AssignOfficer(self, officerId, officerName)
    if self.assigned_officers[officerId] then
        return false
    end

    self.assigned_officers[officerId] = {
        name = officerName,
        status = "assigned",
        assigned_at = os.time()
    }

    if self.status == "pending" then
        self.status = "assigned"
    end

    return true
end

MDTDispatch.assign = AssignOfficer

function UnassignOfficer(self, officerId)
    if not self.assigned_officers[officerId] then
        return false
    end

    self.assigned_officers[officerId] = nil

    if table.count(self.assigned_officers) == 0 then
        self.status = "pending"
    end

    return true
end

MDTDispatch.unassign = UnassignOfficer

function UpdateOfficerStatus(self, officerId, newStatus)
    if not self.assigned_officers[officerId] then
        return false
    end

    self.assigned_officers[officerId].status = newStatus
    self.assigned_officers[officerId].updated_at = os.time()

    if newStatus == "en_route" then
        if self.status == "assigned" then
            self.status = "en_route"
        end
    elseif newStatus == "on_scene" then
        self.status = "on_scene"
    end

    return true
end

MDTDispatch.updateOfficerStatus = UpdateOfficerStatus

-- ============================================
-- STATUS MANAGEMENT
-- ============================================

function CompleteDispatch(self, completedById)
    self.status = "completed"
    self.completed_at = os.time()
    self.completed_by = completedById

    return true
end

MDTDispatch.complete = CompleteDispatch

function ReopenDispatch(self)
    self.status = "pending"
    self.completed_at = nil
    self.completed_by = nil
    self.updated_at = os.time()

    return true
end

MDTDispatch.reopen = ReopenDispatch

-- ============================================
-- DATA EXPORT
-- ============================================

function ConvertDispatchToTable(self)
    return {
        id = self.id,
        type = self.type,
        title = self.title,
        description = self.description,
        location = self.location,
        coords = self.coords,
        priority = self.priority,
        status = self.status,
        created_by = self.created_by,
        created_by_name = self.created_by_name,
        created_at = self.created_at,
        updated_at = self.updated_at,
        completed_at = self.completed_at,
        assigned_officers = self.assigned_officers,
        departments = self.departments,
        metadata = self.metadata
    }
end

MDTDispatch.toTable = ConvertDispatchToTable