local displayVehiclePoints = {}
local dealershipLoadingStatus = {}
local collisionCheckEnabled = true
local isInShowroom = false
local isPlacingVehicle = false
local disabledControls = {30, 31, 44, 22, 200}
function CheckVehicleCollision(vehicle)
  local coords = GetEntityCoords(vehicle)
  local rotation = GetEntityRotation(vehicle, 2)
  local angleRad = math.rad(rotation.z)
  local minDim, maxDim = GetModelDimensions(GetEntityModel(vehicle))
  local width = maxDim.x - minDim.x
  local length = maxDim.y - minDim.y
  local heightOffset = (maxDim.z - minDim.z) / 2
  
  local corners = {
    {width / 2, 0},
    {0, length / 2},
    {-width / 2, 0},
    {0, -length / 2}
  }
  
  for _, corner in ipairs(corners) do
    local rotatedX = corner[1] * math.cos(angleRad) - corner[2] * math.sin(angleRad)
    local rotatedY = corner[1] * math.sin(angleRad) + corner[2] * math.cos(angleRad)
    
    local startPos = vector3(coords.x, coords.y, coords.z + heightOffset)
    local endPos = vector3(coords.x + rotatedX, coords.y + rotatedY, coords.z + heightOffset)
    
    local rayHandle = StartShapeTestRay(startPos.x, startPos.y, startPos.z, endPos.x, endPos.y, endPos.z, -1, vehicle, 0)
    local retval, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
    
    if Config.Debug then
      DrawLine(startPos.x, startPos.y, startPos.z, endPos.x, endPos.y, endPos.z, 255, 0, 0, 255)
    end
    
    if hit == 1 and entityHit ~= cache.ped then
      return true
    end
  end
  
  return false
end
function RotateVehicle(vehicle, angle)
  local rotation = GetEntityRotation(vehicle, 2)
  local newZ = rotation.z + angle
  SetEntityRotation(vehicle, rotation.x, rotation.y, newZ, 2, true)
end
function GetForwardVector(heading)
  local angleRad = math.rad(heading)
  return vector3(-math.sin(angleRad), math.cos(angleRad), 0)
end
function MoveVehicle(vehicle, direction, distance)
  local vehicleCoords = GetEntityCoords(vehicle)
  local playerCoords = GetEntityCoords(cache.ped)
  local heading = GetEntityHeading(vehicle)
  local forwardVector = GetForwardVector(heading)
  local newPosition = nil
  
  if direction == "forward" then
    newPosition = vehicleCoords + (forwardVector * distance)
  elseif direction == "backward" then
    newPosition = vehicleCoords - (forwardVector * distance)
  elseif direction == "left" then
    local leftVector = vector3(-forwardVector.y, forwardVector.x, 0)
    newPosition = vehicleCoords + (leftVector * distance)
  elseif direction == "right" then
    local rightVector = vector3(forwardVector.y, -forwardVector.x, 0)
    newPosition = vehicleCoords + (rightVector * distance)
  end
  
  if #(playerCoords - newPosition) <= 10.0 then
    SetEntityCoordsNoOffset(vehicle, newPosition.x, newPosition.y, newPosition.z, false, false, false)
  end
end
function CreateDisplayPoint(coords, distance, onEnter, onExit, nearby)
  local point = lib.points.new({
    coords = coords,
    distance = distance
  })
  
  point.onEnter = function(self)
    onEnter()
  end
  
  point.onExit = function(self)
    onExit()
  end
  
  if nearby then
    point.nearby = function(self)
      nearby()
    end
  end
  
  return point
end
function RemoveDisplayVehicles(dealershipId)
  if displayVehiclePoints[dealershipId] and #displayVehiclePoints[dealershipId] > 0 then
    for _, point in ipairs(displayVehiclePoints[dealershipId]) do
      point:remove()
    end
  end
  
  local stateKey = ("displayVehicles:%s"):format(dealershipId)
  local vehicleData = json.decode(LocalPlayer.state[stateKey] or "{}")
  
  if vehicleData and #vehicleData > 0 then
    for _, vehicle in ipairs(vehicleData) do
      DeleteEntity(vehicle.entity)
    end
  end
end
function LoadDealershipVehicles(dealershipId)
  if dealershipLoadingStatus[dealershipId] then
    return
  end
  
  dealershipLoadingStatus[dealershipId] = true
  
  CreateThread(function()
    RemoveDisplayVehicles(dealershipId)
    
    local vehicleData = lib.callback.await("jg-dealerships:server:get-display-vehicles", false, dealershipId)
    if not vehicleData then
      dealershipLoadingStatus[dealershipId] = false
      return
    end
    local spawnedVehicles = {}
    local isManager = vehicleData.isManager
    local vehicles = vehicleData.vehicles
    local dealershipConfig = Config.DealershipLocations[dealershipId]
    for _, vehicleInfo in ipairs(vehicles) do
      local vehicleModel = ConvertModelToHash(vehicleInfo.vehicle)
      local coords = json.decode(vehicleInfo.coords)
      
      lib.requestModel(vehicleModel, 60000)
      
      -- Create vehicle with network flag for visibility to all players
      local spawnedVehicle = CreateVehicle(vehicleModel, coords.x, coords.y, coords.z, coords.w, true, true)
      
      -- Wait for vehicle to exist and be fully loaded
      local timeout = 0
      while not DoesEntityExist(spawnedVehicle) and timeout < 5000 do
        Wait(10)
        timeout = timeout + 10
      end
      
      if not DoesEntityExist(spawnedVehicle) then
        print("^1[ERROR] Failed to spawn display vehicle:", vehicleInfo.vehicle)
        SetModelAsNoLongerNeeded(vehicleModel)
        goto continue
      end
      
      -- Additional wait to ensure vehicle is fully loaded
      Wait(100)
      
      -- Make vehicle persistent and visible
      SetEntityAsMissionEntity(spawnedVehicle, true, true)
      SetVehicleHasBeenOwnedByPlayer(spawnedVehicle, true)
      SetVehicleNeedsToBeHotwired(spawnedVehicle, false)
      SetEntityVisible(spawnedVehicle, true, false)
      SetEntityAlpha(spawnedVehicle, 255, false)
      SetEntityCollision(spawnedVehicle, true, true)
      SetEntityCanBeDamaged(spawnedVehicle, false)
      SetEntityInvincible(spawnedVehicle, true)
      SetVehicleOnGroundProperly(spawnedVehicle)
      -- Ensure vehicle doesn't despawn - REMOVED SetEntityAsNoLongerNeeded as it causes vehicles to disappear
      SetVehicleDirtLevel(spawnedVehicle, 0.0)
      -- Additional persistence measures
      SetVehicleHasBeenOwnedByPlayer(spawnedVehicle, false) -- Prevent ownership issues
      SetVehicleNeedsToBeHotwired(spawnedVehicle, false)
      
      -- Set vehicle properties
      SetEntityHeading(spawnedVehicle, coords.w)
      SetVehicleColour(spawnedVehicle, vehicleInfo.color)
      SetVehicleDoorsLocked(spawnedVehicle, 2)
      SetVehicleNumberPlateText(spawnedVehicle, Config.DisplayVehiclesPlate)
      SetVehRadioStation(spawnedVehicle, "OFF")
      
      -- Freeze position to prevent physics issues
      FreezeEntityPosition(spawnedVehicle, true)
      
      SetModelAsNoLongerNeeded(vehicleModel)
      
      -- Wait for vehicle to be ready
      lib.waitFor(function()
        return DoesEntityExist(spawnedVehicle) and true or nil
      end, nil, 5000)
      
      Entity(spawnedVehicle).state:set("isDisplayVehicle", true, false)
      
      local minDim, maxDim = GetModelDimensions(GetEntityModel(spawnedVehicle))
      local interactionDistance = (0 - minDim.x) + maxDim.x + 1.0
      local textPrompt = Config.ViewInShowroomPrompt
      local drawTextType = Config.DrawText
      
      if drawTextType == "auto" then
        drawTextType = GetResourceState("jg-textui") == "started" and "jg-textui" or drawTextType
      end
      
      if drawTextType == "jg-textui" then
        textPrompt = string.format(
          "<h4 style='margin-bottom:5px'>%s %s</h4><p>%s</p>",
          vehicleInfo.brand or "",
          vehicleInfo.model or "",
          Config.ViewInShowroomPrompt
        )
      end
      
      if not Config.DisplayVehiclesHidePurchasePrompt then
        local canAccess = IsShowroomAccessAllowed(dealershipId) or (dealershipConfig.type == "owned" and isManager)
        
        if canAccess and not isInShowroom then
          if not displayVehiclePoints[dealershipId] then
            displayVehiclePoints[dealershipId] = {}
          end
          
          local point = CreateDisplayPoint(
            vector4(coords.x, coords.y, coords.z, coords.w),
            interactionDistance,
            function()
              Framework.Client.ShowTextUI(textPrompt)
            end,
            function()
              Framework.Client.HideTextUI()
            end,
            function()
              if IsControlJustPressed(0, Config.ViewInShowroomKeyBind) and not isInShowroom then
                TriggerEvent("jg-dealerships:client:open-showroom", dealershipId, vehicleInfo.vehicle, vehicleInfo.color)
              end
            end
          )
          
          table.insert(displayVehiclePoints[dealershipId], point)
        end
      end
      
      vehicleInfo.entity = spawnedVehicle
      table.insert(spawnedVehicles, vehicleInfo)
      
      ::continue::
    end
    
    local stateKey = ("displayVehicles:%s"):format(dealershipId)
    LocalPlayer.state:set(stateKey, json.encode(spawnedVehicles))
    
    if not displayVehiclePoints[dealershipId] then
      displayVehiclePoints[dealershipId] = {}
    end
    
    dealershipLoadingStatus[dealershipId] = false
  end)
end
function SpawnAllDealershipDisplayVehicles()
  for dealershipId in pairs(Config.DealershipLocations) do
    LoadDealershipVehicles(dealershipId)
  end
end

SpawnAllDealershipDisplayVehicles = SpawnAllDealershipDisplayVehicles
RegisterNetEvent("jg-dealerships:client:spawn-display-vehicles", function(dealershipId)
  LoadDealershipVehicles(dealershipId)
end)
-- Global variable to store selected display color
local DisplayVehicleColor = nil

RegisterNUICallback("create-display-vehicle", function(data, cb)
  if isPlacingVehicle then
    return cb({error = true})
  end
  
  Framework.Client.HideTextUI()
  isInShowroom = true
  
  local dealershipId = data.dealershipId
  local color = data.color
  local spawnCode = data.spawnCode
  
  -- Initialize display color (can be updated with color picker)
  DisplayVehicleColor = color
  
  local KEY_Q = 44
  local KEY_UP = 38
  local KEY_W = 32
  local KEY_S = 33
  local KEY_A = 34
  local KEY_D = 35
  local KEY_X = 73
  local KEY_ENTER = 201
  local KEY_C = 26 -- Color picker key
  
  SetNuiFocus(false, false)
  SendNUIMessage({
    type = "displayVehicleHud",
    vehiclePlaced = false,
    locale = Locale,
    config = GetSafeConfigForNUI()
  })
  
  -- Wait for user to press Enter to start placement
  while not IsControlJustPressed(0, KEY_ENTER) do
    Wait(0)
  end
  
  SendNUIMessage({
    type = "displayVehicleHud",
    vehiclePlaced = true,
    locale = Locale,
    config = GetSafeConfigForNUI()
  })
  
  isPlacingVehicle = true
  
  lib.requestModel(spawnCode)
  
  local playerHeading = GetEntityHeading(cache.ped)
  local spawnPos = GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, 3.0, 0.0)
  
  -- Create preview vehicle (local only for placement)
  local placementVehicle = CreateVehicle(spawnCode, spawnPos.x, spawnPos.y, spawnPos.z, playerHeading, false, false)
  
  -- Wait for vehicle to exist
  local timeout = 0
  while not DoesEntityExist(placementVehicle) and timeout < 5000 do
    Wait(10)
    timeout = timeout + 10
  end
  
  if not DoesEntityExist(placementVehicle) then
    print("^1[ERROR] Failed to create placement preview vehicle")
    isPlacingVehicle = false
    isInShowroom = false
    FreezeEntityPosition(cache.ped, false)
    SendNUIMessage({type = "hide"})
    SetModelAsNoLongerNeeded(spawnCode)
    return cb({error = true})
  end
  
  -- Make preview vehicle visible and persistent
  SetEntityAsMissionEntity(placementVehicle, true, true)
  SetVehicleHasBeenOwnedByPlayer(placementVehicle, true)
  SetEntityVisible(placementVehicle, true, false)
  SetEntityAlpha(placementVehicle, 200, false)
  SetEntityCollision(placementVehicle, false, false)
  SetVehicleColour(placementVehicle, DisplayVehicleColor)
  SetEntityCanBeDamaged(placementVehicle, false)
  FreezeEntityPosition(placementVehicle, true)
  SetEntityInvincible(placementVehicle, true)
  SetVehicleGravity(placementVehicle, false)
  SetEntityDynamic(placementVehicle, false)
  DisableVehicleWorldCollision(placementVehicle)
  SetVehicleOnGroundProperly(placementVehicle)
  SetVehRadioStation(placementVehicle, "OFF")
  
  FreezeEntityPosition(cache.ped, true)
  SetModelAsNoLongerNeeded(spawnCode)
  
  -- Show color picker notification
  Framework.Client.Notify("Press [C] to open color picker | [Enter] to place | [X] to cancel", "info")
  
  while isPlacingVehicle do
    Wait(0)
    
    local hasCollision = false
    if collisionCheckEnabled then
      hasCollision = CheckVehicleCollision(placementVehicle)
    end
    
    -- Disable controls during placement
    for _, control in ipairs(disabledControls) do
      DisableControlAction(0, control, true)
    end
    
    -- Set outline color based on collision
    if hasCollision then
      SetEntityDrawOutlineColor(254, 77, 77, 255) -- Red for collision
    else
      SetEntityDrawOutlineColor(106, 226, 119, 255) -- Green for valid placement
    end
    
    SetEntityDrawOutlineShader(1)
    SetEntityDrawOutline(placementVehicle, true)
    
    -- Handle rotation controls
    if IsDisabledControlPressed(0, KEY_Q) then
      RotateVehicle(placementVehicle, -0.5)
    elseif IsControlPressed(0, KEY_UP) then
      RotateVehicle(placementVehicle, 0.5)
    end
    
    -- Handle movement controls
    if IsControlPressed(0, KEY_W) then
      MoveVehicle(placementVehicle, "forward", 0.025)
    elseif IsControlPressed(0, KEY_S) then
      MoveVehicle(placementVehicle, "backward", 0.025)
    elseif IsControlPressed(0, KEY_A) then
      MoveVehicle(placementVehicle, "left", 0.025)
    elseif IsControlPressed(0, KEY_D) then
      MoveVehicle(placementVehicle, "right", 0.025)
    end
    
    -- Handle color picker (C key)
    if IsControlJustPressed(0, KEY_C) then
      -- Open ox_lib color menu
      local colorMenu = {
        {
          title = 'Preset Colors',
          description = 'Choose from predefined colors',
          icon = 'palette',
          onSelect = function()
            local colorOptions = {}
            for i, color in ipairs(Config.VehicleColourOptions) do
              table.insert(colorOptions, {
                title = color.label,
                description = string.format('Color #%d', color.index),
                icon = 'circle',
                iconColor = color.hex,
                onSelect = function()
                  DisplayVehicleColor = color
                  SetVehicleColour(placementVehicle, color)
                  Framework.Client.Notify('Color changed to ' .. color.label, 'success')
                end
              })
            end
            
            lib.registerContext({
              id = 'display_preset_colors',
              title = 'Select Color',
              options = colorOptions
            })
            lib.showContext('display_preset_colors')
          end
        },
        {
          title = 'Custom RGB Color',
          description = 'Enter specific RGB values',
          icon = 'sliders',
          onSelect = function()
            local input = lib.inputDialog('Custom RGB Color', {
              {type = 'number', label = 'Red (0-255)', default = 255, min = 0, max = 255},
              {type = 'number', label = 'Green (0-255)', default = 255, min = 0, max = 255},
              {type = 'number', label = 'Blue (0-255)', default = 255, min = 0, max = 255}
            })
            
            if input then
              local r, g, b = input[1], input[2], input[3]
              DisplayVehicleColor = {rgb = {r, g, b}}
              SetVehicleModKit(placementVehicle, 0)
              SetVehicleCustomPrimaryColour(placementVehicle, r, g, b)
              SetVehicleCustomSecondaryColour(placementVehicle, r, g, b)
              Framework.Client.Notify(string.format('Color set to RGB(%d, %d, %d)', r, g, b), 'success')
            end
          end
        },
        {
          title = 'Hex Color',
          description = 'Enter a hex color code',
          icon = 'hashtag',
          onSelect = function()
            local input = lib.inputDialog('Hex Color', {
              {type = 'input', label = 'Hex Code (e.g., #FF0000)', default = '#FFFFFF'}
            })
            
            if input and input[1] then
              local hex = input[1]:gsub('#', '')
              local r = tonumber(hex:sub(1, 2), 16) or 255
              local g = tonumber(hex:sub(3, 4), 16) or 255
              local b = tonumber(hex:sub(5, 6), 16) or 255
              
              DisplayVehicleColor = {rgb = {r, g, b}}
              SetVehicleModKit(placementVehicle, 0)
              SetVehicleCustomPrimaryColour(placementVehicle, r, g, b)
              SetVehicleCustomSecondaryColour(placementVehicle, r, g, b)
              Framework.Client.Notify(string.format('Color set to %s', input[1]), 'success')
            end
          end
        }
      }
      
      lib.registerContext({
        id = 'display_color_menu',
        title = 'Vehicle Colors',
        options = colorMenu
      })
      lib.showContext('display_color_menu')
    end
    
    -- Handle cancel placement (X key)
    if IsControlJustPressed(0, KEY_X) then
      DeleteEntity(placementVehicle)
      isPlacingVehicle = false
      FreezeEntityPosition(cache.ped, false)
      SetEntityDrawOutline(placementVehicle, false)
      SendNUIMessage({type = "hide"})
      ClearPedTasks(cache.ped)
      TriggerEvent("jg-dealerships:client:open-management", dealershipId)
      return cb({success = true})
    end
    
    -- Handle confirm placement (Enter key)
    if IsDisabledControlJustPressed(0, KEY_ENTER) then
      if not CheckVehicleCollision(placementVehicle) then
        local vehicleCoords = GetEntityCoords(placementVehicle)
        local vehicleHeading = GetEntityHeading(placementVehicle)
        local position = vector4(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z, vehicleHeading)
        
        DeleteEntity(placementVehicle)
        isPlacingVehicle = false
        FreezeEntityPosition(cache.ped, false)
        SetEntityDrawOutline(placementVehicle, false)
        SendNUIMessage({type = "hide"})
        ClearPedTasks(cache.ped)
        
        -- Use the DisplayVehicleColor instead of the original color
        lib.callback.await("jg-dealerships:server:create-display-vehicle", false, dealershipId, spawnCode, DisplayVehicleColor, position)
        TriggerEvent("jg-dealerships:client:open-management", dealershipId)
        isInShowroom = false
        return cb({success = true})
      else
        Framework.Client.Notify(Locale.errorPlacementCollision or "You can't place the vehicle here", "error")
      end
    end
    
    -- Keep vehicle on ground
    local coords = GetEntityCoords(placementVehicle)
    SetEntityCoordsNoOffset(placementVehicle, coords.x, coords.y, coords.z, false, false, false)
  end
end)
RegisterNUICallback("edit-display-vehicle", function(data, cb)
  local id = data.id
  local dealershipId = data.dealershipId
  local spawnCode = data.spawnCode
  local color = data.color
  
  lib.callback.await("jg-dealerships:server:edit-display-vehicle", false, dealershipId, id, spawnCode, color)
  cb({success = true})
end)
RegisterNUICallback("delete-display-vehicle", function(data, cb)
  local id = data.id
  local dealershipId = data.dealershipId
  
  lib.callback.await("jg-dealerships:server:delete-display-vehicle", false, dealershipId, id)
  cb({success = true})
end)
RegisterNUICallback("reset-display-vehicles", function(data, cb)
  local dealershipId = data.dealershipId
  LoadDealershipVehicles(dealershipId)
  cb({success = true})
end)
CreateThread(function()
  if Config.RemoveGeneratorsAroundDealership and Config.RemoveGeneratorsAroundDealership > 0 then
    while true do
      for dealershipId, dealershipConfig in pairs(Config.DealershipLocations) do
        local coords = dealershipConfig.openShowroom and dealershipConfig.openShowroom.coords or dealershipConfig.openShowroom
        local radius = Config.RemoveGeneratorsAroundDealership or 60.0
        
        RemoveVehiclesFromGeneratorsInArea(
          coords.x - radius,
          coords.y - radius,
          coords.z - radius,
          coords.x + radius,
          coords.y + radius,
          coords.z + radius
        )
      end
      Wait(5000)
    end
  end
end)

-- Periodic check to ensure display vehicles remain persistent
if Config.DisplayVehiclePersistenceCheck then
  CreateThread(function()
    while true do
      Wait(30000) -- Check every 30 seconds
      
      for dealershipId in pairs(Config.DealershipLocations) do
        local stateKey = ("displayVehicles:%s"):format(dealershipId)
        local vehicleData = json.decode(LocalPlayer.state[stateKey] or "{}")
        
        if vehicleData and #vehicleData > 0 then
          for _, vehicleInfo in ipairs(vehicleData) do
            if vehicleInfo.entity and DoesEntityExist(vehicleInfo.entity) then
              -- Ensure vehicle remains persistent
              SetEntityAsMissionEntity(vehicleInfo.entity, true, true)
              SetEntityInvincible(vehicleInfo.entity, true)
              SetEntityCanBeDamaged(vehicleInfo.entity, false)
              FreezeEntityPosition(vehicleInfo.entity, true)
              
              -- Ensure it's visible
              SetEntityVisible(vehicleInfo.entity, true, false)
              SetEntityAlpha(vehicleInfo.entity, 255, false)
            end
          end
        end
      end
    end
  end)
end
lib.onCache("vehicle", function(vehicle)
  if vehicle and Entity(vehicle).state.isDisplayVehicle then
    Framework.Client.Notify("Vehicle security breach detected", "warning")
    FreezeEntityPosition(vehicle, true)
    SetVehicleAlarm(vehicle, true)
    StartVehicleAlarm(vehicle)
  end
end)
AddEventHandler("onResourceStop", function(resourceName)
  if GetCurrentResourceName() == resourceName then
    for dealershipId in pairs(Config.DealershipLocations) do
      RemoveDisplayVehicles(dealershipId)
    end
  end
end)
