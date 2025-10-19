local function getVehicleSellValue(source, dealershipId, plate, model)
  local dealershipConfig = Config.DealershipLocations[dealershipId]
  if not dealershipConfig.enableSellVehicle then
    return false
  end
  local dealership = Config.DealershipLocations[dealershipId]
  local identifier = Framework.Server.GetPlayerIdentifier(source)
  local vehicleData = MySQL.single.await("SELECT * FROM " .. Framework.VehiclesTable .. " WHERE plate = ? AND " .. Framework.PlayerId .. " = ?", {plate, identifier})
  if not vehicleData then
    DebugPrint("The vehicle " .. plate .. " is not owned by player: " .. identifier .. " (" .. source .. ")", "warning")
    Framework.Server.Notify(source, Locale.notYourVehicleError, "error")
    return false
  end
  local dbModel = Framework.Server.GetModelColumn(vehicleData)
  if type(dbModel) == "string" then
    dbModel = dbModel:lower()
  end
  model = model:lower()
  if dbModel ~= model and dbModel ~= joaat(model) then
    DebugPrint("[sell-vehicle]: model does not match db: " .. dbModel .. " doesn't match " .. model .. " or " .. joaat(model), "warning")
    Framework.Server.Notify(source, "MODEL_DOES_NOT_MATCH_DB", "error")
    return false
  end
  if vehicleData.financed then
    Framework.Server.Notify(source, Locale.vehicleFinancedError, "error")
    return false
  end
  local stockData = MySQL.single.await("SELECT *, stock.price as stock_price FROM dealership_stock stock INNER JOIN dealership_vehicles vehicle ON vehicle.spawn_code = stock.vehicle WHERE stock.dealership = ? AND vehicle.spawn_code = ?", {dealershipId, model})
  if not stockData then
    Framework.Server.Notify(source, Locale.dealershipDoesntSellVehicle, "error")
    return false
  end
  local sellPrice = Round(stockData.stock_price * (dealershipConfig.sellVehiclePercent or 0.6))
  return sellPrice, dealership, stockData
end
lib.callback.register("jg-dealerships:server:sell-vehicle-get-value", function(source, dealershipId, plate, model)
  local sellPrice = getVehicleSellValue(source, dealershipId, plate, model)
  if not sellPrice then
    return false
  end
  local preCheckPassed = SellVehiclePreCheck(dealershipId, plate, model, sellPrice)
  if not preCheckPassed then
    return false
  end
  return sellPrice
end)
lib.callback.register("jg-dealerships:server:sell-vehicle", function(source, dealershipId, plate, model)
  local sellPrice, dealership, stockData = getVehicleSellValue(source, dealershipId, plate, model)
  if not (sellPrice and dealership) or not stockData then
    return false
  end
  if dealership.type == "owned" then
    local balance = MySQL.scalar.await("SELECT balance FROM dealership_data WHERE name = ?", {dealershipId})
    if balance - sellPrice < 0 then
      Framework.Server.Notify(source, Locale.dealershipDoesntSellVehicle, "error")
      return false
    end
    MySQL.update.await("UPDATE dealership_data SET balance = balance - ? WHERE name = ?", {sellPrice, dealershipId})
    MySQL.update.await("UPDATE dealership_stock SET stock = stock + 1 WHERE dealership = ? AND vehicle = ?", {dealershipId, stockData.spawn_code})
    UpdateDealershipShowroomCache(dealershipId)
  end
  MySQL.query.await(("DELETE FROM %s WHERE plate = ?"):format(Framework.VehiclesTable), {plate})
  Framework.Server.PlayerAddMoney(source, sellPrice, "bank")
  return true
end)
