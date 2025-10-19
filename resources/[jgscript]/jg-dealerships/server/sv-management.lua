-- Check if a player is an employee of a dealership with specific roles
---@param source integer Player source
---@param dealershipId string Dealership identifier
---@param roles string|table Role(s) to check for (e.g., "manager" or {"supervisor", "manager"})
---@param allowOwner boolean Whether to allow the dealership owner
---@return string|false Returns the role if employee, false otherwise
function IsEmployee(source, dealershipId, roles, allowOwner)
  local playerIdentifier = Framework.Server.GetPlayerIdentifier(source)
  if not playerIdentifier then 
    return false 
  end
  
  -- Check if player is admin (admins can manage all dealerships)
  local isAdmin = Framework.Server.IsAdmin(source)
  if isAdmin then
    return "manager" -- Give admins manager role
  end
  
  -- Check if player is the dealership owner
  local dealershipData = MySQL.single.await("SELECT owner_id FROM dealership_data WHERE name = ?", {dealershipId})
  if dealershipData and dealershipData.owner_id == playerIdentifier then
    if allowOwner then
      return "manager" -- Owners have manager role
    end
  end
  
  -- Check if player is an employee with the required role
  local employee = MySQL.single.await("SELECT role FROM dealership_employees WHERE dealership = ? AND identifier = ?", {
    dealershipId,
    playerIdentifier
  })
  
  if not employee then return false end
  
  -- Convert roles to table if it's a string
  if type(roles) == "string" then
    roles = {roles}
  end
  
  -- Check if employee has one of the required roles
  for _, role in ipairs(roles) do
    if employee.role == role then
      return employee.role
    end
  end
  
  -- Special case: managers can do everything supervisors can do
  if employee.role == "manager" then
    for _, role in ipairs(roles) do
      if role == "supervisor" then
        return employee.role
      end
    end
  end
  
  return false
end

local function FulfillOrder(order)
  -- Mark order as fulfilled
  MySQL.update.await("UPDATE dealership_orders SET fulfilled = 1 WHERE id = ?", {order.id})
  
  -- Update stock - use INSERT ON DUPLICATE KEY UPDATE to handle both new and existing records
  -- First check if stock record exists
  local existingStock = MySQL.scalar.await("SELECT stock FROM dealership_stock WHERE dealership = ? AND vehicle = ?", {
    order.dealership,
    order.vehicle
  })
  
  if existingStock then
    -- Update existing stock
    MySQL.update.await("UPDATE dealership_stock SET stock = stock + ? WHERE dealership = ? AND vehicle = ?", {
      order.quantity,
      order.dealership,
      order.vehicle
    })
  else
    -- Get vehicle price from dealership_vehicles table
    local vehiclePrice = MySQL.scalar.await("SELECT price FROM dealership_vehicles WHERE spawn_code = ?", {order.vehicle})
    if not vehiclePrice then
      vehiclePrice = 0 -- Default price if not found
      print("[JG-Dealerships] Warning: Could not find price for vehicle " .. order.vehicle .. ", using default price 0")
    end
    
    -- Insert new stock record
    MySQL.insert.await("INSERT INTO dealership_stock (dealership, vehicle, stock, price) VALUES (?, ?, ?, ?)", {
      order.dealership,
      order.vehicle,
      order.quantity,
      vehiclePrice
    })
  end
  
  print("[JG-Dealerships] Order fulfilled: ID " .. order.id .. ", Vehicle: " .. order.vehicle .. ", Quantity: " .. order.quantity .. ", Dealership: " .. order.dealership)
  
  -- Notify online employees about the delivery
  local employees = MySQL.query.await("SELECT identifier FROM dealership_employees WHERE dealership = ?", {order.dealership})
  if employees then
    for _, employee in ipairs(employees) do
      local playerId = Framework.Server.GetPlayerIdFromIdentifier(employee.identifier)
      if playerId then
        Framework.Server.Notify(playerId, "Vehicle delivery completed! " .. order.quantity .. "x " .. order.vehicle .. " added to stock.", "success")
      end
    end
  end
  
  DebugPrint("Order fulfilled: " .. order.id, "debug", order)
end

lib.callback.register("jg-dealerships:server:get-dealership-data", function(source, dealershipId)
  local employeeRole = IsEmployee(source, dealershipId, {"supervisor", "manager"}, true)
  
  if not employeeRole then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  local dealershipData = MySQL.prepare.await("SELECT * FROM dealership_data WHERE name = ?", {dealershipId})
  if not dealershipData then
    DebugPrint("Failed to get dealership data for dealer: " .. dealershipId, "warning")
    return {error = true}
  end
  
  local stats = MySQL.prepare.await([[
    SELECT
      (SELECT COUNT(*) FROM dealership_stock WHERE dealership = ?) AS total_vehicle_count,
      (SELECT COUNT(*) FROM dealership_sales WHERE dealership = ?) AS total_sales_count,
      (SELECT COUNT(*) FROM dealership_dispveh WHERE dealership = ?) AS total_display_vehicles_count;
  ]], {dealershipId, dealershipId, dealershipId})
  
  if not stats then
    return {error = true}
  end
  
  local playerInfo = Framework.Server.GetPlayerInfo(source)
  local playerName = playerInfo and playerInfo.name or ""
  
  return {
    name = dealershipData.label,
    balance = dealershipData.balance,
    ownerId = dealershipData.owner_id,
    playerName = playerName,
    commission = dealershipData.employee_commission,
    employeeRole = employeeRole,
    stats = {
      vehiclesCount = stats.total_vehicle_count,
      totalSales = stats.total_sales_count,
      vehiclesOnDisplay = stats.total_display_vehicles_count
    },
    nearbyPlayers = GetNearbyPlayers(source, GetEntityCoords(GetPlayerPed(source)), 10.0, false)
  }
end)

lib.callback.register("jg-dealerships:server:get-dealership-balance", function(source, dealershipId)
  if not IsEmployee(source, dealershipId, {"supervisor", "manager"}, true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  local balance = MySQL.scalar.await("SELECT balance FROM dealership_data WHERE name = ?", {dealershipId})
  if not balance then
    return {error = true}
  end
  
  return {balance = balance}
end)

lib.callback.register("jg-dealerships:server:get-dealership-vehicles", function(source, data)
  local dealershipId = data.dealershipId
  
  if not IsEmployee(source, dealershipId, {"supervisor", "manager"}, true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  return MySQL.rawExecute.await(
    "SELECT vehicle.*, stock.stock as stock, stock.price as list_price FROM dealership_vehicles vehicle INNER JOIN dealership_stock stock ON vehicle.spawn_code = stock.vehicle INNER JOIN dealership_data dealership ON stock.dealership = dealership.name WHERE dealership.name = ? ORDER BY vehicle.spawn_code ASC;",
    {dealershipId}
  )
end)

lib.callback.register("jg-dealerships:server:get-dealership-display-vehicles", function(source, data)
  local dealershipId = data.dealershipId
  
  if not IsEmployee(source, dealershipId, {"supervisor", "manager"}, true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  return MySQL.query.await(
    "SELECT dispveh.*, vehicle.brand, vehicle.model FROM dealership_dispveh dispveh INNER JOIN dealership_vehicles vehicle ON vehicle.spawn_code = dispveh.vehicle WHERE dispveh.dealership = ?;",
    {dealershipId}
  )
end)

lib.callback.register("jg-dealerships:server:get-dealership-orders", function(source, data)
  local dealershipId = data.dealershipId
  
  if not IsEmployee(source, dealershipId, {"supervisor", "manager"}, true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  local orders = MySQL.query.await(
    "SELECT orders.*, vehicle.brand, vehicle.model FROM dealership_orders orders INNER JOIN dealership_vehicles vehicle ON orders.vehicle = vehicle.spawn_code WHERE orders.dealership = ? ORDER BY orders.order_created DESC;",
    {dealershipId}
  )
  
  if not orders then
    return {}
  end
  
  for index, order in ipairs(orders) do
    orders[index].time_remaining = order.delivery_time - os.time()
  end
  
  return orders
end)

lib.callback.register("jg-dealerships:server:get-dealership-sales", function(source, data)
  local dealershipId = data.dealershipId
  local pageIndex = data.pageIndex
  local pageSize = data.pageSize
  
  if not IsEmployee(source, dealershipId, {"supervisor", "manager"}, true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  local sales = MySQL.query.await(
    "SELECT sales.*, vehicle.brand, vehicle.model FROM dealership_sales sales INNER JOIN dealership_vehicles vehicle ON sales.vehicle = vehicle.spawn_code WHERE sales.dealership = ? ORDER BY sales.created_at DESC LIMIT ? OFFSET ?;",
    {dealershipId, pageSize, pageIndex * pageSize}
  )
  
  for index, sale in ipairs(sales) do
    local playerInfo = Framework.Server.GetPlayerInfoFromIdentifier(sale.player)
    sales[index].player_name = playerInfo and playerInfo.name or "-"
    
    local sellerInfo = Framework.Server.GetPlayerInfoFromIdentifier(sale.seller)
    sales[index].seller_name = sellerInfo and sellerInfo.name or "-"
  end
  
  local totalCount = MySQL.scalar.await("SELECT COUNT(*) FROM dealership_sales WHERE dealership = ?", {dealershipId})
  local pageCount = math.ceil(totalCount / pageSize)
  
  return {
    sales = sales,
    pageCount = pageCount
  }
end)

lib.callback.register("jg-dealerships:server:get-dealership-employees", function(source, data)
  local dealershipId = data.dealershipId
  local playerIdentifier = Framework.Server.GetPlayerIdentifier(source)
  
  if not IsEmployee(source, dealershipId, "manager", true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  local employees = MySQL.query.await("SELECT * FROM dealership_employees WHERE dealership = ?", {dealershipId})
  
  for index, employee in ipairs(employees) do
    local playerInfo = Framework.Server.GetPlayerInfoFromIdentifier(employee.identifier)
    employees[index] = {
      id = employee.player,
      identifier = employee.identifier,
      name = playerInfo and playerInfo.name or "-",
      role = employee.role,
      joined = employee.joined,
      me = employee.identifier == playerIdentifier
    }
  end
  
  return employees
end)

lib.callback.register("jg-dealerships:server:order-vehicle", function(source, dealershipId, vehicleCode, quantity)
  if not IsEmployee(source, dealershipId, {"supervisor", "manager"}, true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  local vehiclePrice = MySQL.scalar.await("SELECT price FROM dealership_vehicles WHERE spawn_code = ?", {vehicleCode})
  if not vehiclePrice then
    return {error = true}
  end
  
  local totalCost = vehiclePrice * Config.DealerPurchasePrice * quantity
  local deliveryTime = os.time() + (Config.VehicleOrderTime * 60)
  
  local dealershipBalance = MySQL.scalar.await("SELECT balance FROM dealership_data WHERE name = ?", {dealershipId})
  
  if totalCost > dealershipBalance then
    Framework.Server.Notify(source, Locale.dealershipNotEnoughFunds, "error")
    return {error = true}
  end
  
  local orderId = MySQL.insert.await(
    "INSERT INTO dealership_orders (vehicle, dealership, quantity, cost, delivery_time) VALUES(?, ?, ?, ?, ?)",
    {vehicleCode, dealershipId, quantity, totalCost, deliveryTime}
  )
  
  MySQL.query.await("UPDATE dealership_data SET balance = balance - ? WHERE name = ?", {totalCost, dealershipId})
  
  Framework.Server.Notify(source, string.gsub(Locale.dealershipOrderPlaced, "%%{value}", quantity), "success")
  
  SendWebhook(source, Webhooks.Dealership, "Dealership: Order Placed", "info", {
    {key = "Dealership", value = dealershipId},
    {key = "Vehicle", value = vehicleCode},
    {key = "Quantity", value = quantity},
    {key = "Cost", value = totalCost}
  })
  
  if Config.VehicleOrderTime == 0 then
    FulfillOrder({
      id = orderId,
      quantity = quantity,
      dealership = dealershipId,
      vehicle = vehicleCode
    })
  end
  
  local orderData = MySQL.single.await(
    "SELECT orders.*, vehicle.brand, vehicle.model FROM dealership_orders orders INNER JOIN dealership_vehicles vehicle ON orders.vehicle = vehicle.spawn_code WHERE orders.dealership = ? ORDER BY id DESC LIMIT 1",
    {dealershipId}
  )
  
  return orderData
end)

lib.callback.register("jg-dealerships:server:cancel-vehicle-order", function(source, orderId)
  local order = MySQL.single.await("SELECT * FROM dealership_orders WHERE id = ?", {orderId})
  
  if not order then
    return {error = true}
  end
  
  if not IsEmployee(source, order.dealership, {"supervisor", "manager"}, true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  MySQL.query.await("DELETE FROM dealership_orders WHERE id = ?", {orderId})
  MySQL.query.await("UPDATE dealership_data SET balance = balance + ? WHERE name = ?", {order.cost, order.dealership})
  
  Framework.Server.Notify(source, Locale.dealershipOrderCancelled, "success")
  
  SendWebhook(source, Webhooks.Dealership, "Dealership: Order Cancelled", "danger", {
    {key = "Dealership", value = order.dealership},
    {key = "Vehicle", value = order.vehicle},
    {key = "Quantity", value = order.quantity},
    {key = "Amount Refunded", value = order.cost}
  })
  
  return true
end)

lib.callback.register("jg-dealerships:server:dealership-deposit", function(source, dealershipId, accountType, amount)
  if not IsEmployee(source, dealershipId, "manager", true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  if amount < 0 then
    Framework.Server.Notify(source, "Stop trying to exploit the script", "error")
    return false
  end
  
  local playerBalance = Framework.Server.GetPlayerBalance(source, accountType)
  
  if amount > playerBalance then
    Framework.Server.Notify(source, Locale.errorNotEnoughMoney, "error")
    return {error = true}
  end
  
  Framework.Server.PlayerRemoveMoney(source, amount, accountType)
  MySQL.query.await("UPDATE dealership_data SET balance = balance + ? WHERE name = ?", {amount, dealershipId})
  
  Framework.Server.Notify(source, string.gsub(Locale.dealershipDepositSuccess, "%%{value}", amount), "success")
  
  SendWebhook(source, Webhooks.Dealership, "Dealership: Deposit", "success", {
    {key = "Dealership", value = dealershipId},
    {key = "Amount", value = amount},
    {key = "Account Type", value = accountType}
  })
  
  return true
end)

lib.callback.register("jg-dealerships:server:dealership-withdraw", function(source, dealershipId, accountType, amount)
  if not IsEmployee(source, dealershipId, "manager", true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  if amount < 0 then
    Framework.Server.Notify(source, "Stop trying to exploit the script", "error")
    return false
  end
  
  local dealershipBalance = MySQL.scalar.await("SELECT balance FROM dealership_data WHERE name = ?", {dealershipId})
  
  if amount > dealershipBalance then
    Framework.Server.Notify(source, Locale.dealershipNotEnoughFunds, "error")
    return {error = true}
  end
  
  MySQL.query.await("UPDATE dealership_data SET balance = balance - ? WHERE name = ?", {amount, dealershipId})
  Framework.Server.PlayerAddMoney(source, amount, accountType)
  
  Framework.Server.Notify(source, string.gsub(Locale.dealershipWithdrawSuccess, "%%{value}", amount), "success")
  
  SendWebhook(source, Webhooks.Dealership, "Dealership: Withdraw", "warning", {
    {key = "Dealership", value = dealershipId},
    {key = "Amount", value = amount},
    {key = "Account Type", value = accountType}
  })
  
  return true
end)

lib.callback.register("jg-dealerships:server:update-vehicle-price", function(source, dealershipId, vehicleCode, newPrice)
  if not IsEmployee(source, dealershipId, {"supervisor", "manager"}, true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  MySQL.update.await("UPDATE dealership_stock SET price = ? WHERE dealership = ? AND vehicle = ?", {newPrice, dealershipId, vehicleCode})
  
  Framework.Server.Notify(source, string.gsub(Locale.dealershipVehiclePriceUpdated, "%%{value}", vehicleCode), "success")
  
  SendWebhook(source, Webhooks.Dealership, "Dealership: Vehicle Price Updated", "info", {
    {key = "Dealership", value = dealershipId},
    {key = "Vehicle", value = vehicleCode},
    {key = "New Price", value = newPrice}
  })
  
  return true
end)

lib.callback.register("jg-dealerships:server:update-commission", function(source, dealershipId, newCommission)
  if not IsEmployee(source, dealershipId, "manager", true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  MySQL.update.await("UPDATE dealership_data SET employee_commission = ? WHERE name = ?", {newCommission, dealershipId})
  
  Framework.Server.Notify(source, string.gsub(Locale.dealershipCommissionUpdated, "%%{value}", newCommission), "success")
  
  SendWebhook(source, Webhooks.Dealership, "Dealership: Commission Updated", "info", {
    {key = "Dealership", value = dealershipId},
    {key = "New Commission", value = newCommission .. "%"}
  })
  
  return true
end)

lib.callback.register("jg-dealerships:server:hire-employee", function(source, dealershipId, playerId, role)
  if not IsEmployee(source, dealershipId, "manager", true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  local targetIdentifier = Framework.Server.GetPlayerIdentifier(playerId)
  if not targetIdentifier then
    Framework.Server.Notify(source, Locale.employeeNotOnline, "error")
    return {error = true}
  end
  
  local existingEmployee = MySQL.scalar.await(
    "SELECT id FROM dealership_employees WHERE identifier = ? AND dealership = ?",
    {targetIdentifier, dealershipId}
  )
  
  if existingEmployee then
    Framework.Server.Notify(source, Locale.employeeAlreadyHired, "error")
    return {error = true}
  end
  
  MySQL.insert.await(
    "INSERT INTO dealership_employees (dealership, identifier, player, role) VALUES (?, ?, ?, ?)",
    {dealershipId, targetIdentifier, playerId, role}
  )
  
  Framework.Server.Notify(source, Locale.employeeHired, "success")
  Framework.Server.Notify(playerId, string.gsub(Locale.youWereHired, "%%{value}", dealershipId), "success")
  
  SendWebhook(source, Webhooks.Dealership, "Dealership: Employee Hired", "success", {
    {key = "Dealership", value = dealershipId},
    {key = "Employee", value = GetPlayerName(playerId)},
    {key = "Role", value = role}
  })
  
  return true
end)

lib.callback.register("jg-dealerships:server:fire-employee", function(source, dealershipId, employeeIdentifier)
  if not IsEmployee(source, dealershipId, "manager", true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  MySQL.query.await(
    "DELETE FROM dealership_employees WHERE identifier = ? AND dealership = ?",
    {employeeIdentifier, dealershipId}
  )
  
  Framework.Server.Notify(source, Locale.employeeFired, "success")
  
  local firedPlayer = Framework.Server.GetPlayerFromIdentifier(employeeIdentifier)
  if firedPlayer then
    Framework.Server.Notify(firedPlayer, string.gsub(Locale.youWereFired, "%%{value}", dealershipId), "error")
  end
  
  SendWebhook(source, Webhooks.Dealership, "Dealership: Employee Fired", "danger", {
    {key = "Dealership", value = dealershipId},
    {key = "Employee Identifier", value = employeeIdentifier}
  })
  
  return true
end)

lib.callback.register("jg-dealerships:server:update-employee-role", function(source, dealershipId, employeeIdentifier, newRole)
  if not IsEmployee(source, dealershipId, "manager", true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return {error = true}
  end
  
  MySQL.update.await(
    "UPDATE dealership_employees SET role = ? WHERE identifier = ? AND dealership = ?",
    {newRole, employeeIdentifier, dealershipId}
  )
  
  Framework.Server.Notify(source, Locale.employeeRoleUpdated, "success")
  
  local updatedPlayer = Framework.Server.GetPlayerFromIdentifier(employeeIdentifier)
  if updatedPlayer then
    Framework.Server.Notify(updatedPlayer, string.gsub(Locale.yourRoleWasUpdated, "%%{value}", newRole), "info")
  end
  
  SendWebhook(source, Webhooks.Dealership, "Dealership: Employee Role Updated", "info", {
    {key = "Dealership", value = dealershipId},
    {key = "Employee Identifier", value = employeeIdentifier},
    {key = "New Role", value = newRole}
  })
  
  return true
end)

-- Handle dealership settings update (name and commission)
RegisterNetEvent("jg-dealerships:server:update-dealership-settings", function(dealershipId, data)
  local source = source
  
  if not IsEmployee(source, dealershipId, "manager", true) then
    Framework.Server.Notify(source, Locale.employeePermissionsError, "error")
    return
  end
  
  -- Update dealership name if provided
  if data.name then
    MySQL.update.await("UPDATE dealership_data SET label = ? WHERE name = ?", {data.name, dealershipId})
    print("[JG-Dealerships] Updated dealership name for " .. dealershipId .. " to: " .. data.name)
  end
  
  -- Update commission if provided
  if data.commission then
    MySQL.update.await("UPDATE dealership_data SET employee_commission = ? WHERE name = ?", {data.commission, dealershipId})
    print("[JG-Dealerships] Updated commission for " .. dealershipId .. " to: " .. data.commission)
  end
  
  Framework.Server.Notify(source, "Dealership settings updated successfully", "success")
  
  SendWebhook(source, Webhooks.Dealership, "Dealership: Settings Updated", "info", {
    {key = "Dealership", value = dealershipId},
    {key = "New Name", value = data.name or "Not changed"},
    {key = "New Commission", value = data.commission and (data.commission .. "%") or "Not changed"}
  })
end)

-- Override the placeholder function from sv-main.lua with the actual implementation
InitOrderProcessingThread = function()
  CreateThread(function()
    while true do
      local currentTime = os.time()
      -- Check for orders that are ready and not fulfilled
      local orders = MySQL.query.await("SELECT * FROM dealership_orders WHERE (fulfilled = 0 OR fulfilled IS NULL) AND delivery_time <= ?", {currentTime})
      
      for _, order in ipairs(orders) do
        FulfillOrder(order)
        DebugPrint("Auto-fulfilling order: " .. order.id, "debug")
        Wait(500)
      end
      
      Wait(60000)
    end
  end)
end
