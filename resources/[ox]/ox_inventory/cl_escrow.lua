ClientFuncs = ClientFuncs or {}

local ESX = nil
local QBCore = nil
local cachedTheme = nil
local previousArmor = GetPedArmour(PlayerPedId())

CreateThread(function()
    Wait(5000)
    if GetResourceState("qb-core") == "started" then
        QBCore = exports["qb-core"]:GetCoreObject()
    elseif GetResourceState("es_extended") == "started" then
        ESX = exports["es_extended"]:getSharedObject()
    end
end)

CreateThread(function()
    local lastArmor = GetPedArmour(PlayerPedId())
    while true do
        Wait(1500)
        local ped = PlayerPedId()
        local currentArmor = GetPedArmour(ped)
        if currentArmor ~= lastArmor then
            lastArmor = currentArmor
            TriggerServerEvent('armor:maybeRemovePlate', currentArmor)
        end
    end
end)

-- Armor bijhouden
local function UpdatePreviousArmor()
    previousArmor = GetPedArmour(PlayerPedId())
end

-- Bepaal gender
local function GetGender(ped)
    local model = GetEntityModel(ped)
    if model == 1885233650 then
        return "male"
    elseif model == -1667301416 then
        return "female"
    end
    return "male"
end

-- Theme ophalen
local function GetTheme()
    if not cachedTheme then
        cachedTheme = lib.callback.await("raihan-inventory:getTheme", 200)
    end
    return cachedTheme
end

local function ApplyTheme(theme)
    if theme then
        SendNUIMessage({
            action = "setTheme",
            data = theme
        })
    end
end

-- Check of item een backpack is
local function IsBackpack(itemName)
    if not itemName then return false end

    local backpacks = {
        "backpack", "small_backpack", "medium_backpack", "large_backpack",
        "tactical_backpack", "school_backpack", "hiking_backpack",
        "duffel_bag", "sports_bag"
    }

    local lower = string.lower(itemName)
    if string.find(lower, "backpack") or string.find(lower, "bag") then
        return true
    end

    for _, v in ipairs(backpacks) do
        if itemName == v then
            return true
        end
    end

    local item = exports.ox_inventory:Items(itemName)
    if item and item.backpack == true then
        return true
    end

    return false
end

function ClientFuncs.CheckArmorItem(item)
    if not item then return end
    local ped = PlayerPedId()

    if item ~= 'armour' then
        SetPedArmour(ped, 0)
        return
    end
end

function ClientFuncs.CheckParachuteItem(item, removed)
    local ped = PlayerPedId()
    if removed then
        RemoveWeaponFromPed(ped, `GADGET_PARACHUTE`)
        return
    end

    if item == 'parachute' then
        GiveWeaponToPed(ped, `GADGET_PARACHUTE`, 1, false, true)
    end
end

function ClientFuncs.SendGiveUI(data)
    if not data or not data.playerlist then return end

    local nearby = {}

    for _, player in ipairs(data.playerlist) do
        local id
        if type(player) == "table" then
            id = player.id or player.source or player.serverId
        else
            id = tonumber(player)
        end

        if id then
            table.insert(nearby, { label = ('[%s] Warga'):format(id), value = tostring(id) })
        end
    end

    if #nearby == 1 then
        local targetId = tonumber(nearby[1].value)
        local input = lib.inputDialog('Give Item', {
            { type = 'number', label = 'Jumlah', default = data.count or 1, min = 1 }
        })

        if not input or not input[1] then return end
        local count = tonumber(input[1])
        if count and count > 0 then
            exports['ox_inventory']:giveItemToTarget(targetId, data.slot, count)
        end
        return
    end

    local dialog = lib.inputDialog('Give Item', {
        { type = 'select', label = 'Pilih Warga di Sekitar', options = nearby },
        { type = 'number', label = 'Jumlah', default = data.count or 1, min = 1 }
    })

    if not dialog then return end
    local targetId = tonumber(dialog[1])
    local count = tonumber(dialog[2])

    if not targetId or not count or count < 1 then return end
    exports['ox_inventory']:giveItemToTarget(targetId, data.slot, count)
end


-- Inventory instellingen
function ClientFuncs.SetupInventorySettings()
    local settings = {
        gender = GetGender(cache.ped),
        SpecialSlot = Config.UtilitySlots,
        blacklistedItems = Config.BackpackBlacklist
    }
    SendNUIMessage({
        action = "setupInventorySettings",
        data = settings
    })
end

-- Player license ophalen
function ClientFuncs.GetPlayerLicense()
    local fw = GlobalState.fw
    if fw == "esx" then
        return lib.callback.await("raihan-inventory:ESX:GetLicense", false)
    elseif fw == "qb" then
        return QBCore.Functions.GetPlayerData().cid
    elseif fw == "qbx" then
        return QBX.PlayerData.cid
    end
end

-- Backpack check
function ClientFuncs.CheckForBackpack()
    local items = exports.ox_inventory:GetPlayerItems()
    if not items then
        LocalPlayer.state:set("backpack", nil, true)
        TriggerServerEvent("raihan-inventory:SyncBackpackClothes", nil)
        return false
    end

    local firstItem = items[1]
    if firstItem and IsBackpack(firstItem.name) then
        if not firstItem.metadata then firstItem.metadata = {} end
        if not firstItem.metadata.id then
            firstItem.metadata.id = "bp_" .. GetPlayerServerId(PlayerId()) ..
                                    "_" .. math.random(100000, 999999) ..
                                    "_" .. GetGameTimer()
        end

        local newState = {
            use = true,
            id = firstItem.metadata.id,
            itemName = firstItem.name
        }

        LocalPlayer.state:set("backpack", newState, true)
        TriggerServerEvent("raihan-inventory:SyncBackpackClothes", firstItem.metadata.id)
        return true
    end

    LocalPlayer.state:set("backpack", nil, true)
    TriggerServerEvent("raihan-inventory:SyncBackpackClothes", nil)
    return false
end

-- Events
RegisterNetEvent("raihan-inventory:SetBackpackClothes", function(src, hasBackpack)
    if not Config.BackpackProp.Enabled then return end

    local ped = GetPlayerPed(GetPlayerFromServerId(src))
    if not DoesEntityExist(ped) then return end

    local gender = GetGender(ped)
    if not hasBackpack then
        ClearPedProp(ped, 5)
        SetPedComponentVariation(ped, 5, 0, 0, 2)
    else
        local config = Config.BackpackProp[gender]
        SetPedComponentVariation(ped, 5, config.DrawableID, config.Texture or 0, 2)
    end
end)

RegisterNetEvent("raihan-inventory:themeChanged", function(theme)
    cachedTheme = theme
    ApplyTheme(theme)
end)

-- Command
RegisterCommand("previewtheme", function(_, args)
    if args[1] then
        TriggerServerEvent("raihan-inventory:changeTheme", args[1])
    else
        lib.notify({
            type = "info",
            description = "Usage: /previewtheme [theme_name]"
        })
    end
end, false)

CreateThread(function()
    Wait(1500)
    local theme = lib.callback.await("raihan-inventory:getTheme", 200)
    if theme then
        cachedTheme = theme
        ApplyTheme(theme)
        -- print("[raihan-inventory] Applied theme:", theme.name)
    else
        -- print("[raihan-inventory] Failed to fetch theme, using default")
    end
end)