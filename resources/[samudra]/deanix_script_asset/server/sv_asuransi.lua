local Config = require 'c_asuransi'

local function hapus()
    local totalTime = Config.countdownTime or 30
    TriggerClientEvent('c_asuransi:startCountdown', -1, totalTime)

    SetTimeout(totalTime * 1000, function()
        TriggerClientEvent('c_asuransi:done', -1)
    end)
end

lib.cron.new('*/' .. Config.cooldown .. ' * * * *', function()
    hapus()
end)

RegisterNetEvent('c_asuransi:MasukimpundB', function(plates)
    if not plates or #plates == 0 then return end

    local vehicles = GetAllVehicles()

    for _, veh in pairs(vehicles) do
        if DoesEntityExist(veh) then
            local plate = GetVehicleNumberPlateText(veh):gsub("%s+", "")
            if lib.table.contains(plates, plate) then
                local model = GetEntityModel(veh)
                if not lib.table.contains(Config.IgnoreVehicles, model) then
                    exports['jg-advancedgarages']:deleteOutsideVehicle(plate)
                    MySQL.update.await(
                        'UPDATE player_vehicles SET garage_id = ?, impound = ? WHERE plate = ?',
                        {'Asuransi Paleto', 0, plate}
                    )
                    DeleteEntity(veh)
                end
            end
        end
    end
end)
