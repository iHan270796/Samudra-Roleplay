local Config = {}

Config.GangStashZones = {
    ["blackfang_stash"] = {
        coords = vector3(-249.15, -1525.25, 31.56),
        rotation = 232.81,
        size = vector3(1.5, 1.5, 1.0),
        gang = "blackfang",
        gangLabel = "Blackfang",
        stashId = "gang_blackfang",
        minGrade = 1,
        useProp = true -- pakai prop
    },
    ["whiteblood_stash"] = {
        coords = vector3(-812.30, 189.85, 72.48),
        rotation = 204.35,
        size = vector3(1.5, 1.5, 1.0),
        gang = "whiteblood",
        gangLabel = "Whiteblood",
        stashId = "gang_whiteblood",
        minGrade = 1,
        useProp = false -- hanya zona
    },
    ["lonewolfmc_stash"] = {
        coords = vector3(977.15, -104.66, 74.61),
        rotation = 204.35,
        size = vector3(1.5, 1.5, 1.0),
        gang = "lonewm",
        gangLabel = "lonewolfmc",
        stashId = "gang_lonewolfmc",
        minGrade = 1,
        useProp = false -- hanya zona
    },
}

return Config