local function getFinanceData()
  local vehicles = lib.callback.await("jg-dealerships:server:get-financed-vehicles", false)
  for index, vehicle in pairs(vehicles) do
    if vehicle.financed then
      if vehicle.finance_data then
        local model = Framework.Client.GetModelColumn(vehicle)
        vehicles[index].vehicleLabel = model and Framework.Client.GetVehicleLabel(model) or model
        vehicles[index].finance_data = json.decode(vehicle.finance_data)
      end
    end
  end
  return {
    type = "manageFinance",
    vehicles = vehicles,
    config = GetSafeConfigForNUI(),
    locale = Locale
  }
end

RegisterCommand(Config.MyFinanceCommand or "myfinance", function()
  SetNuiFocus(true, true)
  SendNUIMessage(getFinanceData())
end, false)

RegisterNUICallback("finance-make-payment", function(data, cb)
  local result = lib.callback.await("jg-dealerships:server:finance-make-payment", false, data.plate, data.type)
  if data.sendNUI then
    SetNuiFocus(true, true)
    SendNUIMessage(getFinanceData())
  end
  cb(result)
end)
