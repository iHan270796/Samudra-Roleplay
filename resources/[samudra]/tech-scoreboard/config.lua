Config = {}

-- Framework Configuration
Config.Framework = 'qb-core' -- 'auto', 'qb-core', 'esx', 'standalone'
Config.FrameworkName = 'QBCore' -- Display name for the framework

-- Scoreboard Configuration
Config.MaxPlayers = 64
Config.RefreshTime = 5000 -- Refresh every 5 seconds
Config.Debug = false -- Enable/disable debug output
Config.Keybind = 'F10' -- Key to open/close scoreboard
-- Available options: 'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'F10', 'F11', 'F12'
--                   'TAB', 'ENTER', 'ESC', 'SPACE', 'LSHIFT', 'RSHIFT', 'LCTRL', 'RCTRL'
--                   'LALT', 'RALT', 'CAPITAL', 'NUMPAD0' through 'NUMPAD9'
--                   Any other FiveM key name (see FiveM documentation for full list)

-- Job Configuration
-- Note: Only jobs with active players (count > 0) will be displayed in the scoreboard
-- Jobs with 0 players will be automatically hidden

-- Job Type Grouping Configuration
-- When enabled, jobs with the same 'type' field from QBCore shared jobs will be grouped together
Config.JobTypeGrouping = {
    enabled = false, -- Set to true to enable job type grouping
    fallbackToIndividual = false, -- If a job type doesn't have a group config, show individual jobs
    groupConfigs = {
        ['mechanic'] = {
            label = 'Mekanik',
            color = '#F59E0B',
            icon = 'wrench'
        },
        ['police'] = {
            label = 'Polisi',
            color = '#3B82F6',
            icon = 'shield'
        },
        ['pemerintah'] = {
            label = 'Pemerintah',
            color = '#FF8800',
            icon = 'shield'
        }
    }
}

Config.Jobs = {
    ['police'] = {
        label = 'Polisi',
        color = '#3B82F6',
        icon = 'shield'
    },
    ['ambulance'] = {
        label = 'Medis',
        color = '#EF4444',
        icon = 'heart'
    },
    ['mechanic'] = {
        label = 'Mekanik',
        color = 'FFF5DA0B',
        icon = 'wrench'
    },
    ['bahamas'] = {
        label = 'Bahamas',
        color = 'FF7CF50B',
        icon = 'utensils'
    },
    ['pemerintah'] = {
        label = 'Pemerintah',
        color = '#FF8800',
        icon = 'building-ngo'
    },
    ['unemployed'] = {
        label = 'Pengangguran',
        color = '#6B7280',
        icon = 'user'
    }
}



-- Server Information
Config.ServerInfo = {
    name = 'Samudra Roleplay',
    description = 'Kota Ringan Fitur Menarik'
}

-- Discord Configuration
Config.Discord = {
    enabled = true,
    botToken = GetConvar('scoreboard_discord_token', ''), -- Load from server.cfg
    guildId = GetConvar('scoreboard_discord_guild', ''), -- Load from server.cfg
    showAvatars = true,
    showRoles = true,
    cacheTime = 300000 -- Cache Discord data for 5 minutes
}

-- Robbery Availability System
Config.RobberySettings = {
    showUnavailableRobberies = true, -- Set to false to hide robberies when not available
    showNoRobberiesMessage = true, -- Show message when no robberies are available
    updateInterval = 5000 -- How often to update robbery availability (milliseconds)
}

Config.RobberyTypes = {
    -- ['car'] = {
    --     label = 'Car Theft',
    --     icon = 'fas fa-car',
    --     color = '#FF6B6B',
    --     minPolice = 1 -- Minimum police required for availability
    -- },
    -- ['house'] = {
    --     label = 'House Robbery',
    --     icon = 'fas fa-home',
    --     color = '#4ECDC4',
    --     minPolice = 3
    -- },
    ['bank'] = {
        label = 'Bank Heist',
        icon = 'fas fa-university',
        color = '#45B7D1',
        minPolice = 4
    },
    ['drug'] = {
        label = 'Atm',
        icon = 'fas fa-money-bills',
        color = '#96CEB4',
        minPolice = 3
    },
    ['store'] = {
        label = 'Store Robbery',
        icon = 'fas fa-store',
        color = '#FFEAA7',
        minPolice = 3
    },
    ['jewelry'] = {
        label = 'Jewelry Store',
        icon = 'fas fa-gem',
        color = '#DDA0DD',
        minPolice = 4
    }
}

-- Player Visibility Options
Config.PlayerVisibility = {
    hidePlayers = false, -- Set to true to hide all players
    hidePlayerNames = false, -- Set to true to hide player names (show as "Player #ID")
    hideOfflinePlayers = false, -- Hide players with 0 ping (temporarily disabled for debugging)
    showOnlyPolice = false, -- Show only police officers
    showOnlySpecificJobs = {}, -- Array of job names to show only (e.g., {'police', 'ambulance'})
    hideSpecificJobs = {'realestate'}, -- Array of job names to hide (e.g., {'unemployed'})
    allowPlayerHideToggle = true, -- Allow players to hide their own name and job
    showHideButton = true -- Show/hide the "Hide My Info" button in the scoreboard header
}

-- Layout Configuration
Config.Layout = {
    -- Grid layout options
    gridLayout = '4x4', -- 'auto', '2x2', '3x3', '4x4', 'custom'
    customGrid = {rows = 3, cols = 3}, -- Used when gridLayout is 'custom'
    
    -- Player list layout
    playerListLayout = 'grid', -- 'list', 'grid', 'compact'
    playersPerRow = 4, -- For grid layout
    compactMode =   false, -- Show players in compact cards
    
    -- Size options
    scoreboardSize = 'fullscreen', -- 'small', 'medium', 'large', 'fullscreen'
    maxHeight = '80vh', -- Maximum height of scoreboard
    maxWidth = '1200px', -- Maximum width of scoreboard
    
    -- Responsive settings
    responsive = true, -- Enable responsive design
    mobileLayout = 'grid' -- 'compact', 'list', 'grid' for mobile devices
}

