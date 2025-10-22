-- ============================================
-- MDT (Mobile Data Terminal) Functions
-- ============================================

-- Create callsigns table in database
function CreateCallsignsTable()
  MySQL.query([[
      CREATE TABLE IF NOT EXISTS wsb_mdt_callsigns (
          id INT AUTO_INCREMENT PRIMARY KEY,
          officer_id VARCHAR(255) NOT NULL,
          callsign VARCHAR(10) NOT NULL
      )
  ]])
end

-- Initialize all MDT database tables
function CreateSQLIfNotExist()
  MDTAnnouncement.createTable()
  MDTCitizen.createTable()
  MDTVehicle.createTable()
  MDTWeapon.createTable()
  MDTProperty.createTable()
  MDTEvidence.createTable()
  MDTPhoto.createTable()
  MDTNote.createTable()
  MDTLinkManager.createTable()
  MDTCharge.createTable()
  MDTWarrant.createTable()
  MDTBOLO.createTable()
  MDTIncident.createTable()
  MDTCamera.createTable()
  CreateCallsignsTable()
end

-- Check if player has permission to open MDT
function IsOfficer(identifier)
  return HasPermission(identifier, "mdt.open")
end

-- Check if player has specific permission based on department and grade
function HasPermission(identifier, permission)
  local playerId = wsb.getPlayerIdFromIdentifier(identifier)
  if not playerId then
      return false
  end

  local jobData = wsb.getJobData(playerId)
  if not jobData then
      return false
  end

  local jobName = jobData.name
  local gradeLevel = type(jobData.grade) == "table" and jobData.grade.level or jobData.grade

  local department = Config.Departments[jobName]
  if not department then
      return false
  end

  local permissionData = department.permissions and department.permissions[permission]
  if not permissionData then
      return false
  end

  if permissionData == "*" or permissionData == "all" then
      return true
  end

  if type(permissionData) == "table" then
      for _, allowedGrade in ipairs(permissionData) do
          if allowedGrade == gradeLevel then
              return true
          end
      end
  end

  return false
end

-- Get officer's callsign from database
function GetOfficerCallsign(officerId)
  local result = MySQL.query.await(
      "SELECT callsign FROM wsb_mdt_callsigns WHERE officer_id = ?",
      {officerId}
  )

  if result and result[1] then
      return result[1].callsign
  end

  return "N/A"
end

-- Add officer to the Officers global table
function AddOfficer(identifier, location)
  local playerId = wsb.getPlayerIdFromIdentifier(identifier)
  if not playerId then
      return
  end

  local jobData = wsb.getJobData(playerId)
  if not jobData or not IsOfficer(identifier) then
      return
  end

  local callsign = GetOfficerCallsign(identifier)
  local gradeLabel = (jobData.grade and jobData.grade.label) or 
                     (jobData.grade and jobData.grade.name) or 
                     "N/A"
  local gradeLevel = type(jobData.grade) == "table" and jobData.grade.level or jobData.grade

  Officers[identifier] = {
      identifier = identifier,
      name = wsb.getName(playerId),
      department = jobData.name,
      job = wsb.getJobLabel(playerId),
      gradeLabel = gradeLabel,
      grade = gradeLevel,
      callsign = callsign,
      location = location or "Unknown",
      arrests = 0,
      citations = 0,
      reports = 0,
      convictionRate = 0,
      onDuty = false,
      onDutySince = nil
  }
end

-- Refresh all officer locations
function RefreshOfficers()
  for identifier, officerData in pairs(Officers) do
      local playerId = wsb.getPlayerIdFromIdentifier(identifier)
      
      if playerId then
          local streetName = wsb.awaitClientCallback("wasabi_mdt:getStreetName", playerId) or "Unknown"
          officerData.location = streetName
      else
          officerData.onDuty = false
          officerData.onDutySince = nil
      end
  end
end

-- Get officers filtered by department
function GetDepartmentOfficers(departmentFilter)
  local filteredOfficers = {}

  for identifier, officerData in pairs(Officers) do
      if not departmentFilter or officerData.department == departmentFilter then
          filteredOfficers[identifier] = officerData
      end
  end

  return filteredOfficers
end

-- Search officers by name, identifier, callsign, or department
function SearchOfficers(searchQuery)
  local results = {}
  local lowerQuery = string.lower(searchQuery)

  for identifier, officerData in pairs(Officers) do
      local nameMatch = string.find(string.lower(officerData.name or ""), lowerQuery)
      local idMatch = string.find(string.lower(officerData.identifier or ""), lowerQuery)
      local callsignMatch = string.find(string.lower(officerData.callsign or ""), lowerQuery)
      local deptMatch = string.find(string.lower(officerData.department or ""), lowerQuery)

      if nameMatch or idMatch or callsignMatch or deptMatch then
          table.insert(results, officerData)
      end
  end

  return results
end

-- Save callsign to database (insert or update)
function SaveCallsignToDatabase(officerId, callsign)
  MySQL.single(
      "SELECT `callsign` FROM `wsb_mdt_callsigns` WHERE `officer_id` = ? LIMIT 1",
      {officerId},
      function(existingRecord)
          if not existingRecord then
              MySQL.query(
                  "INSERT INTO wsb_mdt_callsigns (officer_id, callsign) VALUES (?, ?)",
                  {officerId, callsign}
              )
          else
              MySQL.query(
                  "UPDATE wsb_mdt_callsigns SET callsign = ? WHERE officer_id = ?",
                  {callsign, officerId}
              )
          end
      end
  )
end

-- Set player's callsign and broadcast update to all officers
function SetPlayerCallsign(identifier, callsign)
  local playerId = wsb.getPlayerIdFromIdentifier(identifier)
  local playerData = wsb.getPlayer(playerId)
  
  if not playerData then
      return
  end

  -- Set callsign in player state
  Player(playerId).state:set("callsign", callsign, true)

  -- Set metadata for QB-Core framework
  if wsb.framework == "qb" then
      playerData.Functions.SetMetaData("callsign", callsign)
  end

  -- Update Officers table
  Officers[identifier].callsign = callsign

  -- Save to database
  SaveCallsignToDatabase(identifier, callsign)

  -- Broadcast update to all online officers
  for officerIdentifier in pairs(Officers) do
      local officerPlayerId = wsb.getPlayerIdFromIdentifier(officerIdentifier)
      if officerPlayerId then
          TriggerClientEvent(
              "wasabi_mdt:updateOfficerCallsign",
              officerPlayerId,
              Officers[officerIdentifier]
          )
      end
  end
end