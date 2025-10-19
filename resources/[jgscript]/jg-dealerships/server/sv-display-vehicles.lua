lib.callback.register("jg-dealerships:server:get-display-vehicles", function(source, dealershipId)
  local identifier = Framework.Server.GetPlayerIdentifier(source)
  local dealershipData = MySQL.single.await("SELECT d.*, e.identifier, e.role FROM dealership_data d LEFT JOIN dealership_employees e ON d.name = e.dealership AND e.identifier = ? WHERE d.name = ?", {identifier, dealershipId})
  if not dealershipData then
    return false
  end
  local isManager = dealershipData.owner_id == identifier
  local vehicles = MySQL.query.await("SELECT dispveh.*, vehicle.model, vehicle.brand FROM dealership_dispveh dispveh INNER JOIN dealership_vehicles vehicle ON dispveh.vehicle = vehicle.spawn_code WHERE dealership = ?", {dealershipId})
  return {
    isManager = isManager,
    vehicles = vehicles
  }
end)

lib.callback.register("jg-dealerships:server:create-display-vehicle", function(source, dealershipId, vehicleCode, color, coords)
  -- Convert color to string format for database storage
  local colorString = color
  if type(color) == "table" then
    if color.rgb then
      -- Store as RGB string
      colorString = string.format("%d,%d,%d", color.rgb[1], color.rgb[2], color.rgb[3])
    elseif color.index then
      -- Store as index
      colorString = tostring(color.index)
    elseif color[1] and color[2] and color[3] then
      -- RGB array
      colorString = string.format("%d,%d,%d", color[1], color[2], color[3])
    else
      -- Default to white
      colorString = "255,255,255"
    end
  elseif type(color) == "number" then
    colorString = tostring(color)
  end
  
  MySQL.query.await("INSERT INTO dealership_dispveh (dealership,vehicle,color,coords) VALUES(?,?,?,?)", {dealershipId, vehicleCode, colorString, json.encode(coords)})
  TriggerClientEvent("jg-dealerships:client:spawn-display-vehicles", -1, dealershipId)
  return true
end)

lib.callback.register("jg-dealerships:server:edit-display-vehicle", function(source, dealershipId, vehicleId, vehicleCode, color)
  -- Convert color to string format for database storage
  local colorString = color
  if type(color) == "table" then
    if color.rgb then
      -- Store as RGB string
      colorString = string.format("%d,%d,%d", color.rgb[1], color.rgb[2], color.rgb[3])
    elseif color.index then
      -- Store as index
      colorString = tostring(color.index)
    elseif color[1] and color[2] and color[3] then
      -- RGB array
      colorString = string.format("%d,%d,%d", color[1], color[2], color[3])
    else
      -- Default to white
      colorString = "255,255,255"
    end
  elseif type(color) == "number" then
    colorString = tostring(color)
  end
  
  MySQL.query.await("UPDATE dealership_dispveh SET vehicle = ?, color = ? WHERE id = ?", {vehicleCode, colorString, vehicleId})
  TriggerClientEvent("jg-dealerships:client:spawn-display-vehicles", -1, dealershipId)
  return true
end)

lib.callback.register("jg-dealerships:server:delete-display-vehicle", function(source, dealershipId, vehicleId)
  MySQL.query.await("DELETE FROM dealership_dispveh WHERE id = ?", {vehicleId})
  TriggerClientEvent("jg-dealerships:client:spawn-display-vehicles", -1, dealershipId)
  return true
end)
