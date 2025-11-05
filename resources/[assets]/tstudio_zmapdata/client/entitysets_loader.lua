-- TStudio Entity Sets Manager
-- Manages interior entity sets activation/deactivation based on configuration

-- Get entity sets configuration from Config or initialize empty table
local entitySetsConfig = Config.EntitySets or {}

-- Apply entity sets for a specific interior configuration
function applyEntitySets(config)
    -- Validate configuration - must have coords and ipl
    if not config or not config.coords or not config.ipl then
        TStudioUtils.Debug("^1[TStudio ENTITY SETS]^7 Invalid configuration. Skipping...")
        return
    end
    
    -- Request the IPL first
    RequestIpl(config.ipl)
    
    -- Create thread to handle entity set application
    Citizen.CreateThread(function()
        -- Wait for IPL to be active before proceeding
        while not IsIplActive(config.ipl) do
            Citizen.Wait(1000)
        end
        
        -- Get interior at the specified coordinates
        local interior = GetInteriorAtCoords(config.coords.x, config.coords.y, config.coords.z)
        
        -- Validate that we have a valid interior
        if IsValidInterior(interior) then
            -- Process each entity set in the configuration
            for _, entitySet in ipairs(config.entitySets or {}) do
                if entitySet.enable then
                    -- Activate the entity set
                    ActivateInteriorEntitySet(interior, entitySet.name)
                else
                    -- Deactivate the entity set
                    DeactivateInteriorEntitySet(interior, entitySet.name)
                end
            end
            
            -- Refresh interior to apply all changes
            RefreshInterior(interior)
            TStudioUtils.Debug(string.format("^2[TStudio ENTITY SETS]^7 Applied entity sets for '%s'", config.name))
        else
            TStudioUtils.Debug(string.format("^1[TStudio ENTITY SETS]^7 Invalid interior for '%s'", config.name))
        end
    end)
end

-- Initialize all configured entity sets
for _, entitySetConfig in ipairs(entitySetsConfig) do
    applyEntitySets(entitySetConfig)
end
