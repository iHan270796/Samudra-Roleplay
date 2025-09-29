-- local QBCore = nil

-- Citizen.CreateThread(function()
--     while QBCore == nil do
--         QBCore = exports[config.coreData.scriptName]:GetCoreObject()
--         Citizen.Wait(200)
--     end
--     print("[QBCore] Loaded")
--     QBCore.Functions.CreateUseableItem("pdbadge", function(source, item)
--         local Player = QBCore.Functions.GetPlayer(source)
--         local coords = GetEntityCoords(GetPlayerPed(source))
--         if Player.Functions.GetItemBySlot(item.slot) ~= nil then
--             TriggerClientEvent("x99-pdbadge:open", -1, source, coords, item.info)
--         end
--     end)
-- end)

-- RegisterServerEvent("x99-badge:item:create")
-- AddEventHandler("x99-badge:item:create", function(name, callsign, rank, photo, type)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     local info = {}
--     info.name = name
--     info.callsign = callsign
--     info.rank = rank
--     info.photo = photo
--     info.type = type
--     Player.Functions.AddItem("pdbadge", 1, false, info)
-- end)

-- RegisterServerEvent("x99-badge:SaveMetaData")
-- AddEventHandler("x99-badge:SaveMetaData", function(data)
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     if not Player then return end

--     local result = MySQL.query.await('SELECT metadata FROM players WHERE citizenid = ?', {
--         Player.PlayerData.citizenid
--     })

--     local MetaData = result[1] and json.decode(result[1].metadata) or {}
--     MetaData.phonedata = MetaData.phonedata or {}

--     MetaData.phonedata.profilepicture = data.profilepicture or ""

--     MySQL.update('UPDATE players SET metadata = ? WHERE citizenid = ?', {
--         json.encode(MetaData), Player.PlayerData.citizenid
--     })

--     Player.Functions.SetMetaData("phone", data)
-- end)


local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("x99-badge:item:create", function(name, callsign, rank, photo, type)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    local metadata = {
        name = name,
        callsign = callsign,
        rank = rank,
        photo = photo,
        type = type
    }

    exports.ox_inventory:AddItem(src, "pdbadge", 1, metadata)
end)

AddEventHandler('ox_inventory:usedItem', function(playerId, itemName, slotId, metadata)
    if itemName ~= "pdbadge" then return end

    local coords = GetEntityCoords(GetPlayerPed(playerId))
    TriggerClientEvent("x99-pdbadge:open", -1, playerId, coords, metadata)
end)

RegisterNetEvent("x99-badge:SaveMetaData", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local result = MySQL.query.await('SELECT metadata FROM players WHERE citizenid = ?', {
        Player.PlayerData.citizenid
    })

    local MetaData = result[1] and json.decode(result[1].metadata) or {}
    MetaData.phonedata = MetaData.phonedata or {}
    MetaData.phonedata.profilepicture = data.profilepicture or ""

    MySQL.update('UPDATE players SET metadata = ? WHERE citizenid = ?', {
        json.encode(MetaData), Player.PlayerData.citizenid
    })

    Player.Functions.SetMetaData("phone", data)
end)

