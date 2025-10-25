Config = {}

Config.UseJobCheck = false
Config.JobName = 'tailor' 

Config.ItemKapas = 'kapas'
Config.ItemBenang = 'benang'
Config.ItemKain = 'kain'
Config.ItemBaju = 'baju'

-- jumlah task per stage
Config.TasksForKapas = 10   -- 10 lokasi pengambilan kapas
Config.TasksForBenang = 3
Config.TasksForKain = 2
Config.TasksForBaju = 8
Config.TaskDuration = 4000 -- 4 detik per task
Config.KapasGiveAmount = 1
Config.BenangGiveAmount = 1
Config.KainGiveAmount = 1
Config.BajuGiveAmount = 50 -- hasil akhir 50 baju
Config.BenangRequired = 1 -- butuh 1 kapas untuk bikin benang
Config.KainRequired = 1   -- butuh 1 benang untuk bikin kain
Config.BajuRequired = 1   -- butuh 1 kain untuk bikin baju

Config.Coords = {
    JobStart = vector4(714.26, -976.57, 24.13, 178.08),
    VehicleSpawn = vector4(721.87, -982.02, 24.1, 271.31),
    VehicleStore = vector3(721.87, -982.02, 24.1),

    KapasStations = {
        vector3(1595.02, -2598.8, 52.58), vector3(1620.75, -2571.9, 61.89),
        vector3(1604.03, -2598.37, 53.16), vector3(1626.08, -2581.76, 58.83),
        vector3(1613.36, -2589.28, 56.23), vector3(1624.49, -2597.22, 54.37),
        vector3(1615.19, -2579.56, 59.26), vector3(1613.49, -2610.07, 50.18),
        vector3(1604.31, -2571.03, 61.3), vector3(1600.1, -2619.31, 47.07),
        vector3(1581.66, -2610.23, 49.08), vector3(1577.4, -2624.28, 45.61),
        vector3(1558.52, -2633.63, 43.84), vector3(1550.05, -2622.05, 46.05),
        vector3(1550.39, -2603.98, 49.55), vector3(1550.39, -2603.98, 49.55),
        vector3(1566.53, -2591.04, 53.14), vector3(1579.59, -2580.87, 56.49),
        vector3(1594.39, -2579.6, 58.02), vector3(1591.77, -2565.07, 62.16),
    },

    BenangStations = {
        vector3(712.78, -958.68, 29.43), vector3(710.53, -973.11, 29.43),
        vector3(718.96, -958.68, 29.43),
    },

    KainStations = {
        vector3(712.04, -974.4, 30.37), vector3(713.7, -974.93, 30.4),
    },

    BajuStation = {
        vector3(714.3, -967.75, 30.39), vector3(716.14, -960.69, 30.6),
        vector3(714.3, -969.94, 30.39), vector3(718.7, -963.16, 30.6),
        vector3(714.3, -972.16, 30.39), vector3(718.7, -960.68, 30.6),
        vector3(713.6, -960.64, 30.6), vector3(715.97, -963.09, 30.6),
    }
}

Config.VehicleModel = 'bison'

-- marker untuk simpan kendaraan
Config.Marker = {
    type = 20,
    size = { x = 1.0, y = 1.0, z = 1.0 },
    color = { r = 0, g = 150, b = 255, a = 150 }
}

Config.TextUI = {
    StoreVehicle = '[E] Simpan Kendaraan Kerja'
}

Config.UI = {
    taskUI = true
}

--pakaian

Config.WorkClothes = {
    male = {
        {component_id = 3, drawable = 52, texture = 0}, -- arms
        {component_id = 11, drawable = 342, texture = 6}, -- torso
        {component_id = 4, drawable = 6, texture = 0},  -- pants
        {component_id = 8, drawable = 0, texture = 0},  -- t-shirt
        {component_id = 6, drawable = 78, texture = 0},  -- shoes
        helmet = {clotheId = 3, variation = 1}
    },
    female = {
        {component_id = 3, drawable = 3, texture = 0},
        {component_id = 11, drawable = 4, texture = 0},
        {component_id = 4, drawable = 4, texture = 0},
        {component_id = 8, drawable = 6, texture = 0},
        {component_id = 6, drawable = 7, texture = 0},
        helmet = {clotheId = 0, variation = 0}
    }
}

