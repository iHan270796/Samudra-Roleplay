local Config = require 'c_peds'

-- QBCore.Functions.CreateUseableItem(Config.PedSelectorItem, function(source)
--     TriggerClientEvent("custom-ped:openMenu", source)
-- end)

RegisterNetEvent("custom-ped:requestPedMenu", function()
    local src = source
    local license = QBCore.Functions.GetIdentifier(src, "license")
    local allowed = Config.AllowedPeds[license]

    TriggerClientEvent("custom-ped:showMenu", src, allowed)
end)

RegisterNetEvent("custom-ped:savePedModel", function(model)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    MySQL.update('UPDATE players SET pedmodel = ? WHERE citizenid = ?', {
        model,
        Player.PlayerData.citizenid
    })
end)

AddEventHandler("QBCore:Server:PlayerLoaded", function(Player)
    local result = MySQL.single.await('SELECT pedmodel FROM players WHERE citizenid = ?', {
        Player.PlayerData.citizenid
    })
    if result and result.pedmodel then
        TriggerClientEvent("custom-ped:applyPed", Player.PlayerData.source, result.pedmodel)
    end
end)
