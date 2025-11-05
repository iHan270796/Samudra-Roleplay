-- TStudio IPL Manager
-- Manages Interior Proxy Lists (IPLs) for different floors and areas
-- Handles dynamic loading/unloading based on player position

-- Debug function - outputs debug messages if TStudioUtils or Config debug is enabled
function debugPrint(message)
    if TStudioUtils and TStudioUtils.Debug then
        TStudioUtils.Debug(message)
    elseif Config and Config.Debug then
        print(message)
    end
end

-- Find the closest floor to the player's current Z coordinate
function findClosestFloor(playerZ, floors)
    local closestFloorIndex = -1
    local minDistance = math.huge
    
    for floorIndex, floorData in pairs(floors) do
        local distance = math.abs(playerZ - floorData.height)
        if minDistance > distance then
            minDistance = distance
            closestFloorIndex = floorIndex
        end
    end
    
    TStudioUtils.Debug(string.format("^3[TStudio IPL MANAGER]^7 Closest floor: %d, Difference: %.2f", closestFloorIndex, minDistance))
    return closestFloorIndex, minDistance
end

-- Check if a resource is running
function isResourceRunning(resourceName)
    local numResources = GetNumResources() - 1
    for i = 0, numResources do
        local currentResource = GetResourceByFindIndex(i)
        if currentResource == resourceName then
            return true
        end
    end
    return false
end

-- Check if player is on any configured floor (within 2.5 units of height)
function isPlayerOnConfiguredFloor(floorConfig)
    local playerCoords = GetEntityCoords(PlayerPedId())
    
    for floorIndex, floorData in pairs(floorConfig.floors) do
        local floorHeight = floorData.height
        local heightDifference = math.abs(playerCoords.z - floorHeight)
        if heightDifference <= 2.5 then
            return true
        end
    end
    return false
end

-- Check if player is within a specific area radius
function isPlayerInArea(areaConfig, radius)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local playerPos2D = vector2(playerCoords.x, playerCoords.y)
    local areaCenter2D = vector2(areaConfig.center.x, areaConfig.center.y)
    local distance = #(playerPos2D - areaCenter2D)
    
    TStudioUtils.Debug(string.format("^3[TStudio IPL MANAGER]^7 Checking area: Center = (%.2f, %.2f), Player = (%.2f, %.2f), Distance = %.2f, Radius = %.2f", 
        areaCenter2D.x, areaCenter2D.y, playerPos2D.x, playerPos2D.y, distance, radius))
    
    if radius >= distance then
        TStudioUtils.Debug("^2[TStudio IPL MANAGER]^7 Player is within the radius of the area.")
        return true
    end
    
    TStudioUtils.Debug("^3[TStudio IPL MANAGER]^7 Player is not within the radius of the area.")
    return false
end

-- Check if player is on Pillbox floor
function isPlayerOnPillboxFloor()
    return isPlayerOnConfiguredFloor(Config.FloorConfigs.pillbox)
end

-- Check if player is on Opium floor
function isPlayerOnOpiumFloor()
    return isPlayerOnConfiguredFloor(Config.FloorConfigs.opium)
end

-- Check if player is in Pillbox area
function isPlayerInPillboxArea()
    return isPlayerInArea(Config.FloorConfigs.pillbox, 100.0)
end

-- Check if player is in Opium area
function isPlayerInOpiumArea()
    return isPlayerInArea(Config.FloorConfigs.opium, 100.0)
end

-- Activate entity set for floor (specifically for privacy settings)
function activateFloorEntitySet()
    TStudioUtils.Debug("^2[TStudio IPL MANAGER]^7 Activating entity set for floor")
    Citizen.Wait(500)
    
    local interior = GetInteriorFromEntity(PlayerPedId())
    if interior ~= 0 then
        LoadInterior(interior)
        
        -- Wait for interior to be ready
        while not IsInteriorReady(interior) do
            Citizen.Wait(50)
        end
        
        -- Activate privacy entity set if not already active
        if not IsInteriorEntitySetActive(interior, "r7_privacy_off") then
            TStudioUtils.Debug("^2[TStudio IPL MANAGER]^7 Activating interior entity set: r7_privacy_off")
            ActivateInteriorEntitySet(interior, "r7_privacy_off")
            RefreshInterior(interior)
        end
    end
end

-- Handle Pillbox MD resource state checking
function handlePillboxMDResource()
    TriggerServerEvent("checkResourceState", "tstudio_pillbox_md")
    
    RegisterNetEvent("receiveResourceState")
    AddEventHandler("receiveResourceState", function(resourceName, state)
        if resourceName == "tstudio_pillbox_md" and state == "started" then
            if isPlayerOnPillboxFloor() then
                activateFloorEntitySet()
            end
        end
    end)
end

-- Load IPLs for a specific floor and unload others
function loadFloorIPLs(targetFloor, floors)
    TStudioUtils.Debug(string.format("^2[TStudio IPL MANAGER]^7 Loading IPLs for floor: %d", targetFloor))
    
    -- Load IPLs for target floor
    for _, iplName in pairs(floors[targetFloor].ipls) do
        TStudioUtils.Debug(string.format("^2[TStudio IPL MANAGER]^7 Requesting IPL: %s", iplName))
        RequestIpl(iplName)
    end
    
    -- Remove IPLs for all other floors
    for floorIndex, floorData in pairs(floors) do
        if floorIndex ~= targetFloor then
            for _, iplName in pairs(floorData.ipls) do
                TStudioUtils.Debug(string.format("^1[TStudio IPL MANAGER]^7 Removing IPL: %s", iplName))
                RemoveIpl(iplName)
            end
        end
    end
    
    handlePillboxMDResource()
end

-- Monitor player movement and manage IPLs accordingly
function monitorPlayerMovement(floorConfig)
    local lastFloor = nil
    
    local function checkPlayerPosition()
        local playerCoords = GetEntityCoords(PlayerPedId())
        local closestFloor, distance = findClosestFloor(playerCoords.z, floorConfig.floors)
        
        -- Only update if player is close enough to a floor (within 2.5 units)
        if distance <= 2.5 then
            if lastFloor ~= closestFloor then
                loadFloorIPLs(closestFloor, floorConfig.floors)
                lastFloor = closestFloor
            end
        end
    end
    
    RegisterNetEvent("playerMoved")
    AddEventHandler("playerMoved", checkPlayerPosition)
end

-- Main thread to monitor player position and trigger events
Citizen.CreateThread(function()
    local lastPosition = nil
    
    while true do
        local currentPosition = GetEntityCoords(PlayerPedId())
        
        -- Check if player is in any configured area
        if isPlayerInPillboxArea() or isPlayerInOpiumArea() then
            TStudioUtils.Debug("^2[TStudio IPL MANAGER]^7 Player is near a configured area")
            
            -- Only trigger movement event if player has moved significantly
            if lastPosition then
                local distance = #(currentPosition - lastPosition)
                if distance > 1.0 then
                    TriggerEvent("playerMoved")
                    lastPosition = currentPosition
                end
            else
                TriggerEvent("playerMoved")
                lastPosition = currentPosition
            end
        end
        
        Citizen.Wait(500)
    end
end)

-- Initialize IPL Manager
TStudioUtils.Debug("^3[TStudio IPL MANAGER]^7 Removing all IPLs during initialization")

-- Remove all IPLs on startup to ensure clean state
for configName, floorConfig in pairs(Config.FloorConfigs) do
    for floorIndex, floorData in pairs(floorConfig.floors) do
        TStudioUtils.Debug(string.format("^1[TStudio IPL MANAGER]^7 Removing IPLs for floor: %d in resource: %s", 
            floorIndex, tostring(floorConfig.resourceName or "unknown")))
        
        for _, iplName in pairs(floorData.ipls) do
            RemoveIpl(iplName)
        end
    end
end

-- Start monitoring for both Pillbox and Opium configurations
monitorPlayerMovement(Config.FloorConfigs.pillbox)
monitorPlayerMovement(Config.FloorConfigs.opium)