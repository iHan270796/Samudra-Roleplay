if Config.Core == "ESX" then
    if Config.CoreDefine ~= nil and Config.CoreDefine ~= "" then
        ESX = nil
        TriggerEvent(Config.CoreDefine, function(obj) 
            ESX = obj 
        end)
    else
        ESX = Config.CoreExport()
    end

    ESX.RegisterServerCallback('deanix_vehicleshop:buyTestDrive', function(source, cb, testDrivePrice)
        local xPlayer = ESX.GetPlayerFromId(source)
        if testDrivePrice then
            local myMoney = xPlayer.getMoney()
            if myMoney >= testDrivePrice then
                xPlayer.removeMoney(testDrivePrice)
                TriggerClientEvent('deanix_vehicleshop:notification', source, Config.Translate['notify.you_bought_test']:format(testDrivePrice), 5000, 'success')
                cb(true)
            else
                TriggerClientEvent('deanix_vehicleshop:notification', source, Config.Translate['notify.enought_money_for_test'], 4000, 'error')
                cb(false)
            end
        end
    end)
    
    ESX.RegisterServerCallback('deanix_vehicleshop:isPlateTaken', function(source, cb, plate)
        MySQL.Async.fetchAll('SELECT plate FROM owned_vehicles WHERE @plate = plate', {
            ['@plate'] = plate
        }, function (result)
            cb(result[1] ~= nil)
        end)
    end)
elseif Config.Core == "QB-Core" then
    QBCore = Config.CoreExport()

    QBCore.Functions.CreateCallback("deanix_vehicleshop:buyTestDrive", function(source, cb, testDrivePrice)
		local Player = QBCore.Functions.GetPlayer(source)
        if testDrivePrice then
            local myMoney = Player.Functions.GetMoney('cash')
            if myMoney >= testDrivePrice then
                Player.Functions.RemoveMoney('cash', testDrivePrice)
                TriggerClientEvent('deanix_vehicleshop:notification', source, Config.Translate['notify.you_bought_test']:format(testDrivePrice), 5000, 'success')
                cb(true)
            else
                TriggerClientEvent('deanix_vehicleshop:notification', source, Config.Translate['notify.enought_money_for_test'], 4000, 'error')
                cb(false)
            end
        end
	end)
    
    QBCore.Functions.CreateCallback("deanix_vehicleshop:isPlateTaken", function(source, cb, plate)
        MySQL.Async.fetchAll('SELECT plate FROM player_vehicles WHERE @plate = plate', {
            ['@plate'] = plate
        }, function(result)
            cb(result[1] ~= nil)
        end)
	end)
end

RegisterNetEvent("deanix_vehicleshop:setRoutingBucket", function(isBack)
    local src = source
    if isBack then
        SetPlayerRoutingBucket(src, 0)
        TriggerClientEvent('deanix_vehicleshop:settedRoutingBucket', src, false)
    else
        SetPlayerRoutingBucket(src, src)
        TriggerClientEvent('deanix_vehicleshop:settedRoutingBucket', src, true)
    end
end)