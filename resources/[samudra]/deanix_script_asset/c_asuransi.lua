local Config = {}

Config.cooldown = 45

Config.IgnoreVehicles = {
    --kendaraan polisi
    `police2`,
    `baracuda`,
    `barracks`,
    `evleo`,
    `evopol`,
    `hiacepol`,
    `elantrapol`,
    `brimob1`,
    `polisivx200`,
    `r1200rtp`,
    `psp_bmwgs`,
    `brimobdirtbike`,
    `pajeropol`,
    `polraptor`,
    `riot`,
    `police3`,
    `14tesla`,
    `lguard`,
    `priuspol`,
    `triton`,
    `wranglerpolisi`,
    `pd_wrangler`,
    `zr2`,
    --heli police
    `polmav`,

    --kendaraan medis
    `ambulancecak`,
    `ghispo3`,
    `ems_gs1200`,
    `dodgesamu`,
    `ist57srf`,
    --heli ems
    `aw139`,

    --burgershot
    `taco2`,
    `vespa1`,

    --mechanic
    `flatbedm2`,
    `dmax18`,

    --job delivery
    `boxville2`,

    --job bus
    `tourbus`,
    `bus`,
    `airbus`,
    `coach`,

    --job truk
    `phantom3`,
    `tanker`,
    `phantom`,
    `trailerlogs`,
    `trailers4`,
    `docktrailer`,
    `trailers`,
    `tr4`,
    `trailers3`,

    --job kuli bangunan
    `17mov_BuilderCar`,
    `17mov_Mixer`
}

Config.SafeZones = {
    {
        points = {
            vec3(43.22, 6563.47, 30.71),
            vec3(81.14, 6526.09, 30.71),
            vec3(50.84, 6495.46, 30.71),
            vec3(12.5, 6535.48, 30.54),
        }
    },
    {
        points = {
            vec3(-1189.58, -878.16, 13.65),
            vec3(-1173.68, -867.4, 14.1),
            vec3(-1157.78, -891.37, 15.24),
            vec3(-1173.61, -902.28, 13.71),
        }
    }
}

return Config
