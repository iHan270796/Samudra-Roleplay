local showroomSessions = {}
local showroomVehicleCache = {}

function UpdateDealershipShowroomCache(dealershipId)
  local dealership = Config.DealershipLocations[dealershipId]
  if not dealership then
    return false
  end
  
  if not dealership.categories or #dealership.categories == 0 then
    showroomVehicleCache[dealershipId] = {}
    return
  end
  
  local vehicles = MySQL.query.await(
    "SELECT vehicle.*, stock.stock as stock, stock.price as price FROM dealership_vehicles vehicle INNER JOIN dealership_stock stock ON vehicle.spawn_code = stock.vehicle INNER JOIN dealership_data dealership ON stock.dealership = dealership.name WHERE vehicle.category IN (?) AND (dealership.name = ?) ORDER BY vehicle.spawn_code ASC;",
    {dealership.categories, dealershipId}
  )
  
  showroomVehicleCache[dealershipId] = vehicles
end

UpdateDealershipShowroomCache = UpdateDealershipShowroomCache

function UpdateAllDealershipsShowroomCache()
  for dealershipId, _ in pairs(Config.DealershipLocations) do
    UpdateDealershipShowroomCache(dealershipId)
  end
end

UpdateAllDealershipsShowroomCache = UpdateAllDealershipsShowroomCache
lib.callback.register("jg-dealerships:server:enter-showroom", function(source, dealershipId, dealershipConfig, originalCoords)
  local identifier = Framework.Server.GetPlayerIdentifier(source)
  if not identifier then
    DebugPrint("jg-dealerships:server:enter-showroom: no identifier found for player " .. source, "warning")
    return false
  end
  
  local playerPed = GetPlayerPed(source)
  local cameraCoords = dealershipConfig.camera.coords
  local originalBucket = 0
  
  if Config.ReturnToPreviousRoutingBucket then
    originalBucket = GetPlayerRoutingBucket(source)
  end
  
  showroomSessions[identifier] = {
    dealership = dealershipId,
    originalBucket = originalBucket,
    originalCoords = originalCoords
  }
  
  local showroomBucket = math.random(100, 999)
  SetPlayerRoutingBucket(source, showroomBucket)
  SetEntityCoords(playerPed, cameraCoords.x, cameraCoords.y, cameraCoords.z, false, false, false, false)
  ClearPedTasksImmediately(playerPed)
  FreezeEntityPosition(playerPed, true)
  
  if not showroomVehicleCache[dealershipId] then
    UpdateDealershipShowroomCache(dealershipId)
  end
  
  local financedCount = MySQL.scalar.await(
    "SELECT COUNT(*) as total FROM " .. Framework.VehiclesTable .. " WHERE financed = 1 AND " .. Framework.PlayerId .. " = ?",
    {identifier}
  )
  
  return {
    vehicles = showroomVehicleCache[dealershipId],
    financeAllowed = financedCount < (Config.MaxFinancedVehiclesPerPlayer or 999999)
  }
end)
lib.callback.register("jg-dealerships:server:exit-showroom", function(source, dealershipId)
  local identifier = Framework.Server.GetPlayerIdentifier(source)
  if not identifier then
    DebugPrint("jg-dealerships:server:exit-showroom: no identifier found for player " .. source, "warning")
    return false
  end
  
  local playerPed = GetPlayerPed(source)
  local session = showroomSessions[identifier]
  
  if session then
    local originalCoords = session.originalCoords
    SetPlayerRoutingBucket(source, session.originalBucket)
    SetEntityCoords(playerPed, originalCoords.x, originalCoords.y, originalCoords.z, false, false, false, false)
  elseif dealershipId then
    SetPlayerRoutingBucket(source, 0)
    local dealership = Config.DealershipLocations[dealershipId]
    local exitCoords = dealership.openShowroom.coords
    SetEntityCoords(playerPed, exitCoords.x, exitCoords.y, exitCoords.z, false, false, false, false)
  end
  
  FreezeEntityPosition(playerPed, false)
  ClearPedTasksImmediately(playerPed)
  showroomSessions[identifier] = nil
  
  return true
end)
lib.callback.register("jg-dealerships:server:get-showroom-vehicle-data", function(source, dealershipId, vehicleSpawnCode)
  return MySQL.single.await(
    "SELECT * FROM dealership_stock WHERE vehicle = ? AND dealership = ?",
    {vehicleSpawnCode, dealershipId}
  )
end)
