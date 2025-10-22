-- Find the closest vehicle to a position within a radius
function WSB.getClosestVehicle(coords, maxDistance, includePlayerVehicle)
  local playerPed = PlayerPedId()
  local playerVehicle = GetVehiclePedIsIn(playerPed, false)
  
  -- If includePlayerVehicle is true and player is in a vehicle, return it immediately
  if includePlayerVehicle and playerVehicle ~= 0 then
      return playerVehicle
  end
  
  local allVehicles = GetGamePool("CVehicle")
  local closestDistance = -1
  local closestVehicle = -1
  
  -- Use player position if coords not provided
  if coords == nil then
      coords = GetEntityCoords(playerPed)
  end
  
  -- Default max distance to 1000 units
  if maxDistance == nil then
      maxDistance = 1000.0
  end
  
  -- Find closest vehicle
  for i = 1, #allVehicles, 1 do
      -- Skip player's current vehicle if exists
      if playerVehicle then
          if allVehicles[i] == playerVehicle then
              goto continue
          end
      end
      
      local vehicleCoords = GetEntityCoords(allVehicles[i])
      local distance = #(coords - vehicleCoords)
      
      if closestDistance == -1 or closestDistance > distance then
          closestVehicle = allVehicles[i]
          closestDistance = distance
      end
      
      ::continue::
  end
  
  -- Return vehicle if found within max distance
  if closestDistance ~= -1 and maxDistance >= closestDistance then
      return closestVehicle
  else
      return nil
  end
end

-- Find the closest player (by player ID) to a position within a radius
function WSB.getClosestPlayer(coords, maxDistance)
  local activePlayers = GetActivePlayers()
  local localPlayer = PlayerId()
  local closestDistance = -1
  local closestPlayer = -1
  
  -- Use player position if coords not provided
  if coords == nil then
      coords = GetEntityCoords(PlayerPedId())
  end
  
  -- Default max distance to 1000 units
  if maxDistance == nil then
      maxDistance = 1000.0
  end
  
  -- Find closest player
  for i = 1, #activePlayers, 1 do
      if activePlayers[i] ~= localPlayer then
          local playerPed = GetPlayerPed(activePlayers[i])
          
          if playerPed ~= nil then
              local playerCoords = GetEntityCoords(playerPed)
              local distance = #(coords - playerCoords)
              
              if closestDistance == -1 or closestDistance > distance then
                  closestPlayer = activePlayers[i]
                  closestDistance = distance
              end
          end
      end
  end
  
  -- Return player ID if found within max distance
  if closestDistance ~= -1 and maxDistance >= closestDistance then
      return closestPlayer
  else
      return nil
  end
end

-- Find the closest player ped entity to a position within a radius
function WSB.getClosestPlayerPed(coords, maxDistance)
  local activePlayers = GetActivePlayers()
  local localPlayer = PlayerId()
  local closestDistance = -1
  local closestPed = -1
  
  -- Use player position if coords not provided
  if coords == nil then
      coords = GetEntityCoords(PlayerPedId())
  end
  
  -- Default max distance to 1000 units
  if maxDistance == nil then
      maxDistance = 1000.0
  end
  
  -- Find closest player ped
  for i = 1, #activePlayers, 1 do
      if activePlayers[i] ~= localPlayer then
          local playerPed = GetPlayerPed(activePlayers[i])
          
          if playerPed ~= nil then
              local pedCoords = GetEntityCoords(playerPed)
              local distance = #(coords - pedCoords)
              
              if closestDistance == -1 or closestDistance > distance then
                  closestPed = playerPed
                  closestDistance = distance
              end
          end
      end
  end
  
  -- Return ped entity if found within max distance
  if closestDistance ~= -1 and maxDistance >= closestDistance then
      return closestPed
  end
  
  return nil
end

-- Get all vehicles within a radius of a position
function WSB.getNearbyVehicles(coords, maxDistance, includePlayerVehicle)
  local nearbyVehicles = {}
  local playerPed = PlayerPedId()
  local playerVehicle = GetVehiclePedIsIn(playerPed, false)
  local allVehicles = GetGamePool("CVehicle")
  
  -- Use player position if coords not provided
  if coords == nil then
      coords = GetEntityCoords(playerPed)
  end
  
  -- Default max distance to 1000 units
  if maxDistance == nil then
      maxDistance = 1000.0
  end
  
  -- Find all vehicles within range
  for i = 1, #allVehicles, 1 do
      local vehicleCoords = GetEntityCoords(allVehicles[i])
      local distance = #(coords - vehicleCoords)
      
      if not includePlayerVehicle then
          -- Exclude player vehicle if flag is false/nil
          if playerVehicle and allVehicles[i] ~= playerVehicle and maxDistance >= distance then
              nearbyVehicles[#nearbyVehicles + 1] = allVehicles[i]
          end
      elseif maxDistance >= distance then
          -- Include all vehicles within range
          nearbyVehicles[#nearbyVehicles + 1] = allVehicles[i]
      end
  end
  
  return nearbyVehicles
end

-- Get all players (by player ID) within a radius of a position
function WSB.getNearbyPlayers(coords, maxDistance)
  local activePlayers = GetActivePlayers()
  local localPlayer = PlayerId()
  local nearbyPlayers = {}
  
  -- Use player position if coords not provided
  if coords == nil then
      coords = GetEntityCoords(PlayerPedId())
  end
  
  -- Default max distance to 1000 units
  if maxDistance == nil then
      maxDistance = 1000.0
  end
  
  -- Find all players within range
  for i = 1, #activePlayers, 1 do
      if activePlayers[i] ~= localPlayer then
          local playerPed = GetPlayerPed(activePlayers[i])
          
          if playerPed ~= nil then
              local playerCoords = GetEntityCoords(playerPed)
              local distance = #(coords - playerCoords)
              
              if maxDistance >= distance then
                  nearbyPlayers[#nearbyPlayers + 1] = activePlayers[i]
              end
          end
      end
  end
  
  return nearbyPlayers
end

-- Get all player ped entities within a radius of a position
function WSB.getNearbyPlayerPeds(coords, maxDistance)
  local activePlayers = GetActivePlayers()
  local localPlayer = PlayerId()
  local nearbyPeds = {}
  
  -- Use player position if coords not provided
  if coords == nil then
      coords = GetEntityCoords(PlayerPedId())
  end
  
  -- Default max distance to 1000 units
  if maxDistance == nil then
      maxDistance = 1000.0
  end
  
  -- Find all player peds within range
  for i = 1, #activePlayers, 1 do
      if activePlayers[i] ~= localPlayer then
          local playerPed = GetPlayerPed(activePlayers[i])
          
          if playerPed ~= nil then
              local pedCoords = GetEntityCoords(playerPed)
              local distance = #(coords - pedCoords)
              
              if maxDistance >= distance then
                  nearbyPeds[#nearbyPeds + 1] = playerPed
              end
          end
      end
  end
  
  return nearbyPeds
end

-- Force network ownership of an entity to the local player
function WSB.forceEntityOwnership(callback, entity)
  local localPlayer = PlayerId()
  
  -- Check if entity exists
  if not DoesEntityExist(entity) then
      callback(false)
      return
  end
  
  -- Setup network ownership
  local networkId = NetworkGetNetworkIdFromEntity(entity)
  SetNetworkIdCanMigrate(networkId, true)
  SetNetworkIdExistsOnAllMachines(networkId, true)
  NetworkSetNetworkIdDynamic(networkId, true)
  SetNetworkIdSyncToPlayer(networkId, localPlayer, true)
  
  -- Request control if not already owner
  local currentOwner = NetworkGetEntityOwner(entity)
  if currentOwner ~= localPlayer then
      while NetworkGetEntityOwner(entity) ~= localPlayer do
          NetworkRequestControlOfEntity(entity)
          Wait(30)
      end
  end
  
  callback(true)
end

-- Disable control actions (keys/inputs)
function WSB.disableKeys(controls)
  local controlType = type(controls)
  
  if controlType == "number" then
      -- Disable single control
      DisableControlAction(0, controls, true)
  else
      -- Check if controls table has entries
      if controls and next(controls) then
          -- Disable multiple specific controls
          for i = 1, #controls, 1 do
              DisableControlAction(0, controls[i], true)
          end
      else
          -- Disable all controls
          DisableAllControlActions(0)
      end
  end
end

-- Check if the player is a boss/manager
function WSB.isPlayerBoss()
  local isBoss = WSB.awaitServerCallback("wasabi_bridge:isPlayerBoss")
  return isBoss or false
end