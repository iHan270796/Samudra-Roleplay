Config = {}

-- Banking System Selection
Config.BankingSystem = "renewed-banking"  -- Options: "dw-banking", "qb-banking", "renewed-banking"

-- Target Sysytem Selection
Config.TargetSystem = "ox_target"  -- Options: "qb-target", "ox_target"

-- Job Application System Settings
Config.EnableApplicationSystem = false  -- Set to false to disable job application system


-- Management access locations
Config.Locations = {
    ["police"] = {
        label = "Police Department",
        logoImage = "police.png",
        locations = {
            {
                coords = vector3(461.46, -986.17, 30.64), -- Main Police Station
                width = 1.0,
                length = 1.0,
                heading = 0,
                minZ = 32.0,
                maxZ = 38.0,
            }
        }
    },
    ["ambulance"] = {
        label = "EMS Department",
        logoImage = "ems.png",
        locations = {
            {
                coords = vector3(1145.68, -1559.98, 35.09), -- Main Hospital
                width = 1.0,
                length = 1.0,
                heading = 0,
                minZ = 32.0,
                maxZ = 36.0,
            }
        }
    },
    ["mechanic"] = {
        label = "Mechanic Shop",
        logoImage = "mechanic.png",
        locations = {
            {
                coords = vector3(20.69, 6534.7, 31.52), -- Mechanic Shop
                width = 1.0,
                length = 1.0,
                heading = 0,
                minZ = 29.0,
                maxZ = 35.0,
            }
        }
    },
    ["bahamas"] = {
        label = "Bahamas",
        logoImage = "burgershot.png",
        locations = {
            {
                coords = vector3(-1365.99, -622.48, 30.2), -- Mechanic Shop
                width = 1.0,
                length = 1.0,
                heading = 0,
                minZ = 28.0,
                maxZ = 32.0,
            }
        }
    },
    ["pemerintah"] = {
        label = "Pemerintah",
        logoImage = "police.png",
        locations = {
            {
                coords = vector3(1757.1, 3638.98, 34.09), -- Mechanic Shop
                width = 1.0,
                length = 1.0,
                heading = 0,
                minZ = 32.0,
                maxZ = 36.0,
            }
        }
    }
    -- Add more jobs as needed
}

Config.ApplicationPoints = {
    ["police"] = {
        coords = vector3(87.81, -402.58, 42.05),  -- Near the police station
        width = 1.0,
        length = 1.0,
        heading = 0,
        minZ = 40.0,
        maxZ = 44.0,
        label = "Police Application"
    },
    ["ambulance"] = {
        coords = vector3(1145.68, -1559.98, 35.09),  -- Near the hospital
        width = 1.0,
        length = 1.0,
        heading = 0,
        minZ = 20.0,
        maxZ = 25.0,
        label = "EMS Application"
    },
    ["mechanic"] = {
        coords = vector3(835.92, -912.54, 25.25),  -- Near the mechanic shop
        width = 1.0,
        length = 1.0,
        heading = 0,
        minZ = 25.0,
        maxZ = 26.0,
        label = "Mechanic Application"
    },
    -- Add more points as needed
}

-- Define application form questions (these will be shown in the application form)
Config.ApplicationQuestions = {
    ["police"] = {
        {
            question = "Why do you want to join the Police Department?",
            type = "text",
            required = true,
            min = 1,
            max = 1024
        },
        {
            question = "Do you have any previous law enforcement experience?",
            type = "select",
            options = {"Yes", "No"},
            required = true
        },
        {
            question = "How many years of experience do you have?",
            type = "number",
            required = false,
            min = 0,
            max = 50
        },
        {
            question = "How would you handle a high-stress situation?",
            type = "text",
            required = true,
            min = 1,
            max = 1024
        }
    },
    ["ambulance"] = {
        {
            question = "Why do you want to join the Ems?",
            type = "text",
            required = true,
            min = 1,
            max = 1024
        },
        {
            question = "Do you have any previous law enforcement experience?",
            type = "select",
            options = {"Yes", "No"},
            required = true
        },
        {
            question = "How many years of experience do you have?",
            type = "number",
            required = false,
            min = 0,
            max = 50
        },
        {
            question = "How would you handle a high-stress situation?",
            type = "text",
            required = true,
            min = 1,
            max = 1024
        }
    }
}

-- Default settings
Config.DefaultSettings = {
    darkMode = true,
    showAnimations = true,
    compactView = false,
    notificationSound = "default",
    themeColor = "blue",
    refreshInterval = 60,
    showPlaytime = true,
    showLocation = true
}
