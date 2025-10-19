---Purchase a vehicle
---@param dealershipId string
---@param model string|integer
---@param colour string|table
---@param purchaseType "society"|"personal"
---@param paymentMethod "bank"|"cash"
---@param society? any if purchaseType == "society"
---@param societyType? any
---@param finance boolean
---@param directSaleUuid? string
---@return boolean success
local function purchaseVehicle(dealershipId, model, colour, purchaseType, paymentMethod, society, societyType, finance, directSaleUuid)
  local dealership = Config.DealershipLocations[dealershipId]
  local hash = ConvertModelToHash(model)
  local vehicleType = GetVehicleTypeFromClass(GetVehicleClassFromName(hash))
  local coords = FindVehicleSpawnCoords(dealership.purchaseSpawn)
  
  -- Convert color to a serializable format for server
  local colorToSend = colour
  if type(colour) == "table" then
    if colour.rgb then
      -- Convert RGB table to string format "r,g,b"
      colorToSend = string.format("%d,%d,%d", colour.rgb[1], colour.rgb[2], colour.rgb[3])
      DebugPrint("Converting RGB color to string:", "debug", colorToSend)
    elseif colour.index then
      -- Use the index directly
      colorToSend = colour.index
      DebugPrint("Using color index:", "debug", colorToSend)
    end
  end

  ExitShowroom()

  local success, netId, vehicleId, plate, price = lib.callback.await("jg-dealerships:server:purchase-vehicle", false, dealershipId, coords, purchaseType, society, societyType, model, colorToSend, paymentMethod, finance, directSaleUuid)
  local vehicle = netId and NetToVeh(netId) or nil --[[@as integer|false]]
  if not success then 
    DoScreenFadeIn(500) -- Ensure screen fades back in on failure
    return false 
  end

  -- TODO WIP: new spawning logic

  if Config.SpawnVehiclesWithServerSetter and not vehicle then
    print("^1[ERROR] There was a problem spawning in your vehicle")
    DoScreenFadeIn(500) -- Ensure screen fades back in on failure
    return false
  end

  -- Server spawning disabled, create vehicle on client
  if not vehicle and not Config.SpawnVehiclesWithServerSetter then
    local warp = not Config.DoNotSpawnInsideVehicle
    local properties = {
      plate = plate,
      colour = colorToSend  -- Use the converted color format
    }
    
    vehicle = SpawnVehicleClient(vehicleId or 0, model, plate, coords, warp, properties, "purchase")
    if not vehicle then 
      DoScreenFadeIn(500) -- Ensure screen fades back in on failure
      return false 
    end
    
    netId = VehToNet(vehicle)
  end

  if not vehicle then 
    DoScreenFadeIn(500) -- Ensure screen fades back in on failure
    return false 
  end

  -- TODO: refactor this maybe? it's also a vulnerable event for people that know what they are doing
  local props = Framework.Client.GetVehicleProperties(vehicle)
  TriggerServerEvent("jg-dealerships:server:update-purchased-vehicle-props", purchaseType, society, plate, props)
  -- TODO END

  TriggerEvent("jg-dealerships:client:purchase-vehicle:config", vehicle, plate, purchaseType, price, paymentMethod, finance)
  TriggerServerEvent("jg-dealerships:server:purchase-vehicle:config", netId, plate, purchaseType, price, paymentMethod, finance)

  -- If they are running jg-advancedgarages, register the vehicle is out & set vehicle in valid garage ID
  if GetResourceState("jg-advancedgarages") == "started" then
    TriggerServerEvent("jg-advancedgarages:server:register-vehicle-outside", plate, netId)
    TriggerServerEvent("jg-advancedgarages:server:dealerships-send-to-default-garage", vehicleType, plate)
  end

  DoScreenFadeIn(500)

  return true
end

RegisterNUICallback("purchase-vehicle", function(data, cb)
  local dealershipId = data.dealership
  local model = data.vehicle
  
  -- Always prefer ShowroomVehicleColor over what UI sends if it exists
  -- UI often sends just an index, but ShowroomVehicleColor has the full color data with RGB
  local vehicleColor = ShowroomVehicleColor or data.color
  
  -- If UI sent just a number and we don't have ShowroomVehicleColor, convert it to proper format
  if not ShowroomVehicleColor and data.color ~= nil and type(data.color) == "number" then
    -- Safely check if it's an array index
    if Config.VehicleColourOptions and data.color >= 0 and data.color < #Config.VehicleColourOptions then
      -- Map array index to actual color from config (add 1 for Lua indexing)
      vehicleColor = Config.VehicleColourOptions[data.color + 1]
      DebugPrint("Mapped UI index to config color:", "debug", vehicleColor)
    else
      -- Use as direct color index or default to white
      vehicleColor = {index = data.color or 111}
    end
  elseif not vehicleColor then
    -- Default to white if no color specified
    vehicleColor = {index = 111, rgb = {255, 255, 255}}
  end
  
  local purchaseType = data.purchaseType
  local paymentMethod = data.paymentMethod
  local finance = data.finance
  local society = data.society
  local societyType = data.societyType
  local directSaleUuid = data.directSaleUuid
  
  -- Debug: Log the color being used for purchase
  DebugPrint("Purchase - data.color from UI:", "debug", data.color)
  DebugPrint("Purchase - ShowroomVehicleColor stored:", "debug", ShowroomVehicleColor)
  DebugPrint("Purchase - Final vehicleColor:", "debug", vehicleColor)

  DoScreenFadeOut(500)
  Wait(500)

  local res = purchaseVehicle(dealershipId, model, vehicleColor, purchaseType, paymentMethod, society, societyType, finance, directSaleUuid)
  
  if not res then
    DoScreenFadeIn(0)
    return cb({error = true}) 
  end
  
  cb({success = true})
end)