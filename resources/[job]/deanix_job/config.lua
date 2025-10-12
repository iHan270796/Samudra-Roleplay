Config = {}

-------------------------------
-- MINING CONFIG
-------------------------------

Config.MiningLocations = {
    vector3(2935.15, 2751.47, 45.09),
    vector3(2942.65, 2733.04, 46.43),
    vector3(2956.53, 2726.66, 48.86),
    vector3(2972.02, 2734.59, 47.04),
    vector3(2977.89, 2745.01, 44.42),
    vector3(2985.22, 2751.29, 43.2),
    vector3(2991.07, 2750.63, 43.67),
    vector3(2998.58, 2751.03, 44.31),
    vector3(2999.99, 2755.02, 43.49),
    vector3(3004.29, 2762.05, 43.56),
    vector3(3004.84, 2783.25, 44.67),
    vector3(2999.11, 2794.72, 44.91),
    vector3(2985.41, 2817.56, 46.05),
    vector3(2980.12, 2826.31, 46.17),
    vector3(2977.39, 2832.55, 46.43),
}

Config.WashingSpot = vector3(-1759.22, 2637.03, 0.22)
Config.SmeltingSpot = vector3(1085.18, -2002.48, 31.39)

Config.RequiredItem = 'drill'
Config.StoneItem = 'stone'
Config.WashedStoneItem = 'batu_bersih'

Config.SmeltingResults = {
    "emas",
    "tembaga",
    "diamon",
    "besi"
}

Config.DrillMaxDurability = 5
Config.AxeMaxDurability = 5

Config.RockProps = {
    'prop_rock_1_g'
}

Config.DrillProp = 'ch_prop_laserdrill_01a'

Config.MiningAnim = {
    dict = "anim@heists@fleeca_bank@drilling",
    anim = "drill_straight_fail"
}

Config.MiningTime = 10000
Config.MinigameCount = 3
Config.MinigameKeys = { "A", "W", "S", "D" }

-------------------------------
-- LUMBERJACK CONFIG
-------------------------------

Config.TreeLocations = {
    vector3(-571.64, 5434.9, 60.81),
    vector3(-577.4, 5439.71, 60.46),
    vector3(-552.94, 5463.44, 65.08),
    vector3(-547.67, 5459.58, 66.79),
    vector3(-543.53, 5451.36, 67.38),
    vector3(-537.11, 5450.33, 69.36),
    vector3(-530.09, 5459.24, 71.17),
    vector3(-524.08, 5458.62, 72.92),
    vector3(-519.16, 5452.44, 74.39),
    vector3(-512.14, 5455.12, 76.29),
    vector3(-507.44, 5460.27, 77.81),
    vector3(-504.22, 5467.05, 78.91),
    vector3(-500.82, 5475.66, 79.73),
    vector3(-499.24, 5487.51, 78.92),
    vector3(-495.36, 5502.89, 78.87),
    vector3(-518.06, 5481.45, 72.52),
    vector3(-524.32, 5496.08, 68.27),
}

Config.WoodProcessingSpot = vector3(-552.07, 5329.17, 74.16)
Config.AxeItem = 'axe'
Config.WoodItem = 'kayu'

Config.TreeProps = {
    'prop_tree_pine_01'
}

Config.AxeAnim = {
    dict = "melee@large_wpn@streamed_core",
    anim = "ground_attack_on_spot"
}

Config.ChopTime = 6500
Config.TreeRespawnTime = 900000 -- 15 minutes
Config.RockRespawnTime = 900000 -- 15 minutes

-------------------------------
-- SHARED / GENERAL
-------------------------------

Config.Notifications = {
    NeedDrill = "You need a drill to mine!",
    DrillBroken = "Bor kamu rusak!",
    DrillDurabilityLost = "Bor kamu mengalami kerusakan!",
    MiningFailed = "Gagal menambang!",
    MiningSuccess = "Kamu berhasil mendapatkan batu!",

    NoStone = "Kamu tidak punya batu untuk dicuci!",
    NoWashed = "Kamu tidak punya batu bersih untuk dilebur!",
    WashSuccess = "Batu berhasil dicuci menjadi batu bersih.",
    SmeltSuccess = "Kamu mendapatkan hasil dari peleburan batu bersih.",

    NeedAxe = "Kamu butuh kapak untuk menebang pohon!",
    ChopSuccess = "Kamu berhasil mendapatkan kayu!",
    TreeGone = "Pohon ini sudah ditebang, tunggu pohon tumbuh kembali.",
    AxeBroken = "Kapakmu rusak!"
}
