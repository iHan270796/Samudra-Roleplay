RegisterNetEvent("jg-dealerships:client:open-management", function(dealershipId, fromAdmin)
    local dealershipLocation = Config.DealershipLocations[dealershipId]
    local dealershipData = lib.callback.await("jg-dealerships:server:get-dealership-data", false, dealershipId)
    
    -- Check if dealershipData is valid
    if not dealershipData or dealershipData.error then
        Framework.Client.Notify(Locale.employeePermissionsError or "You don't have permission to access this", "error")
        return
    end
    
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "showAdmin",
        shopType = dealershipLocation.type,
        dealershipId = dealershipId,
        ownerId = dealershipData.ownerId,
        name = dealershipData.name,
        balance = dealershipData.balance or 0,
        commission = dealershipData.commission or 10,
        playerName = dealershipData.playerName,
        employeeRole = dealershipData.employeeRole,
        stats = dealershipData.stats,
        fromAdmin = fromAdmin or false,
        nearbyPlayers = dealershipData.nearbyPlayers,
        playerBalance = {
            bank = Framework.Client.GetBalance("bank"),
            cash = Framework.Client.GetBalance("cash")
        },
        roles = {"CEO", "Owner", "Employee"},
        locale = Locale,
        config = GetSafeConfigForNUI()
    })
end)
RegisterNUICallback("open-dealership-management", function(data, cb)
    TriggerEvent("jg-dealerships:client:open-management", data.id, data.fromAdmin)
    cb({success = true})
end)
RegisterNUICallback("get-dealership-balance", function(data, cb)
    local result = lib.callback.await("jg-dealerships:server:get-dealership-balance", false, data.dealership)
    cb(result or {error = true})
end)
RegisterNUICallback("get-dealership-vehicles", function(data, cb)
    local result = lib.callback.await("jg-dealerships:server:get-dealership-vehicles", false, data)
    cb(result or {error = true})
end)
RegisterNUICallback("get-dealership-display-vehicles", function(data, cb)
    local result = lib.callback.await("jg-dealerships:server:get-dealership-display-vehicles", false, data)
    cb(result or {error = true})
end)
RegisterNUICallback("get-dealership-orders", function(data, cb)
    local result = lib.callback.await("jg-dealerships:server:get-dealership-orders", false, data)
    cb(result or {error = true})
end)
RegisterNUICallback("get-dealership-sales", function(data, cb)
    local result = lib.callback.await("jg-dealerships:server:get-dealership-sales", false, data)
    cb(result or {error = true})
end)
RegisterNUICallback("get-dealership-employees", function(data, cb)
    local result = lib.callback.await("jg-dealerships:server:get-dealership-employees", false, data)
    cb(result or {error = true})
end)
RegisterNUICallback("order-vehicle", function(data, cb)
    local result = lib.callback.await("jg-dealerships:server:order-vehicle", false, data.dealership, data.spawnCode, data.quantity)
    cb(result or {error = true})
end)
RegisterNUICallback("cancel-vehicle-order", function(data, cb)
    local result = lib.callback.await("jg-dealerships:server:cancel-vehicle-order", false, data.orderId)
    cb(result or {error = true})
end)
RegisterNUICallback("update-dealership-balance", function(data, cb)
    if data.action == "deposit" then
        local result = lib.callback.await("jg-dealerships:server:dealership-deposit", false, data.dealership, data.source, data.amount)
        cb(result or {error = true})
    elseif data.action == "withdraw" then
        -- Always show dialog for withdrawal to choose account type
        local input = lib.inputDialog(Locale.withdraw, {
            {type = 'number', label = Locale.amount, description = 'Amount to withdraw', required = true, min = 1, default = data.amount},
            {type = 'select', label = Locale.paymentSource, options = {
                {value = 'cash', label = Locale.cash},
                {value = 'bank', label = Locale.bank}
            }, required = true, default = 'bank'}
        })
        
        if not input then
            cb({error = true})
            return
        end
        
        local withdrawAmount = input[1]
        local accountType = input[2]
        
        local result = lib.callback.await("jg-dealerships:server:dealership-withdraw", false, data.dealership, accountType, withdrawAmount)
        cb(result or {error = true})
    else
        cb({error = true})
    end
end)
RegisterNUICallback("update-vehicle-price", function(data, cb)
    local vehicle = data.vehicle
    local dealership = data.dealership
    local newPrice = data.newPrice
    TriggerServerEvent("jg-dealerships:server:update-vehicle-price", dealership, vehicle, newPrice)
    cb({success = true})
end)
RegisterNUICallback("update-dealership-settings", function(data, cb)
    local dealership = data.dealership
    TriggerServerEvent("jg-dealerships:server:update-dealership-settings", dealership, data)
    cb({success = true})
end)

-- Add close callback to fix cursor stuck issue
RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({type = "hideUI"})
    cb({success = true})
end)

RegisterNUICallback("hideUI", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({type = "hideUI"})
    cb({success = true})
end)
