return {
    checkInCost = 2000, -- Price for using the hospital check-in system
    minForCheckIn = 2, -- Minimum number of people with the ambulance job to prevent the check-in system from being used

    locations = { -- Various interaction points
        duty = {
            vec3(1139.41, -1537.24, 35.47),
            -- vec3(-254.88, 6324.5, 32.58),
        },
        pakaian = {
            vec3(1151.64, -1589.77, 35.35),
            vec3(1151.64, -1583.81, 35.71)
        },
        vehicle = {
            -- vec4(294.578, -574.761, 43.179, 35.79),
            -- vec4(-234.28, 6329.16, 32.15, 222.5),
        },
        helicopter = {
            -- vec4(351.58, -587.45, 74.16, 160.5),
            -- vec4(-475.43, 5988.353, 31.716, 31.34),
        },
        armory = {
            {
                shopType = 'AmbulanceArmory',
                name = 'Armory',
                groups = { ambulance = 0 },
                inventory = {
                    { name = 'radio', price = 15000 },
                    { name = 'weapon_flashlight', price = 0 },
                    { name = 'weapon_fireextinguisher', price = 0 },
                    { name = 'billing_tablet', price = 250000, },
			        { name = 'documents', price = 1500, },
			        { name = 'firstaid', price = 1500, },
			        { name = 'painkillers', price = 1500, },
			        { name = 'ifaks', price = 1500, },
			        { name = 'bandage', price = 1500, },
			        { name = 'tiket_oplas', price = 1500, },
			        { name = 'paramedicbag', price = 1500, }
                },
                locations = {
                    vec3(1140.38, -1563.6, 35.71)
                }
            }
        },
        roof = {
            vec3(0.0, 0.0, 0.0),
        },
        main = {
            vec3(0.0, 0.0, 0.0),
        },
        stash = {
            {
                name = 'ambulanceStash',
                label = 'Personal stash',
                weight = 4000000,
                slots = 50,
                groups = { ambulance = 0 },
                owner = true, -- Set to false for group stash
                location = vec3(1135.05, -1540.28, 35.68)
            }
        },

        ---@class Bed
        ---@field coords vector4
        ---@field model number

        ---@type table<string, {coords: vector3, checkIn?: vector3|vector3[], beds: Bed[]}>
        hospitals = {
            pillbox = {
                coords = vec3(1138.64, -1546.47, 35.33),
                checkIn = vec3(1138.64, -1546.47, 35.33),
                beds = {
                    {coords = vec4(1121.7, -1553.56, 35.9, 177.28), model = 1631638868},
                    {coords = vec4(1124.55, -1553.77, 35.9, 179.91), model = 1631638868},
                    {coords = vec4(1127.41, -1553.74, 35.9, 182.67), model = 1631638868},
                    {coords = vec4(1126.43, -1562.37, 35.9, 1.76), model = 1631638868},
                    {coords = vec4(1123.7, -1562.58, 35.9, 3.09), model = 1631638868},
                    {coords = vec4(1120.92, -1562.31, 35.9, 0.05), model = 1631638868},
                    {coords = vec4(1120.52, -1547.21, 35.9, 1.12), model = 1631638868},
                    {coords = vec4(1123.35, -1547.23, 35.9, 359.1), model = 1631638868},
                    {coords = vec4(1126.62, -1547.23, 35.9, 359.53), model = 1631638868},
                    {coords = vec4(1127.16, -1538.19, 35.9, 165.81), model = 1631638868},
                    {coords = vec4(1124.22, -1538.29, 35.9, 178.62), model = 1631638868},
                    {coords = vec4(1121.22, -1538.56, 35.9, 181.49), model = 1631638868},

                    {coords = vec4(1136.53, -1579.78, 36.29, 263.27), model = 920926379},
                    {coords = vec4(1137.77, -1573.6, 35.40, 271.56), model = -2000397202},
                    {coords = vec4(1147.18, -1576.18, 34.38, 89.99), model = 920926379},
                    -- {coords = vec4(-452.59, -996.52, 29.87, 89.31), model = 2117668672},
                    -- {coords = vec4(-452.63, -991.86, 29.87, 91.1), model = 2117668672},
                    -- {coords = vec4(-460.51, -991.17, 29.87, 264.41), model = 2117668672},
                    -- {coords = vec4(-460.39, -995.92, 29.87, 269.35), model = 2117668672},
                },
            },
            paleto = {
                coords = vec3(-250, 6315, 32),
                checkIn = vec3(-254.54, 6331.78, 32.43),
                beds = {
                    {coords = vec4(-252.43, 6312.25, 32.34, 313.48), model = 2117668672},
                    {coords = vec4(-247.04, 6317.95, 32.34, 134.64), model = 2117668672},
                    {coords = vec4(-255.98, 6315.67, 32.34, 313.91), model = 2117668672},
                },
            },
            jail = {
                coords = vec3(1761, 2600, 46),
                beds = {
                    {coords = vec4(1761.96, 2597.74, 45.66, 270.14), model = 2117668672},
                    {coords = vec4(1761.96, 2591.51, 45.66, 269.8), model = 2117668672},
                    {coords = vec4(1771.8, 2598.02, 45.66, 89.05), model = 2117668672},
                    {coords = vec4(1771.85, 2591.85, 45.66, 91.51), model = 2117668672},
                    {coords = vec4(1761.72, 2594.56, 45.66, 275.55), model = 2117668672},
                    {coords = vec4(1771.99, 2594.95, 45.66, 90.67), model = 2117668672},
                },
            },
        },

        stations = {
            {label = 'Rumah Sakit', coords = vec4(1153.18, -1514.08, 34.69, 354.34)},
        }
    },
}