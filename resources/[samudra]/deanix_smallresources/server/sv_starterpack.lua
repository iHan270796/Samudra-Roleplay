local QBCore = exports['qb-core']:GetCoreObject()
local Config = require 'c_starterpack'

RegisterNetEvent("rst-starterpack:server:claimStarterpack", function(gender)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if Player.PlayerData.metadata["starterpack"] == true then
        TriggerClientEvent('ox_lib:notify', src, {
            description = 'You`ve picked up the Starterpack.',
            type = 'error' -- atau 'success'
        })
        return
    end

    local items = (gender == 0) and Config.ItemsMale or Config.ItemsFemale
    local vehicles = (gender == 0) and Config.VehicleMale or Config.VehicleFemale

    for _, v in pairs(items) do
        Player.Functions.AddItem(v.itemName, v.qty)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v.itemName], "add")
    end   

    -- Beri kendaraan dan ambil info plate
    if gender == 0 then
        local veh = vehicles[1]
        if veh then
            local vehicle, plate = GiveVehicle(src, veh, false)
            TriggerClientEvent('ox_lib:notify', src, {
                description = 'The starterpack vehicle ' .. vehicle .. ' with plates ' .. plate .. ' made it into the garage.',
                type = 'success' -- atau 'success'
            })
        end
    else
        for _, veh in ipairs(vehicles) do
            local vehicle, plate = GiveVehicle(src, veh, false)
            TriggerClientEvent('ox_lib:notify', src, {
                description = 'The starterpack vehicle ' .. vehicle .. ' with plates ' .. plate .. ' made it into the garage.',
                type = 'success' -- atau 'success'
            })
        end
    end

    Player.Functions.SetMetaData("starterpack", true)

    -- Simpan metadata ke database
    MySQL.Async.execute('UPDATE players SET metadata = ? WHERE citizenid = ?', {
        json.encode(Player.PlayerData.metadata),
        Player.PlayerData.citizenid
    })
end)

RegisterNetEvent("rst-starterpack:server:giveChosenVehicle", function(vehicle)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if Player.PlayerData.metadata["starterpack2"] == true then
        TriggerClientEvent('ox_lib:notify', src, {
                description = 'You have selected the 2nd Starterpack vehicle.',
                type = 'error' -- atau 'success'
            })
        return
    end

    local model = vehicle
    local vehicleName, plate = GiveVehicle(src, model, false)

    Player.Functions.SetMetaData("starterpack2", true)
    MySQL.Async.execute('UPDATE players SET metadata = ? WHERE citizenid = ?', {
        json.encode(Player.PlayerData.metadata),
        Player.PlayerData.citizenid
    })
    TriggerClientEvent('ox_lib:notify', src, {
        description = 'The ' .. model .. ' vehicle was successfully put into the garage.',
        type = 'success' -- atau 'success'
    })
end)


function GiveVehicle(source, vehicle, notify)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local plate = GeneratePlate()

    MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, in_garage, garage_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
        pData.PlayerData.license,
        cid,
        vehicle,
        GetHashKey(vehicle),
        '{}',
        plate,
        1,
        Config.DefaultGarage
    })

    if notify ~= false then
        TriggerClientEvent('ox_lib:notify', src, {
            description = 'Starterpack vehicle ' .. vehicle .. ' ditambahkan!',
            type = 'success' -- atau 'success'
        })
    end

    return vehicle, plate
end

function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

QBCore.Commands.Add("setstarterpack", "Set Starterpack METADATA", {{name = "citizen_id", help = "CITIZEN ID, Check on DATABASE"}, {name = 'status', help = 'true or false'}}, false, function(source, args)
	local src = source
	if args[1] then
		local Player = QBCore.Functions.GetPlayerByCitizenId(args[1])
		if Player then
            if args[2] then
                local status = nil
                if args[2] == 'true' then
                    status = true
                else
                    status = false
                end

                Player.Functions.SetMetaData("starterpack", status)
                TriggerClientEvent('QBCore:Notify', src, "Starterpack Metadata Has Been Set", "primary")
            else
                TriggerClientEvent('QBCore:Notify', src, "Please Provide Status true or false", "error")
            end
		else
			-- TriggerClientEvent('QBCore:Notify', src, "Citizen Is not Online Right Now/Not Exist, Trying To Update in Database", "primary")
            local result = MySQL.Sync.fetchScalar('SELECT metadata FROM players WHERE citizenid = ?', {args[1]})
            if result then
                local status = nil
                
                if args[2] then
                    if args[2] == 'true' then
                        status = true
                    else
                        status = false
                    end

                    local metadata = json.decode(result)
                    print("metadata", metadata['starterpack'])
    
                    metadata['starterpack'] = status
                    
                    print("metadata after", metadata['starterpack'])
                    MySQL.Async.execute('UPDATE players SET metadata = ? WHERE citizenid = ?', { json.encode(metadata), args[1] })
                    TriggerClientEvent('QBCore:Notify', src, "Starterpack Metadata Has Been Set", "primary")
                else
                    TriggerClientEvent('QBCore:Notify', src, "Please Provide Status true or false", "error")
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "Citizen ID Not Found", "error")
            end
		end
	else
        TriggerClientEvent('QBCore:Notify', src, "Please Provide Citizen ID", "error")
	end
end, "admin")

QBCore.Commands.Add("checkstarterpack", "Check Starterpack METADATA", {{name = "citizen_id", help = "CITIZEN ID, Check on DATABASE"}}, false, function(source, args)
	local src = source
	if args[1] then
		local Player = QBCore.Functions.GetPlayerByCitizenId(args[1])
		if Player then
            local status = nil
            if Player.PlayerData.metadata['starterpack'] then
                status = 'true'
            else
                status = 'false'
            end
            TriggerClientEvent('ox_lib:notify', src, {
                description = "Starterpack Claim Status for " .. Player.PlayerData.name .. " is " .. status,
                type = 'infrom' -- atau 'success'
            })
		else
            -- TriggerClientEvent('QBCore:Notify', src, "Citizen Is not Online Right Now/Not Exist, Trying To Search in Database", "primary")
            local result = MySQL.Sync.fetchScalar('SELECT metadata FROM players WHERE citizenid = ?', {args[1]})
            if result then
                local status = nil
                
                local metadata = json.decode(result)
                if metadata['starterpack'] then
                    status = 'true'
                else
                    status = 'false'
                end
                TriggerClientEvent('ox_lib:notify', src, {
                    description = 'Starterpack Claim Status is ' .. status,
                    type = 'infrom' -- atau 'success'
                })
            else
                TriggerClientEvent('ox_lib:notify', src, {
                    description = 'Citizen ID Not Found.',
                    type = 'error' -- atau 'success'
                })
            end
		end
	else
        TriggerClientEvent('ox_lib:notify', src, {
            description = 'Please Provide Citizen ID.',
            type = 'error' -- atau 'success'
        })
	end
end, "admin")