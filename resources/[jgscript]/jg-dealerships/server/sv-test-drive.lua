local testDriveSessions = {}

lib.callback.register("jg-dealerships:server:start-test-drive", function(source, dealershipId, spawnCoords, netId, vehicleModel, vehicleLabel, plate, vehicleColor)
  local vehicle = netId and NetworkGetEntityFromNetworkId(netId) or nil
  local playerPed = GetPlayerPed(source)
  local identifier = Framework.Server.GetPlayerIdentifier(source)
  if not identifier then
    return false
  end
  if Config.SpawnVehiclesWithServerSetter then
    local spawnInside = not Config.DoNotSpawnInsideVehicle
    local vehicleData = {
      plate = plate,
      colour = vehicleColor
    }
    netId, vehicle = SpawnVehicleServer(source, 0, vehicleModel, plate, spawnCoords, spawnInside, vehicleData, "testDrive")
  end
  if not vehicle or vehicle == 0 or not netId then
    Framework.Server.Notify(source, "Could not spawn vehicle", "error")
    return false
  end
  local originalBucket = 0
  local useRoutingBucket = not Config.TestDriveNotInBucket
  if useRoutingBucket then
    if Config.ReturnToPreviousRoutingBucket then
      originalBucket = GetPlayerRoutingBucket(source)
    end
  end
  if useRoutingBucket then
    local bucket = math.random(100, 999)
    SetPlayerRoutingBucket(source, bucket)
    SetEntityRoutingBucket(vehicle, bucket)
  end
  testDriveSessions[identifier] = {
    dealershipId = dealershipId,
    originalBucket = originalBucket,
    originalCoords = GetEntityCoords(playerPed),
    vehicleNetId = netId,
    vehicleModel = vehicleModel,
    vehicleColour = vehicleColor
  }
  SendWebhook(source, Webhooks.TestDrive, "New Test Drive", "success", {
    {key = "Vehicle", value = vehicleLabel},
    {key = "Dealership", value = dealershipId},
    {key = "Plate", value = plate}
  })
  return true, netId
end)

lib.callback.register("jg-dealerships:server:finish-test-drive", function(source)
  local identifier = Framework.Server.GetPlayerIdentifier(source)
  if not identifier then
    DebugPrint("jg-dealerships:server:finish-test-drive: no identifier found for player " .. source, "warning")
    return false
  end
  local session = testDriveSessions[identifier]
  if not session then
    DebugPrint("jg-dealerships:server:finish-test-drive: no test drive session found for player " .. source, "warning")
    return false
  end
  local vehicle = NetworkGetEntityFromNetworkId(session.vehicleNetId)
  SetEntityVelocity(vehicle, 0, 0, 0)
  for seatIndex = -1, 5, 1 do
    local ped = GetPedInVehicleSeat(vehicle, seatIndex)
    if ped then
      TaskLeaveVehicle(ped, vehicle, 0)
    end
  end
  SetVehicleDoorsLocked(vehicle, 2)
  local playerPed = GetPlayerPed(source)
  local dealership = Config.DealershipLocations[session.dealershipId]
  local showroomCoords = dealership.openShowroom.coords
  JGDeleteVehicle(vehicle)
  SetEntityCoords(playerPed, showroomCoords.x, showroomCoords.y, showroomCoords.z, false, false, false, false)
  Wait(500)
  local useRoutingBucket = not Config.TestDriveNotInBucket
  if useRoutingBucket then
    SetPlayerRoutingBucket(source, session.originalBucket)
  end
  testDriveSessions[identifier] = nil
  return session
end)
