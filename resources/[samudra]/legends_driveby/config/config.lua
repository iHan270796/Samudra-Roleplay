Config = {}

Config.Debug = false -- Enable debug prints in F8 console to track distance checks and exit reasons
Config.MaxDistance = 1.7 -- Maximum distance allowed from vehicle in driveby mode. Players will be automatically exited from driveby if they exceed this distance
Config.MaxExceedCount = 3 -- Number of consecutive distance violations before kicking (prevents physics glitch kicks). Higher = more tolerant to lag/bumps

Config.Settings = {
    EnableCommand = true, -- Enables the command "GetVehicleHash" used to get the vehicle hash the player is in
    Keybind = 'G',
    DefaultSettings = {
        { -- Seat 2
            Offset = {xPos = 0.0+0.9, yPos = 0.0+0.1, zPos = 0.0+0.7},
            Rotation = {xRot = 0.0, yRot = 30.0, zRot = 10.0}
        },
        { -- Seat 3
            Offset = {xPos = 0.0-0.8, yPos = 0.0-0.68, zPos = 0.0+0.8},
            Rotation = {xRot = 0.0, yRot = -30.0, zRot = 0.0}
        },
        { -- Seat 4
            Offset = {xPos = 0.0+0.9, yPos = 0.0-0.68, zPos = 0.0+0.7},
            Rotation = {xRot = 0.0, yRot = 30.0, zRot = 0.0}
        }
    }
}

Config.Vehicles = { -- Settings for specific vehicle (right wheeled vehicles, cars with different shaped windows etc.)
    { -- rx7
        CarHash = -285576169,
        { -- Seat 2
            Offset = {xPos = 0.0-0.8, yPos = 0.0-.38, zPos = 0.0+0.4},
            Rotation = {xRot = 0.0, yRot = -30.0, zRot = 0.0}
        }
    },
    { -- animfk8hr
        CarHash = 626972477,
        { -- Seat 2
            Offset = {xPos = 0.0-0.8, yPos = 0.0-.18, zPos = 0.0+1.0},
            Rotation = {xRot = 0.0, yRot = -30.0, zRot = 0.0}
        },
        { -- Seat 3
            Offset = {xPos = 0.0+0.9, yPos = 0.0-0.9, zPos = 0.0+1},
            Rotation = {xRot = 0.0, yRot = 30.0, zRot = 0.0}
        },
        { -- Seat 4
            Offset = {xPos = 0.0-0.9, yPos = 0.0-0.9, zPos = 0.0+1},
            Rotation = {xRot = 0.0, yRot = -30.0, zRot = 0.0}
        }
    }
}

Config.GlobalSettings = true -- If true, driveby would be able to be used in all vehicles, if false only whitelisted vehicles would be able to use driveby
Config.WhitelistMode = true -- True will only allow whitelisted vehicles to use driveby, false will allow all vehicles except blacklisted vehicles to use driveby
Config.WhitelistedVehicles = {
    626972477, -- animfk8hr
    -285576169, -- rx7
    -664141241 -- krieger
}
Config.BlacklistedVehicles = {
    -- Add vehicle hashes here
}