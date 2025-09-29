local RegisteredInteractions = {}

RegisterNetEvent("anes_interaction:registerEntityInteraction", function(data)
    RegisteredInteractions[data.id] = data
    TriggerClientEvent("anes_interaction:syncInteractions", -1, RegisteredInteractions)
end)

RegisterNetEvent("anes_interaction:removeInteraction", function(id)
    RegisteredInteractions[id] = nil
    TriggerClientEvent("anes_interaction:syncInteractions", -1, RegisteredInteractions)
end)

RegisterNetEvent("anes_interaction:requestInteractions", function()
    local src = source
    TriggerClientEvent("anes_interaction:syncInteractions", src, RegisteredInteractions)
end)
