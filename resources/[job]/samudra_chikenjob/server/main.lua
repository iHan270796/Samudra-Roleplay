local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("mb-chicken:server:AddAliveChicken", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player then
		Player.Functions.AddItem('ayam', Config.CatchAliveChicken["amount_alive_chicken_to_give"])
	end
end)

RegisterNetEvent('mb-chicken:server:SlaughteredChicken', function(position)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)

	xPlayer.Functions.RemoveItem('ayam', Config.SlaughteredChicken[position]["amount_alive_chicken_to_remove"])
	xPlayer.Functions.AddItem('ayam_potong', Config.SlaughteredChicken[position]["amount_slaughtered_chicken_to_give"])
end)

RegisterNetEvent('mb-chicken:server:PackagedChicken', function(position)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)

	xPlayer.Functions.RemoveItem('ayam_potong', Config.PackagedChicken[position]["amount_slaughtered_chicken_to_remove"])
	xPlayer.Functions.AddItem('ayam_packing', Config.PackagedChicken[position]["amount_packaged_chicken_to_give"])
end)