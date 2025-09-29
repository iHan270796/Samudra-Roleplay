cache = cache
local healthDamage = 10
local armorDamage = 10

local bones = {
    [0]     = 'NONE',
    [31085] = 'HEAD',
    [31086] = 'HEAD',
    [39317] = 'NECK',
    [57597] = 'SPINE',
    [23553] = 'SPINE',
    [24816] = 'SPINE',
    [24817] = 'SPINE',
    [24818] = 'SPINE',
    [10706] = 'UPPER_BODY',
    [64729] = 'UPPER_BODY',
    [11816] = 'LOWER_BODY',
    [45509] = 'LARM',
    [61163] = 'LARM',
    [18905] = 'LHAND',
    [4089]  = 'LFINGER',
    [4090]  = 'LFINGER',
    [4137]  = 'LFINGER',
    [4138]  = 'LFINGER',
    [4153]  = 'LFINGER',
    [4154]  = 'LFINGER',
    [4169]  = 'LFINGER',
    [4170]  = 'LFINGER',
    [4185]  = 'LFINGER',
    [4186]  = 'LFINGER',
    [26610] = 'LFINGER',
    [26611] = 'LFINGER',
    [26612] = 'LFINGER',
    [26613] = 'LFINGER',
    [26614] = 'LFINGER',
    [58271] = 'LLEG',
    [63931] = 'LLEG',
    [2108]  = 'LFOOT',
    [14201] = 'LFOOT',
    [40269] = 'RARM',
    [28252] = 'RARM',
    [57005] = 'RHAND',
    [58866] = 'RFINGER',
    [58867] = 'RFINGER',
    [58868] = 'RFINGER',
    [58869] = 'RFINGER',
    [58870] = 'RFINGER',
    [64016] = 'RFINGER',
    [64017] = 'RFINGER',
    [64064] = 'RFINGER',
    [64065] = 'RFINGER',
    [64080] = 'RFINGER',
    [64081] = 'RFINGER',
    [64096] = 'RFINGER',
    [64097] = 'RFINGER',
    [64112] = 'RFINGER',
    [64113] = 'RFINGER',
    [36864] = 'RLEG',
    [51826] = 'RLEG',
    [20781] = 'RFOOT',
    [52301] = 'RFOOT',
}
---@enum WeaponClass
local weaponClasses = { -- Define gta weapon classe numbers
    SMALL_CALIBER = 1,
    MEDIUM_CALIBER = 2,
    HIGH_CALIBER = 3,
    SHOTGUN = 4,
    CUTTING = 5,
    LIGHT_IMPACT = 6,
    HEAVY_IMPACT = 7,
    EXPLOSIVE = 8,
    FIRE = 9,
    SUFFOCATING = 10,
    OTHER = 11,
    WILDLIFE = 12,
    NONE = 13,
}
local weapons = { -- Correspond weapon names to their class number
    [`WEAPON_STUNGUN`] = weaponClasses.NONE,
    [`WEAPON_STUNGUN_MP`] = weaponClasses.NONE,
    --[[ Small Caliber ]] --
    [`WEAPON_PISTOL`] = weaponClasses.SMALL_CALIBER,
    [`WEAPON_COMBATPISTOL`] = weaponClasses.SMALL_CALIBER,
    [`WEAPON_APPISTOL`] = weaponClasses.SMALL_CALIBER,
    [`WEAPON_COMBATPDW`] = weaponClasses.SMALL_CALIBER,
    [`WEAPON_MACHINEPISTOL`] = weaponClasses.SMALL_CALIBER,
    [`WEAPON_MICROSMG`] = weaponClasses.SMALL_CALIBER,
    [`WEAPON_MINISMG`] = weaponClasses.SMALL_CALIBER,
    [`WEAPON_PISTOL_MK2`] = weaponClasses.SMALL_CALIBER,
    [`WEAPON_SNSPISTOL`] = weaponClasses.SMALL_CALIBER,
    [`WEAPON_SNSPISTOL_MK2`] = weaponClasses.SMALL_CALIBER,
    [`WEAPON_VINTAGEPISTOL`] = weaponClasses.SMALL_CALIBER,

    --[[ Medium Caliber ]] --
    [`WEAPON_ADVANCEDRIFLE`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_ASSAULTSMG`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_BULLPUPRIFLE`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_BULLPUPRIFLE_MK2`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_CARBINERIFLE`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_CARBINERIFLE_MK2`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_COMPACTRIFLE`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_DOUBLEACTION`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_GUSENBERG`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_HEAVYPISTOL`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_MARKSMANPISTOL`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_PISTOL50`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_REVOLVER`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_REVOLVER_MK2`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_SMG`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_SMG_MK2`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_SPECIALCARBINE`] = weaponClasses.MEDIUM_CALIBER,
    [`WEAPON_SPECIALCARBINE_MK2`] = weaponClasses.MEDIUM_CALIBER,

    --[[ High Caliber ]] --
    [`WEAPON_ASSAULTRIFLE`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_ASSAULTRIFLE_MK2`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_COMBATMG`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_COMBATMG_MK2`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_HEAVYSNIPER`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_HEAVYSNIPER_MK2`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_MARKSMANRIFLE`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_MARKSMANRIFLE_MK2`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_MG`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_MINIGUN`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_MUSKET`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_RAILGUN`] = weaponClasses.HIGH_CALIBER,
    [`WEAPON_HEAVYRIFLE`] = weaponClasses.HIGH_CALIBER,

    --[[ Shotguns ]] --
    [`WEAPON_ASSAULTSHOTGUN`] = weaponClasses.SHOTGUN,
    [`WEAPON_BULLUPSHOTGUN`] = weaponClasses.SHOTGUN,
    [`WEAPON_DBSHOTGUN`] = weaponClasses.SHOTGUN,
    [`WEAPON_HEAVYSHOTGUN`] = weaponClasses.SHOTGUN,
    [`WEAPON_PUMPSHOTGUN`] = weaponClasses.SHOTGUN,
    [`WEAPON_PUMPSHOTGUN_MK2`] = weaponClasses.SHOTGUN,
    [`WEAPON_SAWNOFFSHOTGUN`] = weaponClasses.SHOTGUN,
    [`WEAPON_SWEEPERSHOTGUN`] = weaponClasses.SHOTGUN,

    --[[ Animals ]]                                  --
    [`WEAPON_ANIMAL`] = weaponClasses.WILDLIFE,      -- Animal
    [`WEAPON_COUGAR`] = weaponClasses.WILDLIFE,      -- Cougar
    [`WEAPON_BARBED_WIRE`] = weaponClasses.WILDLIFE, -- Barbed Wire

    --[[ Cutting Weapons ]]                          --
    [`WEAPON_BATTLEAXE`] = weaponClasses.CUTTING,
    [`WEAPON_BOTTLE`] = weaponClasses.CUTTING,
    [`WEAPON_DAGGER`] = weaponClasses.CUTTING,
    [`WEAPON_HATCHET`] = weaponClasses.CUTTING,
    [`WEAPON_KNIFE`] = weaponClasses.CUTTING,
    [`WEAPON_MACHETE`] = weaponClasses.CUTTING,
    [`WEAPON_SWITCHBLADE`] = weaponClasses.CUTTING,

    --[[ Light Impact ]] --
    [`WEAPON_KNUCKLE`] = weaponClasses.LIGHT_IMPACT,

    --[[ Heavy Impact ]] --
    [`WEAPON_BAT`] = weaponClasses.HEAVY_IMPACT,
    [`WEAPON_CROWBAR`] = weaponClasses.HEAVY_IMPACT,
    [`WEAPON_FIREEXTINGUISHER`] = weaponClasses.HEAVY_IMPACT,
    [`WEAPON_FIRWORK`] = weaponClasses.HEAVY_IMPACT,
    [`WEAPON_GOLFLCUB`] = weaponClasses.HEAVY_IMPACT,
    [`WEAPON_HAMMER`] = weaponClasses.HEAVY_IMPACT,
    [`WEAPON_PETROLCAN`] = weaponClasses.HEAVY_IMPACT,
    [`WEAPON_POOLCUE`] = weaponClasses.HEAVY_IMPACT,
    [`WEAPON_WRENCH`] = weaponClasses.HEAVY_IMPACT,
    [`WEAPON_RAMMED_BY_CAR`] = weaponClasses.HEAVY_IMPACT,
    [`WEAPON_RUN_OVER_BY_CAR`] = weaponClasses.HEAVY_IMPACT,

    --[[ Explosives ]] --
    [`WEAPON_EXPLOSION`] = weaponClasses.EXPLOSIVE,
    [`WEAPON_GRENADE`] = weaponClasses.EXPLOSIVE,
    [`WEAPON_COMPACTLAUNCHER`] = weaponClasses.EXPLOSIVE,
    [`WEAPON_HOMINGLAUNCHER`] = weaponClasses.EXPLOSIVE,
    [`WEAPON_PIPEBOMB`] = weaponClasses.EXPLOSIVE,
    [`WEAPON_PROXMINE`] = weaponClasses.EXPLOSIVE,
    [`WEAPON_RPG`] = weaponClasses.EXPLOSIVE,
    [`WEAPON_STICKYBOMB`] = weaponClasses.EXPLOSIVE,
    [`WEAPON_HELI_CRASH`] = weaponClasses.EXPLOSIVE,
    [`WEAPON_EMPLAUNCHER`] = weaponClasses.EXPLOSIVE,

    --[[ Other ]]                                         --
    [`WEAPON_FALL`] = weaponClasses.OTHER,                -- Fall
    [`WEAPON_HIT_BY_WATER_CANNON`] = weaponClasses.OTHER, -- Water Cannon

    --[[ Fire ]]                                          --
    [`WEAPON_ELECTRIC_FENCE`] = weaponClasses.FIRE,
    [`WEAPON_FIRE`] = weaponClasses.FIRE,
    [`WEAPON_MOLOTOV`] = weaponClasses.FIRE,
    [`WEAPON_FLARE`] = weaponClasses.FIRE,
    [`WEAPON_FLAREGUN`] = weaponClasses.FIRE,

    --[[ Suffocate ]]                                           --
    [`WEAPON_DROWNING`] = weaponClasses.SUFFOCATING,            -- Drowning
    [`WEAPON_DROWNING_IN_VEHICLE`] = weaponClasses.SUFFOCATING, -- Drowning Veh
    [`WEAPON_EXHAUSTION`] = weaponClasses.SUFFOCATING,          -- Exhaust
    [`WEAPON_BZGAS`] = weaponClasses.SUFFOCATING,
    [`WEAPON_SMOKEGRENADE`] = weaponClasses.SUFFOCATING,
}

---@alias BodyPartKey string

Injuries = {}

---create/upgrade injury at bone.
---@param bodyPartKey BodyPartKey
---@param weaponHash? number
local function InjureBodyPart(bodyPartKey, weaponHash)
    local severity = Injuries[bodyPartKey]
    if not severity then
        Injuries[bodyPartKey] = {
            level = math.random(1, 3),
            weaponHash = weaponHash,
        }
    else
        severity.level = math.min(severity.level + 1, 4)
        severity.weaponHash = weaponHash
    end
end

---Apply bleeds, injure the body part hit, make ped limp/stagger
---@param ped number
---@param boneId integer
---@param weaponHash? number
---@param weaponClass WeaponClass
---@param damageDone number
local function CheckDamage(ped, boneId, weaponHash, weaponClass, damageDone)
    local bodyPartKey = bones[boneId]
    if not bodyPartKey then return end

    InjureBodyPart(bodyPartKey, weaponHash)
end

---gets the weapon class of the weapon that damaged the player.
---@param ped number player's ped
---@return integer? hash of weapon that damaged player, or nil if player hasn't been damaged.
local function GetDamagingWeapon(ped)
    for hash in pairs(weapons) do
        if HasPedBeenDamagedByWeapon(ped, hash, 0) then
            return tonumber(hash)
        end
    end

    return nil
end

---returns true if player took damage in their upper body or if the weapon class is NONE
---@param isArmorDamaged boolean
---@param bodypart string
---@param weapon number
---@return boolean
local function CheckBodyHitOrWeakWeapon(isArmorDamaged, bodypart, weapon)
    return isArmorDamaged and (bodypart == 'SPINE' or bodypart == 'UPPER_BODY') or weapon == weaponClasses.NONE
end

---Apply damage to health and armor based off of damage done and weapon used.
---@param ped number
---@param damageDone number
---@param isArmorDamaged boolean
---@return number? weaponHash
local function ApplyDamage(ped, damageDone, isArmorDamaged)
    local hit, bone = GetPedLastDamageBone(ped)
    local bodypart = bones[bone]
    local weaponHash = GetDamagingWeapon(ped)
    if not hit or bodypart == 'NONE' then return end
    local weaponClass = weapons[weaponHash]
    if damageDone >= healthDamage then
        local isBodyHitOrWeakWeapon = CheckBodyHitOrWeakWeapon(isArmorDamaged, bodypart, weaponClass)
        if isBodyHitOrWeakWeapon and isArmorDamaged then
            -- armour
        elseif not isBodyHitOrWeakWeapon then
            CheckDamage(ped, bone, weaponHash, weaponClass, damageDone)
        end
    end

    return weaponHash
end

local playerArmor = 100
local Hp = 200

CreateThread(function()
    while true do
        local health = GetEntityHealth(cache.ped)
        local armor = GetPedArmour(cache.ped)
        local isArmorDamaged = (playerArmor ~= armor and armor < (playerArmor - armorDamage) and armor > 0)
        local isHealthDamaged = (Hp ~= health)

        if isArmorDamaged or isHealthDamaged then
            local damageDone = (Hp - health)
            ApplyDamage(cache.ped, damageDone, isArmorDamaged)
        end

        Hp = health
        playerArmor = armor
        Wait(100)
    end
end)

RegisterNUICallback('getInjury', function(body, cb)
    local data = {}
    for bodyPart, injury in pairs(Injuries) do
        data[#data + 1] = {
            level = injury.level,
            key = bodyPart,
        }
    end
    cb(data)
end)


if GetResourceState('qbx_ambulancejob') == 'started' or GetResourceState('qbx_medical') == 'started' then
    RegisterNetEvent('hospital:client:RevivePlayer', function()
        Injuries = {}
    end)
    RegisterNetEvent('qbx_medical:client:playerRevived', function()
        Injuries = {}
    end)
    RegisterNetEvent('qbx_medical:client:playerRevived', function()
        Injuries = {}
    end)
end
