local QBCore = exports['qb-core']:GetCoreObject()

-- Ambil semua identifier dari player, termasuk license
function ExtractIdentifiers(src)
    local identifiers = {}
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if string.find(id, "license:") then
            identifiers.license = id
        end
    end
    return identifiers
end

-- Command 'givecar'
QBCore.Commands.Add('givecar', 'Give any vehicle to a player', {}, true, function(source, args)
    local ids = ExtractIdentifiers(source)
    local licenseID = ids.license

    -- Cek apakah license ditemukan
    if not licenseID then
        print("License ID tidak ditemukan untuk source: " .. tostring(source))
        TriggerClientEvent('ox_lib:notify', source, {
            description = 'License ID tidak ditemukan!',
            type = 'error'
        })
        return
    end

    -- Cek apakah license ID termasuk yang diizinkan
    if not Config.AllowedLicenses[licenseID] then
        print("Unauthorized access attempt by license: " .. licenseID)
        TriggerClientEvent('ox_lib:notify', source, {
            description = 'Kamu tidak punya akses ke command ini.',
            type = 'error'
        })
        return
    end

    -- Jika lolos, kirim menu ke client
    local avatarURL = "https://i.imgur.com/placeholder.png"
    local playerName = GetPlayerName(source)

    TriggerClientEvent("ns-givecar:openmenu", source, avatarURL, playerName)
end, 'admin')

local function generatePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        return generatePlate()
    else
        return plate:upper()
    end
end

RegisterNetEvent("ns-givecar:givecar", function(data)
    local src = source
    local id = tonumber(data.oyuncuID)
    local model = tostring(data.aracKodu)
    local plate = (data.plaka and data.plaka ~= "") and string.upper(data.plaka) or string.upper(generatePlate())
    local fullmod = data.fullmod or false
    local renk1 = data.aracRenk1 or "0 0 0"
    local renk2 = data.aracRenk2 or "0 0 0"
    local Player = QBCore.Functions.GetPlayer(id)
    if not Player then
        TriggerClientEvent('ox_lib:notify', src, {
            description = 'Player is Offline!',
            type = 'error'
        })
        return
    end
    local cid = Player.PlayerData.citizenid
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        TriggerClientEvent('ox_lib:notify', src, {
            description = 'This plate is already exist!',
            type = 'error'
        })
    else
        MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            Player.PlayerData.license,
            cid,
            model,
            GetHashKey(model),
            '{}',
            plate,
            0
        })
        TriggerClientEvent('ox_lib:notify', src, {
            description = 'Vehicle is given!',
            type = 'success'
        })
        TriggerClientEvent("ns-givecar:getvehicle", id, model, renk1, renk2, fullmod, plate)
    end
end)
