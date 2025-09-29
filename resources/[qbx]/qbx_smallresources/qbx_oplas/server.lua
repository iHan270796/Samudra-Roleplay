local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("deanix:server:RemovePlasticSurgeryItem", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    Player.Functions.RemoveItem("tiket_oplas", 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["tiket_oplas"], "remove")
end)
