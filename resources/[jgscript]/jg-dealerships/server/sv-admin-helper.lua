-- Admin Helper Commands for JG-Dealerships
-- This file provides commands to manage admin permissions

-- Command to grant admin permission to a player
RegisterCommand("jg-makeadmin", function(source, args, rawCommand)
    -- Only allow console to run this command
    if source ~= 0 then
        print("This command can only be run from the server console")
        return
    end
    
    local targetId = tonumber(args[1])
    if not targetId then
        print("Usage: jg-makeadmin [player_id]")
        return
    end
    
    -- Get player identifiers
    local identifiers = GetPlayerIdentifiers(targetId)
    if not identifiers then
        print("Player not found")
        return
    end
    
    -- Find the license identifier
    local license = nil
    for _, id in ipairs(identifiers) do
        if string.match(id, "license:") then
            license = id
            break
        end
    end
    
    if license then
        -- Add ACE permission for this player
        ExecuteCommand(string.format("add_ace identifier.%s command allow", license))
        ExecuteCommand(string.format("add_ace identifier.%s admin allow", license))
        print(string.format("[JG-Dealerships] Admin permissions granted to player %d (license: %s)", targetId, license))
        
        -- Notify the player
        TriggerClientEvent("jg-dealerships:client:notify", targetId, "You have been granted admin permissions!", "success", 5000)
    else
        print("Could not find license identifier for player")
    end
end, true)

-- Command to check if a player has admin permissions
RegisterCommand("jg-checkadmin", function(source, args, rawCommand)
    local targetId = source
    
    -- If run from console, check specified player
    if source == 0 then
        targetId = tonumber(args[1])
        if not targetId then
            print("Usage: jg-checkadmin [player_id]")
            return
        end
    end
    
    local isAdmin = Framework.Server.IsAdmin(targetId)
    
    if source == 0 then
        print(string.format("[JG-Dealerships] Player %d admin status: %s", targetId, tostring(isAdmin)))
    else
        TriggerClientEvent("jg-dealerships:client:notify", source, 
            string.format("Your admin status: %s", tostring(isAdmin)), 
            isAdmin and "success" or "error", 
            5000
        )
    end
end, false)

-- Command to temporarily bypass admin check (DEVELOPMENT ONLY)
RegisterCommand("jg-bypassadmin", function(source, args, rawCommand)
    -- Only allow console to run this command
    if source ~= 0 then
        print("This command can only be run from the server console")
        return
    end
    
    local enable = args[1] == "true" or args[1] == "1" or args[1] == "on"
    
    -- Store bypass state globally
    _G.JG_ADMIN_BYPASS = enable
    
    print(string.format("[JG-Dealerships] Admin bypass %s", enable and "ENABLED" or "DISABLED"))
    print("WARNING: This should only be used for development/testing!")
end, true)

print("[JG-Dealerships] Admin helper commands loaded:")
print("  - jg-makeadmin [player_id] - Grant admin permissions (console only)")
print("  - jg-checkadmin [player_id] - Check admin status")
print("  - jg-bypassadmin [true/false] - Enable/disable admin bypass (console only)")
