Citizen.CreateThread(function()
    local blips = {
        {title="Clothing Store", colour=0, id=73, x=72.3, y=-1399.1, z=28.4},
        {title="Clothing Store", colour=0, id=73, x=-703.8, y=-152.3, z=36.4},
        {title="Clothing Store", colour=0, id=73, x=-167.9, y=-299.0, z=38.7},
        {title="Clothing Store", colour=0, id=73, x=428.7, y=-800.1, z=28.5},
        {title="Clothing Store", colour=0, id=73, x=-829.4, y=-1073.7, z=10.3},
        {title="Clothing Store", colour=0, id=73, x=-1447.8, y=-242.5, z=48.8},
        {title="Clothing Store", colour=0, id=73, x=11.6, y=6514.2, z=30.9},
        {title="Clothing Store", colour=0, id=73, x=123.6, y=-219.4, z=53.6},
        {title="Clothing Store", colour=0, id=73, x=1696.3, y=4829.3, z=41.1},
        {title="Clothing Store", colour=0, id=73, x=618.1, y=2759.6, z=41.1},
        {title="Clothing Store", colour=0, id=73, x=1190.6, y=2713.4, z=37.2},
        {title="Clothing Store", colour=0, id=73, x=-1193.4, y=-772.3, z=16.3},
        {title="Clothing Store", colour=0, id=73, x=-3172.5, y=1048.1, z=19.9},
        {title="Clothing Store", colour=0, id=73, x=-1108.4, y=2708.9, z=18.1},
        {title="Barbershop", colour=1, id=71, x=1932.075, y=3729.670, z=32.844},
        {title="Barbershop", colour=1, id=71, x=-278.190, y=6228.361, z=30.695},
        {title="Barbershop", colour=1, id=71, x=1211.990, y=-472.771, z=65.208},
        {title="Barbershop", colour=1, id=71, x=-33.224, y=-154.647, z=55.800},
        {title="Barbershop", colour=1, id=71, x=-1280.410, y=-1117.030, z=6.990},
        {title="Barbershop", colour=1, id=71, x=136.718, y=-1708.267, z=28.291},
        {title="Barbershop", colour=1, id=71, x=-815.590, y=-184.140, z=36.569},
        {title="mechanic", colour=5, id=446, x=79.91, y=6575.51, z=32.07},
        -- {title="Ls Customs", colour=5, id=446, x=-312.1, y=-102.9, z=39.02},
        {title="Tatto Shop", colour=1, id=75, x=319.77, y=180.76, z=102.60},
        {title="Tatto Shop", colour=1, id=75, x=1322.6, y=-1651.9, z=51.2},
        {title="Tatto Shop", colour=1, id=75, x=-1153.6, y=-1425.6, z=4.9},
        {title="Tatto Shop", colour=1, id=75, x=-3170.0, y=1075.0, z=20.8},
        {title="Tatto Shop", colour=1, id=75, x=1864.6, y=3747.7, z=33.0},
        {title="Tatto Shop", colour=1, id=75, x=-293.7, y=6200.0, z=31.4},
        {title="Tambang", colour=5, id=285, x=2935.15, y=2751.47, z=45.09},
        {title="Cuci Batu", colour=5, id=285, x=-1759.22, y=2637.03, z=0.22},
        {title="Peleburan", colour=5, id=285, x=1085.18, y=-2002.48, z=31.39},
        {title="Tukang Kayu", colour=5, id=256, x=-565.51, y=5325.56, z=73.59},
        {title="Kantor Pemerintah", colour=29, id=176, x=1779.44, y=3645.47, z=34.63},
        {title="Bahamas", colour=5, id=93, x=-1390.15, y=-584.38, z= 30.22},
        {title="Jual Ikan", colour=3, id=68, x=-3411.66, y=960.62, z=8.35},
        {title="Sewa Gudang", colour=3, id=557, x=900.64, y=3580.18, z=32.39},

        -- {title="South Rockford Drive", colour=3, id=475, x=-621.0366, y=46.594829, z=43.591472},
    }

    for _, info in pairs(blips) do
        local blip = AddBlipForCoord(info.x, info.y, info.z)
        SetBlipSprite(blip, info.id)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, info.colour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(info.title)
        EndTextCommandSetBlipName(blip)
    end
    local fishingZones = {
        {
            title = "Fishing Zone",
            coords = vector3(-1849.22, -1251.38, 8.62),
            blipId = 68,
            colour = 3,
            radius = 150.0
        }
    }

    for _, zone in pairs(fishingZones) do
        local blip = AddBlipForCoord(zone.coords.x, zone.coords.y, zone.coords.z)
        SetBlipSprite(blip, zone.blipId)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.7)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, zone.colour)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(zone.title)
        EndTextCommandSetBlipName(blip)

        local radiusBlip = AddBlipForRadius(zone.coords.x, zone.coords.y, zone.coords.z, zone.radius)
        SetBlipColour(radiusBlip, zone.colour)
        SetBlipAlpha(radiusBlip, 40)
    end
end)
