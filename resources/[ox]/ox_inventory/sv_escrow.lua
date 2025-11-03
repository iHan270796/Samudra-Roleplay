local ServerFuncs = {}
local ESX, QBCore, QBX, FrameworkName = nil, nil, nil, nil

CreateThread(function()
    Wait(5000)
    if GetResourceState('qbx_core') == 'started' then
        QBX = exports.qbx_core
        FrameworkName = 'qbx'
    elseif GetResourceState('qb-core') == 'started' then
        QBCore = exports['qb-core']:GetCoreObject()
        FrameworkName = 'qb'
    elseif GetResourceState('es_extended') == 'started' then
        ESX = exports.es_extended:getSharedObject()
        FrameworkName = 'esx'
    end
    GlobalState.fw = FrameworkName
    if not Config.Backpack.owner then
        exports.ox_inventory:RegisterStash('backpack', 'Backpack', Config.Backpack.slots, Config.Backpack.maxWeight, true)
    end
end)

local function GetPlayerObject(src)
    if FrameworkName == 'esx' then
        return ESX.GetPlayerFromId(src)
    elseif FrameworkName == 'qb' then
        return QBCore.Functions.GetPlayer(src)
    elseif FrameworkName == 'qbx' then
        return QBX:GetPlayer(src)
    end
end

function ServerFuncs.getIdentifier(src)
    local player = GetPlayerObject(src)
    if not player then return nil end
    if player.getIdentifier then
        return player.getIdentifier()
    elseif player.PlayerData then
        return player.PlayerData.citizenid
    end
end

function ServerFuncs.GetBankBal(src)
    local player = GetPlayerObject(src)
    if not player then return 0 end
    if FrameworkName == 'esx' then
        return player.getAccount('bank').money
    else
        return player.PlayerData.money.bank
    end
end

function ServerFuncs.RemoveMoney(src, amount, reason)
    local player = GetPlayerObject(src)
    if not player then return false end
    if FrameworkName == 'esx' then
        return player.removeAccountMoney('bank', amount)
    else
        return player.Functions.RemoveMoney('bank', amount, reason)
    end
end

local function GetBackpackSlotWeight(item)
    local data = exports.ox_inventory:Items(item)
    if not data then return Config.Backpack.slots, Config.Backpack.maxWeight end
    local slots = data.bp_slot or Config.Backpack.slots
    local weight = (data.bp_weight or Config.Backpack.maxWeight) * 1000
    return slots, weight
end

local function IsBackpackItem(item)
    if not item then return false end
    local info = exports.ox_inventory:Items(item)
    if info and info.backpack then return true end
    for _,v in ipairs(Config.UtilitySlots[1] or {}) do if v == item then return true end end
    for _,v in ipairs(Config.BackpackBlacklist or {}) do if v == item then return true end end
    return false
end

local function RegisterBackpackStash(stashId, item)
    local slots, weight = GetBackpackSlotWeight(item)
    exports.ox_inventory:RegisterStash(stashId, 'Backpack', slots, weight, false)
end

local function GetPlayerBackpackSlot(src)
    local slot = exports.ox_inventory:GetSlot(src, 1)
    if slot and IsBackpackItem(slot.name) then return slot end
end

lib.callback.register('raihan-inventory:GetBackpackItem', function(_, src)
    local state = Player(src).state
    if not state.backpack then return false end

    local inv = exports.ox_inventory:GetInventory(src)
    if not inv or not inv.items then return false end

    local item = inv.items[1]
    if not item or not IsBackpackItem(item.name) then return false end

    local slots, weight = GetBackpackSlotWeight(item.name)
    return {
        hasBackpack = true,
        slots = slots,
        maxWeight = weight,
        id = state.backpack.id,
        itemName = item.name
    }
end)

local function GetCurrentTheme()
    local key = Config.Themes.current or 'default'
    local theme = Config.Themes.themes[key]
    if not theme then
        -- print(('^3[WARNING]^7 Theme %s not found, using default'):format(key))
        theme = Config.Themes.themes.default
    end
    return {name=key, displayName=theme.name, colors=theme.colors}
end

lib.callback.register('raihan-inventory:getTheme', function() return GetCurrentTheme() end)

RegisterNetEvent('raihan-inventory:changeTheme', function(theme)
    local src = source
    if Config.Themes.themes[theme] then
        Config.Themes.current = theme
        TriggerClientEvent('raihan-inventory:themeChanged', -1, GetCurrentTheme())
        print(('^2[INFO]^7 Theme changed to: %s by %s'):format(theme, src))
    else
        TriggerClientEvent('ox_lib:notify', src, {type='error', description='Invalid theme name: '..theme})
    end
end)

lib.callback.register('raihan-inventory:ESX:GetLicense', function(_, src)
    local ply = GetPlayerObject(src)
    if ply and ply.getIdentifier then return ply.getIdentifier() end
end)

lib.callback.register('sk-inv:getIdent', function(_, src)
    return ServerFuncs.getIdentifier(src)
end)

RegisterNetEvent('raihan-inventory:RemoveParachute', function()
    exports.ox_inventory:RemoveItem(source, 'parachute', 1)
end)

RegisterNetEvent('raihan-inventory:UpdateArmor', function(value, slot)
    local item = exports.ox_inventory:GetSlot(source, slot)
    if item then
        item.metadata.value = value
        exports.ox_inventory:SetMetadata(source, item.slot, item.metadata)
    end
end)

RegisterNetEvent('raihan-inventory:SyncBackpackClothes', function(owner)
    TriggerClientEvent('raihan-inventory:SetBackpackClothes', -1, source, owner)
    if owner and Config.Backpack.owner then
        local slot = GetPlayerBackpackSlot(source)
        if slot then RegisterBackpackStash('backpack-'..owner, slot.name) end
    end
end)

RegisterServerEvent('raihan-inventory:Armor:GetIdentifier', function()
    TriggerClientEvent('raihan-inventory:Armor:RecieveIdentifier', source, ServerFuncs.getIdentifier(source))
end)

AddEventHandler('ox_inventory:itemEquipped', function(src, item, slot)
    if slot == 1 and IsBackpackItem(item.name) and Config.Backpack.owner then
        local state = Player(src).state
        if state and state.backpack then
            RegisterBackpackStash('backpack-'..state.backpack.id, item.name)
        end
    end
end)

local function ArmorValueFromPlates(plates)
    return math.min(plates * Config.ArmorPlates.ArmorPerPlate, 100)
end

-- local function PlatesFromArmorValue(armor)
--     if armor >= 100 then return 5 end
--     if armor > 80 then return 4 end
--     if armor > 60 then return 3 end
--     if armor > 40 then return 2 end
--     if armor > 20 then return 1 end
--     return 0
-- end

local function PlatesFromArmorValue(armor)
    local armorPerPlate = Config.ArmorPlates.ArmorPerPlate
    local maxPlates = Config.ArmorPlates.MaxPlates

    -- hitung jumlah plate yang masih aktif
    local plates = math.ceil(armor / armorPerPlate)

    if plates > maxPlates then plates = maxPlates end
    if plates < 0 then plates = 0 end

    return plates
end

RegisterNetEvent('armor:insertPlate', function()
    local src = source
    local ped = GetPlayerPed(src)
    local vest = exports.ox_inventory:GetSlot(src, 2)
    if not vest then
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = 'Tidak Ada Armor Di Slot Armor' })
        return
    end

    local meta = vest.metadata or {}
    local plates = meta.plates or 0
    local armorValue = meta.armorValue or GetPedArmour(ped)
    local armorPerPlate = Config.ArmorPlates.ArmorPerPlate
    local maxPlates = Config.ArmorPlates.MaxPlates

    if plates >= maxPlates then
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = 'Vest is full' })
        return
    end

    if exports.ox_inventory:RemoveItem(src, Config.ArmorPlates.PlateItem, 1) then
        plates += 1
        local newArmor = armorValue + armorPerPlate
        local maxArmor = ArmorValueFromPlates(plates)
        if newArmor > maxArmor then
            newArmor = maxArmor
        end

        local newMeta = {
            plates = plates,
            rarity = meta.rarity,
            armorValue = newArmor
        }

        exports.ox_inventory:SetMetadata(src, vest.slot, newMeta)
        GlobalState['ihan-inv-'..ServerFuncs.getIdentifier(src)] = { plates = plates, hasPlates = true }
        SetPedArmour(ped, newArmor)
        TriggerClientEvent('armor:syncArmor', src)

        TriggerClientEvent('ox_lib:notify', src, { type = 'success', description = ('Plate inserted (+%d%%)'):format(armorPerPlate) })
    else
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = 'No armor plates!' })
    end
end)

RegisterNetEvent('armor:removePlates', function()
    local src = source
    local vest = exports.ox_inventory:GetSlot(src, 2)
    if not vest then return end
    local armor = GetPedArmour(GetPlayerPed(src))
    local plates = math.floor(armor / Config.ArmorPlates.ArmorPerPlate)
    if plates <= 0 then return end
    exports.ox_inventory:AddItem(src, Config.ArmorPlates.PlateItem, plates)
    exports.ox_inventory:SetMetadata(src, vest.slot, {plates=0, rarity=vest.metadata.rarity})
    local id = ServerFuncs.getIdentifier(src)
    -- DeleteResourceKvp('raihan-inventory-armor-plates-'..id)
    GlobalState['ihan-inv-'..id] = {}
    SetPedArmour(GetPlayerPed(src), 0)
    TriggerClientEvent('armor:syncArmor', src)
    TriggerClientEvent('ox_lib:notify', src, {type='success', description='Removed '..plates..' plates'})
end)


RegisterNetEvent('armor:maybeRemovePlate', function(targetArmor)
    local src = source
    local id = ServerFuncs.getIdentifier(src)
    if not id then return end

    local vest = exports.ox_inventory:GetSlot(src, 2)
    if not vest or not vest.metadata then return end

    local expected = PlatesFromArmorValue(targetArmor)
    local rarity = vest.metadata.rarity or 'common'

    if targetArmor <= 0 then
        exports.ox_inventory:RemoveItem(src, vest.name, 1, nil, vest.slot)
        GlobalState['ihan-inv-'..id] = {}
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = ('%s has been destroyed!'):format(vest.label or 'Armor Vest')
        })
        -- print(('[Armor Destroyed] %s | Vest %s removed'):format(id, vest.name))
        return
    end
    local newMeta = {
        plates = expected,
        armorValue = targetArmor,
        rarity = rarity
    }

    if (vest.metadata.armorValue or 0) ~= targetArmor or (vest.metadata.plates or 0) ~= expected then
        exports.ox_inventory:SetMetadata(src, vest.slot, newMeta)
        GlobalState['ihan-inv-'..id] = { plates = expected, hasPlates = expected > 0 }
        -- print(('[Armor Sync] %s | Armor %.1f%% | Plates %d'):format(id, targetArmor, expected))
    end
end)

RegisterServerEvent('raihan-inventory:Server:ReApplyPlates', function()
    local src = source
    Wait(250)
    local vest = exports.ox_inventory:GetSlot(src, 2)
    if not vest then return end

    local meta = vest.metadata or {}
    local plates = meta.plates or 0
    local armor = meta.armorValue or ArmorValueFromPlates(plates)

    local maxArmor = ArmorValueFromPlates(plates)
    if armor > maxArmor then armor = maxArmor end

    TriggerClientEvent('raihan-inventory:setArmor', src, armor)
end)


lib.addCommand('setinvtheme', {
    help='Change inventory theme',
    params={{name='theme',type='string',help='Theme name (default, dark, blue, purple, red, green, custom)'}},
    restricted='group.admin'
}, function(src,args)
    local theme=args.theme
    if Config.Themes.themes[theme] then
        Config.Themes.current=theme
        TriggerClientEvent('raihan-inventory:themeChanged', -1, GetCurrentTheme())
        TriggerClientEvent('ox_lib:notify', src,{type='success',description='Theme changed to: '..Config.Themes.themes[theme].name})
    else
        TriggerClientEvent('ox_lib:notify', src,{type='error',description='Available themes: '..table.concat(table.keys(Config.Themes.themes),', ')})
    end
end)

AddEventHandler('playerDropped', function()
    local src = source
    local vest = exports.ox_inventory:GetSlot(src, 2)
    if vest and vest.metadata and vest.metadata.plates then
        exports.ox_inventory:AddItem(src, Config.ArmorPlates.PlateItem, vest.metadata.plates)
        exports.ox_inventory:SetMetadata(src, vest.slot, {plates=0, rarity=vest.metadata.rarity})
    end
end)

exports.ox_inventory:registerHook('swapItems', function(event)
    if event.toInventory ~= 'newdrop' then return end
    local slot = event.fromSlot
    local payload = {{slot.name, event.count, slot.metadata}}
    local model = Config.ItemDrops[slot.name] or Config.DefaultDropModel
    local drop = exports.ox_inventory:CustomDrop(slot.label, payload, GetEntityCoords(GetPlayerPed(event.source)), 50, 99999999, nil, model)
    if not drop then print('ERROR: Failed to create drop for '..slot.name) return true end
    CreateThread(function()
        exports.ox_inventory:RemoveItem(event.source, slot.name, slot.count, nil, slot.slot)
        Wait(0)
        exports.ox_inventory:forceOpenInventory(event.source, 'drop', drop)
    end)
    return false
end, {typeFilter={player=true}})

CreateThread(function()
    Wait(1000)
    print('^2[LOADED]^7 - ^1PRODIGY INVENTORY V2^7 - CREATED BY ^I han^7')
end)
