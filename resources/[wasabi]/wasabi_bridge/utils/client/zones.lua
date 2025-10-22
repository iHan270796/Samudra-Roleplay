WSB.zones = {}

local allZones = {}
local currentZones = {}
local enterQueue = {}
local exitQueue = {}

-- Ray casting algorithm for point-in-polygon detection
function IsPointInPolygon(polygon, point)
    local inside = false
    local vertexCount = #polygon
    
    for i = 1, #polygon, 1 do
        local vertex1 = polygon[i]
        local vertex2 = polygon[vertexCount]
        
        local x1, y1 = vertex1.x, vertex1.y
        local x2, y2 = vertex2.x, vertex2.y
        
        if (y1 > point.y) ~= (y2 > point.y) then
            if point.x < (x2 - x1) * (point.y - y1) / (y2 - y1) + x1 then
                inside = not inside
            end
        end
        
        vertexCount = i
    end
    
    return inside
end

-- Calculate center point (centroid) of polygon
function CalculatePolygonCenter(polygon)
    local sumX, sumY, sumZ = 0, 0, 0
    
    for i = 1, #polygon, 1 do
        sumX = sumX + polygon[i].x
        sumY = sumY + polygon[i].y
        sumZ = sumZ + polygon[i].z
    end
    
    local count = #polygon
    return vector3(sumX / count, sumY / count, sumZ / count)
end

-- Check if polygon is convex
function IsPolygonConvex(polygon)
    local vertexCount = #polygon
    
    if vertexCount < 4 then
        return true
    end
    
    local isPositive = nil
    
    for i = 1, vertexCount, 1 do
        local current = i
        local next = (i % vertexCount) + 1
        local afterNext = ((i + 1) % vertexCount) + 1
        
        local dx1 = polygon[next].x - polygon[current].x
        local dy1 = polygon[next].y - polygon[current].y
        local dx2 = polygon[afterNext].x - polygon[next].x
        local dy2 = polygon[afterNext].y - polygon[next].y
        
        local crossProduct = dx1 * dy2 - dy1 * dx2
        local currentIsPositive = crossProduct >= 0
        
        if isPositive == nil then
            isPositive = currentIsPositive
        elseif isPositive ~= currentIsPositive then
            return false
        end
    end
    
    return true
end

-- Check if point is inside triangle (used for triangulation validation)
function IsPointInTriangle(point, vertex1, vertex2, vertex3)
    function Sign(p1, p2, p3)
        return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y)
    end
    
    local d1 = Sign(point, vertex1, vertex2)
    local d2 = Sign(point, vertex2, vertex3)
    local d3 = Sign(point, vertex3, vertex1)
    
    local hasNegative = (d1 < 0) or (d2 < 0) or (d3 < 0)
    local hasPositive = (d1 > 0) or (d2 > 0) or (d3 > 0)
    
    return not (hasNegative and hasPositive)
end

-- Check if vertex is an "ear" for ear clipping triangulation
function IsEar(polygon, vertexIndex)
    local vertexCount = #polygon
    local prevIndex = (vertexIndex == 1) and vertexCount or (vertexIndex - 1)
    local nextIndex = (vertexIndex == vertexCount) and 1 or (vertexIndex + 1)
    
    local prev = polygon[prevIndex]
    local current = polygon[vertexIndex]
    local next = polygon[nextIndex]
    
    -- Check if the triangle is oriented correctly
    local dx1 = current.x - prev.x
    local dy1 = current.y - prev.y
    local dx2 = next.x - current.x
    local dy2 = next.y - current.y
    
    local crossProduct = dx1 * dy2 - dy1 * dx2
    
    if crossProduct < 0 then
        return false
    end
    
    -- Check if any other vertex is inside this triangle
    for i, vertex in ipairs(polygon) do
        local checkPrevIndex = (vertexIndex == 1) and vertexCount or (vertexIndex - 1)
        
        if i ~= checkPrevIndex and i ~= vertexIndex then
            local checkNextIndex = (vertexIndex == vertexCount) and 1 or (vertexIndex + 1)
            
            if i ~= checkNextIndex then
                if IsPointInTriangle(vertex, prev, current, next) then
                    return false
                end
            end
        end
    end
    
    return true
end

-- Triangulate polygon using ear clipping algorithm
function TriangulatePolygon(polygon)
    local triangles = {}
    local vertexCount = #polygon
    
    if vertexCount < 3 then
        return triangles
    end
    
    -- If convex, simple fan triangulation
    if IsPolygonConvex(polygon) then
        for i = 2, vertexCount - 1, 1 do
            table.insert(triangles, {polygon[1], polygon[i], polygon[i + 1]})
        end
        return triangles
    end
    
    -- Ear clipping for concave polygons
    local remainingVertices = {}
    for i = 1, vertexCount, 1 do
        remainingVertices[i] = polygon[i]
    end
    
    while #remainingVertices > 3 do
        local earFound = false
        
        for i = 1, #remainingVertices, 1 do
            if IsEar(remainingVertices, i) then
                local prevIndex = (i == 1) and #remainingVertices or (i - 1)
                local nextIndex = (i == #remainingVertices) and 1 or (i + 1)
                
                local prev = remainingVertices[prevIndex]
                local current = remainingVertices[i]
                local next = remainingVertices[nextIndex]
                
                table.insert(triangles, {prev, current, next})
                table.remove(remainingVertices, i)
                earFound = true
                break
            end
        end
        
        if not earFound then
            print("Unable to triangulate polygon for debug drawing.")
            break
        end
    end
    
    if #remainingVertices == 3 then
        table.insert(triangles, {remainingVertices[1], remainingVertices[2], remainingVertices[3]})
    end
    
    return triangles
end

-- Ensure coordinates are in vector3 format
function EnsureVector3(coords)
    if type(coords) == "vector3" then
        return coords
    elseif type(coords) == "table" then
        return vector3(
            coords.x or coords[1],
            coords.y or coords[2],
            coords.z or coords[3]
        )
    else
        error("Invalid coordinate type, expected vector3 or table.")
    end
end

-- Remove zone from all tracking systems
function RemoveZone(zone)
    allZones[zone.id] = nil
    currentZones[zone.id] = nil
    
    for i, queuedZone in ipairs(enterQueue) do
        if queuedZone.id == zone.id then
            table.remove(enterQueue, i)
            break
        end
    end
    
    for i, queuedZone in ipairs(exitQueue) do
        if queuedZone.id == zone.id then
            table.remove(exitQueue, i)
            break
        end
    end
end

-- Draw polygon zone debug visualization
function DrawPolygonDebug(zone)
    if not zone.triangles then
        return
    end
    
    -- Draw filled triangles
    for _, triangle in ipairs(zone.triangles) do
        DrawPoly(
            triangle[1].x, triangle[1].y, triangle[1].z,
            triangle[2].x, triangle[2].y, triangle[2].z,
            triangle[3].x, triangle[3].y, triangle[3].z,
            zone.debugColour.r, zone.debugColour.g, zone.debugColour.b, zone.debugColour.a
        )
    end
    
    -- Draw outline
    for i = 1, #zone.polygon, 1 do
        local current = zone.polygon[i]
        local next = zone.polygon[(i % #zone.polygon) + 1]
        
        DrawLine(
            current.x, current.y, current.z,
            next.x, next.y, next.z,
            zone.debugColour.r, zone.debugColour.g, zone.debugColour.b, 255
        )
    end
end

-- Draw sphere zone debug visualization
function DrawSphereDebug(zone)
    DrawMarker(
        28,
        zone.coords.x, zone.coords.y, zone.coords.z,
        0, 0, 0,
        0, 0, 0,
        zone.radius, zone.radius, zone.radius,
        zone.debugColour.r, zone.debugColour.g, zone.debugColour.b, zone.debugColour.a,
        false, false, 2, false, nil, nil, false
    )
end

-- Check if point is inside polygon zone
function PolygonContainsPoint(zone, point)
    point = EnsureVector3(point)
    return IsPointInPolygon(zone.polygon, point)
end

-- Check if point is inside sphere zone
function SphereContainsPoint(zone, point)
    point = EnsureVector3(point)
    local distance = #(zone.coords - point)
    return distance < zone.radius
end

-- Enable/disable debug visualization for zone
function SetZoneDebug(zone, enabled, color)
    if not enabled then
        zone.debugColour = nil
        zone.triangles = nil
        zone.debug = nil
        currentZones[zone.id] = nil
        return
    end
    
    zone.debugColour = {
        r = (color and color.r) or 255,
        g = (color and color.g) or 42,
        b = (color and color.b) or 24,
        a = (color and color.a) or 100
    }
    
    if zone.type == "sphere" then
        zone.debug = DrawSphereDebug
    elseif zone.type == "box" or zone.type == "poly" then
        zone.triangles = TriangulatePolygon(zone.polygon)
        zone.debug = DrawPolygonDebug
    end
end

-- Main zone update thread
CreateThread(function()
    while true do
        local waitTime = 300
        local playerCoords = GetEntityCoords(WSB.cache.ped)
        
        for zoneId, zone in pairs(allZones) do
            zone.distance = #(zone.coords - playerCoords)
            local isInside = zone:contains(playerCoords)
            
            if isInside then
                if not zone.insideZone then
                    zone.insideZone = true
                    
                    if zone.onEnter then
                        table.insert(enterQueue, zone)
                    end
                    
                    if zone.inside then
                        currentZones[zone.id] = zone
                    end
                end
            else
                if zone.insideZone then
                    zone.insideZone = false
                    currentZones[zone.id] = nil
                    
                    if zone.onExit then
                        table.insert(exitQueue, zone)
                    end
                end
            end
            
            -- Handle debug rendering
            if zone.debug then
                if type(zone.debug) == "function" then
                    waitTime = 0
                    zone:debug()
                else
                    zone:setDebug(true, zone.debugColour or nil)
                end
            end
        end
        
        -- Process enter queue (sorted by distance - closest first)
        if #enterQueue > 0 then
            table.sort(enterQueue, function(a, b)
                return a.distance < b.distance
            end)
            
            for _, zone in ipairs(enterQueue) do
                if zone.onEnter then
                    zone.onEnter(zone)
                end
            end
            
            enterQueue = {}
        end
        
        -- Process exit queue (sorted by distance - farthest first)
        if #exitQueue > 0 then
            table.sort(exitQueue, function(a, b)
                return a.distance > b.distance
            end)
            
            for _, zone in ipairs(exitQueue) do
                if zone.onExit then
                    zone.onExit(zone)
                end
            end
            
            exitQueue = {}
        end
        
        -- Call inside callback for all zones player is currently in
        for _, zone in pairs(currentZones) do
            if zone.inside then
                zone.inside(zone)
            end
        end
        
        Wait(waitTime)
    end
end)

-- Create polygon zone
function WSB.zones.poly(zoneData)
    zoneData.id = #allZones + 1
    zoneData.thickness = zoneData.thickness or 4
    
    -- Convert points to vector3
    local polygon = {}
    for _, point in ipairs(zoneData.points) do
        table.insert(polygon, EnsureVector3(point))
    end
    zoneData.polygon = polygon
    
    zoneData.coords = CalculatePolygonCenter(zoneData.polygon)
    zoneData.type = "poly"
    
    zoneData.remove = function(self)
        RemoveZone(self)
    end
    
    zoneData.contains = function(self, point)
        return PolygonContainsPoint(self, point)
    end
    
    zoneData.setDebug = function(self, enabled, color)
        SetZoneDebug(self, enabled, color)
    end
    
    allZones[zoneData.id] = zoneData
    return zoneData
end

-- Create box zone
function WSB.zones.box(zoneData)
    zoneData.id = #allZones + 1
    zoneData.coords = EnsureVector3(zoneData.coords)
    
    local size = (zoneData.size and EnsureVector3(zoneData.size)) or vector3(2, 2, 2)
    local halfWidth = size.x / 2
    local halfLength = size.y / 2
    
    zoneData.rotation = zoneData.rotation or 0
    local rotationRad = math.rad(zoneData.rotation)
    
    -- Create unrotated corner points
    local corners = {
        vector3(halfWidth, halfLength, 0),
        vector3(-halfWidth, halfLength, 0),
        vector3(-halfWidth, -halfLength, 0),
        vector3(halfWidth, -halfLength, 0)
    }
    
    -- Rotate and translate corners
    local polygon = {}
    for _, corner in ipairs(corners) do
        local rotatedX = corner.x * math.cos(rotationRad) - corner.y * math.sin(rotationRad)
        local rotatedY = corner.x * math.sin(rotationRad) + corner.y * math.cos(rotationRad)
        
        table.insert(polygon, vector3(
            rotatedX + zoneData.coords.x,
            rotatedY + zoneData.coords.y,
            zoneData.coords.z
        ))
    end
    
    zoneData.polygon = polygon
    zoneData.type = "box"
    
    zoneData.remove = function(self)
        RemoveZone(self)
    end
    
    zoneData.contains = function(self, point)
        return PolygonContainsPoint(self, point)
    end
    
    zoneData.setDebug = function(self, enabled, color)
        SetZoneDebug(self, enabled, color)
    end
    
    allZones[zoneData.id] = zoneData
    return zoneData
end

-- Create sphere zone
function WSB.zones.sphere(zoneData)
    zoneData.id = #allZones + 1
    zoneData.coords = EnsureVector3(zoneData.coords)
    zoneData.radius = zoneData.radius or 2
    zoneData.type = "sphere"
    
    zoneData.remove = function(self)
        RemoveZone(self)
    end
    
    zoneData.contains = function(self, point)
        return SphereContainsPoint(self, point)
    end
    
    zoneData.setDebug = function(self, enabled, color)
        SetZoneDebug(self, enabled, color)
    end
    
    allZones[zoneData.id] = zoneData
    return zoneData
end

-- Get all registered zones
function WSB.zones.getAllZones()
    return allZones
end

-- Get zones player is currently inside
function WSB.zones.getCurrentZones()
    return currentZones
end