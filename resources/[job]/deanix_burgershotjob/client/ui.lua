RegisterNUICallback("bayarBahan", function(data, cb)
    TriggerServerEvent("deanix_burgershot:bayarItem", data.items)
    cb({})
end)