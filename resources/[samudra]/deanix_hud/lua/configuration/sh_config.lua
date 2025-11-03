Config = {}

Config.Framework = "qbx" -- "auto" | "esx" | "qb" | "qbx"| "custom" | (View auto settings at bottom of config.) ESX: Unsupported ATM

Config.HudSettings = {
    UseMPH = false, -- "true" : MPH | "false" : KM/H
    MinimapVisibleWhileWalking = true, -- "true" : Minimap Shows While Walking | "false" : Minimap Doesn't Show While Walking
    GetFuel = function(vehicle)
        return exports["lc_fuel"]:GetFuel(vehicle)

        -- For Ox Fuel:
        --return Entity(vehicle).state.fuel
    end,
    HudAlwaysOn = true, -- "true" : Hud Always Shows | "false" : Hud Doesn't Show Until Trigger Export. exports["deanix_hud"]:ToggleHud()
    WeaponUI = {
        HideDefaultGTAUI = true,
    },
    CrosshairEnabled = true, -- "true" : Crosshair Shows | "false" : Crosshair Doesn't Show
}



Config.Settings = {
    EnableStress = true, -- "true" : Enables Our Stress System | "false" : Disables Our Stress System
    NoHudVehicles = {
        [`bmx`] = true,
    },
    StressSettings = {
        StressUsage = {
            Shooting = true,
            Driving = true,
        },
        ScreenShake = {
            MinStressForShake = 40,
        },
        ShootingStressChance = 0.1, -- Percentage
        UnbuckledSpeed = 100, -- Going over this speed cause stress
        MinimumSpeed = 100, -- Going over this speed cause stress
        JobWhitelist = {
            police = true,
            ambulance = true
        },
        WeaponWhitelist = {
            [`weapon_petrolcan`] = true,
            [`weapon_hazardcan`] = true,
            [`weapon_fireextinguisher`] = true
        },
        Intensity = {
            [1] = {
                Min = 50,
                Max = 60,
                Intensity = 1500,
            },
            [2] = {
                Min = 60,
                Max = 70,
                Intensity = 2000,
            },
            [3] = {
                Min = 70,
                Max = 80,
                Intensity = 2500,
            },
            [4] = {
                Min = 80,
                Max = 90,
                Intensity = 2700,
            },
            [5] = {
                Min = 90,
                Max = 100,
                Intensity = 3000,
            },
        },
        EffectInterval = {
            [1] = {
                Min = 50,
                Max = 60,
                Timeout = math.random(50000, 60000)
            },
            [2] = {
                Min = 60,
                Max = 70,
                Timeout = math.random(40000, 50000)
            },
            [3] = {
                Min = 70,
                Max = 80,
                Timeout = math.random(30000, 40000)
            },
            [4] = {
                Min = 80,
                Max = 90,
                Timeout = math.random(20000, 30000)
            },
            [5] = {
                Min = 90,
                Max = 100,
                Timeout = math.random(15000, 20000)
            }
        }
    },
}

Config.AmmoTypes = {  -- Ammo Type = 1 : Means that 3 bullets show on UI | Ammo Type = 0 : Means that 1 bullet shows on UI
    {name = "WEAPON_PISTOL", ammoType = 1},
    {name = "WEAPON_COMBATPISTOL", ammoType = 1},
    {name = "WEAPON_APPISTOL", ammoType = 1},
    {name = "WEAPON_HEAVYPISTOL", ammoType = 1},
    {name = "WEAPON_VINTAGEPISTOL", ammoType = 1},
    {name = "WEAPON_REVOLVER", ammoType = 1},
    {name = "WEAPON_MICROSMG", ammoType = 1},
    {name = "WEAPON_SMG", ammoType = 1},
    {name = "WEAPON_ASSAULTSMG", ammoType = 1},
    {name = "WEAPON_ASSAULTRIFLE", ammoType = 1},
    {name = "WEAPON_CARBINERIFLE", ammoType = 1},
    {name = "WEAPON_ADVANCEDRIFLE", ammoType = 1},
    {name = "WEAPON_SPECIALCARBINE", ammoType = 1},
    {name = "WEAPON_BULLPUPRIFLE", ammoType = 1},
    {name = "WEAPON_SNIPERRIFLE", ammoType = 0},
    {name = "WEAPON_HEAVYSNIPER", ammoType = 0},
    {name = "WEAPON_MARKSMANRIFLE", ammoType = 1},
    {name = "WEAPON_PUMPSHOTGUN", ammoType = 1},
    {name = "WEAPON_SAWNOFFSHOTGUN", ammoType = 1},
    {name = "WEAPON_ASSAULTSHOTGUN", ammoType = 1},
    {name = "WEAPON_BULLPUPSHOTGUN", ammoType = 1},
    {name = "WEAPON_FIREWORK", ammoType = 0},
    {name = "WEAPON_RPG", ammoType = 0},
    {name = "WEAPON_GRENADELAUNCHER", ammoType = 0},
    {name = "WEAPON_STINGER", ammoType = 0},
    {name = "WEAPON_MG", ammoType = 1},
    {name = "WEAPON_COMBATMG", ammoType = 1},
    {name = "WEAPON_GUSENBERG", ammoType = 1},
    {name = "WEAPON_FLAREGUN", ammoType = 0}
}

Config.MeleeWeapons = {
    "WEAPON_KNIFE",
    "WEAPON_NIGHTSTICK",
    "WEAPON_HAMMER",
    "WEAPON_BAT",
    "WEAPON_CROWBAR",
    "WEAPON_BOTTLE",
    "WEAPON_DAGGER",
    "WEAPON_MACHETE",
    "WEAPON_TASER",
    "WEAPON_FLASHLIGHT",
    "WEAPON_PETROLCAN",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_WRENCH"
}

if GetResourceState("es_extended") ~= 'missing' then
    Config.Framework = "esx"
    ESX = exports["es_extended"]:getSharedObject()
elseif GetResourceState("qb-core") ~= 'missing' then
    Config.Framework = "qb"
    QB = exports["qb-core"]:GetCoreObject()
elseif GetResourceState("qbx_core") ~= 'missing' then
    Config.Framework = "qbx"
    QBX = exports.qbx_core:GetObject()
end