RegisterNetEvent('custom-guidebook:client:open', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'SHOW_UI' })
end)

-- NUI Callback
RegisterNUICallback('CLOSE_UI', function()
    SetNuiFocus(false, false)
end)
