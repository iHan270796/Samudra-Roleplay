-- TStudio Utilities
-- Debug utility functions for TStudio resources
-- Provides conditional debug output based on configuration

-- Initialize TStudioUtils table
TStudioUtils = {}

-- Debug function - only prints if Config.Debug is enabled
function TStudioUtils.Debug(message)
    -- Only output debug messages if debug mode is enabled in config
    if not Config.Debug then
        return
    end
    
    -- Print the debug message
    print(message)
end