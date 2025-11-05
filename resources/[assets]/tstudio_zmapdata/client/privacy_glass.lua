-- TStudio Privacy Glass Toggle System
-- Allows players to toggle privacy glass on/off in configured locations
-- Uses markers and help text to guide player interaction

-- Current privacy glass state
local privacyGlassState = "off"

-- Toggle privacy glass function
function togglePrivacyGlass()
    -- Get player's current interior
    local interior = GetInteriorFromEntity(PlayerPedId())
    
    -- Only work if player is inside an interior
    if interior == 0 then
        return
    end
    
    -- Toggle the state
    if privacyGlassState == "off" then
        privacyGlassState = "on"
    else
        privacyGlassState = "off"
    end
    
    -- Send toggle request to server
    TriggerServerEvent("privacy_glass:toggleGlass", privacyGlassState)
end

-- Main thread for privacy glass interaction
Citizen.CreateThread(function()
    local helpText = "Press ~INPUT_CONTEXT~ to toggle privacy glass"
    local helpTextShown = false
    
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local nearSwitch = false
        
        -- Check all configured privacy switch positions
        for _, switchPosition in pairs(Config.PrivacySwitch.positions) do
            local distance = #(playerCoords - switchPosition)
            
            -- Draw marker if player is within 5.0 units
            if distance < 5.0 then
                DrawMarker(
                    Config.PrivacySwitch.marker.type,    -- Marker type
                    switchPosition.x,                     -- X position
                    switchPosition.y,                     -- Y position
                    switchPosition.z,                     -- Z position
                    0.0, 0.0, 0.0,                       -- Direction
                    0.0, 0.0, 0.0,                       -- Rotation
                    0.6, 0.6, 0.6,                       -- Scale
                    Config.PrivacySwitch.marker.r,       -- Red
                    Config.PrivacySwitch.marker.g,       -- Green
                    Config.PrivacySwitch.marker.b,       -- Blue
                    Config.PrivacySwitch.marker.alpha,   -- Alpha
                    false,                               -- Bob up and down
                    true,                                -- Face camera
                    2,                                   -- Rotate
                    false,                               -- Texture dict
                    nil,                                 -- Texture name
                    false                                -- Draw on entities
                )
            end
            
            -- Check if player is within interaction range
            if distance < Config.PrivacySwitch.range then
                -- Show help text if not already shown
                if not helpTextShown then
                    AddTextEntry("HelpNotify", helpText)
                    helpTextShown = true
                end
                
                -- Display help text
                DisplayHelpTextThisFrame("HelpNotify", false)
                
                -- Check for interaction key press (E key)
                if IsControlJustReleased(0, 38) then
                    togglePrivacyGlass()
                end
                
                nearSwitch = true
            end
        end
        
        -- Reset help text flag if not near any switch
        if not nearSwitch then
            helpTextShown = false
        end
        
        -- No wait to ensure smooth interaction
        Citizen.Wait(0)
    end
end)