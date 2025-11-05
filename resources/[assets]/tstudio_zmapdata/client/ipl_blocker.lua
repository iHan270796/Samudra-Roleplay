-- TStudio IPL Blocker
-- Disables/removes specific interiors and IPLs based on configuration
-- Only processes interiors for active resources reported by server

-- Process interiors for a specific resource configuration
function processInteriors(interiorList)
    for i = 1, #interiorList do
        local interior = interiorList[i]
        
        if interior.enabled then
            -- Try to get interior by coordinates and type
            local interiorId = GetInteriorAtCoordsWithType(
                interior.coords.x, 
                interior.coords.y, 
                interior.coords.z, 
                interior.name
            )
            
            if interiorId and interiorId ~= 0 then
                -- Disable and unpin the interior
                DisableInterior(interiorId, true)
                UnpinInterior(interiorId)
                TStudioUtils.Debug(string.format(
                    "^1[TStudio IPL BLOCKER]^7 Successfully disabled interior %s (ID: %d)", 
                    interior.name, 
                    interiorId
                ))
            else
                -- Fallback to IPL removal if interior not found
                local iplName = interior.ipl or interior.name
                
                if IsIplActive(iplName) then
                    RemoveIpl(iplName)
                    TStudioUtils.Debug(string.format(
                        "^1[TStudio IPL BLOCKER]^7 Successfully removed IPL %s at %s", 
                        iplName, 
                        interior.coords
                    ))
                else
                    -- Debug message for failed attempts
                    if Config.Debug then
                        TStudioUtils.Debug(string.format(
                            "^1[TStudio IPL BLOCKER]^7 Failed to find interior %s or IPL %s at %s", 
                            interior.name, 
                            iplName, 
                            interior.coords
                        ))
                    end
                end
            end
        else
            -- Debug message for disabled interiors
            if Config.Debug then
                TStudioUtils.Debug(string.format(
                    "^3[TStudio IPL BLOCKER]^7 Skipping disabled interior %s at %s", 
                    interior.name or "unknown", 
                    interior.coords
                ))
            end
        end
    end
end

-- Track if interiors have already been processed
local interiorsProcessed = false

-- Process interiors for active resources only
function processActiveResourceInteriors(activeResources)
    -- Prevent duplicate processing
    if interiorsProcessed then
        TStudioUtils.Debug("^3[TStudio IPL BLOCKER]^7 Interiors already processed, skipping...")
        return
    end
    
    -- Validate input
    if not activeResources or #activeResources == 0 then
        TStudioUtils.Debug("^2[TStudio IPL BLOCKER]^7 No active resources reported by server, not processing any interiors.")
        return
    end
    
    TStudioUtils.Debug("^2[TStudio IPL BLOCKER]^7 Processing interiors for active resources only...")
    
    -- Process each active resource
    for _, resourceName in ipairs(activeResources) do
        local resourceInteriors = Config.Interiors[resourceName]
        
        if resourceInteriors then
            TStudioUtils.Debug(string.format(
                "^2[TStudio IPL BLOCKER]^7 Processing interiors for resource: %s", 
                resourceName
            ))
            processInteriors(resourceInteriors)
        else
            TStudioUtils.Debug(string.format(
                "^3[TStudio IPL BLOCKER]^7 Resource %s not found in config, skipping", 
                resourceName
            ))
        end
    end
    
    -- Mark as processed
    interiorsProcessed = true
    TStudioUtils.Debug("^2[TStudio IPL BLOCKER]^7 Interior blocking process completed")
end

-- Register network event for resources ready notification
RegisterNetEvent("tstudio_zmapdata:resourcesReady", function(activeResources)
    TStudioUtils.Debug("^2[TStudio IPL BLOCKER]^7 Received resources ready notification from server")
    processActiveResourceInteriors(activeResources)
end)