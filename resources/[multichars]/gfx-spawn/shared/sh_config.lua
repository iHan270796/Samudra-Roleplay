Config = {
    coords = vector3(-901.5, -866.9, 15.47), -- The coordinates where the bus stop will be spawned
    heading = 314.33,
    speed = 250.0, -- The speed of the bus in m/s (used to calculate the time to reach the destination but only for ui)

    -------------- [[[ Theme ]]] --------------
    theme = "default", -- The theme of the bus stop (cyberpunk, neon, default)
    themes = {
        ["default"] = {
            hash = `prop_busstop_02`,
            model = 'prop_busstop_02',
            unit = "MIN",
            scene = {
                scenario = "PROP_HUMAN_SEAT_BUS_STOP_WAIT",
                offset = vec3(0.134155, 0.174561, 0.500000),
                heading = 134.32,
            },
            screen = {
                offset = vector3(-2.0, -0.1, 1.165),
                rot = vector3(0.0, 0.0, 0.0),
                texture = "prop_busstop_poster_01",
                sizeX = 0.4,
                sizeY = 0.8,
            }
        },
        ["cyberpunk"] = {
            hash = `prop_busstop_04`,
            model = 'prop_busstop_04',
            unit = "YEARS",
            scene = {
                scenario = "PROP_HUMAN_SEAT_BUS_STOP_WAIT",
                offset = vec3(-0.5, 0.584814, 0.500000),
                heading = 134.32,
            },
            screen = {
                offset = vector3(-2.5, -0.1, 1.45),
                rot = vector3(0.0, 0.0, 0.0),
                texture = "prop_busstop_poster_03",
                sizeX = 0.5,
                sizeY = 1.0,
            }
        },
        ["neon"] = {
            hash = `prop_busstop_05`,
            model = 'prop_busstop_05',
            unit = "BAR",
            scene = {
                scenario = "PROP_HUMAN_SEAT_BUS_STOP_WAIT",
                offset = vec3(0.286047, 0.0, 0.571235),
                heading = 134.32,
            },
            screen = {
                offset = vector3(-2.0, -0.1, 1.25),
                rot = vector3(0.0, 0.0, 0.0),
                texture = "prop_busstop_poster_02",
                sizeX = 0.4,
                sizeY = 0.8,
            }
        },
    },

    -------------- [[[ Environment & Camera ]]] --------------
    weather = "CLEAR",
    time = {
        hour = 0,
        minute = 30,
        second = 0,
    },
    camOffset = vector3(3.5, -2.5, 1.0), -- The offset of the camera from the bus stop
    camFov = 20.0, -- The field of view of the camera

    -------------- [[[ Locations ]]] --------------
    locations = {
        {
            id = "lastlocation",
            name = "Posisi Terakhir (%s)", -- (%s) will be replaced with the street name (if you don't want to show the street name, remove it)
        },
        -- {
        --     id = "apartment1",
        --     name = "South Rockford Drive",
        --     coords = vector3(-621.0366, 46.594829, 43.591472),
        --     heading = 182.83181,
        -- },
        -- {
        --     id = "pier",
        --     name = "Del Perro Pier",
        --     coords = vector3(-1648.76, -994.26, 13.02),
        --     heading = 230.24,
        -- },
        -- {
        --     id = "harmonymotel",
        --     name = "Harmony Motel",
        --     coords = vector3(1122.11, 2667.24, 38.04),
        --     heading = 180.39,
        -- },
        {
            id = "paleto",
            name = "Paleto Bay",
            coords = vector3(145.62, 6563.19, 32.0),
            heading = 42.83,
        },
        {
            id = "vinewood",
            name = "Bandara",
            coords = vector3(-1037.63, -2737.38, 20.17),
            heading = 329.28,
        },
        -- {
        --     id = "hospital",
        --     name = "Crusade Medical Center",
        --     coords = vector3(374.22, -1537.64, 29.29),
        --     heading = 139.53,
        -- },
        {
            id = "bolingbroke_penitentiary",
            name = 'Plabuhan',
            coords = vector3(-772.36, -1348.95, 5.15),
            heading = 51.03,
        },
    },
}