RegisterNetEvent("jg-dealerships:client:direct-sale", function()
    local dealershipId = lib.callback.await("jg-dealerships:server:employee-nearest-dealership", false)
    if dealershipId then
        if dealershipId.error then
            return
        end
    end
    local dealershipLocation = Config.DealershipLocations[dealershipId]
    local categories = dealershipLocation.categories
    local directSaleData = lib.callback.await("jg-dealerships:server:get-direct-sale-data", false, dealershipId)
    PlayTabletAnim()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "showDSSellVehicle",
        vehicles = directSaleData.vehicles,
        nearbyPlayers = directSaleData.nearbyPlayers,
        categories = categories,
        commission = directSaleData.commission,
        enableFinance = dealershipLocation.enableFinance,
        config = GetSafeConfigForNUI(),
        locale = Locale
    })
end)
RegisterNetEvent("jg-dealerships:client:show-direct-sale-request", function(data)
    if Globals.CurrentDealership then
        TriggerServerEvent("jg-dealerships:server:notify-other-player", data.dealerPlayerId, "Customer is in the showroom! Wait for them to come back, and try again", "error")
        return
    end
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "show-direct-sale-request",
        uuid = data.uuid,
        dealerPlayerId = data.dealerPlayerId,
        dealerName = data.dealerName,
        dealershipId = data.dealershipId,
        dealershipLabel = data.dealershipLabel,
        playerBalances = GetPlayerBalances(data.dealershipId),
        vehicleLabel = (data.vehicle.brand or "") .. " " .. (data.vehicle.model or ""),
        vehicleSpawnCode = data.vehicle.spawn_code,
        vehiclePrice = data.vehicle.price,
        color = data.colour,
        financed = data.financed,
        downPayment = data.downPayment,
        noOfPayments = data.noOfPayments,
        config = GetSafeConfigForNUI(),
        locale = Locale
    })
end)
RegisterNUICallback("send-direct-sale-request", function(data, cb)
    local dealershipId = lib.callback.await("jg-dealerships:server:employee-nearest-dealership", false)
    if dealershipId then
        if dealershipId.error then
            return cb({error = true})
        end
    end
    local result = lib.callback.await("jg-dealerships:server:send-direct-sale-request", false, dealershipId, data)
    if not result then
        return cb({error = true})
    end
    cb({success = true})
end)
RegisterNUICallback("accept-direct-sale-request", function(data, cb)
    SetNuiFocus(false, false)
    local result = lib.callback.await("jg-dealerships:server:direct-sale-request-accepted", false, data)
    if not result then
        return cb({error = true})
    end
    cb({success = true})
end)
RegisterNUICallback("deny-direct-sale-request", function(data, cb)
    SetNuiFocus(false, false)
    local result = lib.callback.await("jg-dealerships:server:direct-sale-request-denied", false, data)
    if not result then
        return cb({error = true})
    end
    cb({success = true})
end)
RegisterCommand(Config.DirectSaleCommand or "directsale", function()
    TriggerEvent("jg-dealerships:client:direct-sale")
end, false)
