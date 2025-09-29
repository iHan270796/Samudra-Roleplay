Config = {}
Config.Cooldown = 1800 -- 30 menit
Config.MinPolisi = 4
Config.Reward = {
    Money = {
        min = 83,
        max = 85
    },
    Item = "markedbills",
    ItemAmount = 1
}
Config.Timers = {
    HackComputer = 10000,
    HackSecureSystem = 30000,
    inDoor = 30000,
    QueueUI = 8000
}
Config.Items = {
    PhoneHack = "phonehack",
    Laptop = "laptop",
    inDoor = "security_card_01"
}
Config.Banks = {
    ["fleeca0"] = {
        label = "Fleeca Bank0",
        hackComputer = vector3(312.26, -279.6, 53.98),
        secureSystem = vector3(311.28, -284.52, 54.16),
        inDoor = vector3(312.78, -284.77, 53.99),
        moneyTable = vector3(313.16, -287.4, 54.34),
        doorId = 76
    },
    ["fleeca1"] = {
        label = "Fleeca Bank1",
        hackComputer = vector3(147.79, -1041.5, 29.07),
        secureSystem = vector3(146.88, -1046.04, 29.37),
        inDoor = vector3(148.59, -1046.57, 29.23),
        moneyTable = vector3(148.65, -1049.13, 29.30),
        doorId = 83
    },
    ["fleeca2"] = {
        label = "Fleeca Bank2",
        hackComputer = vector3(-353.23, -50.7, 48.88),
        secureSystem = vector3(-353.81, -55.29, 49.04),
        inDoor = vector3(-352.11, -55.46, 49.01),
        moneyTable = vector3(-351.86, -58.16, 48.94),
        doorId = 84
    },
    ["fleeca3"] = {
        label = "Fleeca Bank3",
        hackComputer = vector3(-1213.66, -332.42, 37.64),
        secureSystem = vector3(-1210.73, -336.56, 37.78),
        inDoor = vector3(-1209.55, -335.48, 37.76),
        moneyTable = vector3(-1206.99, -337.16, 37.03),
        doorId = 85
    },
    ["fleeca4"] = {
        label = "Fleeca Bank4",
        hackComputer = vector3(1176.72, 2707.87, 37.94),
        secureSystem = vector3(1175.97, 2712.9, 38.09),
        inDoor = vector3(1174.38, 2712.47, 38.07),
        moneyTable = vector3(1173.02, 2715.08, 38.06),
        doorId = 87
    }
}