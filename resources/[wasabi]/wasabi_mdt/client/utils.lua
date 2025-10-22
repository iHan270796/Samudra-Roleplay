-- ============================================
-- WASABI MDT UTILITY FUNCTIONS
-- Helper functions for scaleforms, animations, and data processing
-- ============================================

-- ============================================
-- SCALEFORM UTILITIES
-- ============================================

function CallScaleformMethod(scaleformHandle, returnValue, methodName, ...)
  BeginScaleformMovieMethod(scaleformHandle, methodName)
  
  local args = {...}
  
  if args ~= nil then
      for i = 1, #args do
          local argType = type(args[i])
          
          if argType == "boolean" then
              ScaleformMovieMethodAddParamBool(args[i])
              
          elseif argType == "number" then
              if string.find(args[i], "%.") then
                  ScaleformMovieMethodAddParamFloat(args[i])
              else
                  ScaleformMovieMethodAddParamInt(args[i])
              end
              
          elseif argType == "string" then
              _ENV["ScaleformMovieMethodAddParamTextureNameString"](args[i])
          end
      end
      
      if not returnValue then
          EndScaleformMovieMethod()
      else
          return EndScaleformMovieMethodReturnValue()
      end
  end
end

function DrawFinishedScaleform(celebrationData, statsTable)
  local mainScaleform = wsb.stream.scaleform("HEIST_CELEBRATION")
  local backgroundScaleform = wsb.stream.scaleform("HEIST_CELEBRATION_BG")
  local foregroundScaleform = wsb.stream.scaleform("HEIST_CELEBRATION_FG")
  
  local scaleforms = {mainScaleform, backgroundScaleform, foregroundScaleform}
  
  for _, scaleform in pairs(scaleforms) do
      CallScaleformMethod(scaleform, false, "CREATE_STAT_WALL", 1, "HUD_COLOUR_FREEMODE_DARK", 1)
      CallScaleformMethod(scaleform, false, "ADD_BACKGROUND_TO_WALL", 1, 80, 1)
      CallScaleformMethod(
          scaleform, false, "ADD_MISSION_RESULT_TO_WALL",
          1,
          celebrationData.missionTextLabel,
          celebrationData.passFailTextLabel,
          celebrationData.messageLabel,
          true, true, true
      )
      
      if statsTable and statsTable[1] ~= nil then
          CallScaleformMethod(scaleform, false, "CREATE_STAT_TABLE", 1, 10)
          
          for _, stat in pairs(statsTable) do
              CallScaleformMethod(
                  scaleform, false, "ADD_STAT_TO_TABLE",
                  1, 10,
                  stat.stat,
                  stat.value,
                  true, true, false, false, 0
              )
          end
          
          CallScaleformMethod(scaleform, false, "ADD_STAT_TABLE_TO_WALL", 1, 10)
      end
      
      CallScaleformMethod(scaleform, false, "SHOW_STAT_WALL", 1)
      CallScaleformMethod(scaleform, false, "createSequence", 1, 1, 1)
  end
  
  return mainScaleform, backgroundScaleform, foregroundScaleform
end

function ShowFinishedScaleform(passFailLabel, missionLabel, messageLabel, statsTable)
  local celebrationData = {
      passFailTextLabel = passFailLabel,
      missionTextLabel = missionLabel,
      messageLabel = messageLabel
  }
  
  PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", true)
  
  local shouldDraw = false
  
  CreateThread(function()
      Wait(3000)
      shouldDraw = true
  end)
  
  CreateThread(function()
      local mainScaleform, backgroundScaleform, foregroundScaleform = DrawFinishedScaleform(celebrationData, statsTable)
      
      while not shouldDraw do
          Wait(1)
          DrawScaleformMovieFullscreenMasked(backgroundScaleform, foregroundScaleform, 255, 255, 255, 50)
          DrawScaleformMovieFullscreen(mainScaleform, 255, 255, 255, 255)
      end
      
      StartScreenEffect("HeistCelebToast")
  end)
end

function ShowScaleform(title, subtitle, description)
  local shouldDraw = true
  
  PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", true)
  
  local scaleform = wsb.stream.scaleform("MIDSIZED_MESSAGE")
  
  CallScaleformMethod(scaleform, false, "SHOW_COND_SHARD_MESSAGE", title, subtitle, description, true)
  
  CreateThread(function()
      Wait(3000)
      CallScaleformMethod(scaleform, false, "SHARD_ANIM_OUT", 2, 0.3, true)
      Wait(1000)
      shouldDraw = false
  end)
  
  CreateThread(function()
      while shouldDraw do
          Wait(0)
          DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
      end
  end)
end

-- ============================================
-- PLAYER & LOCATION UTILITIES
-- ============================================

function GetNearbyPlayers(coords, radius, includeSelf)
  local allPlayers = GetActivePlayers()
  local nearbyPlayers = {}
  
  if not radius then
      radius = 2.0
  end
  
  for i = 1, #allPlayers do
      local player = allPlayers[i]
      
      if player ~= PlayerId() or includeSelf then
          local playerPed = GetPlayerPed(player)
          local playerCoords = GetEntityCoords(playerPed)
          local distance = #(coords - playerCoords)
          
          if radius > distance then
              local serverPlayerId = GetPlayerServerId(player)
              
              nearbyPlayers[#nearbyPlayers + 1] = {
                  id = player,
                  src = serverPlayerId,
                  ped = playerPed,
                  coords = playerCoords,
                  identifier = GlobalState["wsbgw:identifier:" .. tostring(serverPlayerId)]
              }
          end
      end
  end
  
  return nearbyPlayers
end

function GetStreetName()
  local playerPed = wsb.cache.ped
  local coords = GetEntityCoords(playerPed)
  local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
  
  return GetStreetNameFromHashKey(streetHash)
end

function GetCurrentLocation()
  local playerPed = wsb.cache.ped
  local coords = GetEntityCoords(playerPed)
  
  return {
      street = GetStreetName(),
      coords = {
          x = coords.x,
          y = coords.y,
          z = coords.z
      }
  }
end

-- ============================================
-- TABLET ANIMATION
-- ============================================

function PlayTabletAnim()
  CreateThread(function()
      if IsPlayingTabletAnim then return end
      
      IsPlayingTabletAnim = true
      
      local animDict = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
      local animName = "base"
      local propModel = "prop_cs_tablet"
      local propOffset = vector3(0.03, 0.002, -0.0)
      local propRotation = vector3(10.0, 160.0, 0.0)
      
      local playerPed = wsb.cache.ped
      local tabletProp = nil
      
      if wsb.stream.model(propModel) then
          local playerCoords = GetEntityCoords(playerPed)
          
          tabletProp = CreateObject(propModel, playerCoords.x, playerCoords.y, 0.0, true, true, true)
          
          local boneIndex = GetPedBoneIndex(playerPed, 60309)
          
          AttachEntityToEntity(
              tabletProp, playerPed, boneIndex,
              propOffset.x, propOffset.y, propOffset.z,
              propRotation.x, propRotation.y, propRotation.z,
              true, false, false, false, 2, true
          )
          
          SetModelAsNoLongerNeeded(propModel)
      end
      
      if wsb.stream.animDict(animDict) then
          while IsPlayingTabletAnim do
              Wait(100)
              
              if not IsEntityPlayingAnim(playerPed, animDict, animName, 3) then
                  TaskPlayAnim(playerPed, animDict, animName, 3.0, 3.0, -1, 49, 0, false, false, false)
              end
          end
          
          ClearPedTasks(playerPed)
          Wait(250)
          DetachEntity(tabletProp, true, true)
          DeleteEntity(tabletProp)
      end
  end)
end

-- ============================================
-- NUI COMMUNICATION
-- ============================================

function ToVue(action, data)
  SendNUIMessage({
      action = action,
      data = data
  })
end

RegisterNUICallback("escape", function(data, cb)
  SetNuiFocus(false, false)
  cb(true)
  
  if IsPlayingTabletAnim then
      IsPlayingTabletAnim = false
  end
  
  if MDTOpen then
      MDTOpen = false
  end
end)

-- ============================================
-- VEHICLE UTILITIES
-- ============================================

function GetVehicleTypeFromClass(modelHash)
  local vehicleClass = GetVehicleClassFromName(modelHash)
  
  local vehicleTypes = {
      [0] = "compact",
      [1] = "sedan",
      [2] = "suv",
      [3] = "coupe",
      [4] = "muscle",
      [5] = "sports_classic",
      [6] = "sports",
      [7] = "super",
      [8] = "motorcycle",
      [9] = "off_road",
      [10] = "industrial",
      [11] = "utility",
      [12] = "van",
      [13] = "bicycle",
      [14] = "boat",
      [15] = "helicopter",
      [16] = "plane",
      [17] = "service",
      [18] = "emergency",
      [19] = "military",
      [20] = "commercial",
      [21] = "train"
  }
  
  return vehicleTypes[vehicleClass] or "car"
end