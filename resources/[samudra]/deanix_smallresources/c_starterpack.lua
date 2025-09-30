

local Config = {}

-- Starterpack untuk pemain laki-laki
Config.ItemsMale = {
    { itemName = "water_bottle", qty = 5 },
    { itemName = "sandwich", qty = 5 },
    { itemName = "yflip_lavender", qty = 1 },
    { itemName = "guidebook", qty = 1 },
    { itemName = "tiket_oplas", qty = 1 },
}

-- Starterpack untuk pemain perempuan
Config.ItemsFemale = {
    { itemName = "water_bottle", qty = 5 },
    { itemName = "sandwich", qty = 5 },
    { itemName = "yflip_lavender", qty = 1 },
    { itemName = "guidebook", qty = 1 },
    { itemName = "tiket_oplas", qty = 1 },
}

-- Kendaraan starterpack berdasarkan gender
Config.VehicleMale = {
    "carry"
}

Config.VehicleFemale = {
    "carry"
}

Config.ChooseVehicleMale = {
    { label = "Senna", model = "senna", image = "nui://deanix_smallresources/html/imgs/dc_jokernsx.png" },
    { label = "Mans 296", model = "a296mans", image = "nui://deanix_smallresources/html/imgs/evo3.png" },
    { label = "HR C63", model = "c63hr", image = "nui://deanix_smallresources/html/imgs/isfhr.png" }
}

Config.ChooseVehicleFemale = {
    { label = "Cat Car", model = "cat_car", image = "nui://deanix_smallresources/html/imgs/brisket.png" },
    { label = "AMG GTR", model = "amggtr", image = "nui://deanix_smallresources/html/imgs/l111s.png" },
    { label = "PIKA 01", model = "pika01", image = "nui://deanix_smallresources/html/imgs/brisket.png" },
    { label = "S2000", model = "hondaS2000", image = "nui://deanix_smallresources/html/imgs/a356a.png" },
}

-- Garasi default untuk penyimpanan kendaraan starterpack
Config.DefaultGarage = "international airport"

return Config