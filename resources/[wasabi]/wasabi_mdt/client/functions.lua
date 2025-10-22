-- ============================================
-- WASABI MDT CORE FUNCTIONS
-- Provides global functions for MDT operations and dispatch creation
-- ============================================

function OpenMDT(targetPage, cameraId)
  if MDTOpen then
      if targetPage then
          ToVue("navigateToPage", {
              page = targetPage,
              cameraId = cameraId
          })
      end
      return
  end
  
  wsb.serverCallback("wasabi_mdt:openMDT", function(canOpen, department)
      if not canOpen then return end
      
      MDTOpen = true
      
      PlayTabletAnim()
      
      ToVue("openMDT", {
          department = department,
          playerIdentifier = wsb.getIdentifier(),
          targetPage = targetPage,
          cameraId = cameraId
      })
      
      SetNuiFocus(true, true)
  end)
end

function CreateDispatch(dispatchData)
  if not dispatchData then
      Error("[MDT] CreateDispatch called with no data")
      return false
  end
  
  if not dispatchData.type or not dispatchData.title then
      Error("[MDT] CreateDispatch requires type and title")
      return false
  end
  
  TriggerServerEvent("wasabi_mdt:createExternalDispatch", dispatchData)
  return true
end

function SendPremadeDispatch(dispatchType, overrideData)
  if not Config.PremadeDispatches[dispatchType] then
      Error("[MDT] Invalid premade dispatch type: " .. tostring(dispatchType))
      return false
  end
  
  local dispatchData = {}
  
  for key, value in pairs(Config.PremadeDispatches[dispatchType]) do
      dispatchData[key] = value
  end
  
  if overrideData then
      for key, value in pairs(overrideData) do
          if dispatchData[key] ~= nil then
              dispatchData[key] = value
          end
      end
  end
  
  if not dispatchData.coords then
      local playerPed = wsb.cache.ped
      local playerCoords = GetEntityCoords(playerPed)
      
      dispatchData.coords = {
          x = playerCoords.x,
          y = playerCoords.y,
          z = playerCoords.z
      }
  end
  
  TriggerServerEvent("wasabi_mdt:createExternalDispatch", dispatchData)
  return true
end

function ExportHandler(resourceName, exportName, exportFunction)
  AddEventHandler(("__cfx_export_%s_%s"):format(resourceName, exportName), function(setCB)
      setCB(exportFunction)
  end)
end