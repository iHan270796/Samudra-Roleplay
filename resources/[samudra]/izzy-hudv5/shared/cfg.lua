cfg = {
    debug = false,
    settingsCommand = "hud",
    statusInterval = 500,
    topInfosInterval = 1000,
    speedoInterval = 250,
    locationInterval = 150,
    minimapScale = 1000,

    useMinimapBorder = true,
    useMusicPlayer = true,
    showLocation = true,
    showCompass = false,

    showTopInfos = true,
    serverName = 'SAMUDRA',
    serverDesc = 'ROLEPLAY',
    notifyPosition = "top-left", -- top-left / top-center / top-right --- bottom-left / bottom-center / bottom-right
    
    cancelProgress = {
        command = "cancel",
        key = "",
        description = "Samudra Hud"
    },

    useCarMode = true,
    carModCommand = "carmod",
    musicCommand = "music",
    clearRadioCommand = "clearRadio",

    seatbeltWarnSound = true,
    seatbeltWarnVolume = 1.0,

    status = {
        {
            name = 'mic',
            icon = 'mic',
            label = 'Mic',
            value = 66,
            color = 'white'
        },
        {
            name = 'health',
            icon = 'health',
            label = 'Health',
            value = 90,
            color = 'red'
        },
        {
            name = 'armor',
            icon = 'armor',
            label = 'Armor',
            value = 0,
            min = 1,
            color = 'darkblue'
        },
        {
            name = 'hunger',
            icon = 'hunger',
            label = 'Hunger',
            value = 50,
            color = 'yellow'
        },
        {
            name = 'thirst',
            icon = 'thirst',
            label = 'Thirst',
            value = 50,
            color = 'lightblue'
        },
        {
            name = 'stamina',
            icon = 'stamina',
            label = 'Stamina',
            value = 50,
            color = 'lightgreen',
            secondLabel = '',
            inWaterLabel = 'Oxygen'
        },
        {
            name = 'stress',
            icon = 'stress',
            label = 'Stress',
            value = 50,
            color = 'brown'
        }
    },

    topInfos = {
        {
            id = 'playerCount',
            icon = 'playerCount',
            color = 'theme',
            label = 'Server Online',
            value = '347'
        },
        {
            id = 'time',
            icon = 'time',
            color = 'theme',
            label = 'Server Time',
            value = '19:05'
        },
        {
            id = 'job',
            icon = 'job',
            color = 'theme',
            label = 'Pekerjaan',
            value = 'Police Officer'
        },
        {
            id = 'fullname',
            icon = 'fullname',
            color = 'theme',
            label = 'Nama Anda',
            value = 'Erza Baba',
            secondValue = '(252)'
        },
        {
            id = 'cash',
            icon = 'cash',
            color = 'cash',
            label = 'Uang Tunai',
            value = '31000',
            money = true
        },
        {
            id = 'bank',
            icon = 'bank',
            color = 'bank',
            label = 'Bank',
            value = '62000',
            money = true
        }
    },

    keybinds = {
        -- {
        --     label = "hud",
        --     key = "i"
        -- },
        -- {
        --     label = "Actionbar",
        --     key = "Z"
        -- },
        -- {
        --     label = "Phone",
        --     key = "M"
        -- },
        -- {
        --     label = "Radial Menu",
        --     key = "F3"
        -- }
    },
    
    defaultSettings = {
        statusType = 'modern',
        statusStyle = 3,
        carhudStyle = 3,
        topInfosStyle = 2,
        mapStyle = 'square',
        mapVisibility = 'onlyInVehicle',
        speedType = 'kmh',
        cinematic = false,
        statusColors = {},
        statusSize = 100,
        carhudSize = 100
    },
    colors = {
        theme = {
            primary = '#2F80F3',
            secondary = '#2F80F3'
        },
        cash = {
            primary = '#2F80F3',
            secondary = '#2F80F3'
        },
        bank = {
            primary = '#2F80F3',
            secondary = '#2F80F3'
        },
        purple = {
            primary = '#B04AFF',
            secondary = '#672D95'
        },
        pink = {
            primary = '#FB32FF',
            secondary = '#912E93'
        },
        green = {
            primary = '#78FC4A',
            secondary = '#49962E'
        },
        lightgreen = {
            primary = '#A7FFDF',
            secondary = '#4AFCBC'
        },
        white = {
            primary = '#FFFFFF',
            secondary = '#999999'
        },
        red = {
            primary = '#FF4242',
            secondary = '#B32F2F'
        },
        yellow = {
            primary = '#FFCA0F',
            secondary = '#A38931'
        },
        darkblue = {
            primary = '#95ADFF',
            secondary = '#4A72FC'
        },
        lightblue = {
            primary = '#9CE2FF',
            secondary = '#4AC7FC'
        },
        brown = {
            primary = '#FFAA7A',
            secondary = '#FC8A4A'
        }
    },
    notifyColors = {
        success = '#51FF62',
        error = '#FF5151',
        inform = '#51ABFF'
    },

    voiceRanges = {
        ["1.5"] = 33,
        ["3.0"] = 66,
        ["6.0"] = 100
    },

    useStress = true,
    MinimumStress = 25,         -- Minimum Stress Level For Screen Shaking
    MinimumSpeedUnbuckled = 100, -- Going Over This Speed Unbuckled Will Cause Stress
    MinimumSpeed = 70,        -- Going Over This Speed While Buckled Will Cause Stress
    StressChance = 0.1,
    WhitelistedWeaponArmed = { -- Disable showing armed icon from weapons in this table
        [`weapon_petrolcan`] = true,
        [`weapon_hazardcan`] = true,
        [`weapon_fireextinguisher`] = true,
        [`weapon_dagger`] = true,
        [`weapon_bat`] = true,
        [`weapon_bottle`] = true,
        [`weapon_crowbar`] = true,
        [`weapon_flashlight`] = true,
        [`weapon_golfclub`] = true,
        [`weapon_hammer`] = true,
        [`weapon_hatchet`] = true,
        [`weapon_knuckle`] = true,
        [`weapon_knife`] = true,
        [`weapon_machete`] = true,
        [`weapon_switchblade`] = true,
        [`weapon_nightstick`] = true,
        [`weapon_wrench`] = true,
        [`weapon_battleaxe`] = true,
        [`weapon_poolcue`] = true,
        [`weapon_briefcase`] = true,
        [`weapon_briefcase_02`] = true,
        [`weapon_garbagebag`] = true,
        [`weapon_handcuffs`] = true,
        [`weapon_bread`] = true,
        [`weapon_stone_hatchet`] = true,
        [`weapon_grenade`] = true,
        [`weapon_bzgas`] = true,
        [`weapon_molotov`] = true,
        [`weapon_stickybomb`] = true,
        [`weapon_proxmine`] = true,
        [`weapon_snowball`] = true,
        [`weapon_pipebomb`] = true,
        [`weapon_ball`] = true,
        [`weapon_smokegrenade`] = true,
        [`weapon_flare`] = true
    },

    WhitelistedWeaponStress = { -- Disable gaining stress from weapons in this table
        [`weapon_petrolcan`] = true,
        [`weapon_hazardcan`] = true,
        [`weapon_fireextinguisher`] = true
    },

    VehClassStress = { -- Enable/Disable gaining stress from vehicle classes in this table
        ['0'] = true,         -- Compacts
        ['1'] = true,         -- Sedans
        ['2'] = true,         -- SUVs
        ['3'] = true,         -- Coupes
        ['4'] = true,         -- Muscle
        ['5'] = true,         -- Sports Classics
        ['6'] = true,         -- Sports
        ['7'] = true,         -- Super
        ['8'] = true,         -- Motorcycles
        ['9'] = true,         -- Off Road
        ['10'] = true,        -- Industrial
        ['11'] = true,        -- Utility
        ['12'] = true,        -- Vans
        ['13'] = false,       -- Cycles
        ['14'] = false,       -- Boats
        ['15'] = false,       -- Helicopters
        ['16'] = false,       -- Planes
        ['18'] = false,       -- Emergency
        ['19'] = false,       -- Military
        ['20'] = false,       -- Commercial
        ['21'] = false        -- Trains
    },

    WhitelistedVehicles = { -- Disable gaining stress from speeding in any vehicle in this table
        --[`adder`] = true
    },

    WhitelistedJobs = { -- Disable stress completely for players with matching job or job type
        ['leo'] = true,
        ['ambulance'] = true
    },

    Intensity = {
        ['blur'] = {
            [1] = {
                min = 50,
                max = 60,
                intensity = 1500,
            },
            [2] = {
                min = 60,
                max = 70,
                intensity = 2000,
            },
            [3] = {
                min = 70,
                max = 80,
                intensity = 2500,
            },
            [4] = {
                min = 80,
                max = 90,
                intensity = 2700,
            },
            [5] = {
                min = 90,
                max = 100,
                intensity = 3000,
            },
        }
    },

    EffectInterval = {
        [1] = {
            min = 50,
            max = 60,
            timeout = math.random(50000, 60000)
        },
        [2] = {
            min = 60,
            max = 70,
            timeout = math.random(40000, 50000)
        },
        [3] = {
            min = 70,
            max = 80,
            timeout = math.random(30000, 40000)
        },
        [4] = {
            min = 80,
            max = 90,
            timeout = math.random(20000, 30000)
        },
        [5] = {
            min = 90,
            max = 100,
            timeout = math.random(15000, 20000)
        }
    },

    locale = "en",
    locales = {
        ["en"] = {
            mph = 'MPH',
            kmh = 'KM/H',
            playlists = 'Playlists',
            addPlaylist = 'Add Playlist',
            addMusic = 'Add Music',
            playMusic = 'Play Music',
            enterName = 'Enter name...',
            enterDesc = 'Enter description...',
            enterImageUrl = 'Enter image url...',
            enterUrl = 'Enter url...',
            accept = 'Accept',
            favoriteMusics = 'Favorite Musics',
            favorite = 'Favorite',
            hud = 'HUD',
            settings = 'SETTINGS',
            moveIt = 'Move It',
            defaultAll = 'Default All',
            saveSettings = 'Save Settings',
            statusHud = 'Status Hud',
            statusColor = 'Status Color',
            toggleseatbelt = 'SeatBelt',
            topInfo = 'Top Info',
            mapStyle = 'Map Style',
            mapVisibility = 'Map Visibility',
            circle = 'Circle',
            square = 'Square',
            onlyInVehicle = 'Only in Vehicle',
            always = 'Always',
            choose = 'Choose',
            modernStatus = 'Modern Status',
            classicStatus = 'Classic Status',
            -- statusColor = 'Status Color',
            status = 'Status',
            primary = 'Primary',
            secondary = 'Secondary',
            modernSpeedo = 'Modern Speedometer',
            classicSpeedo = 'Classic Speedometer',
            speedoMeter = 'Speedometer',
            speedType = "Speed Type",
            carSettings = 'Car Settings',
            driftMode = 'Drift Mode',
            normalMode = 'Normal Mode',
            statusSize = "Status Size",
            carhudSize = "Carhud Size",
            stamina = 'Stamina',
            oxygen = 'Oxygen',
            successfulySave = 'Settings saved successfully',
            success = 'Success',
            location = 'Location'
        }
    }
}
