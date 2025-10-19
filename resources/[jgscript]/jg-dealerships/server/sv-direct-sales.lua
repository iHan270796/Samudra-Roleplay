PendingDirectSales = {}

function CreateDirectSaleRequest(dealershipId, dealerPlayerId, playerId, model, colour, price, finance, noOfPayments, downPayment)
  local uuid = GenerateUuid()
  local attempts = 0
  
  while PendingDirectSales[uuid] and attempts < 10 do
    attempts = attempts + 1
    uuid = GenerateUuid()
  end
  
  PendingDirectSales[uuid] = {
    dealershipId = dealershipId,
    dealerPlayerId = dealerPlayerId,
    playerId = playerId,
    model = model,
    colour = colour,
    price = price,
    finance = finance,
    noOfPayments = noOfPayments,
    downPayment = downPayment
  }
  
  return uuid
end

function RemoveDirectSaleRequest(uuid)
  if not PendingDirectSales[uuid] then
    return
  end
  PendingDirectSales[uuid] = nil
end
lib.callback.register("jg-dealerships:server:get-direct-sale-data", function(source, dealershipId)
  if not IsEmployee(source, dealershipId, {"supervisor", "manager", "sales"}, true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  local categories = Config.DealershipLocations[dealershipId].categories
  local dealershipData = MySQL.query.await("SELECT * FROM dealership_data WHERE name = ?", {dealershipId})
  
  local vehicles = MySQL.query.await(
    "SELECT vehicle.*, stock.stock as stock, stock.price as price FROM dealership_vehicles vehicle INNER JOIN dealership_stock stock ON vehicle.spawn_code = stock.vehicle INNER JOIN dealership_data dealership ON stock.dealership = dealership.name WHERE vehicle.category IN (?) AND (dealership.name = ?) ORDER BY vehicle.spawn_code ASC;",
    {categories, dealershipId}
  )
  
  local commission = (dealershipData[1].employee_commission or 10) / 100
  local playerPed = GetPlayerPed(source)
  local playerCoords = GetEntityCoords(playerPed)
  
  return {
    vehicles = vehicles,
    commission = commission,
    nearbyPlayers = GetNearbyPlayers(source, playerCoords, 10.0, false)
  }
end)
lib.callback.register("jg-dealerships:server:send-direct-sale-request", function(source, dealershipId, data)
  if not IsEmployee(source, dealershipId, {"supervisor", "manager", "sales"}, true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return false
  end
  
  local dealerInfo = Framework.Server.GetPlayerInfo(source)
  local dealerName = dealerInfo and dealerInfo.name
  local playerId = data.playerId
  local playerIdentifier = Framework.Server.GetPlayerIdentifier(playerId)
  local model = data.model
  local colour = data.colour
  local finance = data.finance
  local financePayments = data.financePayments
  local financeDownPayment = data.financeDownPayment
  
  if finance then
    local financedVehicles = MySQL.query.await(
      "SELECT COUNT(*) as total FROM " .. Framework.VehiclesTable .. " WHERE financed = 1 AND " .. Framework.PlayerId .. " = ?",
      {playerIdentifier}
    )
    
    if financedVehicles[1].total >= (Config.MaxFinancedVehiclesPerPlayer or 999999) then
      Framework.Server.Notify(source, Locale.playerTooManyFinancedVehicles, "error")
      return false
    end
  end
  
  local dealershipLabel = MySQL.scalar.await("SELECT label FROM dealership_data WHERE name = ?", {dealershipId})
  if not dealershipLabel or dealershipLabel == "" then
    dealershipLabel = dealershipId
  end
  
  local vehicleData = MySQL.single.await(
    "SELECT vehicle.*, stock.stock as stock, stock.price as price FROM dealership_vehicles vehicle INNER JOIN dealership_stock stock ON vehicle.spawn_code = stock.vehicle INNER JOIN dealership_data dealership ON stock.dealership = dealership.name WHERE vehicle.spawn_code = ? AND dealership.name = ?",
    {model, dealershipId}
  )
  
  if not vehicleData then
    return false
  end
  
  local uuid = CreateDirectSaleRequest(
    dealershipId,
    source,
    playerId,
    model,
    colour,
    vehicleData.price,
    finance,
    financePayments,
    financeDownPayment
  )
  
  TriggerClientEvent("jg-dealerships:client:show-direct-sale-request", playerId, {
    uuid = uuid,
    dealerPlayerId = source,
    dealerName = dealerName,
    dealershipId = dealershipId,
    dealershipLabel = dealershipLabel,
    vehicle = vehicleData,
    colour = colour,
    financed = finance,
    downPayment = financeDownPayment,
    noOfPayments = financePayments
  })
  
  return true
end)
lib.callback.register("jg-dealerships:server:direct-sale-request-accepted", function(source, uuid)
  local saleRequest = PendingDirectSales[uuid]
  if not saleRequest then
    return false
  end
  
  if source ~= saleRequest.playerId then
    return false
  end
  
  local totalPrice = saleRequest.finance and (saleRequest.price * (1 + Config.FinanceInterest)) or saleRequest.price
  local dealershipId = saleRequest.dealershipId
  local dealerPlayerId = saleRequest.dealerPlayerId
  
  local dealershipData = MySQL.query.await("SELECT * FROM dealership_data WHERE name = ?", {dealershipId})
  local commission = Round((dealershipData[1].employee_commission or 10) / 100 * totalPrice)
  
  MySQL.update.await("UPDATE dealership_data SET balance = balance - ? WHERE name = ?", {commission, dealershipId})
  Framework.Server.PlayerAddMoney(dealerPlayerId, commission, "bank")
  Framework.Server.Notify(dealerPlayerId, Locale.directSaleAccepted, "success")
  
  return true
end)
lib.callback.register("jg-dealerships:server:direct-sale-request-denied", function(source, uuid)
  local saleRequest = PendingDirectSales[uuid]
  if not saleRequest then
    return false
  end
  
  if source ~= saleRequest.playerId then
    return false
  end
  
  RemoveDirectSaleRequest(uuid)
  Framework.Server.Notify(saleRequest.dealerPlayerId, Locale.directSaleRejected, "error")
  
  return true
end)
