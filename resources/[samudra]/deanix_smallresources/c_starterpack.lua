

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
    "tundra2020sfh"
}

Config.VehicleFemale = {
    "mrbeanmini",
    "tundra2020sfh"
}

Config.ChooseVehicleMale = {
    { label = "Joker Nsx", model = "dc_jokernsx", image = "nui://deanix_smallresources/html/imgs/dc_jokernsx.png" },
    { label = "Evo Royal", model = "RoyalCustomEVO3", image = "nui://deanix_smallresources/html/imgs/evo3.png" },
    { label = "Isf Hr", model = "isfhr", image = "nui://deanix_smallresources/html/imgs/isfhr.png" }
}

Config.ChooseVehicleFemale = {
    { label = "Brisket", model = "brisket", image = "nui://deanix_smallresources/html/imgs/brisket.png" },
    { label = "L111S", model = "l111s", image = "nui://deanix_smallresources/html/imgs/l111s.png" },
    -- { label = "MH8", model = "mh8", image = "nui://deanix_smallresources/html/imgs/brisket.png" },
    { label = "356 A", model = "a356a", image = "nui://deanix_smallresources/html/imgs/a356a.png" },
}

-- Garasi default untuk penyimpanan kendaraan starterpack
Config.DefaultGarage = "international airport"

return Config