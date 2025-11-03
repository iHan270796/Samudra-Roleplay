if Config.Framework == "qb" or Config.Framework == "qbx" then
    RegisterServerEvent("hud:server:GainStress", function(amount)
        if Config.Settings.EnableStress then
            local src = source
            local PlayerMetadata = Bridge.GetPlayerMetadata(src)
            local Job = Bridge.GetJob(src)
            local NewStress
            if not PlayerMetadata or Config.Settings.StressSettings.JobWhitelist[Job] then return end
            if not PlayerMetadata['stress'] then PlayerMetadata['stress'] = 0 end
    
            NewStress = PlayerMetadata['stress'] + amount
            if NewStress <= 0 then NewStress = 0 end
            if NewStress > 100 then NewStress = 100 end
            
            Bridge.SetPlayerMetadata(src, 'stress', NewStress)
            TriggerClientEvent("hud:client:UpdateStress", src, NewStress)
            Bridge.Notify("Stress Gained!", "error", 4000)
        end
    end)
    
    RegisterServerEvent("hud:server:RelieveStress", function(amount)
        if Config.Settings.EnableStress then
            local src = source
            local PlayerMetadata = Bridge.GetPlayerMetadata(src)
            local NewStress
            if not PlayerMetadata then return end
            if not PlayerMetadata['stress'] then PlayerMetadata['stress'] = 0 end
    
            NewStress = PlayerMetadata['stress'] - amount
            if NewStress <= 0 then NewStress = 0 end
            if NewStress > 100 then NewStress = 100 end
    
            Bridge.SetPlayerMetadata(src, 'stress', NewStress)
            TriggerClientEvent("hud:client:UpdateStress", src, NewStress)
            Bridge.Notify("Stress Relieved!", "success", 4000)
        end
    end)
elseif Config.Framework == "esx" then
    ESX = exports["es_extended"]:getSharedObject()


ESX.RegisterServerCallback("deanix_hud:RetrieveStress", function(src, cb)
    local ply = ESX.GetPlayerFromId(src)
    local identifier = ply.getIdentifier()
    local response = MySQL.query.await('SELECT `identifier`, `stress` FROM `sk_hud_stress` WHERE `identifier` = ?', {
        identifier
    })
    local newStress = 1.5
     
    if response then
        for i = 1, #response do
            local row = response[i]
            newStress = row.stress
        end
    else
        newStress = 1.5
    end

    if newStress <= 0 then newStress = 0 end
    if newStress > 100 then
        newStress = 100
    end

    if newStress == 1.5 then
        cb(0)
    else
        cb(newStress)
    end
end)

RegisterNetEvent('hud:server:GainStress', function(amount)
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local identifier = Player.getIdentifier()
    local Job = Player.job.name
    local newStress
    if not Player or Config.stressWLJobs[Job] then return end

    local response = MySQL.query.await('SELECT `identifier`, `stress` FROM `sk_hud_stress` WHERE `identifier` = ?', {
        identifier
    })
     
    if response then
        for i = 1, #response do
            local row = response[i]
            newStress = row.stress + amount
        end
    else
        newStress = 1.5
    end

    if newStress <= 0 then newStress = 0 end
    if newStress > 100 then
        newStress = 100
    end
    if newStress == 1.5 then
        MySQL.insert('INSERT INTO `sk_hud_stress` (identifier, stress) VALUES (?, ?)', {
            identifier, 0 + amount
        }, function(id)
            TriggerClientEvent('hud:client:UpdateStress', src, 0 + amount)
            TriggerClientEvent('SK-UI:Notify', src, 'Stress Gained', 'error', 3500)
        end)
    else
        MySQL.update('UPDATE sk_hud_stress SET stress = ? WHERE identifier = ?', {
            newStress, identifier
        }, function(affectedRows)
            TriggerClientEvent('hud:client:UpdateStress', src, newStress)
            TriggerClientEvent('SK-UI:Notify', src, 'Stress Gained', 'error', 3500)
        end)
    end
end)

RegisterNetEvent('hud:server:RelieveStress', function(amount)
    if Config.DisableStress then return end
    local src = source
    local Player = ESX.GetPlayerFromId(src)
    local identifier = Player.getIdentifier()
    local newStress
    if not Player then return end

    local response = MySQL.query.await('SELECT `identifier`, `stress` FROM `sk_hud_stress` WHERE `identifier` = ?', {
        identifier
    })
     
    if response then
        for i = 1, #response do
            local row = response[i]
            newStress = row.stress - amount
        end
    else
        newStress = 1.5
    end

    if newStress == 1.5 then newStress = 0 end
    if newStress <= 0 then newStress = 0 end
    if newStress > 100 then
        newStress = 100
    end
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
    TriggerClientEvent('SK-UI:Notify', src, 'Stress Relieved', 'success', 3500)
end)
end