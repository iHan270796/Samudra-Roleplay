RegisterNetEvent("jg-dealerships:client:sell-vehicle", function(dealershipId)
  if not cache.vehicle then
    return Framework.Client.Notify(Locale.notInVehicle, "error")
  end
  local plate = Framework.Client.GetPlate(cache.vehicle)
  if not plate then
    return
  end
  local model = GetEntityArchetypeName(cache.vehicle)
  DebugPrint("Trying to sell vehicle with plate: " .. plate .. " and model: " .. model, "debug")
  local value = lib.callback.await("jg-dealerships:server:sell-vehicle-get-value", false, dealershipId, plate, model)
  if not value then
    return
  end
  SetNuiFocus(true, true)
  SendNUIMessage({
    type = "sell-vehicle-to-dealer",
    dealershipId = dealershipId,
    plate = plate,
    value = value,
    config = GetSafeConfigForNUI(),
    locale = Locale
  })
end)

RegisterNUICallback("sell-vehicle-price-accepted", function(data, cb)
  if not cache.vehicle then
    return cb({error = true})
  end
  local vehicle = cache.vehicle
  local plate = Framework.Client.GetPlate(vehicle)
  if not plate then
    return cb({error = true})
  end
  local model = GetEntityArchetypeName(vehicle)
  local success = lib.callback.await("jg-dealerships:server:sell-vehicle", 2500, data.dealershipId, plate, model)
  if not success then
    return cb({error = true})
  end
  local showroomCoords = Config.DealershipLocations[data.dealershipId] and Config.DealershipLocations[data.dealershipId].openShowroom and Config.DealershipLocations[data.dealershipId].openShowroom.coords
  DoScreenFadeOut(500)
  Wait(500)
  for seatIndex = -1, 5, 1 do
    local ped = GetPedInVehicleSeat(vehicle, seatIndex)
    if ped then
      TaskLeaveVehicle(ped, vehicle, 0)
      if showroomCoords then
        SetEntityCoords(ped, showroomCoords.x, showroomCoords.y, showroomCoords.z, true, false, false, false)
      end
    end
  end
  Framework.Client.VehicleRemoveKeys(plate, vehicle, "vehicleSale")
  SetVehicleDoorsLocked(vehicle, 2)
  Wait(1500)
  TriggerEvent("jg-dealerships:client:sell-vehicle:config", vehicle, plate)
  DoScreenFadeIn(500)
  cb({success = true})
end)
