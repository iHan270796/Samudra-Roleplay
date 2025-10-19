local currentDealership = nil
local testDriveVehicle = nil

local function finishTestDrive()
  if not Globals.IsTestDriving or not testDriveVehicle or not currentDealership then
    -- Ensure we clean up UI state even if test drive wasn't properly started
    SetNuiFocus(false, false)
    SendNUIMessage({type = "hideUI"})
    if not IsScreenFadedIn() then
      DoScreenFadeIn(500)
    end
    return false
  end
  Globals.IsTestDriving = false
  DoScreenFadeOut(500)
  Wait(500)
  local plate = Framework.Client.GetPlate(testDriveVehicle)
  if plate then
    Framework.Client.VehicleRemoveKeys(plate, testDriveVehicle, "testDrive")
  end
  testDriveVehicle = nil
  local result = lib.callback.await("jg-dealerships:server:finish-test-drive", false)
  if result and result.dealershipId then
    TriggerEvent("jg-dealerships:client:open-showroom", result.dealershipId, result.vehicleModel, result.vehicleColour)
  else
    -- If no result, just fade back in and clean up
    DoScreenFadeIn(500)
    SetNuiFocus(false, false)
    SendNUIMessage({type = "hideUI"})
  end
end

local function testDriveThread()
  CreateThread(function()
    while Globals.IsTestDriving do
      if not cache.vehicle then
        finishTestDrive()
      end
      SetPlayerCanDoDriveBy(cache.ped, false)
      DisablePlayerFiring(cache.ped, true)
      DisableControlAction(0, 140, true)
      Wait(0)
    end
  end)
end
local function startTestDrive(dealershipId, vehicleModel, vehicleColor)
  currentDealership = Config.DealershipLocations[dealershipId]
  local testDriveSpawn = currentDealership.testDriveSpawn
  if not currentDealership.enableTestDrive then
    return false
  end
  
  -- Convert color to a serializable format for server
  local colorToSend = vehicleColor
  if type(vehicleColor) == "table" then
    if vehicleColor.rgb then
      -- Convert RGB table to string format "r,g,b"
      colorToSend = string.format("%d,%d,%d", vehicleColor.rgb[1], vehicleColor.rgb[2], vehicleColor.rgb[3])
      DebugPrint("Test drive - Converting RGB color to string:", "debug", colorToSend)
    elseif vehicleColor.index then
      -- Use the index directly
      colorToSend = vehicleColor.index
      DebugPrint("Test drive - Using color index:", "debug", colorToSend)
    end
  end
  
  local vehicleLabel = Framework.Client.GetVehicleLabel(vehicleModel)
  local plate = lib.callback.await("jg-dealerships:server:vehicle-generate-plate", false, Config.TestDrivePlate, false)
  testDriveSpawn = FindVehicleSpawnCoords(currentDealership.testDriveSpawn)
  ExitShowroom()
  local vehicle = nil
  local netId = nil
  local success = false
  if not Config.SpawnVehiclesWithServerSetter then
    local vehicleData = {
      plate = plate,
      colour = colorToSend  -- Use the converted color format
    }
    vehicle = SpawnVehicleClient(0, vehicleModel, plate, testDriveSpawn, true, vehicleData, "testDrive")
    if not vehicle then
      return false
    end
    netId = VehToNet(vehicle)
  end
  success, netId = lib.callback.await("jg-dealerships:server:start-test-drive", false, dealershipId, testDriveSpawn, netId, vehicleModel, vehicleLabel, plate, colorToSend)
  vehicle = netId and NetToVeh(netId) or false
  if not success then
    if vehicle then
      JGDeleteVehicle(vehicle)
    end
    return false
  end
  if Config.SpawnVehiclesWithServerSetter and not vehicle then
    print("^1[ERROR] There was a problem spawning in your vehicle")
    return false
  end
  testDriveVehicle = vehicle
  Globals.IsTestDriving = true
  SetNuiFocus(false, false)
  SendNUIMessage({
    type = "testDriveHud",
    time = Config.TestDriveTimeSeconds or 60,
    locale = Locale,
    config = GetSafeConfigForNUI()
  })
  TriggerEvent("jg-dealerships:client:start-test-drive:config", vehicle, Framework.Client.GetPlate(vehicle))
  DoScreenFadeIn(500)
  CreateThread(function()
    Wait(2500)
    testDriveThread()
  end)
  return true
end
RegisterNUICallback("finish-test-drive", function(data, cb)
  finishTestDrive()
  cb({success = true})
end)

-- ESX-specific fix for screen fade issues
if Config.Framework == "ESX" or (Config.Framework == "auto" and GetResourceState("es_extended") == "started") then
  -- Ensure screen fades in when resource starts
  CreateThread(function()
    Wait(1000)
    if IsScreenFadedOut() or IsScreenFadingOut() then
      DoScreenFadeIn(500)
    end
  end)
end

RegisterNUICallback("test-drive", function(data, cb)
  -- Validate required data
  if not data or not data.dealershipId or not data.vehicle then
    print("^1[ERROR] Test drive callback missing required data")
    return cb({error = true})
  end
  
  DoScreenFadeOut(500)
  Wait(500)
  
  -- Always prefer ShowroomVehicleColor over what UI sends if it exists
  local vehicleColor = ShowroomVehicleColor or data.color
  
  -- If UI sent just a number and we don't have ShowroomVehicleColor, convert it to proper format
  if not ShowroomVehicleColor and data.color ~= nil and type(data.color) == "number" then
    -- Safely check if it's an array index
    if Config.VehicleColourOptions and data.color >= 0 and data.color < #Config.VehicleColourOptions then
      -- Map array index to actual color from config (add 1 for Lua indexing)
      vehicleColor = Config.VehicleColourOptions[data.color + 1]
      DebugPrint("Test drive - Mapped UI index to config color:", "debug", vehicleColor)
    else
      -- Use as direct color index or default to white
      vehicleColor = {index = data.color or 111}
    end
  elseif not vehicleColor then
    -- Default to white if no color specified
    vehicleColor = {index = 111, rgb = {255, 255, 255}}
  end
  
  DebugPrint("Test drive - data.color from UI:", "debug", data.color)
  DebugPrint("Test drive - ShowroomVehicleColor stored:", "debug", ShowroomVehicleColor)
  DebugPrint("Test drive - Final vehicleColor:", "debug", vehicleColor)
  
  local success = startTestDrive(data.dealershipId, data.vehicle, vehicleColor)
  if not success then
    DoScreenFadeIn(500)
    SetNuiFocus(false, false)
    SendNUIMessage({type = "hideUI"})
    return cb({error = true})
  end
  cb({success = true})
end)

AddEventHandler("onResourceStop", function(resourceName)
  if GetCurrentResourceName() == resourceName then
    if Globals.IsTestDriving then
      TriggerServerEvent("jg-dealerships:server:exit-bucket")
      if cache.vehicle then
        DeleteEntity(cache.vehicle)
      end
    end
  end
end)
