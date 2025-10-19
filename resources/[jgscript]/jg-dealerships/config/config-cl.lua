-- 
-- Events
-- 

---Fired when the vehicle is purchased
---@param vehicle integer
---@param plate string
---@param purchaseType "personal"|"society"
---@param amount number
---@param paymentMethod "bank"|"cash"
---@param financed boolean
RegisterNetEvent("jg-dealerships:client:purchase-vehicle:config", function(vehicle, plate, purchaseType, amount, paymentMethod, financed)

end)

---Fired when vehicle is test driven
---@param vehicle integer
---@param plate string
RegisterNetEvent("jg-dealerships:client:start-test-drive:config", function(vehicle, plate)

end)

---Fired when a vehicle is sold; this also contains the delete vehicle function
---@param vehicle integer
---@param plate string
RegisterNetEvent("jg-dealerships:client:sell-vehicle:config", function(vehicle, plate)
  --
  -- Add code here to run before the vehicle is deleted
  --

  JGDeleteVehicle(vehicle) -- this runs Kimi's AdvancedParking export already! 
end)

-- 
-- Hooks
-- 

---Runs before the showroom opens; return false to prevent showroom from opening
---@param dealershipId string
---@return boolean allowed
function ShowroomPreCheck(dealershipId)
  local Player = Framework.Client.GetPlayerData()
  local licenseCheck = Config.DealershipLocations[dealershipId].licenseCheck
  local license = Player.metadata['licences'][Config.DealershipLocations[dealershipId].license]

  if licenseCheck then
    if not license then
      allowed = false

    elseif license  then
      print(license)
      allowed = true
    end
  else
    allowed = true
  end

  if not allowed then
    local msg = "You require a ".. Config.DealershipLocations[dealershipId].license
    Framework.Client.Notify(msg, "error", 1000 )
    return false
  end

  return true

end
-- function ShowroomPreCheck(dealershipId)
--   return true
-- end