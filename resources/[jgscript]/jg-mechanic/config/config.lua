Config = {}

Config.ShopImages = "nui://ox_inventory/web/images/" -- "nui://qb-inventory/html/images/" for qb
Config.LargeImages = true -- or false to disable Large Images

-- Integrations (recommended to leave as "auto")
Config.Framework = "Qbox" -- or "QBCore", "Qbox", "ESX"
Config.Inventory = "ox_inventory" -- or "ox_inventory", "qb-inventory", "esx_inventory", "codem-inventory", "qs-inventory"
Config.Notifications = "ox_lib" -- or "default", "ox_lib", "lation_ui", "ps-ui", "okokNotify", "nox_notify"
Config.ProgressBar = "ox-bar" -- or "ox-circle", "ox-bar", "lation_ui", "qb"
Config.SkillCheck = "ox" -- or "ox", "qb", "lation_ui"
Config.DrawText = "ox_lib" -- or "jg-textui", "ox_lib", "okokTextUI", "ps-ui", "lation_ui", "qb"
Config.SocietyBanking = "Renewed-Banking" -- or "okokBanking", "fd_banking", "Renewed-Banking", "tgg-banking", "qb-banking", "qb-management", "esx_addonaccount"
Config.Menus = "ox" -- or "ox", "lation_ui"

-- Localisation
Config.Locale = "en"
Config.NumberAndDateFormat = "en-US"
Config.Currency = "USD"

-- Set to false to use built-in job system
Config.UseFrameworkJobs = true

-- Mechanic Tablet
Config.UseTabletCommand = "tablet" -- set to false to disable command
Config.TabletConnectionMaxDistance = 5.0

-- Shops
Config.Target = "ox_target" -- (shops/stashes only) "qb-target" or "ox_target"
Config.UseSocietyFund = true -- set to false to use player balance
Config.PlayerBalance = "bank" -- or "bank" or "cash"

-- Skill Bars
Config.UseSkillbars = false -- set to false to use progress bars instead of skill bars for installations
Config.ProgressBarDuration = 10000 -- if not using skill bars, this is the progress bar duration in ms (10000 = 10 seconds)
Config.MaximumSkillCheckAttempts = 3 -- How many times the player can attempt a skill check before the skill check fails
Config.SkillCheckDifficulty = { "easy", "easy", "easy", "easy", "easy" } -- for ox only
Config.SkillCheckInputs = { "w", "a", "s", "d" } -- for ox only

-- Servicing
Config.EnableVehicleServicing = true
Config.ServiceRequiredThreshold = 20 -- [%] if any of the servicable parts hit this %, it will flag that the vehicle needs servicing 
Config.ServicingBlacklist = {
  "police", "police2" -- Vehicles that are excluded from servicing damage
}

-- Nitrous
Config.NitrousScreenEffects = true
Config.NitrousRearLightTrails = true -- Only really visible at night
Config.NitrousPowerIncreaseMult = 2.0
Config.NitrousDefaultKeyMapping = "RMENU"
Config.NitrousMaxBottlesPerVehicle = 3 -- The UI can't really handle more than 7, more than that would be unrealistic anyway
Config.NitrousBottleDuration = 10 -- [in seconds] How long a nitrous tank lasts
Config.NitrousBottleCooldown = 5 -- [in seconds] How long until player can start using the next bottle
Config.NitrousPurgeDrainRate = 0.1 -- purging drains bottle only 10% as fast as actually boosting - set to 1 to drain at the same rate 

-- Stancing
Config.StanceMinSuspensionHeight = -0.3
Config.StanceMaxSuspensionHeight = 0.3
Config.StanceMinCamber = 0.0
Config.StanceMaxCamber = 0.5
Config.StanceMinTrackWidth = 0.5
Config.StanceMaxTrackWidth = 1.25
Config.StanceNearbyVehiclesFreqMs = 500

-- Repairs
Config.AllowFixingAtOwnedMechanicsIfNoOneOnDuty = false
Config.DuctTapeMinimumEngineHealth = 100.0
Config.DuctTapeEngineHealthIncrease = 150.0

-- Tuning
Config.TuningGiveInstalledItemBackOnRemoval = false

-- Locations
Config.UseCarLiftPrompt = "[E] Use car lift"
Config.UseCarLiftKey = 38
Config.CustomiseVehiclePrompt = "[E] Customise vehicle"
Config.CustomiseVehicleKey = 38

-- Update vehicle props whenever they are changed [probably should not touch]
-- You can set to false to leave saving any usual props vehicle changes such as
-- GTA performance, cosmetic, colours, wheels, etc to the garage or other scripts
-- that persist the props data to the database. Additional data from this script,
-- such as engine swaps, servicing etc is not affected as it's saved differently
Config.UpdatePropsOnChange = true

-- Stops vehicles from immediately going to redline, for a slightly more realistic feel and
-- reduced liklihood of wheelspin. Can make vehicle launch (slightly) slower.
-- No effect on electric vehicles!
-- May not work immediately for all vehicles; see: https://docs.jgscripts.com/mechanic/manual-transmissions-and-smooth-first-gear#smooth-first-gear
Config.SmoothFirstGear = false

-- If using a manual gearbox, show a notification with key binds when high RPMs 
-- have been detected for too long
Config.ManualHighRPMNotifications = true

-- Misc
Config.UniqueBlips = true
Config.ModsPricesAsPercentageOfVehicleValue = true -- Enable pricing tuning items as % of vehicle value - it tries jg-dealerships, then QBShared, then the vehicles meta file automagically for pricing data
Config.AdminsHaveEmployeePermissions = false -- admins can use tablet & interact with mechanics like an owner
Config.MechanicEmployeesCanSelfServiceMods = false -- set to true to allow mechanic employees to bypass the "place order" system at their own mechanic
Config.FullRepairAdminCommand = "vfix"
Config.MechanicAdminCommand = "mechanicadmin"
Config.ChangePlateDuringPreview = "PREVIEW"
Config.RequireManagementForOrderDeletion = false 
Config.UseCustomNamesInTuningMenu = false
Config.DisableNoPaymentOptionForEmployees = false

-- Mechanic Locations
Config.MechanicLocations = {
  -- lscustoms = {
  --   type = "owned",
  --   job = "mechanic",
  --   jobManagementRanks = {4},
  --   logo = "ls_customs.png",
  --   commission = 0, -- %, 10 = 10%
  --   locations = {
  --     {
  --       coords = vector3(-312.1, -102.9, 39.02),
  --       size = 3.0,
  --       showBlip = false,
  --       employeeOnly = true,
  --     },
  --     {
  --       coords = vector3(-313.95, -108.68, 39.02),
  --       size = 3.0,
  --       showBlip = false,
  --       employeeOnly = true,
  --     },
  --     {
  --       coords = vector3(-315.79, -113.6, 39.02),
  --       size = 3.0,
  --       showBlip = false,
  --       employeeOnly = true,
  --     },
  --     {
  --       coords = vector3(-317.71, -118.63, 39.02),
  --       size = 3.0,
  --       showBlip = false,
  --       employeeOnly = true,
  --     },
  --     {
  --       coords = vector3(-319.31, -123.8, 39.02),
  --       size = 3.0,
  --       showBlip = false,
  --       employeeOnly = true,
  --     },
  --     {
  --       coords = vector3(-321.4, -128.84, 39.02),
  --       size = 3.0,
  --       showBlip = false,
  --       employeeOnly = true,
  --     },
  --     {
  --       coords = vector3(-323.38, -134.29, 39.02),
  --       size = 3.0,
  --       showBlip = false,
  --       employeeOnly = true,
  --     },
  --     {
  --       coords = vector3(-325.26, -139.35, 39.02),
  --       size = 3.0,
  --       showBlip = false,
  --       employeeOnly = true,
  --     },
  --     {
  --       coords = vector3(-327.12, -144.45, 39.02),
  --       size = 3.0,
  --       showBlip = false,
  --       employeeOnly = true,
  --     }
  --   },
  --   blip = {
  --     id = 446,
  --     color = 47,
  --     scale = 0.7
  --   },
  --   mods = {
  --     repair           = { enabled = true, price = 500, percentVehVal = 0.01 },
  --     performance      = { enabled = true, price = 500, percentVehVal = 0.01, priceMult = 0.1 },
  --     cosmetics        = { enabled = true, price = 500, percentVehVal = 0.01, priceMult = 0.1 },
  --     stance           = { enabled = true, price = 500, percentVehVal = 0.01 },
  --     respray          = { enabled = true, price = 500, percentVehVal = 0.01 },
  --     wheels           = { enabled = true, price = 500, percentVehVal = 0.01, priceMult = 0.1 },
  --     neonLights       = { enabled = true, price = 500, percentVehVal = 0.01 },
  --     headlights       = { enabled = true, price = 500, percentVehVal = 0.01 },
  --     tyreSmoke        = { enabled = true, price = 500, percentVehVal = 0.01 },
  --     bulletproofTyres = { enabled = true, price = 500, percentVehVal = 0.01 },
  --     extras           = { enabled = true, price = 500, percentVehVal = 0.01 }
  --   },
  --   tuning = {
  --     engineSwaps      = { enabled = true, requiresItem = true },
  --     drivetrains      = { enabled = true, requiresItem = true },
  --     turbocharging    = { enabled = true, requiresItem = true },
  --     tyres            = { enabled = true, requiresItem = true },
  --     brakes           = { enabled = true, requiresItem = true },
  --     driftTuning      = { enabled = true, requiresItem = true },
  --     gearboxes        = { enabled = true, requiresItem = true },
  --   },
  --   carLifts = { -- only usable by employees
  --     vector4(-342.64, -113.62, 39.02, 70.24),
  --     vector4(-346.41, -124.69, 39.01, 68.17),
  --     vector4(-349.32, -131.44, 39.02, 68.0)
  --   },
  --   shops = {
  --     {
  --       name = "Servicing Supplies",
  --       coords = vector3(-310.82, -113.49, 39.02),
  --       size = 2.0,
  --       usePed = false,
  --       pedModel = "s_m_m_lathandy_01",
  --       marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --       items = {
  --         { name = "engine_oil", label = "Engine Oil", price = 1500 },
  --         { name = "tyre_replacement", label = "Tyre Replacement", price = 2500 },
  --         { name = "clutch_replacement", label = "Clutch Replacement", price = 3000 },
  --         { name = "air_filter", label = "Air Filter", price = 1300 },
  --         { name = "spark_plug", label = "Spark Plug", price = 1100 },
  --         { name = "suspension_parts", label = "Suspension Parts", price = 2500 },
  --         { name = "brakepad_replacement", label = "Brakepad Replacement", price = 1500 },
  --         { name = "cosmetic_part", label = "Body Kit", price = 1500 },
  --         { name = "repair_kit", label = "Repair Kit", price = 1500 },
  --         { name = "cleaning_kit", label = "Cleaning Kit", price = 1500 },
  --         { name = "duct_tape", label = "Duct Tape", price = 1500 },
  --         { name = "extras_kit", label = "Extras Kit", price = 1500 },
  --         { name = "lighting_controller", label = "Lighting Controller", price = 1500 },
  --         { name = "respray_kit", label = "Respray Kit", price = 1500 },
  --         { name = "vehicle_wheels", label = "Vehicle Wheels Set", price = 1500 },
  --         { name = "stancing_kit", label = "Stance Kit", price = 1500 },
  --         { name = "performance_part", label = "Performance Part", price = 1500 },
  --         { name = "bulletproof_tyres", label = "Bulletproof Tyres", price = 1500 },
  --         { name = "tyre_smoke_kit", label = "Tyre Smoke Kit", price = 1500 },
  --         { name = "slick_tyres", label = "Slick Tyres", price = 1500 },
  --         { name = "semi_slick_tyres", label = "Semi Slick Tyres", price = 1500 },
  --         { name = "offroad_tyres", label = "Offroad Tyres", price = 1500 },
  --         { name = "awd_drivetrain", label = "AWD Drivetrain", price = 1500 },
  --         { name = "rwd_drivetrain", label = "RWD Drivetrain", price = 1500 },
  --         { name = "fwd_drivetrain", label = "FWD Drivetrain", price = 1500 },
  --         { name = "drift_tuning_kit", label = "Drift Tuning Kit", price = 1500 },
  --         { name = "i4_engine", label = "i4 Engine", price = 1500 },
  --         { name = "v6_engine", label = "V6 Engine", price = 1500 },
  --         { name = "v12_engine", label = "V12 Engine", price = 1500 },

  --         { name = "r488sound", label = "R488 Engine 2.5L", price = 1500 },
  --         { name = "k20a",      label = "K20a Turbo 2.0L", price = 1500 },
  --         { name = "urusv8",    label = "Urus V8 4.0L", price = 1500 },
  --         { name = "m297zonda", label = "M297 Zonda 6.0L", price = 1500 },
  --         { name = "v8engine", label = "V8 5.0L", price = 1500 },
  --         { name = "shonen", label = "Inline-4 Turbo 1.8L", price = 1500 },
  --         { name = "predatorv8", label = "Predator V8 5.2L", price = 1500 },
  --         { name = "gt3flat6", label = "Flat-6 3.8L", price = 1500 },
  --         { name = "lambov10", label = "Lambo V10 5.2L", price = 1500 },
  --         { name = "rotary7", label = "Rotary 2.6L", price = 1500 },
  --         { name = "supra2jzgtett", label = "Supra 2JZ-GTE", price = 1500 },
  --         { name = "m158huayra", label = "AMG V12 6.0L", price = 1500 },
  --         { name = "viperv10", label = "Viper V10 8.4L", price = 1500 },
  --         { name = "veyronsound", label = "Bugatti W16 8.0L", price = 1500 },
  --         { name = "perfov10", label = "Lambo V10 5.2L Performance", price = 1500 },
  --         { name = "sestov10", label = "Lambo V10 5.2L Sesto", price = 1500 },
  --         { name = "mclarenv8", label = "McLaren V8 4.0L", price = 1500 },
  --         { name = "murciev12", label = "Lambo V12 6.5L", price = 1500 },
  --         { name = "r35sound", label = "Nissan GTR R35 3.8L", price = 1500 },
  --         { name = "musv8", label = "Mustang V8 5.0L", price = 1500 },
  --         { name = "apollosv8", label = "Apollo V8 4.0L", price = 1500 },
  --         { name = "avesvv12", label = "Aventador SV V12 6.5L", price = 1500 },
  --         { name = "diablov12", label = "Diablo V12 6.0L", price = 1500 },
  --         { name = "f40v8", label = "Ferrari F40 V8 2.9L", price = 1500 },
  --         { name = "f50v12", label = "Ferrari F50 V12 4.7L", price = 1500 },
  --         { name = "ferrarif12", label = "Ferrari F12 V12 6.3L", price = 1500 },
  --         { name = "gtaspanov10", label = "GTA Spano V10 8.0L", price = 1500 },

  --         { name = "nitrous_install_kit", label = "Nitrous Install Kit", price = 1500 },
  --         { name = "empty_nitrous_bottle", label = "Empty Nitrous Bottle", price = 1500 },
  --         { name = "nitrous_bottle", label = "Nitrous Bottle", price = 1500 },
  --         { name = "manual_gearbox", label = "Nitrous Bottle", price = 1500 },
  --         { name = "mechanic_tablet", label = "Mechanic Tablet", price = 1500 },
  --         { name = "harness", label = "Race Harness", price = 1500 },
  --       },
  --     },
  --     {
  --       name = "Advanced Upgrades",
  --       coords = vector3(-322.79, -146.35, 39.02),
  --       size = 2.0,
  --       usePed = false,
  --       pedModel = "s_m_m_lathandy_01",
  --       marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --       items = {
  --         { name = "turbocharger", label = "Turbo Charger", price = 25000 },
  --         { name = "v8_engine", label = "V8 Engine Upgrade", price = 40000 },
  --         { name = "ceramic_brakes", label = "Ceramic Brakes", price = 15000 },
  --         { name = "ev_motor", label = "EV Motor", price = 15000 },
  --         { name = "ev_battery", label = "EV Battery", price = 15000 },
  --         { name = "ev_coolant", label = "EV Coolant", price = 15000 },
  --       },
  --     }
  --   },
  --   stashes = {
  --     {
  --       name = "Parts Bin",
  --       coords = vector3(-316.8, -129.96, 39.02),
  --       size = 2.0,
  --       usePed = false,
  --       pedModel = "s_m_m_lathandy_01",
  --       marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  --       slots = 10,
  --       weight = 50000,
  --     },
  --   }
  -- },
  bennys = {  --paleto
    type = "owned",
    job = "mechanic",
    jobManagementRanks = {1},
    logo = "bennys.png",
    commission = 0, -- %, 10 = 10%
    locations = {
      {
        coords = vector3(63.49, 6532.47, 31.72),
        size = 6.5,
        showBlip = false,
        employeeOnly = true,
      },
      {
        coords = vector3(66.24, 6529.4, 31.72),
        size = 3.0,
        showBlip = false,
        employeeOnly = true,
      },
      {
        coords = vector3(69.36, 6526.11, 31.72),
        size = 3.0,
        showBlip = false,
        employeeOnly = true,
      },
      {
        coords = vector3(72.34, 6523.13, 31.72),
        size = 3.0,
        showBlip = false,
        employeeOnly = true,
      },
      {
        coords = vector3(47.19, 6511.04, 31.72),
        size = 3.0,
        showBlip = false,
        employeeOnly = true,
      },
      {
        coords = vector3(49.96, 6508.02, 31.72),
        size = 3.0,
        showBlip = false,
        employeeOnly = true,
      },
      {
        coords = vector3(53.28, 6505.02, 31.72),
        size = 3.0,
        showBlip = false,
        employeeOnly = true,
      }
    },
    blip = {
      id = 446,
      color = 47,
      scale = 0.7
    },
    mods = {
      repair           = { enabled = true, price = 500, percentVehVal = 0.01 },
      performance      = { enabled = true, price = 500, percentVehVal = 0.01, priceMult = 0.1 },
      cosmetics        = { enabled = true, price = 500, percentVehVal = 0.01, priceMult = 0.1 },
      stance           = { enabled = true, price = 500, percentVehVal = 0.01 },
      respray          = { enabled = true, price = 500, percentVehVal = 0.01 },
      wheels           = { enabled = true, price = 500, percentVehVal = 0.01, priceMult = 0.1 },
      neonLights       = { enabled = true, price = 500, percentVehVal = 0.01 },
      headlights       = { enabled = true, price = 500, percentVehVal = 0.01 },
      tyreSmoke        = { enabled = true, price = 500, percentVehVal = 0.01 },
      bulletproofTyres = { enabled = true, price = 500, percentVehVal = 0.01 },
      extras           = { enabled = true, price = 500, percentVehVal = 0.01 }
    },
    tuning = {
      engineSwaps      = { enabled = true, requiresItem = true },
      drivetrains      = { enabled = true, requiresItem = true },
      turbocharging    = { enabled = true, requiresItem = true },
      tyres            = { enabled = true, requiresItem = true },
      brakes           = { enabled = true, requiresItem = true },
      driftTuning      = { enabled = true, requiresItem = true },
      gearboxes        = { enabled = true, requiresItem = true },
    },
    carLifts = { -- only usable by employees
      vector4(28.83, 6538.76, 31.72, 44.98),
      vector4(32.79, 6542.53, 31.72, 42.35),
      vector4(36.75, 6546.24, 31.72, 41.8)
    },
    shops = {
      {
        name = "Servicing Supplies",
        coords = vector3(66.31, 6536.03, 31.72),
        size = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        items = {
          { name = "engine_oil", label = "Engine Oil", price = 1500 },
          { name = "tyre_replacement", label = "Tyre Replacement", price = 2500 },
          { name = "clutch_replacement", label = "Clutch Replacement", price = 3000 },
          { name = "air_filter", label = "Air Filter", price = 1300 },
          { name = "spark_plug", label = "Spark Plug", price = 1100 },
          { name = "suspension_parts", label = "Suspension Parts", price = 2500 },
          { name = "brakepad_replacement", label = "Brakepad Replacement", price = 1500 },
          { name = "cosmetic_part", label = "Body Kit", price = 1500 },
          { name = "repair_kit", label = "Repair Kit", price = 1500 },
          { name = "cleaning_kit", label = "Cleaning Kit", price = 1500 },
          { name = "duct_tape", label = "Duct Tape", price = 1500 },
          { name = "extras_kit", label = "Extras Kit", price = 1500 },
          { name = "lighting_controller", label = "Lighting Controller", price = 1500 },
          { name = "respray_kit", label = "Respray Kit", price = 1500 },
          { name = "vehicle_wheels", label = "Vehicle Wheels Set", price = 1500 },
          { name = "stancing_kit", label = "Stance Kit", price = 1500 },
          { name = "performance_part", label = "Performance Part", price = 1500 },
          { name = "bulletproof_tyres", label = "Bulletproof Tyres", price = 1500 },
          { name = "tyre_smoke_kit", label = "Tyre Smoke Kit", price = 1500 },
          { name = "slick_tyres", label = "Slick Tyres", price = 1500 },
          { name = "semi_slick_tyres", label = "Semi Slick Tyres", price = 1500 },
          { name = "offroad_tyres", label = "Offroad Tyres", price = 1500 },
          { name = "awd_drivetrain", label = "AWD Drivetrain", price = 1500 },
          { name = "rwd_drivetrain", label = "RWD Drivetrain", price = 1500 },
          { name = "fwd_drivetrain", label = "FWD Drivetrain", price = 1500 },
          { name = "drift_tuning_kit", label = "Drift Tuning Kit", price = 1500 },
          { name = "i4_engine", label = "I4 Engine", price = 1500 },
          { name = "v6_engine", label = "V6 Engine", price = 1500 },
          { name = "v12_engine", label = "V12 Engine", price = 1500 },

          { name = "r488sound", label = "R488 Engine 2.5L", price = 1500 },
          { name = "k20a",      label = "K20a Turbo 2.0L", price = 1500 },
          { name = "urusv8",    label = "Urus V8 4.0L", price = 1500 },
          { name = "m297zonda", label = "M297 Zonda 6.0L", price = 1500 },
          { name = "v8engine", label = "V8 5.0L", price = 1500 },
          { name = "shonen", label = "Inline-4 Turbo 1.8L", price = 1500 },
          { name = "predatorv8", label = "Predator V8 5.2L", price = 1500 },
          { name = "gt3flat6", label = "Flat-6 3.8L", price = 1500 },
          { name = "lambov10", label = "Lambo V10 5.2L", price = 1500 },
          { name = "rotary7", label = "Rotary 2.6L", price = 1500 },
          { name = "supra2jzgtett", label = "Supra 2JZ-GTE", price = 1500 },
          { name = "m158huayra", label = "AMG V12 6.0L", price = 1500 },
          { name = "viperv10", label = "Viper V10 8.4L", price = 1500 },
          { name = "veyronsound", label = "Bugatti W16 8.0L", price = 1500 },
          { name = "perfov10", label = "Lambo V10 5.2L Performance", price = 1500 },
          { name = "sestov10", label = "Lambo V10 5.2L Sesto", price = 1500 },
          { name = "mclarenv8", label = "McLaren V8 4.0L", price = 1500 },
          { name = "murciev12", label = "Lambo V12 6.5L", price = 1500 },
          { name = "r35sound", label = "Nissan GTR R35 3.8L", price = 1500 },
          { name = "musv8", label = "Mustang V8 5.0L", price = 1500 },
          { name = "apollosv8", label = "Apollo V8 4.0L", price = 1500 },
          { name = "avesvv12", label = "Aventador SV V12 6.5L", price = 1500 },
          { name = "diablov12", label = "Diablo V12 6.0L", price = 1500 },
          { name = "f40v8", label = "Ferrari F40 V8 2.9L", price = 1500 },
          { name = "f50v12", label = "Ferrari F50 V12 4.7L", price = 1500 },
          { name = "ferrarif12", label = "Ferrari F12 V12 6.3L", price = 1500 },
          { name = "gtaspanov10", label = "GTA Spano V10 8.0L", price = 1500 },

          { name = "nitrous_install_kit", label = "Nitrous Install Kit", price = 1500 },
          { name = "empty_nitrous_bottle", label = "Empty Nitrous Bottle", price = 1500 },
          { name = "nitrous_bottle", label = "Nitrous Bottle", price = 1500 },
          { name = "manual_gearbox", label = "Nitrous Bottle", price = 1500 },
          { name = "mechanic_tablet", label = "Mechanic Tablet", price = 1500 },
          { name = "billing_tablet", label = "Tablet Billing", price = 1500 },
          { name = "harness", label = "Race Harness", price = 25000 },
        },
      },
      {
        name = "Advanced Upgrades",
        coords = vector3(70.74, 6531.52, 31.72),
        size = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        items = {
          { name = "turbocharger", label = "Turbo Charger", price = 25000 },
          { name = "v8_engine", label = "V8 Engine Upgrade", price = 40000 },
          { name = "ceramic_brakes", label = "Ceramic Brakes", price = 15000 },
          { name = "ev_motor", label = "EV Motor", price = 15000 },
          { name = "ev_battery", label = "EV Battery", price = 15000 },
          { name = "ev_coolant", label = "EV Coolant", price = 15000 },
        },
      },
    {
        name = "Servicing Supplies2",
        coords = vector3(49.39, 6503.0, 31.72),
        size = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        items = {
          { name = "engine_oil", label = "Engine Oil", price = 1500 },
          { name = "tyre_replacement", label = "Tyre Replacement", price = 2500 },
          { name = "clutch_replacement", label = "Clutch Replacement", price = 3000 },
          { name = "air_filter", label = "Air Filter", price = 1300 },
          { name = "spark_plug", label = "Spark Plug", price = 1100 },
          { name = "suspension_parts", label = "Suspension Parts", price = 2500 },
          { name = "brakepad_replacement", label = "Brakepad Replacement", price = 1500 },
          { name = "cosmetic_part", label = "Body Kit", price = 1500 },
          { name = "repair_kit", label = "Repair Kit", price = 1500 },
          { name = "cleaning_kit", label = "Cleaning Kit", price = 1500 },
          { name = "duct_tape", label = "Duct Tape", price = 1500 },
          { name = "extras_kit", label = "Extras Kit", price = 1500 },
          { name = "lighting_controller", label = "Lighting Controller", price = 1500 },
          { name = "respray_kit", label = "Respray Kit", price = 1500 },
          { name = "vehicle_wheels", label = "Vehicle Wheels Set", price = 1500 },
          { name = "stancing_kit", label = "Stance Kit", price = 1500 },
          { name = "performance_part", label = "Performance Part", price = 1500 },
          { name = "bulletproof_tyres", label = "Bulletproof Tyres", price = 1500 },
          { name = "tyre_smoke_kit", label = "Tyre Smoke Kit", price = 1500 },
          { name = "slick_tyres", label = "Slick Tyres", price = 1500 },
          { name = "semi_slick_tyres", label = "Semi Slick Tyres", price = 1500 },
          { name = "offroad_tyres", label = "Offroad Tyres", price = 1500 },
          { name = "awd_drivetrain", label = "AWD Drivetrain", price = 1500 },
          { name = "rwd_drivetrain", label = "RWD Drivetrain", price = 1500 },
          { name = "fwd_drivetrain", label = "FWD Drivetrain", price = 1500 },
          { name = "drift_tuning_kit", label = "Drift Tuning Kit", price = 1500 },
          { name = "i4_engine", label = "I4 Engine", price = 1500 },
          { name = "v6_engine", label = "V6 Engine", price = 1500 },
          { name = "v12_engine", label = "V12 Engine", price = 1500 },

          { name = "r488sound", label = "R488 Engine 2.5L", price = 1500 },
          { name = "k20a",      label = "K20a Turbo 2.0L", price = 1500 },
          { name = "urusv8",    label = "Urus V8 4.0L", price = 1500 },
          { name = "m297zonda", label = "M297 Zonda 6.0L", price = 1500 },
          { name = "v8engine", label = "V8 5.0L", price = 1500 },
          { name = "shonen", label = "Inline-4 Turbo 1.8L", price = 1500 },
          { name = "predatorv8", label = "Predator V8 5.2L", price = 1500 },
          { name = "gt3flat6", label = "Flat-6 3.8L", price = 1500 },
          { name = "lambov10", label = "Lambo V10 5.2L", price = 1500 },
          { name = "rotary7", label = "Rotary 2.6L", price = 1500 },
          { name = "supra2jzgtett", label = "Supra 2JZ-GTE", price = 1500 },
          { name = "m158huayra", label = "AMG V12 6.0L", price = 1500 },
          { name = "viperv10", label = "Viper V10 8.4L", price = 1500 },
          { name = "veyronsound", label = "Bugatti W16 8.0L", price = 1500 },
          { name = "perfov10", label = "Lambo V10 5.2L Performance", price = 1500 },
          { name = "sestov10", label = "Lambo V10 5.2L Sesto", price = 1500 },
          { name = "mclarenv8", label = "McLaren V8 4.0L", price = 1500 },
          { name = "murciev12", label = "Lambo V12 6.5L", price = 1500 },
          { name = "r35sound", label = "Nissan GTR R35 3.8L", price = 1500 },
          { name = "musv8", label = "Mustang V8 5.0L", price = 1500 },
          { name = "apollosv8", label = "Apollo V8 4.0L", price = 1500 },
          { name = "avesvv12", label = "Aventador SV V12 6.5L", price = 1500 },
          { name = "diablov12", label = "Diablo V12 6.0L", price = 1500 },
          { name = "f40v8", label = "Ferrari F40 V8 2.9L", price = 1500 },
          { name = "f50v12", label = "Ferrari F50 V12 4.7L", price = 1500 },
          { name = "ferrarif12", label = "Ferrari F12 V12 6.3L", price = 1500 },
          { name = "gtaspanov10", label = "GTA Spano V10 8.0L", price = 1500 },

          { name = "nitrous_install_kit", label = "Nitrous Install Kit", price = 1500 },
          { name = "empty_nitrous_bottle", label = "Empty Nitrous Bottle", price = 1500 },
          { name = "nitrous_bottle", label = "Nitrous Bottle", price = 1500 },
          { name = "manual_gearbox", label = "Nitrous Bottle", price = 1500 },
          { name = "mechanic_tablet", label = "Mechanic Tablet", price = 1500 },
        },
      },
      {
        name = "Advanced Upgrades2",
        coords = vector3(43.2, 6508.85, 31.72),
        size = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        items = {
          { name = "turbocharger", label = "Turbo Charger", price = 25000 },
          { name = "v8_engine", label = "V8 Engine Upgrade", price = 40000 },
          { name = "ceramic_brakes", label = "Ceramic Brakes", price = 15000 },
          { name = "ev_motor", label = "EV Motor", price = 15000 },
          { name = "ev_battery", label = "EV Battery", price = 15000 },
          { name = "ev_coolant", label = "EV Coolant", price = 15000 },
        },
      }
    },
    stashes = {
      {
        name = "Parts Bin",
        coords = vector3(74.99, 6526.88, 31.72),
        size = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        slots = 100,
        weight = 200000,
      },
    }
  }
}

-- Add electric vehicles to disable combustion engine features
-----------------------------------------------------------------------
-- PLEASE NOTE: In b3258 (Bottom Dollar Bounties) and newer, electric
-- vehicles are detected automatically, so this list is not used! 
Config.ElectricVehicles = {
  "Airtug",     "buffalo5",   "caddy",
  "Caddy2",     "caddy3",     "coureur",
  "cyclone",    "cyclone2",   "imorgon",
  "inductor",   "iwagen",     "khamelion",
  "metrotrain", "minitank",   "neon",
  "omnisegt",   "powersurge", "raiden",
  "rcbandito",  "surge",      "tezeract",
  "virtue",     "vivanite",   "voltic",
  "voltic2",
}

-- Nerd options
Config.DisableSound = false
Config.AutoRunSQL = true
Config.Debug = false