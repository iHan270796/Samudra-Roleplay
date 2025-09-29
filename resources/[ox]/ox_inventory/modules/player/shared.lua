UtilsSlot   = {
    -- left
    [7] = { type = 'backpack', item = {
        'bag',
        'bag2',
        'paramedicbag'
        }
    },
    [8] = { type = 'armor', item = {
        'armour',
        'armourr',
        'heavy_armour'
        }
    },

    [9] = { type = 'phone', item = {
        'phone',
        'yphone_natural',
        'yphone_black',
        'yphone_white',
        'yphone_blue',
        'yflip_mint',
        'yflip_gold',
        'yflip_graphite',
        'yflip_lavender'
        }
    },

    -- right
    [1] = { type = 'money', item = {
        'money'
        }
    },

    [2] = { type = 1, item = {
        'WEAPON_PISTOL',
        'WEAPON_TECPISTOL',
        'WEAPON_APPISTOL',
        'WEAPON_CERAMICPISTOL',
        'WEAPON_PISTOLXM3',
        'WEAPON_COMBATPISTOL',
        'WEAPON_HEAVYPISTOL',
        'WEAPON_MACHINEPISTOL',
        'WEAPON_MARKSMANPISTOL',
        'WEAPON_GADGETPISTOL',
        'WEAPON_PISTOL50',
        'WEAPON_PISTOL_MK2',
        'WEAPON_RAYPISTOL',
        'WEAPON_SNSPISTOL',
        'WEAPON_SNSPISTOL_MK2',
        'WEAPON_VINTAGEPISTOL',
        'WEAPON_DOUBLEACTION',
        'WEAPON_REVOLVER',
        'WEAPON_FLAREGUN',
        'WEAPON_STUNGUN',
        'WEAPON_NIGHTSTICK'
        }
    },
    [3] = { type = 2, item = {
        'WEAPON_SMG',
        'WEAPON_ASSAULTSMG',
        'WEAPON_MICROSMG',
        'WEAPON_MINISMG',
        'WEAPON_SMG_MK2',
        'WEAPON_BATTLERIFLE',
        'WEAPON_ADVANCEDRIFLE',
        'WEAPON_ASSAULTRIFLE',
        'WEAPON_ASSAULTRIFLE_MK2',
        'WEAPON_BULLPUPRIFLE',
        'WEAPON_BULLPUPRIFLE_MK2',
        'WEAPON_CARBINERIFLE',
        'WEAPON_CARBINERIFLE_MK2',
        'WEAPON_COMPACTRIFLE',
        'WEAPON_HEAVYRIFLE',
        'WEAPON_MARKSMANRIFLE',
        'WEAPON_MARKSMANRIFLE_MK2',
        'WEAPON_MILITARYRIFLE',
        'WEAPON_SPECIALCARBINE',
        'WEAPON_SPECIALCARBINE_MK2',
        'WEAPON_PRECISIONRIFLE',
        'WEAPON_TACTICALRIFLE',
        'WEAPON_HEAVYSNIPER',
        'WEAPON_HEAVYSNIPER_MK2'
        }
    },

    -- bottom
    [4] = { type = 3 },
    [5] = { type = 4 },
    [6] = { type = 5 },
}

BagsArray   = UtilsSlot[7].item
ArmourArray = UtilsSlot[8].item

function IsItemType(item, typeItem)
    if not item then
        return false
    end

    if UtilsSlot[item.slot]?.type == typeItem then
        return true
    end

    return false
end

function IsArmour(item)
    if item then
        for i = 1, #ArmourArray do
            if item.name == ArmourArray[i] then
                return true
            end
        end
    end
    return false
end
