local showroomCam = nil
local showroomVehicle = nil
local camFov = 120.0
local camRotation = 1
local isRotating = false
Globals.CurrentDealership = nil

function GetPlayerBalances(dealershipId)
  return {
    cash = Framework.Client.GetBalance("cash") or 0,
    bank = Framework.Client.GetBalance("bank") or 0
  }
end

function IsShowroomAccessAllowed(dealershipId)
  local dealership = Config.DealershipLocations[dealershipId]
  if not dealership then
    return false
  end
  if (not dealership.showroomJobWhitelist or not next(dealership.showroomJobWhitelist)) and
     (not dealership.showroomGangWhitelist or not next(dealership.showroomGangWhitelist)) then
    return true
  end
  if dealership.showroomJobWhitelist and next(dealership.showroomJobWhitelist) then
    local playerJob = Framework.Client.GetPlayerJob()
    if not playerJob then
      DebugPrint("Framework.Client.GetPlayerJob() returned nil", "warning")
      return false
    end
    DebugPrint("Got player job information", "debug", playerJob)
    local allowedGrades = dealership.showroomJobWhitelist[playerJob.name]
    if allowedGrades then
      if IsItemInList(allowedGrades, tonumber(playerJob.grade) or 0) then
        return true
      end
    end
  end
  if (Config.Framework == "QBCore" or Config.Framework == "Qbox") then
    if dealership.showroomGangWhitelist and next(dealership.showroomGangWhitelist) then
      local playerGang = Framework.Client.GetPlayerGang()
      if not playerGang then
        DebugPrint("Framework.Client.GetPlayerGang() returned nil", "warning")
        return false
      end
      DebugPrint("Got player gang information", "debug", playerGang)
      local allowedGrades = dealership.showroomGangWhitelist[playerGang.name]
      if allowedGrades then
        if IsItemInList(allowedGrades, tonumber(playerGang.grade) or 0) then
          return true
        end
      end
    end
  end
  return false
end
function GetAvailableSocieties(dealershipId)
  local societies = {}
  local dealership = Config.DealershipLocations[dealershipId]
  
  if dealership.societyPurchaseJobWhitelist then
    local playerJob = Framework.Client.GetPlayerJob()
    if not playerJob then
      DebugPrint("Framework.Client.GetPlayerJob() returned nil", "warning")
      return societies  -- Return empty array instead of false
    end
    
    DebugPrint("Got player job information", "debug", playerJob)
    local allowedGrades = dealership.societyPurchaseJobWhitelist[playerJob.name]
    
    if allowedGrades and IsItemInList(allowedGrades, tonumber(playerJob.grade) or 0) then
      local balance = Framework.Client.GetSocietyBalance(playerJob.name, "job")
      table.insert(societies, {
        name = playerJob.name,
        label = playerJob.label,
        balance = balance,
        type = "job"
      })
    end
  end
  
  if (Config.Framework == "QBCore" or Config.Framework == "Qbox") and dealership.societyPurchaseGangWhitelist then
    local playerGang = Framework.Client.GetPlayerGang()
    if not playerGang then
      DebugPrint("Framework.Client.GetPlayerGang() returned nil", "warning")
      return societies  -- Return empty array instead of false
    end
    
    DebugPrint("Got player gang information", "debug", playerGang)
    local allowedGrades = dealership.societyPurchaseGangWhitelist[playerGang.name]
    
    if allowedGrades and IsItemInList(allowedGrades, tonumber(playerGang.grade) or 0) then
      local balance = Framework.Client.GetSocietyBalance(playerGang.name, "gang")
      table.insert(societies, {
        name = playerGang.name,
        label = playerGang.label,
        balance = balance,
        type = "gang"
      })
    end
  end
  
  return societies
end
RegisterNetEvent("jg-dealerships:client:open-showroom", function(dealershipId, defaultVehicle, defaultColor)
  if Globals.CurrentDealership or Globals.IsTestDriving then
    return
  end
  
  Globals.CurrentDealership = dealershipId
  local ped = cache.ped
  local pedCoords = GetEntityCoords(ped)
  
  if IsPedInAnyVehicle(ped, true) then
    Globals.CurrentDealership = nil
    return Framework.Client.Notify(Locale.errorExitVehicle, "error")
  end
  
  if not ShowroomPreCheck(dealershipId) then
    DebugPrint("jg-dealerships:client:showroom-pre-check failed", "debug")
    Globals.CurrentDealership = nil
    return
  end
  
  local dealership = Config.DealershipLocations[dealershipId]
  
  if not dealership.camera or not dealership.camera.coords or dealership.camera.coords == "" then
    Globals.CurrentDealership = nil
    DebugPrint("You are missing camera coords in your config.lua for " .. dealershipId, "warning")
    Framework.Client.Notify("You are missing camera coords in your config.lua for " .. dealershipId, "error")
    return
  end
  
  CreateThread(function()
    DoScreenFadeOut(500)
    Wait(500)
    
    local showroomData = lib.callback.await("jg-dealerships:server:enter-showroom", false, dealershipId, dealership, pedCoords)
    if not showroomData then
      Globals.CurrentDealership = nil
      return DoScreenFadeIn(0)
    end
    
    -- Organize vehicles by category for the NUI
    local vehiclesByCategory = {}
    local vehiclesArray = {}
    
    -- First, initialize all categories from the dealership config
    if dealership.categories then
      for _, category in ipairs(dealership.categories) do
        vehiclesByCategory[category] = {}
      end
    end
    
    -- Then populate with actual vehicle data if available
    if showroomData.vehicles and type(showroomData.vehicles) == "table" then
      for _, vehicle in ipairs(showroomData.vehicles) do
        local category = vehicle.category or "other"
        if not vehiclesByCategory[category] then
          vehiclesByCategory[category] = {}
        end
        
        local vehicleData = {
          id = vehicle.id,
          spawn_code = vehicle.spawn_code,
          brand = vehicle.brand,
          model = vehicle.model,
          price = vehicle.price,
          stock = vehicle.stock,
          category = vehicle.category
        }
        
        -- Add to both structures
        table.insert(vehiclesByCategory[category], vehicleData)
        table.insert(vehiclesArray, vehicleData)
      end
    end
    
    local cameraCoords = dealership.camera.coords
    local cameraPositions = dealership.camera.positions
    local societies = GetAvailableSocieties(dealershipId) or {}
    
    lib.waitFor(function()
      if not IsEntityWaitingForWorldCollision(ped) and HasCollisionLoadedAroundEntity(ped) then
        return true
      end
    end, nil, 5000)
    
    local angleRad = math.rad(cameraCoords.w)
    local xOffset = cameraPositions[1] * math.sin(angleRad)
    local yOffset = cameraPositions[1] * math.cos(angleRad)
    camRotation = cameraCoords.w + 215.0
    
    showroomCam = CreateCamWithParams(
      "DEFAULT_SCRIPTED_CAMERA",
      cameraCoords.x + xOffset,
      cameraCoords.y - yOffset,
      cameraCoords.z + 1.5,
      0.0,
      0.0,
      cameraCoords.w,
      0.0,
      false,
      0
    )
    
    SetCamActive(showroomCam, true)
    SetCamFov(showroomCam, 60.0)
    
    -- Point camera at the spawn location (where vehicles will appear)
    PointCamAtCoord(showroomCam, cameraCoords.x, cameraCoords.y, cameraCoords.z)
    
    RenderScriptCams(true, true, 1, true, true)
    SetEntityVisible(ped, false, false)
    Framework.Client.ToggleHud(false)
    DoScreenFadeIn(500)
    SetNuiFocus(true, true)
    
    -- Debug: Log what we're sending to NUI
    DebugPrint("Sending showroom data to NUI", "debug", {
      vehicleCategories = TableKeys(vehiclesByCategory),
      categoriesFromConfig = dealership.categories,
      vehicleCount = #vehiclesArray,
      vehicleArrayCount = #vehiclesArray
    })
    
    -- Ensure all values are safe for JSON serialization
    local playerBalances = GetPlayerBalances(dealershipId) or {cash = 0, bank = 0}
    local safeConfig = GetSafeConfigForNUI() or {}
    local safeLocale = Locale or {}
    
    SendNUIMessage({
      type = "showShowroom",
      shopType = dealership.type or "dealership",
      vehicles = vehiclesArray,  -- Send as array for filter compatibility
      vehiclesByCategory = vehiclesByCategory,  -- Send categorized version too
      defaultVehicle = defaultVehicle or "",
      defaultColor = defaultColor or 0,
      categories = dealership.categories or {},
      dealershipId = dealershipId,
      playerBalances = playerBalances,
      societies = societies,
      jgGaragesRunning = GetResourceState("jg-advancedgarages") == "started",
      enablePurchase = not dealership.disableShowroomPurchase,
      enableTestDrive = dealership.enableTestDrive == true,
      financeEnabled = (dealership.enableFinance and showroomData.financeAllowed) == true,
      locale = safeLocale,
      config = safeConfig
    })
    
    -- Don't auto-spawn any vehicle - let the user select one first
    -- The camera will point at the spawn location even without a vehicle
  end)
end)
function ExitShowroom()
  if not Globals.CurrentDealership then
    -- Still clean up UI even if no dealership is set
    SetNuiFocus(false, false)
    SendNUIMessage({type = "hideUI"})
    if not IsScreenFadedIn() then
      DoScreenFadeIn(500)
    end
    return
  end
  
  local success = lib.callback.await("jg-dealerships:server:exit-showroom", false, Globals.CurrentDealership)
  if not success then
    DebugPrint("jg-dealerships:server:exit-showroom failed", "warning")
    -- Continue with cleanup even if server callback fails
  end
  
  -- Release NUI focus to fix cursor stuck issue
  SetNuiFocus(false, false)
  SendNUIMessage({type = "hideUI"})
  
  SetEntityVisible(cache.ped, true, false)
  Framework.Client.ToggleHud(true)
  
  if showroomVehicle then
    DeleteEntity(showroomVehicle)
    showroomVehicle = nil
  end
  
  if showroomCam and IsCamActive(showroomCam) then
    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(showroomCam, true)
  end
  
  showroomCam = nil
  camFov = 120.0
  camRotation = 1
  Globals.CurrentDealership = nil
  ShowroomVehicleColor = nil  -- Clear stored color
end

ExitShowroom = ExitShowroom

-- Global variable to store selected color for purchase/test drive
ShowroomVehicleColor = nil

RegisterNUICallback("change-color", function(data, cb)
  if showroomVehicle then
    local colorIndex = data.color
    local colorData = nil
    
    DebugPrint("change-color callback received:", "debug", data)
    DebugPrint("Color index type:", "debug", type(colorIndex))
    DebugPrint("Color index value:", "debug", colorIndex)
    
    -- Handle different color input formats
    if type(colorIndex) == "number" then
      -- Check if it's an array index (0-7) from UI
      if colorIndex >= 0 and colorIndex <= 7 then
        -- Map array index to actual color from config
        colorData = Config.VehicleColourOptions[colorIndex + 1]
        DebugPrint("Mapped UI index to color data:", "debug", colorData)
      else
        -- Direct color index
        colorData = {index = colorIndex}
        DebugPrint("Using direct color index:", "debug", colorIndex)
      end
    elseif type(colorIndex) == "string" then
      -- Try to convert string to number
      local numIndex = tonumber(colorIndex)
      if numIndex then
        colorData = {index = numIndex}
      end
    elseif type(colorIndex) == "table" then
      -- Color object passed directly
      colorData = colorIndex
    end
    
    -- Apply the color to the vehicle
    if colorData then
      ShowroomVehicleColor = colorData
      DebugPrint("Storing ShowroomVehicleColor:", "debug", ShowroomVehicleColor)
      
      -- Use RGB if available and enabled
      if Config.UseRGBColors and colorData.rgb then
        SetVehicleModKit(showroomVehicle, 0)
        SetVehicleCustomPrimaryColour(showroomVehicle, colorData.rgb[1], colorData.rgb[2], colorData.rgb[3])
        SetVehicleCustomSecondaryColour(showroomVehicle, colorData.rgb[1], colorData.rgb[2], colorData.rgb[3])
        DebugPrint("Applied RGB color:", "debug", colorData.rgb)
      elseif colorData.index then
        SetVehicleColours(showroomVehicle, colorData.index, colorData.index)
        DebugPrint("Applied color index:", "debug", colorData.index)
      end
    end
  end
  cb({success = true})
end)

-- Support for custom RGB color input
RegisterNUICallback("change-rgb-color", function(data, cb)
  if showroomVehicle then
    local r, g, b = nil, nil, nil
    
    -- Handle different RGB input formats
    if type(data) == "table" then
      if data.r and data.g and data.b then
        r, g, b = data.r, data.g, data.b
      elseif data.red and data.green and data.blue then
        r, g, b = data.red, data.green, data.blue
      elseif data.rgb and type(data.rgb) == "table" then
        r, g, b = data.rgb[1], data.rgb[2], data.rgb[3]
      elseif data[1] and data[2] and data[3] then
        r, g, b = data[1], data[2], data[3]
      end
    end
    
    -- Validate RGB values
    if r and g and b then
      r = math.max(0, math.min(255, math.floor(r)))
      g = math.max(0, math.min(255, math.floor(g)))
      b = math.max(0, math.min(255, math.floor(b)))
      
      -- Store color for purchase/test drive
      ShowroomVehicleColor = {rgb = {r, g, b}}
      
      -- Apply RGB color to vehicle
      SetVehicleModKit(showroomVehicle, 0)
      SetVehicleCustomPrimaryColour(showroomVehicle, r, g, b)
      SetVehicleCustomSecondaryColour(showroomVehicle, r, g, b)
    end
  end
  cb({success = true})
end)

RegisterNUICallback("switch-vehicle", function(data, cb)
  if not Globals.CurrentDealership or not showroomCam then
    return cb({error = true})
  end
  
  if isRotating then
    return cb({error = true})
  end
  
  local dealership = Config.DealershipLocations[Globals.CurrentDealership]
  
  CreateThread(function()
    isRotating = true
    local cameraCoords = dealership.camera.coords
    local spawnCode = data.spawnCode
    
    if showroomVehicle then
      DeleteEntity(showroomVehicle)
    end
    
    local model = ConvertModelToHash(spawnCode)
    if not IsModelValid(model) then
      DebugPrint("Vehicle does not exist. Please contact an admin! Vehicle: " .. model .. " returned false with IsModelValid", "warning")
      Framework.Client.Notify("Vehicle does not exist. Please contact an admin!", "error")
      isRotating = false
      return cb({error = true})
    end
    
    lib.requestModel(model, 60000)
    showroomVehicle = CreateVehicle(model, cameraCoords.x, cameraCoords.y, cameraCoords.z, camRotation, false, false)
    SetModelAsNoLongerNeeded(model)
    SetEntityHeading(showroomVehicle, camRotation)
    FreezeEntityPosition(showroomVehicle, true)
    SetEntityCollision(showroomVehicle, false, true)
    
    -- Apply the stored color if available
    if ShowroomVehicleColor then
      if Config.UseRGBColors and ShowroomVehicleColor.rgb then
        SetVehicleModKit(showroomVehicle, 0)
        SetVehicleCustomPrimaryColour(showroomVehicle, ShowroomVehicleColor.rgb[1], ShowroomVehicleColor.rgb[2], ShowroomVehicleColor.rgb[3])
        SetVehicleCustomSecondaryColour(showroomVehicle, ShowroomVehicleColor.rgb[1], ShowroomVehicleColor.rgb[2], ShowroomVehicleColor.rgb[3])
      elseif ShowroomVehicleColor.index then
        SetVehicleColours(showroomVehicle, ShowroomVehicleColor.index, ShowroomVehicleColor.index)
      end
    else
      -- Default to white if no color selected
      if Config.UseRGBColors then
        SetVehicleModKit(showroomVehicle, 0)
        SetVehicleCustomPrimaryColour(showroomVehicle, 255, 255, 255)
        SetVehicleCustomSecondaryColour(showroomVehicle, 255, 255, 255)
      else
        SetVehicleColours(showroomVehicle, 111, 111)
      end
    end
    
    local vehicleCoords = GetEntityCoords(showroomVehicle)
    PointCamAtCoord(showroomCam, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z)
    RenderScriptCams(true, true, 1, true, true)
    
    isRotating = false
    cb({success = true})
  end)
end)
RegisterNUICallback("exit-showroom", function(data, cb)
  DoScreenFadeOut(500)
  Wait(500)
  ExitShowroom()
  DoScreenFadeIn(500)
  cb({success = true})  -- Send proper JSON object instead of boolean
end)

-- ESX-specific fix for screen fade issues
if Config.Framework == "ESX" or (Config.Framework == "auto" and GetResourceState("es_extended") == "started") then
  -- Handle ESX player loaded event to ensure clean state
  RegisterNetEvent("esx:playerLoaded")
  AddEventHandler("esx:playerLoaded", function()
    -- Ensure screen is not black
    if IsScreenFadedOut() or IsScreenFadingOut() then
      DoScreenFadeIn(500)
    end
    -- Clean up any stuck UI
    SetNuiFocus(false, false)
    SendNUIMessage({type = "hideUI"})
  end)
end
RegisterNUICallback("veh-left", function(data, cb)
  if not showroomVehicle then
    return cb({success = false})
  end
  
  camRotation = GetEntityHeading(showroomVehicle) - 10
  SetEntityHeading(showroomVehicle, camRotation)
  cb({success = true})
end)
RegisterNUICallback("veh-right", function(data, cb)
  if not showroomVehicle then
    return cb({success = false})
  end
  
  camRotation = GetEntityHeading(showroomVehicle) + 10
  SetEntityHeading(showroomVehicle, camRotation)
  cb({success = true})
end)
local currentCamPosition = 1

RegisterNUICallback("change-cam-view", function(data, cb)
  if not Globals.CurrentDealership or not showroomCam then
    return cb({success = false})
  end
  
  local dealership = Config.DealershipLocations[Globals.CurrentDealership]
  local positions = dealership.camera.positions
  local cameraCoords = dealership.camera.coords
  
  currentCamPosition = currentCamPosition + 1
  if currentCamPosition > 4 then
    currentCamPosition = 1
  end
  
  local distance = positions[currentCamPosition]
  local angleRad = math.rad(cameraCoords.w)
  local xOffset = distance * math.sin(angleRad)
  local yOffset = distance * math.cos(angleRad)
  
  SetCamCoord(
    showroomCam,
    cameraCoords.x + xOffset,
    cameraCoords.y - yOffset,
    cameraCoords.z + 1 + (positions[currentCamPosition] / 10)
  )
  
  cb({success = true})
end)
RegisterNUICallback("get-model-stats", function(data, cb)
  if Config.HideVehicleStats then
    return cb({})
  end
  
  cb(Framework.Client.GetVehicleStats(data.vehicle))
end)
-- Debug commands for testing colors
RegisterCommand("testcolor", function(source, args)
  local colorIndex = tonumber(args[1])
  if not colorIndex then
    Framework.Client.Notify("Usage: /testcolor [index]", "error")
    return
  end
  
  local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
  if vehicle == 0 then
    Framework.Client.Notify("You must be in a vehicle", "error")
    return
  end
  
  SetVehicleColours(vehicle, colorIndex, colorIndex)
  Framework.Client.Notify("Applied color index: " .. colorIndex, "success")
end, false)

RegisterCommand("testrgb", function(source, args)
  local r = tonumber(args[1])
  local g = tonumber(args[2])
  local b = tonumber(args[3])
  
  if not r or not g or not b then
    Framework.Client.Notify("Usage: /testrgb [r] [g] [b]", "error")
    return
  end
  
  local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
  if vehicle == 0 then
    Framework.Client.Notify("You must be in a vehicle", "error")
    return
  end
  
  SetVehicleModKit(vehicle, 0)
  SetVehicleCustomPrimaryColour(vehicle, r, g, b)
  SetVehicleCustomSecondaryColour(vehicle, r, g, b)
  Framework.Client.Notify(string.format("Applied RGB color: %d, %d, %d", r, g, b), "success")
end, false)

AddEventHandler("onResourceStop", function(resourceName)
  if GetCurrentResourceName() == resourceName then
    if Globals.CurrentDealership then
      local dealership = Config.DealershipLocations[Globals.CurrentDealership]
      TriggerServerEvent("jg-dealerships:server:exit-bucket")
      SetEntityVisible(cache.ped, true, false)
      
      local exitCoords = dealership.openShowroom.coords
      SetEntityCoords(cache.ped, exitCoords.x, exitCoords.y, exitCoords.z, false, false, false, false)
      FreezeEntityPosition(cache.ped, false)
      
      if showroomVehicle then
        DeleteEntity(showroomVehicle)
      end
      
      Framework.Client.ToggleHud(true)
    end
  end
end)
