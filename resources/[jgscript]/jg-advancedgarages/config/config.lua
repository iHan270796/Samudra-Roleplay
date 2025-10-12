-----------------------------------------------------------------------------------
-- WAIT! Before editing this file manually, try our new easy configuration tool! --
--            https://configurator.jgscripts.com/advanced-garages                --
-----------------------------------------------------------------------------------
Config = {}

-- Localisation
Config.Locale = "en"
Config.NumberAndDateFormat = "en-US"
Config.Currency = "USD"

-- Framework & Integrations
Config.Framework = "Qbox" -- or "QBCore", "Qbox", "ESX"
Config.FuelSystem = "lc_fuel" -- or "LegacyFuel", "ps-fuel", "lj-fuel", "ox_fuel", "cdn-fuel", "hyon_gas_station", "okokGasStation", "nd_fuel", "myFuel", "ti_fuel", "Renewed-Fuel", "rcore_fuel", "none"
Config.VehicleKeys = "qbx_vehiclekeys" -- or "qb-vehiclekeys", "MrNewbVehicleKeys", "jaksam-vehicles-keys", "qs-vehiclekeys", "mk_vehiclekeys", "wasabi_carlock", "cd_garage", "okokGarage", "t1ger_keys", "Renewed", "tgiann-hotwire", "qbx_vehiclekeys" "none"
Config.Notifications = "ox_lib" -- or "default", "okokNotify", "ox_lib", "ps-ui"
Config.Banking = "Renewed-Banking" -- or "qb-banking", "qb-management", "esx_addonaccount", "Renewed-Banking", "okokBanking", "fd_banking"
Config.Gangs = "auto" -- "qb-gangs", "rcore_gangs"

-- Draw text UI prompts (key binding control IDs here: https://docs.fivem.net/docs/game-references/controls/)
Config.DrawText = "ox_lib" -- or "jg-textui", "qb-DrawText", "okokTextUI", "ox_lib", "ps-ui"
Config.OpenGarageKeyBind = 38
Config.OpenGaragePrompt = "[E] Akses Garasi"
Config.OpenImpoundKeyBind = 38
Config.OpenImpoundPrompt = "[E] Akses Impound"
Config.InsertVehicleKeyBind = 38
Config.InsertVehiclePrompt = "[E] Simpan Kendaraan"
Config.ExitInteriorKeyBind = 38
Config.ExitInteriorPrompt = "[E] Keluar Garasi"

-- Target
Config.UseTarget = false
Config.Target = "ox_target" -- or "qb-target"
Config.TargetPed = "s_m_y_valet_01"

-- Radial
Config.UseRadialMenu = false
Config.RadialMenu = "ox_lib"


-- Little vehicle preview images in the garage UI - learn more/add custom images: https://docs.jgscripts.com/advanced-garages/vehicle-images
Config.ShowVehicleImages = true

-- Vehicle Spawning & Storing
Config.DoNotSpawnInsideVehicle = false
Config.SaveVehicleDamage = true -- Save and apply body and engine damage when taking the vehicle out a garage
Config.AdvancedVehicleDamage = true -- use Kiminaze's VehicleDeformation
Config.SaveVehiclePropsOnInsert = true
Config.CheckVehicleModel = true -- Extra security

-- If you don't know what this means, don't touch this
-- If you know what this means, I do recommend enabling it but be aware you may experience reliability issues on more populated servers
-- Having significant issues? I beg you to just set it back to false before opening a ticket with us
-- HIGHLY recommended that you set Config.DoNotSpawnInsideVehicle = false if you decide to enable this
-- Want to read my rant about server spawned vehicles? https://docs.jgscripts.com/advanced-garages/misc/why-are-you-not-using-createvehicleserversetter-by-default
Config.SpawnVehiclesWithServerSetter = false

-- Vehicle Transfers
Config.GarageVehicleTransferCost = 2500 -- Cost to transfer between garages
Config.TransferHidePlayerNames = false
Config.EnableTransfers = {
  betweenGarages = false,
  betweenPlayers = true
}
Config.DisableTransfersToUnregisteredGarages = false -- Potential hacking protection for vigilant servers - unregistered garages are ones created via events in third-party script integrations, such as housing scripts, and therefore could be prone to script kiddie attacks.

-- Prevent vehicle duplication
-- Learn more: https://docs.jgscripts.com/advanced-garages/vehicle-duplication-prevention
Config.AllowInfiniteVehicleSpawns = false -- Public & private garages
Config.JobGaragesAllowInfiniteVehicleSpawns = false -- Job garages
Config.GangGaragesAllowInfiniteVehicleSpawns = false -- Gang garages
Config.GarageVehicleReturnCost = 25000 -- "towing" tax if not placed back in garage after server restart; or if destroyed or underwater while left out
Config.GarageVehicleReturnCostSocietyFund = false -- Job name of society fund to pay return fees into (optional)

-- Public Garages
Config.GarageShowBlips = true
Config.GarageUniqueBlips = true
Config.GarageUniqueLocations = true
Config.GarageEnableInteriors = true
Config.GarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["Legion Square"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(215.09, -805.17, 30.81),
    spawn = {vector4(216.84, -802.02, 30.78, 69.82), vector4(218.09, -799.42, 30.76, 66.17), vector4(219.29, -797.23, 30.75, 65.4), vector4(219.59, -794.44, 30.75, 69.35), vector4(220.63, -792.03, 30.75, 63.76), vector4(206.81, -798.35, 30.99, 248.53)}, --  you can add multiple spawn locations into a table
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Islington South"] = {
    coords = vector3(273.0, -343.85, 44.91),
    spawn = vector4(270.75, -340.51, 44.92, 342.03),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Grove Street"] = {
    coords = vector3(14.66, -1728.52, 29.3),
    spawn = vector4(23.93, -1722.9, 29.3, 310.58),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Mirror Park"] = {
    coords = vector3(1032.84, -765.1, 58.18),
    spawn = vector4(1023.2, -764.27, 57.96, 319.66),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Beach"] = {
    coords = vector3(-1248.69, -1425.71, 4.32),
    spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Great Ocean Highway"] = {
    coords = vector3(-2961.58, 375.93, 15.02),
    spawn = vector4(-2964.96, 372.07, 14.78, 86.07),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy South"] = {
    coords = vector3(217.33, 2605.65, 46.04),
    spawn = vector4(216.94, 2608.44, 46.33, 14.07),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy North"] = {
    coords = vector3(1878.44, 3760.1, 32.94),
    spawn = vector4(1880.14, 3757.73, 32.93, 215.54),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["North Vinewood Blvd"] = {
    coords = vector3(365.21, 295.65, 103.46),
    spawn = vector4(364.84, 289.73, 103.42, 164.23),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Grapeseed"] = {
    coords = vector3(1713.06, 4745.32, 41.96),
    spawn = vector4(1710.64, 4746.94, 41.95, 90.11),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Paleto Bay"] = {
    coords = vector3(88.7, 6501.03, 31.53),
    spawn = {vector4(96.08, 6501.06, 31.53, 49.83), vector4(93.54, 6497.54, 31.53, 47.16), vector4(90.68, 6494.6, 31.53, 47.63)},
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Alta Streets"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(-304.04, -890.78, 31.08),
    spawn = {vector4(-296.7, -886.24, 31.08, 170.85), vector4(-300.44, -885.55, 31.08, 169.42), vector4(-304.1, -884.85, 31.08, 169.71), vector4(-307.6, -884.25, 31.08, 171.12), vector4(-298.42, -898.81, 31.08, 344.81), vector4(-302.26, -897.99, 31.08, 351.12), vector4(-305.51, -897.26, 31.08, 351.21), vector4(-309.22, -896.95, 31.08, 347.91)}, --  you can add multiple spawn locations into a table
    distance = 25,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Vespucci Boule"] = {
    coords = vector3(-834.75, -762.87, 21.81),
    spawn = {vector4(-840.33, -760.67, 22.04, 273.66), vector4(-840.5, -764.23, 21.67, 271.57), vector4(-840.27, -768.04, 21.33, 275.89), vector4(-830.09, -768.24, 21.31, 91.78), vector4(-829.72, -764.3, 21.66, 93.1), vector4(-829.5, -760.62, 22.03, 88.92), vector4(-829.64, -756.87, 22.38, 96.09)},
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Calais Avenue"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(1156.3, -1474.06, 34.69),
    spawn = {vector4(1156.3, -1474.06, 34.69, 91.05), vector4(1156.64, -1470.69, 34.69, 94.02), vector4(1157.06, -1467.14, 34.69, 89.63), vector4(1156.87, -1477.94, 34.69, 93.04)}, --  you can add multiple spawn locations into a table
    distance = 20,
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Occupation Ave"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(407.55, -988.39, 29.27),
    spawn = {vector4(407.55, -988.39, 29.27, 50.95), vector4(407.8, -993.19, 29.27, 60.06), vector4(406.72, -997.37, 29.27, 64.75), vector4(407.93, -984.4, 29.27, 54.3)}, --  you can add multiple spawn locations into a table
    distance = 7,
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Eclipse Boulevard"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(-330.43, 281.16, 86.17),
    spawn = {vector4(-330.43, 281.16, 86.17, 91.34), vector4(-329.71, 285.17, 86.13, 99.26), vector4(-329.54, 288.89, 86.12, 86.53), vector4(-329.44, 292.58, 86.14, 97.34)}, --  you can add multiple spawn locations into a table
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Ls Customs"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(-381.27, -136.63, 38.69),
    spawn = {vector4(-379.56, -139.9, 38.69, 299.38), vector4(-383.14, -133.92, 38.69, 296.87), vector4(-385.21, -130.77, 38.69, 298.25), vector4(-386.77, -127.83, 38.68, 296.18)}, --  you can add multiple spawn locations into a table
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Alta St"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(-327.25, -1529.52, 27.54),
    spawn = {vector4(-324.37, -1530.42, 27.54, 7.33), vector4(-327.58, -1529.96, 27.54, 5.98), vector4(-330.47, -1530.1, 27.54, 3.69), vector4(-333.79, -1530.29, 27.55, 4.27)}, --  you can add multiple spawn locations into a table
    distance = 10,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Signal St"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(810.2, -2941.49, 5.91),
    spawn = {vector4(810.2, -2941.49, 5.91, 6.58), vector4(814.72, -2940.48, 5.91, 8.73), vector4(804.58, -2940.45, 5.91, 354.49)}, --  you can add multiple spawn locations into a table
    distance = 10,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Voodoo Place"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(162.97, -3075.21, 5.94),
    spawn = {vector4(162.97, -3075.21, 5.94, 265.55), vector4(162.94, -3070.71, 5.94, 273.55)}, --  you can add multiple spawn locations into a table
    distance = 10,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Marathob avenue"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(-1409.62, -588.83, 30.43),
    spawn = {vector4(-1409.62, -588.83, 30.43, 29.66), vector4(-1406.94, -586.87, 30.41, 33.06), vector4(-1412.68, -590.15, 30.47, 31.93)}, --  you can add multiple spawn locations into a table
    distance = 10,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["innocence Boulevard"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(-240.07, -1475.29, 31.46),
    spawn = {vector4(-240.07, -1475.29, 31.46, 321.89), vector4(-237.44, -1477.75, 31.42, 315.82)}, --  you can add multiple spawn locations into a table
    distance = 10,
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["international airport"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(-1859.94, 5185.15, 6.97),
    spawn = {vector4(-1859.94, 5185.15, 6.97, 37.49), vector4(-1856.67, 5187.37, 6.97, 50.31), vector4(-1867.41, 5178.28, 6.97, 44.16)}, --  you can add multiple spawn locations into a table
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Badside LWM"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(971.49, -115.21, 74.35),
    spawn = {vector4(971.49, -115.21, 74.35, 225.74)}, --  you can add multiple spawn locations into a table
    distance = 5,
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Kantor Pemerintah"] = { -- If you change the name of this garage from Legion Square, you must change the default value of `garage_id` to the same name in the SQL table `players_vehicles`
    coords = vector3(1748.56, 3621.14, 34.95),
    spawn = {vector4(1747.39, 3612.25, 34.99, 302.77), vector4(1745.59, 3615.38, 34.99, 308.7), vector4(1743.78, 3618.27, 34.99, 302.48)}, --  you can add multiple spawn locations into a table
    distance = 20,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 29,
      scale = 0.5
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  }
}

-- Private Garages
Config.PrivGarageCreateCommand = "privategarages"
Config.PrivGarageCreateJobRestriction = {"realestate"}
Config.PrivGarageEnableInteriors = true
Config.PrivGarageHideBlips = false
Config.PrivGarageBlip = {
  id = 357,
  color = 0,
  scale = 0.7
}

-- Job Garages
Config.JobGarageShowBlips = true
Config.JobGarageSetVehicleCommand = "setjobvehicle" -- admin only
Config.JobGarageRemoveVehicleCommand = "removejobvehicle" -- admin only
Config.JobGarageUniqueBlips = false
Config.JobGarageUniqueLocations = true
Config.JobGarageEnableInteriors = true
Config.JobGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["Mechanic PaletoBay"] = {
    coords = vector3(76.88, 6541.29, 31.48),
    spawn = vector4(76.88, 6541.29, 31.48, 322.4),
    distance = 10,
    job = {"mechanic"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "flatbedm2", -- spawn code for vehicle
        plate = "Ftd", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        nickname = "FlatBed", -- Show a custom name instead of the vehicle's real name
        livery = 1,
        extras = {1, 2},
        maxMods = true
      },
      [2] = {
        model = "dmax18",
        plate = "Ftd",
        minJobGrade = 0,
        nickname = "Dmx 18",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      }
    }
  },
  ["Mechanic lscustoms"] = {
    coords = vector3(-359.05, -120.09, 38.7),
    spawn = vector4(-362.98, -122.52, 38.7, 67.3),
    distance = 15,
    job = {"mechanic"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "flatbedm2", -- spawn code for vehicle
        plate = "Ftd", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        nickname = "FlatBed", -- Show a custom name instead of the vehicle's real name
        livery = 1,
        extras = {1, 2},
        maxMods = true
      },
      [2] = {
        model = "dmax18",
        plate = "Ftd",
        minJobGrade = 0,
        nickname = "Dmx 18",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      }
    }
  },
  ["Burgershot Vespucci"] = {
    coords = vector3(-1165.58, -890.21, 14.1),
    spawn = vector4(-1165.58, -890.21, 14.1, 118.06),
    distance = 10,
    job = {"bahamas"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "taco2", -- spawn code for vehicle
        plate = "Burger", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        nickname = "Burger Van", -- Show a custom name instead of the vehicle's real name
        livery = 1,
        extras = {1, 2},
        maxMods = true
      },
      [2] = {
        model = "vespa1",
        plate = "Burger",
        minJobGrade = 0,
        nickname = "'Burger Vespa",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      }
    }
  },
  ["Ambulance Calais"] = {
    coords = vector3(1118.22, -1515.12, 34.69),
    spawn = vector4(1118.22, -1515.12, 34.69, 276.24),
    distance = 10,
    job = {"ambulance"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "ambulancecak", -- spawn code for vehicle
        plate = "Medis", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        nickname = "Ems Ambulance", -- Show a custom name instead of the vehicle's real name
        livery = 1,
        extras = {1, 2},
        maxMods = true
      },
      [2] = {
        model = "ghispo3",
        plate = "Medis",
        minJobGrade = 1,
        nickname = "Ems Sedan G3",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      },
      [3] = {
        model = "ems_gs1200",
        plate = "Medis",
        minJobGrade = 1,
        nickname = "Ems Bike Gs1200",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      }
    }
  },
  ["Ambulance Heli"] = {
    coords = vector3(1202.91, -1546.28, 41.28),
    spawn = vector4(1202.91, -1546.28, 41.28, 88.3),
    distance = 7,
    job = {"ambulance"},
    type = "air",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "aw139", -- spawn code for vehicle
        plate = "Medis", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 3, -- only available to players with set minimum grade
        nickname = "Ems Heli", -- Show a custom name instead of the vehicle's real name
        livery = 1,
        extras = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13},
        maxMods = true
      }
    }
  },
  ["Police Occupation"] = {
    coords = vector3(458.51, -1022.2, 28.28),
    spawn = vector4(448.62, -1020.36, 28.47, 90.96),
    distance = 15,
    job = {"police"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Spawn a basic vehicle from a list
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "police2", -- spawn code for vehicle
        plate = "Polisi", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        nickname = "Polisi Audi", -- Show a custom name instead of the vehicle's real name
        livery = 1,
        extras = {1, 2, 3, 4, 5, 6, 10},
        maxMods = true
      },
      [2] = {
        model = "baracuda",
        plate = "polisi",
        minJobGrade = 6,
        nickname = "Polisi Baracuda",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      },
      [3] = {
        model = "barracks",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Barraks",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      },
      [4] = {
        model = "evleo",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Evleo",
        livery = 2,
        extras = {1, 2, 3, 4, 5, 6, 7},
        maxMods = true
      },
      [5] = {
        model = "evopol",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Evo",
        livery = 2,
        extras = {1, 4},
        maxMods = true
      },
      [6] = {
        model = "hiacepol",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Hiace",
        livery = 2,
        extras = {2, 4, 7},
        maxMods = true
      },
      [7] = {
        model = "elantrapol",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Elantra",
        livery = 2,
        extras = {1, 2, 3, 4, 5, 6, 10},
        maxMods = true
      },
      [8] = {
        model = "brimob1",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Police Brimob",
        livery = 2,
        extras = {1, 2, 3, 4, 5, 6, 7, 8, 9, 12},
        maxMods = true
      },
      [9] = {
        model = "polisivx200",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Vx200",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      },
      [10] = {
        model = "r1200rtp",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi R1200",
        livery = 1,
        extras = {1, 2},
        maxMods = true
      },
      [11] = {
        model = "psp_bmwgs",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Gs",
        livery = 1, 2,
        extras = {1, 2},
        maxMods = true
      },
      [12] = {
        model = "brimobdirtbike",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Brimob Bike",
        livery = 1,
        extras = {1, 2},
        maxMods = true
      },
      [13] = {
        model = "polisidirtbike",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Sanchez",
        livery = 1,
        extras = {1, 2},
        maxMods = true
      },
      [14] = {
        model = "pajeropol",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Pajero",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      },
      [15] = {
        model = "polraptor",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Raptor",
        livery = 1, 2, 3,
        extras = {1, 2, 3, 4, 5},
        maxMods = true
      },
      [16] = {
        model = "riot",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Riot",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      },
      [17] = {
        model = "police3",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Sedan",
        livery = 2,
        extras = {2, 4},
        maxMods = true
      },
      [18] = {
        model = "14tesla",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Tesla",
        livery = 1,
        extras = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12},
        maxMods = true
      },
      [19] = {
        model = "lguard",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Hilux",
        livery = 2,
        extras = {2, 4},
        maxMods = true
      },
      [20] = {
        model = "priuspol",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Taprius",
        livery = 2,
        extras = {1, 2, 3, 4, 5, 6, 10},
        maxMods = true
      },
      [21] = {
        model = "triton",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Triton",
        livery = 2,
        extras = {1, 4},
        maxMods = true
      },
      [22] = {
        model = "wranglerpolisi",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Wrangler",
        livery = 2,
        extras = {1, 2},
        maxMods = true
      },
      [23] = {
        model = "pd_wrangler",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Wrangler Brimob ",
        livery = 1,
        extras = {1, 2},
        maxMods = true
      },
      [24] = {
        model = "zr2",
        plate = "Polisi",
        minJobGrade = 6,
        nickname = "Polisi Zr2 ",
        livery = 1,
        extras = {2, 4},
        maxMods = true
      }
    }
  },
  ["police Heli"] = {
    coords = vector3(449.16, -981.27, 43.69),
    spawn = vector4(449.16, -981.27, 43.69, 282.14),
    distance = 10,
    job = {"police"},
    type = "air",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Use owned vehicles that can anyone in this society can access - more details: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "polmav", -- spawn code for vehicle
        plate = "Police", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 9, -- only available to players with set minimum grade
        nickname = "Police Heli", -- Show a custom name instead of the vehicle's real name
        livery = 2,
        extras = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
        maxMods = true
      }
    }
  }
}

-- Gang Garages (QBCore/Qbox only by default)
Config.GangEnableCustomESXIntegration = false -- Set to true if you've added a custom system to cl/sv-functions.lua
Config.GangGarageShowBlips = true
Config.GangGarageSetVehicleCommand = "setgangvehicle" -- admin only
Config.GangGarageRemoveVehicleCommand = "removegangvehicle" -- admin only
Config.GangGarageUniqueBlips = false
Config.GangGarageUniqueLocations = true
Config.GangGarageEnableInteriors = true
Config.GangGarageLocations = { -- IMPORTANT - Every garage name must be unique
  ["The Lost MC"] = {
    coords = vector3(-219.57, -1491.97, 31.26),
    spawn = vector4(-219.57, -1491.97, 31.26, 319.41),
    distance = 5,
    gang = {"blackfang"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Use personal vehicles
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "dubsta3", -- spawn code for vehicle
        plate = "Badside", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        nickname = "Dubsta3", -- Show a custom name instead of the vehicle's real name
        livery = 0, 1, 2,
        extras = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
        maxMods = false
      },
      [2] = {
        model = "sanchez", -- spawn code for vehicle
        plate = "Badside", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        nickname = "Sanchez", -- Show a custom name instead of the vehicle's real name
        livery = 0, 1, 2,
        extras = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
        maxMods = false
      }
    }
  },
  ["LONE WOLF MC"] = {
    coords = vector3(955.28, -133.24, 74.44),
    spawn = vector4(955.94, -130.91, 74.41, 235.6),
    distance = 5,
    gang = {"lonewm"},
    type = "car",
    hideBlip = true,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "spawner", -- Use personal vehicles
    showLiveriesExtrasMenu = true, -- Allow player to select a livery and extras before pulling vehicle out 
    vehicles = {
      [1] = {
        model = "dubsta3", -- spawn code for vehicle
        plate = "Badside", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        nickname = "Dubsta3", -- Show a custom name instead of the vehicle's real name
        livery = 0, 1, 2,
        extras = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
        maxMods = false
      },
      [2] = {
        model = "zombiea", -- spawn code for vehicle
        plate = "Badside", -- set as false for a random plate; do not use a plate already in use in the DB!
        minJobGrade = 0, -- only available to players with set minimum grade
        nickname = "Sanchez", -- Show a custom name instead of the vehicle's real name
        livery = 0, 1, 2,
        extras = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
        maxMods = false
      }
    }
  }
}

-- Impound
Config.ImpoundCommand = "iv"
Config.ImpoundFeesSocietyFund = "police" -- Job name of society fund to pay impound fees into (optional)
Config.ImpoundShowBlips = true
Config.ImpoundUniqueBlips = false
Config.ImpoundTimeOptions = {0, 1, 4, 12, 24, 72, 168} -- in hours
Config.ImpoundLocations = { -- IMPORTANT - Every impound name must be unique
  ["Impound A"] = {
    coords = vector3(410.8, -1626.26, 29.29),
    spawn = vector4(408.44, -1630.88, 29.29, 136.88),
    distance = 15,
    type = "car",
    job = {"police"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Impound B"] = {
    coords = vector3(1649.71, 3789.61, 34.79),
    spawn = vector4(1643.66, 3798.36, 34.49, 216.16),
    distance = 15,
    type = "car",
    job = {"police"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  }
}

-- Garage Interior
Config.GarageInteriorEntrance = vector4(227.96, -1003.06, -99.0, 0.0)
Config.GarageInteriorCameraCutscene = {
  vector4(227.96, -977.81, -98.99, 0.0), -- from
  vector4(227.96, -1006.96, -98.99, 0.0), -- to (this should be the entrance, or slightly further back from the entrance coords for a better final player transition)
}
Config.GarageInteriorVehiclePositions = {
  vector4(233.000000, -984.000000, -99.410004, 118.000000),
  vector4(233.000000, -988.500000, -99.410004, 118.000000),
  vector4(233.000000, -993.000000, -99.410004, 118.000000),
  vector4(233.000000, -997.500000, -99.410004, 118.000000),
  vector4(233.000000, -1002.000000, -99.410004, 118.000000),
  vector4(223.600006, -979.000000, -99.410004, 235.199997),
  vector4(223.600006, -983.599976, -99.410004, 235.199997),
  vector4(223.600006, -988.200012, -99.410004, 235.199997),
  vector4(223.600006, -992.799988, -99.410004, 235.199997),
  vector4(223.600006, -997.400024, -99.410004, 235.199997),
  vector4(223.600006, -1002.000000, -99.410004, 235.199997),
}

-- Staff Commands
Config.ChangeVehiclePlate = "vplate" -- admin only
Config.DeleteVehicleFromDB = "dvdb" -- admin only
Config.ReturnVehicleToGarage = "vreturn" -- admin only

-- Add your import vehicle's spawn name and desired label here for pretty vehicle names in the garage
-- This is mainly designed for ESX - if you are using QB, do this in shared!
Config.VehicleLabels = {
  ["adlc500"] = "Lexus Lc500",
  ["benzg55"] = "Merc G55",
  ["bmwm5"] = "BM M5",
  ["feltzer9"] = "Feltzer",
  ["gallardosuperlb"] = "Galardio LB",
  ["gtr"] = "Gtr R35",
  ["integra"] = "Integra",
  ["moi8"] = "I8",
  ["offjailbreak2"] = "Offjail",
  ["trevita"] = "Pagini",
  ["p1hrc"] = "Mecleron",
  ["sanchez"] = "Sanchez Livery",
  ["zx6r"] = "Zx6",
  ["enduromk2"] = "Dinka K2",
  ["manchezbw"] = "Maibatsu",
  ["dubsta22"] = "Benelactor"
}

-- Block certain vehicles from being transferred to other players
Config.PlayerTransferBlacklist = {
  "spawnName"
}

Config.AutoRunSQL = true
Config.ReturnToPreviousRoutingBucket = false
Config.HideWatermark = false
Config.__v3Config = true
Config.Debug = false