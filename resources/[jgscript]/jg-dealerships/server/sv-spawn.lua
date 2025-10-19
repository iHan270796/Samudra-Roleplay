local spawnAttempts = {}
local MAX_TELEPORT_DISTANCE = 10.0
local MAX_SPAWN_ATTEMPTS = 3

function SpawnVehicleWithServerSetter(source, model, type, plate, coords, warpPed, props)
  if spawnAttempts[source] and spawnAttempts[source] == MAX_SPAWN_ATTEMPTS then
    print("^3[WARNING] Vehicle props failed to set after trying several times. First check if the plate within the vehicle props JSON does not match the plate column. If they match, and you see this message regularly, try setting Config.SpawnVehiclesWithServerSetter = false")
    spawnAttempts[source] = 0
    return false
  end
  
  spawnAttempts[source] = (spawnAttempts[source] or 0) + 1
  
  local vehicle = CreateVehicleServerSetter(model, type, coords.x, coords.y, coords.z, coords.w)
  
  lib.waitFor(function()
    return DoesEntityExist(vehicle) or nil
  end, "Timed out while trying to spawn in vehicle (server)", 10000)
  
  lib.waitFor(function()
    return GetVehicleNumberPlateText(vehicle) ~= "" or nil
  end, "Vehicle number plate text is nil", 5000)
  
  SetEntityRoutingBucket(vehicle, GetPlayerRoutingBucket(source))
  
  -- Prevent vehicle from being culled/despawned
  if SetEntityOrphanMode then
    SetEntityOrphanMode(vehicle, 2)  -- Never delete the entity
  end
  
  -- Additional protection against despawning
  SetEntityDistanceCullingRadius(vehicle, 999999.0)
  
  -- Remove any peds from vehicle
  for seat = -1, 6 do
    local ped = GetPedInVehicleSeat(vehicle, seat)
    if ped ~= 0 then
      DeleteEntity(ped)
    end
  end
  
  if warpPed then
    local playerPed = GetPlayerPed(source)
    pcall(function()
      lib.waitFor(function()
        if GetPedInVehicleSeat(vehicle, -1) == playerPed then
          return true
        end
        SetPedIntoVehicle(playerPed, vehicle, -1)
      end, nil, 1000)
    end)
  end
  
  lib.waitFor(function()
    return NetworkGetEntityOwner(vehicle) ~= -1 or nil
  end, "Timed out waiting for server-setter entity to have an owner (owner is -1)", 5000)
  
  Entity(vehicle).state:set("vehInit", true, true)
  
  if props and type(props) == "table" then
    Entity(vehicle).state:set("dealershipVehCreatedApplyProps", props, true)
  end
  
  local success = pcall(function()
    lib.waitFor(function()
      if not Entity(vehicle).state.dealershipVehCreatedApplyProps then
        if plate and plate ~= "" then
          if Framework.Server.GetPlate(vehicle) ~= plate then
            return nil
          end
        end
        return true
      end
    end, nil, 2000)
  end)
  
  if not success then
    DeleteEntity(vehicle)
    JGDeleteVehicle(vehicle)
    return SpawnVehicleWithServerSetter(source, model, type, plate, coords, warpPed, props)
  end
  
  spawnAttempts[source] = 0
  local netId = NetworkGetNetworkIdFromEntity(vehicle)
  return netId, vehicle
end
function SpawnVehicleServer(source, vehicleId, spawnCode, plate, coords, warpPed, props, financeData)
  local model, type, shouldWarp = lib.callback.await("jg-dealerships:client:req-vehicle-and-get-spawn-details", source, spawnCode)
  
  if not model then
    return false
  end
  
  local playerPed = GetPlayerPed(source)
  local playerCoords = GetEntityCoords(playerPed)
  local wasTeleported = false
  
  if #(playerCoords - coords.xyz) > MAX_TELEPORT_DISTANCE then
    SetEntityCoords(playerPed, coords.x + 3.0, coords.y + 3.0, coords.z, false, false, false, false)
    wasTeleported = true
  end
  
  local netId, entity = SpawnVehicleWithServerSetter(
    source,
    model,
    type,
    plate,
    coords,
    shouldWarp and warpPed,
    props
  )
  
  if not entity or not netId then
    return false
  end
  
  local success = lib.callback.await(
    "jg-dealerships:client:on-server-vehicle-created",
    source,
    netId,
    wasTeleported and playerCoords,
    shouldWarp and warpPed,
    model,
    vehicleId,
    plate,
    props,
    financeData
  )
  
  if not success then
    if DoesEntityExist(entity) then
      DeleteEntity(entity)
      DebugPrint("Failed to create vehicle, deleted entity.", "warning", netId)
    end
    return false
  end
  
  return netId, entity
end

SpawnVehicleServer = SpawnVehicleServer
