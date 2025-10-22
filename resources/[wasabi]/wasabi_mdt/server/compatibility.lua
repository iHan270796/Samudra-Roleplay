-- ============================================
-- MDT Dispatch System - Compatibility Layer
-- Bridges other popular dispatch systems to wasabi_mdt
-- ============================================

-- ============================================
-- HELPER FUNCTIONS
-- ============================================

function CreateUnifiedDispatchData(dispatchInfo)
  return {
      type = dispatchInfo.type or "disturbance",
      title = dispatchInfo.title or "External Dispatch",
      description = dispatchInfo.description or "",
      location = dispatchInfo.location or "Unknown",
      coords = dispatchInfo.coords,
      priority = dispatchInfo.priority or 2,
      created_by = "system",
      created_by_name = "System",
      otherData = dispatchInfo.otherData
  }
end

-- ============================================
-- PS-DISPATCH COMPATIBILITY
-- ============================================

RegisterServerEvent("ps-dispatch:server:notify")
AddEventHandler("ps-dispatch:server:notify", function(psData)
  local unifiedData = CreateUnifiedDispatchData({
      type = psData.codeName,
      title = psData.title,
      description = psData.message,
      location = psData.street,
      coords = psData.coords,
      priority = psData.priority
  })

  TriggerEvent("wasabi_mdt:createExternalDispatch", unifiedData)
end)

-- ============================================
-- QS-DISPATCH COMPATIBILITY
-- ============================================

RegisterServerEvent("qs-dispatch:server:CreateDispatchCall")
AddEventHandler("qs-dispatch:server:CreateDispatchCall", function(qsData)
  local dispatchType = "disturbance"
  if qsData.callCode and qsData.callCode.code then
      dispatchType = qsData.callCode.code
  end

  local dispatchTitle = "Dispatch Call"
  if qsData.blip and qsData.blip.text then
      dispatchTitle = qsData.blip.text
  end

  local dispatchPriority = qsData.priority or (qsData.flashes and 3 or 2)

  local unifiedData = CreateUnifiedDispatchData({
      type = dispatchType,
      title = dispatchTitle,
      description = qsData.message,
      location = qsData.street,
      coords = qsData.callLocation,
      priority = dispatchPriority,
      otherData = qsData.otherData
  })

  TriggerEvent("wasabi_mdt:createExternalDispatch", unifiedData)
end)

-- ============================================
-- CD-DISPATCH COMPATIBILITY
-- ============================================

RegisterServerEvent("cd_dispatch:AddNotification")
AddEventHandler("cd_dispatch:AddNotification", function(cdData)
  local dispatchType = "disturbance"
  if cdData.blip and cdData.blip.text then
      dispatchType = cdData.blip.text:lower():gsub(" ", "-")
  end

  local dispatchPriority = cdData.priority or (cdData.flash and 3 or 2)

  local unifiedData = CreateUnifiedDispatchData({
      type = dispatchType,
      title = cdData.title,
      description = cdData.message,
      location = cdData.street,
      coords = cdData.coords,
      priority = dispatchPriority
  })

  TriggerEvent("wasabi_mdt:createExternalDispatch", unifiedData)
end)