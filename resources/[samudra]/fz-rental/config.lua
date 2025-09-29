Config = {}
Config.useBlips = false -- Show blips on the map.
Config.useTarget = true -- Use ox_target for interaction.
Config.fuelSystem = 'lc_fuel' -- Fuel system to use. Options: 'ox_fuel' or 'LegacyFuel' make sure to start the resource before this one.
Config.keybind = 38 -- Control index for the TextUI. Default is 'E' (38) Change locals file for UI text. https://docs.fivem.net/docs/game-references/controls/#controls

Config.minRentTime = 1 -- Minimum rental time in hours.
Config.maxRentTime = 2 -- Maximum rental time in hours.

Config.moneytype = 'bank' -- Type of money used for transactions. Options: 'cash' or 'bank'.

Config.peds = {
    car_rental1 = {    -- Unique identifier.
        model = 'a_m_m_hasjew_01',  -- Model for the ped.
        coords = vec4(-1039.04, -2678.52, 12.83, 16.87),    -- Coordinates for the rental service ped.
        scenario = 'WORLD_HUMAN_CLIPBOARD', -- Animation scenario for the ped.
        spawncoords = vec4(-1869.92, 5258.56, 6.93, 310.16), -- Coords for spawning vehicles.
        blip = {
            sprite = 225, -- Icon for the blip. https://docs.fivem.net/docs/game-references/blips/
            scale = 1.0, -- Size of the blip.
            -- colour = 2, -- Color of the blip. https://docs.fivem.net/docs/game-references/blips/#blip-colors
            label = 'Rental Kendaraan',
        },
        zoneOptions = { -- Used when UseTarget is false.
            length = 3.0,
            width = 3.0,
            debugPoly = false,  -- Only used for debugging.
        },
    },
    car_rental2 = {    -- Unique identifier.
        model = 'a_m_m_hasjew_01',  -- Model for the ped.
        coords = vec4(-777.35, -1336.13, 5.0, 349.27),    -- Coordinates for the rental service ped.
        scenario = 'WORLD_HUMAN_CLIPBOARD', -- Animation scenario for the ped.
        spawncoords = vec4(-777.35, -1336.13, 5.0, 349.27), -- Coords for spawning vehicles.
        blip = {
            sprite = 225, -- Icon for the blip. https://docs.fivem.net/docs/game-references/blips/
            scale = 1.0, -- Size of the blip.
            -- colour = 2, -- Color of the blip. https://docs.fivem.net/docs/game-references/blips/#blip-colors
            label = 'Rental Kendaraan',
        },
        zoneOptions = { -- Used when UseTarget is false.
            length = 3.0,
            width = 3.0,
            debugPoly = false,  -- Only used for debugging.
        },
    },
    car_rental3 = {    -- Unique identifier.
        model = 'a_m_m_hasjew_01',  -- Model for the ped.
        coords = vec4(-1035.06, -2729.75, 20.06, 246.67),    -- Coordinates for the rental service ped.
        scenario = 'WORLD_HUMAN_CLIPBOARD', -- Animation scenario for the ped.
        spawncoords = vec4(-1035.06, -2729.75, 20.06, 246.67), -- Coords for spawning vehicles.
        blip = {
            sprite = 225, -- Icon for the blip. https://docs.fivem.net/docs/game-references/blips/
            scale = 1.0, -- Size of the blip.
            -- colour = 2, -- Color of the blip. https://docs.fivem.net/docs/game-references/blips/#blip-colors
            label = 'Rental Kendaraan',
        },
        zoneOptions = { -- Used when UseTarget is false.
            length = 3.0,
            width = 3.0,
            debugPoly = false,  -- Only used for debugging.
        },
    },
}

Config.vehicles = {
    car_rental1 = {
        {
            name = 'Faggio',
            description = 'Silahkan klik Untuk Rental.',
            model = 'faggio',
            price = 150,
            icon = 'car',
            image = 'https://raw.githubusercontent.com/MericcaN41/gta5carimages/main/images/faggio.png',
        },
    },
    car_rental2 = {
        {
            name = 'Speda BMX',
            description = 'Silahkan klik Untuk Rental.',
            model = 'bmx',
            price = 150,
            icon = 'car',
            image = 'https://raw.githubusercontent.com/MericcaN41/gta5carimages/main/images/bmx.png',
        },
    },
    car_rental3 = {
        {
            name = 'Faggio',
            description = 'Silahkan klik Untuk Rental.',
            model = 'faggio',
            price = 150,
            icon = 'car',
            image = 'https://raw.githubusercontent.com/MericcaN41/gta5carimages/main/images/faggio.png',
        },
    },
}