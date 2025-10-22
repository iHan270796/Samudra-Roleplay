local allPoints = {}
local nearbyPoints = {}
local nearbyPointsCount = 0
local closestPoint = nil
local nearbyPointsIntervalId = nil

-- Remove a point from the system
function RemovePoint(point)
    if closestPoint then
        if closestPoint.id == point.id then
            closestPoint = nil
        end
    end
    
    allPoints[point.id] = nil
end

-- Ensure coordinates are in vector3 format
function EnsureVector3(coords)
    local coordsType = type(coords)
    
    if coordsType ~= "vector3" then
        if coordsType == "table" or coordsType == "vector4" then
            return vec3(
                coords[1] or coords.x,
                coords[2] or coords.y,
                coords[3] or coords.z
            )
        end
        
        error(("expected type 'vector3' or 'table' (received %s)"):format(coordsType))
    end
    
    return coords
end

-- Points API
WSB.points = {}

-- Create a new point with coords, distance, and optional properties
function WSB.points.new(...)
    local args = {...}
    local pointId = #allPoints + 1
    local point = nil
    
    -- Handle two creation patterns:
    -- 1. Pass a table with all properties
    -- 2. Pass coords, distance, and optional properties table
    if type(args[1]) == "table" then
        point = args[1]
        point.id = pointId
        point.remove = RemovePoint
    else
        point = {
            id = pointId,
            coords = args[1],
            remove = RemovePoint
        }
    end
    
    -- Ensure coords are vector3
    point.coords = EnsureVector3(point.coords)
    
    -- Set distance (use point.distance if it exists, otherwise args[2])
    point.distance = point.distance or args[2]
    
    -- Merge additional properties from args[3]
    if args[3] then
        for key, value in pairs(args[3]) do
            point[key] = value
        end
    end
    
    allPoints[pointId] = point
    return point
end

-- Get all registered points
function WSB.points.getAllPoints()
    return allPoints
end

-- Get all nearby points (within their distance threshold)
function WSB.points.getNearbyPoints()
    return nearbyPoints
end

-- Get the closest point to player
function WSB.points.getClosestPoint()
    return closestPoint
end

-- Main update loop - checks all points against player position
function UpdatePoints()
    local playerCoords = GetEntityCoords(WSB.cache.ped)
    WSB.cache.coords = playerCoords
    
    -- Check if closest point is still in range
    if closestPoint then
        local distanceToClosest = #(playerCoords - closestPoint.coords)
        if distanceToClosest > closestPoint.distance then
            closestPoint.isClosest = nil
            closestPoint = nil
        end
    end
    
    -- Reset nearby points count
    nearbyPointsCount = 0
    
    -- Check all points
    for pointId, point in pairs(allPoints) do
        local distanceToPoint = #(playerCoords - point.coords)
        point.currentDistance = distanceToPoint
        
        -- Point is within range
        if distanceToPoint <= point.distance then
            -- Update closest point if this is closer
            if closestPoint then
                if distanceToPoint < closestPoint.currentDistance then
                    closestPoint.isClosest = nil
                    point.isClosest = true
                    closestPoint = point
                end
            else
                closestPoint = point
                point.isClosest = true
            end
            
            -- Add to nearby points if it has a nearby callback
            if point.nearby then
                nearbyPointsCount = nearbyPointsCount + 1
                nearbyPoints[nearbyPointsCount] = point
            end
            
            -- Handle enter/exit callbacks
            if point.onEnter then
                if not point.inside then
                    point.inside = true
                    point:onEnter()
                end
            else
                if not point.inside then
                    point.inside = true
                end
            end
        else
            -- Point is out of range
            if point.inside then
                if point.onExit then
                    point:onExit()
                end
                point.inside = nil
            end
            point.currentDistance = nil
        end
    end
end

-- Main monitoring thread
CreateThread(function()
    while true do
        UpdatePoints()
        
        -- Start nearby points interval if we have nearby points
        if nearbyPointsCount > 0 then
            if not nearbyPointsIntervalId then
                nearbyPointsIntervalId = SetInterval(function()
                    for i = 1, nearbyPointsCount, 1 do
                        local point = nearbyPoints[i]
                        if point then
                            local success, errorMsg = pcall(function()
                                point:nearby()
                            end)
                            
                            if not success then
                                point:remove()
                            end
                        end
                    end
                end, 0)
            end
        else
            -- Clear interval if no nearby points
            if nearbyPointsCount == 0 and nearbyPointsIntervalId then
                nearbyPointsIntervalId = ClearInterval(nearbyPointsIntervalId)
            end
        end
        
        Wait(300)
    end
end)