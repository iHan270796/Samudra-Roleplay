-- TStudio Server Event Handlers
-- Handles resource state checking and privacy glass toggle functionality
-- Server-side events for client-server communication

-- Event: Check Resource State
-- Checks if a resource is running and returns its state to the client
RegisterNetEvent("checkResourceState", function(resourceName)
    local resourceState = GetResourceState(resourceName)
    TriggerClientEvent("receiveResourceState", source, resourceName, resourceState)
end)

-- Event: Privacy Glass Toggle (Server)
-- Receives toggle request from client and broadcasts to all clients
RegisterNetEvent("privacy_glass:toggleGlass", function(glassState)
    TriggerClientEvent("privacy_glass:updateGlass", -1, glassState)
end)

-- Event: Privacy Glass Update (Client)
-- Updates the privacy glass entity sets based on the requested state
RegisterNetEvent("privacy_glass:updateGlass", function(glassState)
    -- Get player's current interior
    local interior = GetInteriorFromEntity(PlayerPedId())
    
    -- Only proceed if player is inside an interior
    if interior == 0 then
        return
    end
    
    -- Load and wait for interior to be ready
    LoadInterior(interior)
    while not IsInteriorReady(interior) do
        Citizen.Wait(50)
    end
    
    -- Get entity set names from configuration
    local entitySetA = Config.PrivacySwitch.entitySetA
    local entitySetB = Config.PrivacySwitch.entitySetB
    
    if glassState == "on" then
        -- Turn privacy glass ON
        -- Deactivate entity set A if active
        if IsInteriorEntitySetActive(interior, entitySetA) then
            DeactivateInteriorEntitySet(interior, entitySetA)
        end
        -- Activate entity set B (privacy on)
        ActivateInteriorEntitySet(interior, entitySetB)
    else
        -- Turn privacy glass OFF
        -- Deactivate entity set B if active
        if IsInteriorEntitySetActive(interior, entitySetB) then
            DeactivateInteriorEntitySet(interior, entitySetB)
        end
        -- Activate entity set A (privacy off)
        ActivateInteriorEntitySet(interior, entitySetA)
    end
    
    -- Refresh interior to apply changes
    RefreshInterior(interior)
end)