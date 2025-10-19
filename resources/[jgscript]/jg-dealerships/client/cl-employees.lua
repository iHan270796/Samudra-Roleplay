RegisterNetEvent("jg-dealerships:client:show-confirm-employment", function(data)
  SetNuiFocus(true, true)
  SendNUIMessage({
    type = "showConfirmEmployment",
    data = data,
    config = GetSafeConfigForNUI(),
    locale = Locale
  })
end)

RegisterNUICallback("accept-hire-request", function(data, cb)
  TriggerServerEvent("jg-dealerships:server:hire-employee", data)
  cb({success = true})
end)

RegisterNUICallback("deny-hire-request", function(data, cb)
  TriggerServerEvent("jg-dealerships:server:employee-hire-rejected", data.requesterId)
  cb({success = true})
end)

RegisterNUICallback("request-hire-employee", function(data, cb)
  TriggerServerEvent("jg-dealerships:server:request-hire-employee", data)
  cb({success = true})
end)

RegisterNUICallback("fire-employee", function(data, cb)
  local identifier = data.identifier
  local dealershipId = data.dealershipId
  TriggerServerEvent("jg-dealerships:server:fire-employee", identifier, dealershipId)
  cb({success = true})
end)

RegisterNUICallback("update-employee-role", function(data, cb)
  local identifier = data.identifier
  local dealershipId = data.dealershipId
  local newRole = data.newRole
  TriggerServerEvent("jg-dealerships:server:update-employee-role", identifier, dealershipId, newRole)
  cb({success = true})
end)
