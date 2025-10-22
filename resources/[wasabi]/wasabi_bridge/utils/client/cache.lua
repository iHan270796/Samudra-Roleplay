-- Initialize WSB cache structure
WSB.cache = {
  ped = nil,
  vehicle = nil,
  seat = nil,
  weapon = nil
}

-- Store player IDs
WSB.cache.playerId = PlayerId()
WSB.cache.serverId = GetPlayerServerId(WSB.cache.playerId)

-- Cache native functions for performance
local GetVehiclePedIsIn = GetVehiclePedIsIn
local GetPedInVehicleSeat = GetPedInVehicleSeat
local GetVehicleMaxNumberOfPassengers = GetVehicleMaxNumberOfPassengers
local GetCurrentPedWeapon = GetCurrentPedWeapon

function UpdateCacheValue(key, newValue)
  local currentValue = WSB.cache[key]
  
  if currentValue ~= newValue then
      WSB.cache[key] = newValue
      TriggerEvent("wasabi_bridge:cache:" .. key, newValue)
      TriggerEvent("wasabi_bridge:updateCache", key, newValue)
  end
end

CreateThread(function()
  while true do
      local playerPed = PlayerPedId()
      UpdateCacheValue("ped", playerPed)
      
      local currentVehicle = GetVehiclePedIsIn(playerPed, false)
      
      if currentVehicle > 0 then
          UpdateCacheValue("vehicle", currentVehicle)
          
          local cachedSeat = WSB.cache.seat
          local pedInSeat = cachedSeat and GetPedInVehicleSeat(currentVehicle, cachedSeat)
          
          if pedInSeat ~= playerPed then
              local maxSeats = GetVehicleMaxNumberOfPassengers(currentVehicle) - 1
              
              for seatIndex = -1, maxSeats do
                  local occupant = GetPedInVehicleSeat(currentVehicle, seatIndex)
                  
                  if occupant == playerPed then
                      UpdateCacheValue("seat", seatIndex)
                      break
                  end
              end
          end
      else
          UpdateCacheValue("vehicle", false)
          UpdateCacheValue("seat", false)
      end
      
      local hasWeapon, weaponHash = GetCurrentPedWeapon(playerPed, true)
      UpdateCacheValue("weapon", (hasWeapon and weaponHash) or false)
      
      Wait(100)
  end
end)