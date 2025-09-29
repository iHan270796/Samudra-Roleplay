Config = {}

Config.RequiredCops = 3

Config.Cooldown = 30

Config.LoseItemOnFail = true

Config.RewardItem = "markedbills"
Config.RewardAmount = 50

Config.PoliceJobs = {
    police = true,
    sheriff = true
}

Config.PoliceAlert = {
    Enable = true,
    AtCashier = true,
    AtComputer = true
}

Config.CashierTarget = {
    --model = "prop_till_01",
    label = "Bobol Brangkas",
    icon = "fas fa-lock",
    item = "lockpick",
}

Config.ComputerTarget = {
    --model = 810004487,
    label = "Hack Komputer",
    icon = "fas fa-laptop-code",
    item = "phonehack"
}

Config.VaultTarget = {
    --model = "prop_coffee_mac_02",
    icon = "fas fa-vault",
    label = "Bobol Brangkas"
}

Config.CashierZones = {
    {
        coords = vector3(25.25, -1344.89, 29.41),
        length = 1.2,
        width = 1.0,
        heading = 45.0,
        minZ = 28.42,
        maxZ = 30.62
    },
    {
        coords = vector3(-47.3, -1757.52, 29.28),
        length = 1.2,
        width = 1.0,
        heading = 270.0,
        minZ = 28.49,
        maxZ = 30.69
    },
    {
        coords = vector3(-706.53, -915.52, 18.88),
        length = 1.2,
        width = 1.0,
        heading = 270.0,
        minZ = 17.49,
        maxZ = 19.69
    },
    {
        coords = vector3(373.6, 328.59, 103.68),
        length = 1.2,
        width = 1.0,
        heading = 270.0,
        minZ = 101.49,
        maxZ = 104.69
    },
    {
        coords = vector3(2554.88, 381.39, 108.74),
        length = 1.2,
        width = 1.0,
        heading = 270.0,
        minZ = 107.49,
        maxZ = 109.69
    },
    {
        coords = vector3(2676.21, 3280.97, 55.36),
        length = 1.2,
        width = 1.0,
        heading = 270.0,
        minZ = 53.49,
        maxZ = 57.69
    },
    {
        coords = vector3(1959.32, 3742.29, 32.46),
        length = 1.2,
        width = 1.0,
        heading = 270.0,
        minZ = 30.49,
        maxZ = 34.69
    },
    {
        coords = vector3(548.9, 2668.94, 42.27),
        length = 1.2,
        width = 1.0,
        heading = 270.0,
        minZ = 40.49,
        maxZ = 44.69
    },
    {
        coords = vector3(1729.33, 6417.12, 35.15),
        length = 1.2,
        width = 1.0,
        heading = 270.0,
        minZ = 33.49,
        maxZ = 37.69
    },
    {
        coords = vector3(-3244.57, 1000.66, 12.95),
        length = 1.2,
        width = 1.0,
        heading = 270.0,
        minZ = 10.49,
        maxZ = 14.69
    },
    {
        coords = vector3(-3041.36, 584.27, 8.02),
        length = 1.2,
        width = 1.0,
        heading = 270.0,
        minZ = 6.49,
        maxZ = 10.69
    },
}

Config.ComputerZones = {
    {
        coords = vector3(29.42, -1338.65, 29.27),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 28.42,
        maxZ = 30.62
    },
    {
        coords = vector3(-44.62, -1749.02, 29.17),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 28.42,
        maxZ = 30.62
    },
    {
        coords = vector3(-710.59, -905.47, 19.14),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 17.42,
        maxZ = 20.62
    },
    {
        coords = vector3(379.53, 333.5, 103.37),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 101.42,
        maxZ = 104.62
    },
    {
        coords = vector3(2548.85, 386.19, 108.43),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 107.42,
        maxZ = 109.62
    },
    {
        coords = vector3(2673.01, 3287.98, 55.04),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 53.42,
        maxZ = 57.62
    },
    {
        coords = vector3(1960.17, 3749.95, 32.15),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 30.42,
        maxZ = 34.62
    },
    {
        coords = vector3(545.19, 2662.19, 41.96),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 40.42,
        maxZ = 43.62
    },
    {
        coords = vector3(1736.17, 6420.66, 34.84),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 33.42,
        maxZ = 36.62
    },
    {
        coords = vector3(-3250.37, 1005.74, 12.63),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 10.42,
        maxZ = 14.62
    },
    {
        coords = vector3(-3048.66, 586.72, 7.71),
        length = 1.4,
        width = 1.0,
        heading = 90.0,
        minZ = 6.42,
        maxZ = 10.62
    },
}

Config.VaultZones = {
    {
        coords = vector3(28.22, -1338.68, 29.43),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 28.42,
        maxZ = 30.62
    },
    {
        coords = vector3(-43.97, -1747.94, 29.0),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 28.42,
        maxZ = 30.62
    },
    {
        coords = vector3(-710.29, -904.16, 18.77),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 17.42,
        maxZ = 20.62
    },
    {
        coords = vector3(378.27, 334.16, 103.67),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 101.42,
        maxZ = 104.62
    },
    {
        coords = vector3(2548.47, 384.82, 108.73),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 107.42,
        maxZ = 109.62
    },
    {
        coords = vector3(2672.04, 3286.93, 55.35),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 53.42,
        maxZ = 57.62
    },
    {
        coords = vector3(1958.8, 3749.54, 32.45),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 30.42,
        maxZ = 34.62
    },
    {
        coords = vector3(546.61, 2662.04, 42.26),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 40.42,
        maxZ = 44.62
    },
    {
        coords = vector3(1735.08, 6421.57, 35.14),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 33.42,
        maxZ = 37.62
    },
    {
        coords = vector3(-3250.82, 1004.38, 12.94),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 10.42,
        maxZ = 14.62
    },
    {
        coords = vector3(-3048.55, 585.3, 8.02),
        length = 1.4,
        width = 1.0,
        heading = 0.0,
        minZ = 6.42,
        maxZ = 10.62
    },
}

-- 🔔 Notifikasi ke player (bisa kamu ubah ke frameworkmu sendiri)
function Notify(src, message, type)
    TriggerClientEvent('QBCore:Notify', src, message, type or "primary")
end