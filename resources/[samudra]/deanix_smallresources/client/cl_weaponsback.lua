local curWeapon = nil
local ox_inventory = exports.ox_inventory
local ped = cache.ped
local playerLoaded = false
local Weapons = {
    -- GUNS
    [`WEAPON_ADVANCEDRIFLE`] = { object = `w_ar_advancedrifle`, item = 'WEAPON_ADVANCEDRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_ASSAULTRIFLE`] = { object = `w_ar_assaultrifle`, item = 'WEAPON_ASSAULTRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_ASSAULTRIFLE_MK2`] = { object = `w_ar_assaultriflemk2`, item = 'WEAPON_ASSAULTRIFLE_MK2', rot = vector3(0,0,0)},
    [`WEAPON_ASSAULTSHOTGUN`] = { object = `w_sg_assaultshotgun`, item = 'WEAPON_ASSAULTSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_ASSAULTSMG`] = { object = `w_sb_assaultsmg`, item = 'WEAPON_ASSAULTSMG', rot = vector3(0,0,0)},
    [`WEAPON_BULLPUPRIFLE`] = { object = `w_ar_bullpuprifle`, item = 'WEAPON_BULLPUPRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_BULLPUPRIFLE_MK2`] = { object = `w_ar_bullpupriflemk2`, item = 'WEAPON_BULLPUPRIFLE_MK2', rot = vector3(0,0,0)},
    [`WEAPON_BULLPUPSHOTGUN`] = { object = `w_sg_bullpupshotgun`, item = 'WEAPON_BULLPUPSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_CARBINERIFLE`] = { object = `w_ar_carbinerifle`, item = 'WEAPON_CARBINERIFLE', rot = vector3(0,0,0)},
    [`WEAPON_CARBINERIFLE_MK2`] = { object = `w_ar_carbineriflemk2`, item = 'WEAPON_CARBINERIFLE_MK2', rot = vector3(0,0,0)},
    [`WEAPON_COMBATMG`] = { object = `w_mg_combatmg`, item = 'WEAPON_COMBATMG', rot = vector3(0,0,0)},
    [`WEAPON_COMBATMG_MK2`] = { object = `w_mg_combatmgmk2`, item = 'WEAPON_COMBATMG_MK2', rot = vector3(0,0,0)},
    [`WEAPON_COMBATPDW`] = { object = `w_sb_pdw`, item = 'WEAPON_COMBATPDW', rot = vector3(0,0,0)},
    [`WEAPON_COMBATSHOTGUN`] = { object = `w_sg_pumpshotgunh4`, item = 'WEAPON_COMBATSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_COMPACTRIFLE`] = { object = `w_ar_assaultrifle_smg`, item = 'WEAPON_COMPACTRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_DBSHOTGUN`] = { object = `w_sg_doublebarrel`, item = 'WEAPON_DBSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_FIREWORK`] = { object = `w_lr_firework`, item = 'WEAPON_FIREWORK', rot = vector3(0,0,0)},
    [`WEAPON_GUSENBERG`] = { object = `w_sb_gusenberg`, item = 'WEAPON_GUSENBERG', rot = vector3(0,0,0)},
    [`WEAPON_HEAVYRIFLE`] = { object = `w_ar_heavyrifleh`, item = 'WEAPON_HEAVYRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_HEAVYSHOTGUN`] = { object = `w_sg_heavyshotgun`, item = 'WEAPON_HEAVYSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_HEAVYSNIPER`] = { object = `w_sr_heavysniper`, item = 'WEAPON_HEAVYSNIPER', rot = vector3(0,0,0)},
    [`WEAPON_HEAVYSNIPER_MK2`] = { object = `w_sr_heavysnipermk2`, item = 'WEAPON_HEAVYSNIPER_MK2', rot = vector3(0,0,0)},
    [`WEAPON_MARKSMANRIFLE`] = { object = `w_sr_marksmanrifle`, item = 'WEAPON_MARKSMANRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_MARKSMANRIFLE_MK2`] = { object = `w_sr_marksmanriflemk2`, item = 'WEAPON_MARKSMANRIFLE_MK2', rot = vector3(0,0,0)},
    [`WEAPON_MG`] = { object = `w_mg_mg`, item = 'WEAPON_MG', rot = vector3(0,0,0)},
    [`WEAPON_MICROSMG`] = { object = `w_sb_microsmg`, item = 'WEAPON_MICROSMG', rot = vector3(0,0,0)},
    [`WEAPON_MILITARYRIFLE`] = { object = `w_ar_bullpuprifleh4`, item = 'WEAPON_MILITARYRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_MINISMG`] = { object = `w_sb_minismg`, item = 'WEAPON_MINISMG', rot = vector3(0,0,0)},
    [`WEAPON_MUSKET`] = { object = `w_ar_musket`, item = 'WEAPON_MUSKET', rot = vector3(0,0,0)},
    [`WEAPON_PUMPSHOTGUN`] = { object = `w_sg_pumpshotgun`, item = 'WEAPON_PUMPSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_PUMPSHOTGUN_MK2`] = { object = `w_sg_pumpshotgunmk2`, item = 'WEAPON_PUMPSHOTGUN_MK2', rot = vector3(0,0,0)},
    [`WEAPON_SAWNOFFSHOTGUN`] = { object = `w_sg_sawnoff`, item = 'WEAPON_SAWNOFFSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_SMG`] = { object = `w_sb_smg`, item = 'WEAPON_SMG', rot = vector3(0,0,0)},
    [`WEAPON_SMG_MK2`] = { object = `w_sb_smgmk2`, item = 'WEAPON_SMG_MK2', rot = vector3(0,0,0)},
    [`WEAPON_SNIPERRIFLE`] = { object = `w_sr_sniperrifle`, item = 'WEAPON_SNIPERRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_SPECIALCARBINE`] = { object = `w_ar_specialcarbine`, item = 'WEAPON_SPECIALCARBINE', rot = vector3(0,0,0)},
    [`WEAPON_SPECIALCARBINE_MK2`] = { object = `w_ar_specialcarbinemk2`, item = 'WEAPON_SPECIALCARBINE_MK2', rot = vector3(0,0,0)},
    [`WEAPON_AUTOSHOTGUN`] = { object = `w_sg_sweeper`, item = 'WEAPON_AUTOSHOTGUN', rot = vector3(0,0,0)},
    [`WEAPON_PRECISIONRIFLE`] = { object = `w_sr_precisionrifle_reh`, item = 'WEAPON_PRECISIONRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_TACTICALRIFLE`] = { object = `w_ar_carbinerifle_reh`, item = 'WEAPON_TACTICALRIFLE', rot = vector3(0,0,0)},
    [`WEAPON_RAYMINIGUN`] = { object = `w_mg_sminigun`, item = 'WEAPON_RAYMINIGUN', rot = vector3(0,0,0)},
    [`WEAPON_RAYCARBINE`] = { object = `w_ar_srifle`, item = 'WEAPON_RAYCARBINE', rot = vector3(0,0,0)},
    [`WEAPON_RAILGUN`] = { object = `w_ar_railgun`, item = 'WEAPON_RAILGUN', rot = vector3(0,0,0)},
    [`WEAPON_RPG`] = { object = `w_lr_rpg`, item = 'WEAPON_RPG', rot = vector3(0,0,0)},
    [`WEAPON_HOMINGLAUNCHER`] = { object = `w_lr_homing`, item = 'WEAPON_HOMINGLAUNCHER', rot = vector3(0,0,0)},
    [`WEAPON_MINIGUN`] = { object = `w_mg_minigun`, item = 'WEAPON_MINIGUN', rot = vector3(0,0,0)},

    ["WEAPON_APPISTOL"] = { object = "w_pi_appistol", item = "WEAPON_APPISTOL", rot = vector3(-90,0,0)},
    [`WEAPON_PISTOL`] = { object = `w_pi_pistol`, item = 'WEAPON_PISTOL', rot = vector3(-90,0,0)},
    [`WEAPON_COMBATPISTOL`] = { object = `w_pi_combatpistol`, item = 'WEAPON_COMBATPISTOL', rot = vector3(-90,0,0)},
    [`WEAPON_PISTOL50`] = { object = `w_pi_pistol50`, item = 'WEAPON_PISTOL50', rot = vector3(-90,0,0)},
    [`WEAPON_SNSPISTOL`] = { object = `w_pi_sns_pistol`, item = 'WEAPON_SNSPISTOL', rot = vector3(-90,0,0)},
    [`WEAPON_HEAVYPISTOL`] = { object = `w_pi_heavypistol`, item = 'WEAPON_HEAVYPISTOL', rot = vector3(-90,0,0)},
    [`WEAPON_VINTAGEPISTOL`] = { object = `w_pi_vintage_pistol`, item = 'WEAPON_VINTAGEPISTOL', rot = vector3(-90,0,0)},
    [`WEAPON_REVOLVER`] = { object = `w_pi_revolver`, item = 'WEAPON_REVOLVER', rot = vector3(-90,0,0)},
    [`WEAPON_DOUBLEACTION`] = { object = `w_pi_wep1_gun`, item = 'WEAPON_DOUBLEACTION', rot = vector3(-90,0,0)},

    -- MELEE
    [`WEAPON_BATTLEAXE`] = {object = `w_me_battleaxe`, item = 'WEAPON_BATTLEAXE', rot = vector3(-90,92.5,0)},
    [`WEAPON_CROWBAR`] = {object = `w_me_crowbar`, item = 'WEAPON_CROWBAR', rot = vector3(0,92.5,0)},
    [`WEAPON_FIREEXTINGUISHER`] = {object = `w_am_fire_exting`, item = 'WEAPON_FIREEXTINGUISHER', rot = vector3(0,92.5,0)},
    [`WEAPON_GOLFCLUB`] = {object = `w_me_gclub`, item = 'WEAPON_GOLFCLUB', rot = vector3(0,92.5,0)},
    [`WEAPON_HATCHET`] = {object = `w_me_hatchet`, item = 'WEAPON_HATCHET', rot = vector3(0,92.5,0)},
    [`WEAPON_HAZARDCAN`] = {object = `w_ch_jerrycan`, item = 'WEAPON_HAZARDCAN', rot = vector3(0,92.5,0)},
    [`WEAPON_FERTILIZERCAN`] = {object = `w_am_jerrycan_sf`, item = 'WEAPON_FERTILIZERCAN', rot = vector3(0,92.5,0)},
    [`WEAPON_MACHETE`] = {object = `w_me_machette_lr`, item = 'WEAPON_MACHETE', rot = vector3(0,92.5,0)},
    [`WEAPON_PETROLCAN`] = {object = `w_am_jerrycan`, item = 'WEAPON_PETROLCAN', rot = vector3(0,92.5,0)},
    [`WEAPON_POOLCUE`] = {object = `w_me_poolcue`, item = 'WEAPON_POOLCUE', rot = vector3(0,92.5,0)},
    [`WEAPON_STONE_HATCHET`] = {object = `w_me_stonehatchet`, item = 'WEAPON_STONE_HATCHET', rot = vector3(0,92.5,0)},
    [`WEAPON_WRENCH`] = {object = `w_me_wrench`, item = 'WEAPON_WRENCH', rot = vector3(0,92.5,0)},
    [`WEAPON_CANDYCANE`] = {object = `w_me_candy_xm3`, item = 'WEAPON_CANDYCANE', rot = vector3(0,92.5,0)},

    [`WEAPON_NIGHTSTICK`] = {
        object = `w_me_nightstick`,
        item = 'WEAPON_NIGHTSTICK',
        rot = vector3(90,90,0),
        pos = vec3(-0.15, -0.08, -0.30),
        bone = 51826,
    },
    [`WEAPON_BAT`] = {
        object = `w_me_bat`,
        item = 'WEAPON_BAT',
        bone = 24818,
        pos = vec3(0.25, -0.20, -0.20),
        rot = vec3(20.0, -90.0, 70.0),
    },
}

local invToBody = {
    [2] = 2,
    [3] = 3,
    [4] = 4,
    [5] = 5,
    [6] = 5,
}

local slots = {
    [2] = {
        bone = 51826,
        pos = vec3(-0.01, 0.0, 0.12),
        entity = nil,
        hash = nil,
        wep = nil
    },
    [3] = {
        pos = vec3(0.14, -0.21, 0.0),
        bone = 24816,
        entity = nil,
        hash = nil,
        wep = nil
    },
    [4] = {
        pos = vec3(0.14, 0.16, 0.0),
        entity = nil,
        hash = nil,
        wep = nil
    },
    [5] = {
        pos = vec3(0.14, 0.20, 0.0),
        hash = nil,
        wep = nil
    },
}

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    playerLoaded = true
    TriggerEvent('ox_inventory:updateInventory')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
   for i, _ in pairs(slots) do
        local slot = slots[i]
        if slot.entity ~= nil then
            SetEntityAsMissionEntity(slot.entity, false, false)
            NetworkRequestControlOfEntity(slot.entity)
            DeleteEntity(slot.entity)
        end
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        for i, _ in pairs(slots) do
            local slot = slots[i]
            if slot.entity ~= nil then
                SetEntityAsMissionEntity(slot.entity, false, false)
                NetworkRequestControlOfEntity(slot.entity)
                DeleteEntity(slot.entity)
            end
        end
    end
end)

local function clearSlot(i)
    if slots[i].entity and DoesEntityExist(slots[i].entity) then
        SetEntityAsMissionEntity(slots[i].entity, false, false)
        NetworkRequestControlOfEntity(slots[i].entity)
        DeleteEntity(slots[i].entity)
    end
    slots[i].entity = nil
    slots[i].hash = nil
    slots[i].wep = nil
end

local function checkForSlot(hash)
    for i, _ in pairs(slots) do
        if slots[i].hash == hash then return false end
    end
    for i, _ in pairs(slots) do
        local slot = slots[i]
        if not slot.entity then
            return i
        end
    end
    return false
end

local function putOnBack(hash, forcedSlot)
    local whatSlot = forcedSlot or checkForSlot(hash)

    if not whatSlot then return end

    if slots[whatSlot].entity and DoesEntityExist(slots[whatSlot].entity) then
        DeleteEntity(slots[whatSlot].entity)
        slots[whatSlot].entity = nil
    end

    local weapon = Weapons[hash]
    if not weapon then return end

    local object = weapon.object
    local item   = weapon.item
    local model  = type(object) == "string" and joaat(object) or object
    lib.requestModel(model, 500)

    local coords = GetEntityCoords(ped)
    local prop   = CreateObject(model, coords.x, coords.y, coords.z, true, true, true)

    slots[whatSlot].entity = prop
    slots[whatSlot].hash   = hash
    slots[whatSlot].wep    = item

    local bone = weapon.bone or slots[whatSlot].bone or 24816
    local pos  = weapon.pos  or slots[whatSlot].pos  or vec3(0.0, 0.0, 0.0)
    local rot  = weapon.rot  or slots[whatSlot].rot  or vec3(0.0, 0.0, 0.0)

    AttachEntityToEntity(
        prop,
        ped,
        GetPedBoneIndex(ped, bone),
        pos.x, pos.y, pos.z,
        rot.x, rot.y, rot.z,
        true, true, false, true, 2, true
    )
end

AddEventHandler('ox_inventory:currentWeapon', function(data)
    if not LocalPlayer.state.isLoggedIn then return end
    local items = ox_inventory:GetPlayerItems()

    if data and Weapons[data.hash] then
        local newWeapon = data.hash
        if curWeapon and curWeapon ~= newWeapon and Weapons[curWeapon] then
            for _, item in pairs(items) do
                if item and joaat(item.name) == curWeapon then
                    local bodySlot = invToBody[item.slot]
                    if bodySlot then
                        putOnBack(curWeapon, bodySlot)
                    end
                    break
                end
            end
        end
        curWeapon = newWeapon
        for _, item in pairs(items) do
            if item and joaat(item.name) == curWeapon then
                local bodySlot = invToBody[item.slot]
                if bodySlot then
                    clearSlot(bodySlot)
                end
                break
            end
        end

    else
        if curWeapon then
            for _, item in pairs(items) do
                if item and joaat(item.name) == curWeapon then
                    local bodySlot = invToBody[item.slot]
                    if bodySlot then
                        putOnBack(curWeapon, bodySlot)
                    end
                    break
                end
            end
        end
        curWeapon = nil
    end
end)

AddEventHandler('ox_inventory:updateInventory', function(_)
    if not LocalPlayer.state.isLoggedIn then return end
    playerLoaded = true

    local items = ox_inventory:GetPlayerItems()
    local activeSlots = {}

    for _, item in pairs(items) do
        local hash = joaat(item.name)
        local bodySlot = invToBody[item.slot]
        if Weapons[hash] then
            activeSlots[item.slot] = true
            if hash ~= curWeapon and bodySlot and (not slots[bodySlot].entity or not DoesEntityExist(slots[bodySlot].entity)) then
                putOnBack(hash, bodySlot)
            end
        end
    end

    for bodySlot, v in pairs(slots) do
        local keep = false
        for slot,_ in pairs(activeSlots) do
            if invToBody[slot] == bodySlot then
                keep = true
                break
            end
        end
        if not keep and (not curWeapon or v.hash ~= curWeapon) then
            clearSlot(bodySlot)
        end
    end
end)

lib.onCache('vehicle', function(value)
    if value then
        for i, _ in pairs(slots) do
            clearSlot(i)
        end
    else
        if GetResourceState('ox_inventory') ~= 'started' or not playerLoaded then return end

        local items = ox_inventory:GetPlayerItems()
        for _, item in pairs(items) do
            local hash = joaat(item.name)
            local bodySlot = invToBody[item.slot]
            if Weapons[hash] and bodySlot and hash ~= curWeapon then
                putOnBack(hash, bodySlot)
            end
        end
    end
end)

CreateThread(function()
    local wasInVehicle = false

    while true do
        Wait(500)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)

        if veh ~= 0 and not wasInVehicle then
            wasInVehicle = true
            for i, slot in pairs(slots) do
                if slot.entity and DoesEntityExist(slot.entity) then
                    DetachEntity(slot.entity, true, true)
                    DeleteEntity(slot.entity)
                    slot.entity = nil
                end
            end

        elseif veh == 0 and wasInVehicle then
            wasInVehicle = false
            if GetResourceState('ox_inventory') == 'started' and playerLoaded then
                local items = ox_inventory:GetPlayerItems()
                for _, item in pairs(items) do
                    local hash = joaat(item.name)
                    local bodySlot = invToBody[item.slot]
                    if Weapons[hash] and bodySlot and hash ~= curWeapon then
                        putOnBack(hash, bodySlot)
                    end
                end
            end
        end
    end
end)

lib.onCache('ped', function(value)
    ped = value
end)

CreateThread(function() 
    while not LocalPlayer.state.isLoggedIn do Wait(1000) end

    Wait(3000)

    local PlayerData = QBCore.Functions.GetPlayerData()

    for slot, v in pairs(PlayerData.items) do
        local hash = joaat(v.name)
        if Weapons[hash] then
            local bodySlot = invToBody[slot]
            if bodySlot then
                putOnBack(hash, bodySlot)
            end
        end
    end

    while true do
        Wait(250)
        if LocalPlayer.state.isLoggedIn then
            for k, v in pairs(slots) do
                if v.wep and v.hash ~= curWeapon then
                    local entexists = DoesEntityExist(v.entity)
                    local entattached = entexists and IsEntityAttachedToEntity(v.entity, ped)
                    local entmodel = entexists and entattached and GetEntityModel(v.entity)

                    if v.entity == 0 or not entexists or not entattached or Weapons[v.hash].object ~= entmodel then
                        if entexists and not entattached then
                            SetEntityAsMissionEntity(v.entity, false, false)
                            NetworkRequestControlOfEntity(v.entity)
                            DeleteEntity(v.entity)
                        end

                        lib.requestModel(Weapons[v.hash].object, 500)
                        local coords = GetEntityCoords(ped)
                        local prop = CreateObject(Weapons[v.hash].object, coords.x, coords.y, coords.z,  true,  true, true)
                        slots[k].entity = prop
                        slots[k].hash = v.hash
                        local bone = Weapons[v.hash].bone or slots[k].bone or 24816
                        local pos  = Weapons[v.hash].pos  or slots[k].pos  or vec3(0.0, 0.0, 0.0)
                        local rot  = Weapons[v.hash].rot  or slots[k].rot  or vec3(0.0, 0.0, 0.0)

                        AttachEntityToEntity(
                        prop,
                        ped,
                        GetPedBoneIndex(ped, bone),
                        pos.x, pos.y, pos.z,
                        rot.x, rot.y, rot.z,
                        true, true, false, true, 2, true
                        )
                    end
                end
            end
        else
            Wait(2000)
        end
    end
end)