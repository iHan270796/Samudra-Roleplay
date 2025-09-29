
Config = {}

Config.WaitTime = 4000 -- This will set the time for the ProgressBar | 1000 = 1 second

Config.UseLanguage = "en" -- make new languages to your own likng

Config.UseSoundEffect = false -- makes a sound when you use elevator Note: still a work in progress

Config.Elevator = {
    [1] = {
        Sound = "LiftSoundBellRing",
        name = "Apartments", -- it should be different for each elevator you make
        locations = {
            vector3(-659.2011, -1111.356, 15.2),
            vector3(-655.7241, -1111.48, 22.0),
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(-658.845, -1110.279, 15.063224, 60.813488),
            },
            [1] = {
                Coords = vector4(-655.6077, -1110.514, 21.834331, 68.611686),
            },
        }
    },
    [2] = {
        Sound = "LiftSoundBellRing",
        name = "VineWoodPolice", -- it should be different for each elevator you make
        locations = {
            vector3(614.03112, -13.07026, 83.019737),
            vector3(611.2611, -11.97273, 82.995719),
            vector3(611.2918, -12.14775, 87.274009),
            vector3(614.07141, -13.19764, 87.266593),
            vector3(612.53283, -17.43825, 91.774757)
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(614.30505, -14.78626, 82.763526, 335.74468),
            },
            [1] = {
                Coords = vector4(614.24542, -14.89499, 87.053642, 338.45019),
            },
            [2] = {
                Coords = vector4(612.80151, -19.37052, 91.537811, 340.91256),
            },
        }
    },
    [3] = {
        Sound = "LiftSoundBellRing",
        name = "ambulance", -- it should be different for each elevator you make
        locations = {
            vector3(329.96, -602.68, 43.10),
            vector3(338.29, -583.76, 74.12),
            -- vector3(329.96, -602.68, 43.62),
            -- vector3(-467.79, -1026.23, 38.28)
        },
        -- everything above is related to interaction
        Floors = {
            [0] = {
                Coords = vector4(332.32, -595.68, 43.28, 80.22),
            },
            [1] = {
                Coords = vector4(338.32, -584.41, 74.16, 248.54),
            },
            [2] = {
                Coords = vector4(-457.13, -978.88, 34.44, 95.25),
            },
            -- [3] = {
            --     Coords = vector4(-457.13, -978.88, 34.44, 95.25),
            -- },
        }
    },
    [4] = {
        Sound = "LiftSoundBellRing",
        name = "cuciuang", -- it should be different for each elevator you make
        locations = {
            vector3(1137.92, -3199.15, -39.67),
            vector3(-264.14, 2196.38, 130.4),
        },
        -- everything above is related to interaction
        Floors = {
            [1] = {
                Coords = vector4(-264.14, 2196.38, 130.4, 239.92),
            },
            [2] = {
                Coords = vector4(1137.95, -3199.16, -39.67, 1.03),
            },
        }
    },
    [5] = {
        Sound = "LiftSoundBellRing",
        name = "bahamas", -- it should be different for each elevator you make
        locations = {
            vector3(-815.25, -691.63, 27.83),
            vector3(-814.34, -682.49, 122.95),
        },
        -- everything above is related to interaction
        Floors = {
            [1] = {
                Coords = vector4(-813.44, -692.48, 28.06, 270.86),
            },
            [11] = {
                Coords = vector4(-815.7, -683.5, 123.42, 273.6),
            },
        }
    },
}





Config.Locals = {
    ["en"] = {
        Waiting = "Waiting for the Elevator...",
        Restricted = "Access Restricted!",
        CurrentFloor = "Current Floor: ",
        Unable = "You Can't Use The Elevator...",
    },
}
