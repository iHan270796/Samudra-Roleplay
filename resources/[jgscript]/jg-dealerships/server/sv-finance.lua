lib.callback.register("jg-dealerships:server:get-financed-vehicles", function(source)
  local identifier = Framework.Server.GetPlayerIdentifier(source)
  DebugPrint("Getting financed vehicles for player " .. identifier, "debug")
  
  local vehicles = MySQL.query.await(
    "SELECT * FROM " .. Framework.VehiclesTable .. " WHERE " .. Framework.PlayerId .. " = ? AND financed = ?",
    {identifier, 1}
  )
  
  DebugPrint("Got " .. #vehicles .. " financed vehicles for player " .. identifier, "debug")
  return vehicles
end)

lib.callback.register("jg-dealerships:server:finance-make-payment", function(source, plate, paymentType)
  local identifier = Framework.Server.GetPlayerIdentifier(source)
  
  local vehicle = MySQL.single.await(
    "SELECT * FROM " .. Framework.VehiclesTable .. " WHERE " .. Framework.PlayerId .. " = ? AND plate = ? AND financed = ?",
    {identifier, plate, 1}
  )
  
  if not vehicle or not vehicle.finance_data then
    DebugPrint("Player " .. identifier .. " (" .. source .. ") tried to make a payment on a vehicle " .. plate .. " that doesn't exist or isn't financed", "debug")
    return {error = true}
  end
  
  local financeData = json.decode(vehicle.finance_data)
  
  if paymentType == "payment" then
    local paymentAmount = financeData.recurring_payment
    local bankBalance = Framework.Server.GetPlayerBalance(source, "bank")
    
    if paymentAmount > bankBalance then
      Framework.Server.Notify(source, Locale.errorNotEnoughMoney, "error")
      DebugPrint("Player " .. source .. " tried to make a payment but didn't have enough money. Bank account: " .. bankBalance .. " required: " .. paymentAmount, "debug")
      return {error = true}
    else
      Framework.Server.PlayerRemoveMoney(source, paymentAmount, "bank")
      MySQL.update.await("UPDATE dealership_data SET balance = balance + ? WHERE name = ?", {paymentAmount, financeData.dealership_id})
      
      DebugPrint("Player " .. source .. " made a payment of " .. paymentAmount .. " for vehicle " .. vehicle.plate .. ". Completed payments: " .. (financeData.payments_complete + 1), "debug")
      
      financeData.paid = financeData.paid + paymentAmount
      financeData.payment_failed = false
      financeData.payments_complete = financeData.payments_complete + 1
      financeData.seconds_to_next_payment = financeData.payment_interval * 3600
      
      MySQL.update.await(
        "UPDATE dealership_sales SET paid = ?, owed = ? WHERE plate = ?",
        {financeData.paid, Round(financeData.total - financeData.paid), vehicle.plate}
      )
      
      Framework.Server.Notify(source, string.gsub(Locale.vehicleFinancePaymentMade, "%%{value}", vehicle.plate), "success")
      
      SendWebhook(source, Webhooks.Finance, "Finance: Payment Success", "success", {
        {key = "Plate", value = vehicle.plate},
        {key = "Payment amount", value = paymentAmount}
      })
      
      if financeData.payments_complete == financeData.total_payments then
        vehicle.financed = false
        financeData = nil
        DebugPrint("Player " .. source .. " paid off their vehicle " .. vehicle.plate, "debug")
        Framework.Server.Notify(source, string.gsub(Locale.vehicleFinancePaidOff, "%%{value}", vehicle.plate), "success")
        SendWebhook(source, Webhooks.Finance, "Finance: Vehicle paid off", "success", {
          {key = "Plate", value = vehicle.plate}
        })
      end
    end
    
    local financeDataJson = financeData and json.encode(financeData) or nil
    MySQL.update.await(
      "UPDATE " .. Framework.VehiclesTable .. " SET financed = ?, finance_data = ? WHERE plate = ?",
      {vehicle.financed and 1 or 0, financeDataJson, vehicle.plate}
    )
  end
  
  if paymentType == "pay-in-full" then
    local remainingAmount = financeData.total - financeData.paid
    local bankBalance = Framework.Server.GetPlayerBalance(source, "bank")
    
    if remainingAmount > bankBalance then
      DebugPrint("Player " .. source .. " tried to pay off their vehicle " .. vehicle.plate .. " but didn't have enough money. Bank account: " .. bankBalance .. " required: " .. remainingAmount, "debug")
      Framework.Server.Notify(source, Locale.errorNotEnoughMoney, "error")
      return {error = true}
    else
      DebugPrint("Player " .. source .. " paid off their vehicle " .. vehicle.plate .. " in full. Amount: " .. remainingAmount, "debug")
      
      Framework.Server.PlayerRemoveMoney(source, remainingAmount, "bank")
      MySQL.update.await("UPDATE dealership_data SET balance = balance + ? WHERE name = ?", {remainingAmount, financeData.dealership_id})
      MySQL.update.await("UPDATE " .. Framework.VehiclesTable .. " SET financed = ?, finance_data = ? WHERE plate = ?", {0, nil, vehicle.plate})
      MySQL.update.await("UPDATE dealership_sales SET paid = ?, owed = ? WHERE plate = ?", {financeData.total, 0, vehicle.plate})
      
      Framework.Server.Notify(source, string.gsub(Locale.vehicleFinancePaidOff, "%%{value}", vehicle.plate), "success")
      SendWebhook(source, Webhooks.Finance, "Finance: Vehicle paid off", "success", {
        {key = "Plate", value = vehicle.plate}
      })
    end
  end
  
  return true
end)

function ProcessFinancePayments()
  CreateThread(function()
    local checkInterval = 600000
    while true do
      for _, playerData in pairs(Framework.Server.GetPlayers()) do
        local playerId = playerData.player_id
        local identifier = Framework.Server.GetPlayerIdentifier(playerId)
        
        if identifier then
          local vehicles = MySQL.query.await(
            "SELECT * FROM " .. Framework.VehiclesTable .. " WHERE " .. Framework.PlayerId .. " = ? AND financed = ?",
            {identifier, 1}
          )
          
          if #vehicles > 0 then
            DebugPrint("Got " .. #vehicles .. " financed vehicles for player " .. identifier .. " which needs payment", "debug")
            
            for _, vehicle in ipairs(vehicles) do
              if vehicle.financed and vehicle.finance_data then
                local isFinanced = vehicle.financed
                local financeData = json.decode(vehicle.finance_data)
                
                if financeData.payment_failed then
                  DebugPrint("Finance payment failed for vehicle " .. vehicle.plate .. ". Seconds until repo: " .. financeData.seconds_to_repo, "debug")
                  financeData.seconds_to_repo = financeData.seconds_to_repo - (checkInterval / 1000)
                  
                  Framework.Server.Notify(playerId, string.gsub(Locale.vehicleFinanceRepossessedSoon, "%%{value}", vehicle.plate), "error")
                  
                  if financeData.seconds_to_repo <= 0 then
                    DebugPrint("Repossessing vehicle " .. vehicle.plate .. " due to payment failure", "debug")
                    
                    MySQL.query.await("DELETE FROM " .. Framework.VehiclesTable .. " WHERE plate = ?", {vehicle.plate})
                    MySQL.update.await("UPDATE dealership_stock SET stock = stock + 1 WHERE vehicle = ? AND dealership = ?", {financeData.vehicle, financeData.dealership_id})
                    UpdateDealershipShowroomCache(financeData.dealership_id)
                    
                    if GetResourceState("jg-advancedgarages") == "started" then
                      TriggerEvent("jg-advancedgarages:server:DeleteOutsideVehicle", vehicle.plate)
                    end
                    
                    Framework.Server.Notify(playerId, string.gsub(Locale.vehicleFinanceRepossessed, "%%{value}", vehicle.plate), "error")
                    
                    SendWebhook(playerId, Webhooks.Finance, "Finance: Vehicle Repossessed!", "danger", {
                      {key = "Plate", value = vehicle.plate},
                      {key = "Balance owed", value = financeData.owed}
                    })
                    
                    TriggerEvent("jg-dealerships:server:vehicle-finance-defaulted", playerId, vehicle.plate, financeData.owed)
                  end
                else
                  financeData.seconds_to_next_payment = financeData.seconds_to_next_payment - (checkInterval / 1000)
                  
                  if financeData.seconds_to_next_payment <= 0 then
                    local paymentAmount = financeData.recurring_payment
                    local bankBalance = Framework.Server.GetPlayerBalance(playerId, "bank")
                    
                    if paymentAmount > bankBalance then
                      DebugPrint("Finance payment failed for vehicle " .. vehicle.plate .. ". Player " .. playerId .. " didn't have enough money. Bank account: " .. bankBalance .. " required: " .. paymentAmount, "debug")
                      
                      financeData.payment_failed = true
                      financeData.seconds_to_repo = Config.FinancePaymentFailedHoursUntilRepo * 3600
                      
                      Framework.Server.Notify(playerId, string.gsub(Locale.vehicleFinancePaymentFailed, "%%{value}", vehicle.plate), "error")
                      
                      SendWebhook(playerId, Webhooks.Finance, "Finance: Payment Failed", "danger", {
                        {key = "Plate", value = vehicle.plate},
                        {key = "Payment amount", value = paymentAmount}
                      })
                    else
                      Framework.Server.PlayerRemoveMoney(playerId, paymentAmount, "bank")
                      
                      DebugPrint("Player " .. playerId .. " made a payment of " .. paymentAmount .. " for vehicle " .. vehicle.plate .. ". Completed payments: " .. (financeData.payments_complete + 1), "debug")
                      
                      MySQL.update.await("UPDATE dealership_data SET balance = balance + ? WHERE name = ?", {paymentAmount, financeData.dealership_id})
                      
                      financeData.paid = financeData.paid + paymentAmount
                      financeData.payments_complete = financeData.payments_complete + 1
                      financeData.seconds_to_next_payment = financeData.payment_interval * 3600
                      
                      MySQL.update.await(
                        "UPDATE dealership_sales SET paid = ?, owed = ? WHERE plate = ?",
                        {financeData.paid, Round(financeData.total - financeData.paid), vehicle.plate}
                      )
                      
                      Framework.Server.Notify(playerId, string.gsub(Locale.vehicleFinancePaymentMade, "%%{value}", vehicle.plate), "success")
                      
                      SendWebhook(playerId, Webhooks.Finance, "Finance: Payment Success", "success", {
                        {key = "Plate", value = vehicle.plate},
                        {key = "Payment amount", value = paymentAmount}
                      })
                      
                      if financeData.payments_complete == financeData.total_payments then
                        DebugPrint("Player " .. playerId .. " paid off their vehicle " .. vehicle.plate, "debug")
                        isFinanced = 0
                        financeData = nil
                        
                        Framework.Server.Notify(playerId, string.gsub(Locale.vehicleFinancePaidOff, "%%{value}", vehicle.plate), "success")
                        
                        SendWebhook(playerId, Webhooks.Finance, "Finance: Vehicle paid off", "success", {
                          {key = "Plate", value = vehicle.plate}
                        })
                        
                        TriggerEvent("jg-dealerships:server:vehicle-finance-complete", playerId, vehicle.plate)
                      end
                    end
                  end
                end
                
                local financeDataJson = financeData and json.encode(financeData) or nil
                
                DebugPrint("Updating finance data for vehicle " .. vehicle.plate, "debug", financeDataJson or "")
                
                MySQL.update.await(
                  "UPDATE " .. Framework.VehiclesTable .. " SET financed = ?, finance_data = ? WHERE plate = ?",
                  {isFinanced, financeDataJson, vehicle.plate}
                )
              end
              
              Wait(500)
            end
          end
        end
      end
      
      Wait(checkInterval)
    end
  end)
end

InitFinanceThread = ProcessFinancePayments
