-- https://docs.fivem.net/natives/?_0x4757F00BC6323CFE
local Config = {}

Config.WeaponDamage = {
    -- TEMPLATE: [``] = 0.0,

    -- Melee
    [`WEAPON_NIGHTSTICK`] = 0.2,
    [`WEAPON_FLASHLIGHT`] = 0.1,
    [`WEAPON_CANDYCANE`] = 0.2,
    [`WEAPON_UNARMED`] = 0.2,

    --pistol
    [`WEAPON_PISTOL`] = 0.90,
    [`WEAPON_PISTOL50`] = 0.20,
    [`WEAPON_COMBATPISTOL`] = 0.40,
    [`WEAPON_APPISTOL`] = 0.30,
    [`WEAPON_HEAVYPISTOL`] = 0.20,
    [`WEAPON_MACHINEPISTOL`] = 0.20,

    [`WEAPON_NAVYREVOLVER`] = 0.10,
    [`WEAPON_COMBATPDW`] = 0.20,
    [`WEAPON_REVOLVER_MK2`] = 0.10,
    [`WEAPON_DOUBLEACTION`] = 0.25,
    [`WEAPON_MARKSMANPISTOL`] = 0.18,

    --smg
    [`WEAPON_SMG`] = 0.25,
    [`WEAPON_MINISMG`] = 0.27,
    [`WEAPON_MICROSMG`] = 0.30,
    [`WEAPON_GUSENBERG`] = 0.20,

    --rifle
    [`WEAPON_CARBINERIFLE`] = 0.20,
    [`WEAPON_SPECIALCARBINE`] = 0.20,
    [`WEAPON_ASSAULTRIFLE_MK2`] = 0.18,
    [`WEAPON_COMPACTRIFLE`] = 0.22,
    [`WEAPON_TACTICALRIFLE`] = 0.18,

    --shotgune
    [`WEAPON_BULLPUPSHOTGUN`] = 0.25,
    [`WEAPON_SAWNOFFSHOTGUN`] = 0.10,
    [`WEAPON_PUMPSHOTGUN`] = 0.25,

    -- Anti-Cheaters Weapons
    [`WEAPON_RAYMINIGUN`] = 0.0,
    [`WEAPON_RAILGUNXM3`] = 0.0,
    [`WEAPON_RAILGUN`] = 0.0,
    [`WEAPON_FIREWORK`] = 0.0,
    [`WEAPON_MINIGUN`] = 0.0,
    [`WEAPON_RAYCARBINE`] = 0.0,
    [`WEAPON_SNIPERRIFLE`] = 2.0,
    [`WEAPON_HEAVYSNIPER`] = 2.0,

    -- Addons 
    [`WEAPON_TOYSHOVEL`] = 0.1,
    [`WEAPON_SHOE`] = 0.1,
}
return Config