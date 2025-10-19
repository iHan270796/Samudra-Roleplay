lib.addCommand(Config.DealerAdminCommand or "dealeradmin", false, function(source)
    print("[JG-Dealerships] Admin command triggered by player: " .. source)
    local isAdmin = Framework.Server.IsAdmin(source)
    print("[JG-Dealerships] IsAdmin result for player " .. source .. ": " .. tostring(isAdmin))
    
    if not isAdmin then
        Framework.Server.Notify(source, "INSUFFICIENT_PERMISSIONS", "error")
        DebugPrint("Player " .. source .. " tried to access the dealer admin panel without permission", "warning")
        print("[JG-Dealerships] Player " .. source .. " denied admin access")
        return
    end
    
    print("[JG-Dealerships] Opening admin panel for player " .. source)
    TriggerClientEvent("jg-dealerships:client:open-admin", source)
end)
lib.callback.register("jg-dealerships:server:get-admin-data", function(source)
    if not Framework.Server.IsAdmin(source) then
        Framework.Server.Notify(source, "INSUFFICIENT_PERMISSIONS", "error")
        DebugPrint("Player " .. source .. " tried to get admin data without permission", "warning")
        return {error = true}
    end
    
    -- Debug logging
    print("[JG-Dealerships] Getting admin data for player " .. source)
    print("[JG-Dealerships] Config exists:", Config ~= nil)
    print("[JG-Dealerships] Config.DealershipLocations exists:", Config and Config.DealershipLocations ~= nil)
    
    -- Initialize default values
    local dealerships = {}
    local vehicles = {}
    local nearbyPlayers = {}
    
    -- Safely query dealership data
    local dealershipData = MySQL.query.await("SELECT * FROM dealership_data")
    if dealershipData and type(dealershipData) == "table" then
        for _, dealership in pairs(dealershipData) do
            local config = nil
            if Config and Config.DealershipLocations then
                config = Config.DealershipLocations[dealership.name]
            end
            local dealershipType = "-"
            local isActive = false
            if config then
                dealershipType = config.type or "-"
                isActive = true
            end
            dealerships[#dealerships + 1] = {
                name = dealership.name or "",
                type = dealershipType,
                label = dealership.label or "",
                balance = dealership.balance or 0,
                active = isActive,
                owner_id = dealership.owner_id or "",
                owner_name = dealership.owner_name or "",
                -- Don't include the full config object as it might have circular references
                -- Just include what's needed
                hasConfig = config ~= nil
            }
        end
    end
    
    -- Safely query vehicle data
    local vehicleQuery = "SELECT vehicle.spawn_code, MAX(vehicle.brand) AS brand, MAX(vehicle.model) AS model, MAX(vehicle.category) AS category, MAX(vehicle.price) AS price, MAX(vehicle.created_at) AS created_at, IFNULL(CONCAT('[', GROUP_CONCAT(CONCAT('\"', dealer.name, '\"')), ']'), '[]') as dealers FROM dealership_vehicles vehicle LEFT JOIN dealership_stock stock ON vehicle.spawn_code = stock.vehicle LEFT JOIN dealership_data dealer ON dealer.name = stock.dealership GROUP BY vehicle.spawn_code ORDER BY MAX(vehicle.created_at) DESC;"
    local vehicleData = MySQL.query.await(vehicleQuery)
    if vehicleData and type(vehicleData) == "table" then
        for _, vehicle in pairs(vehicleData) do
            local dealerList = {}
            if vehicle.dealers then
                local success, decoded = pcall(json.decode, vehicle.dealers)
                if success and decoded then
                    dealerList = decoded
                end
            end
            vehicles[#vehicles + 1] = {
                spawn_code = vehicle.spawn_code or "",
                brand = vehicle.brand or "",
                model = vehicle.model or "",
                category = vehicle.category or "",
                price = vehicle.price or 0,
                dealerships = dealerList,
                created_at = vehicle.created_at
            }
        end
    end
    
    -- Safely get nearby players
    local ped = GetPlayerPed(source)
    if ped and DoesEntityExist(ped) then
        local coords = GetEntityCoords(ped)
        nearbyPlayers = GetNearbyPlayers(source, coords, 10.0, true) or {}
    end
    
    return {
        vehicles = vehicles,
        dealerships = dealerships,
        nearbyPlayers = nearbyPlayers
    }
end)
lib.callback.register("jg-dealerships:server:add-vehicle", function(source, spawnCode, brand, model, category, price, dealerships)
    if not Framework.Server.IsAdmin(source) then
        Framework.Server.Notify(source, "INSUFFICIENT_PERMISSIONS", "error")
        DebugPrint("Player " .. source .. " tried to add a vehicle without permission", "warning")
        return {error = true}
    end
    
    -- Ensure dealerships is a valid array
    if not dealerships then
        dealerships = {}
    elseif type(dealerships) ~= "table" then
        dealerships = {}
    end
    
    DebugPrint("Adding vehicle with spawn code: " .. spawnCode .. ", trimmed: " .. Trim(spawnCode), "debug")
    spawnCode = Trim(spawnCode)
    MySQL.query.await("INSERT INTO dealership_vehicles (spawn_code, hashkey, brand, model, category, price) VALUES(?, ?, ?, ?, ?, ?)", {
        spawnCode,
        joaat(spawnCode),
        brand,
        model,
        category,
        price
    })
    
    -- Only add to dealership stock if dealerships are specified
    if #dealerships > 0 then
        for _, dealership in ipairs(dealerships) do
            MySQL.query.await("INSERT IGNORE INTO dealership_stock (vehicle, dealership, price) VALUES (?, ?, ?)", {
                spawnCode,
                dealership,
                price
            })
        end
    end
    
    SendWebhook(source, Webhooks.Admin, "Admin: Add Vehicle", "success", {
        {key = "Vehicle", value = spawnCode},
        {key = "Name", value = brand .. " " .. model},
        {key = "Category", value = category},
        {key = "Price", value = price},
        {key = "Dealerships", value = #dealerships .. " dealership(s)"}
    })
    UpdateAllDealershipsShowroomCache()
    return true
end)
lib.callback.register("jg-dealerships:server:update-vehicle", function(source, spawnCode, brand, model, category, price, dealerships, updateDealerPrices)
    if not Framework.Server.IsAdmin(source) then
        Framework.Server.Notify(source, "INSUFFICIENT_PERMISSIONS", "error")
        DebugPrint("Player " .. source .. " tried to update a vehicle without permission", "warning")
        return {error = true}
    end
    
    -- Ensure dealerships is a valid array
    if not dealerships then
        dealerships = {}
    elseif type(dealerships) ~= "table" then
        dealerships = {}
    end
    
    DebugPrint("Updating vehicle with spawn code: " .. spawnCode .. ", trimmed: " .. Trim(spawnCode), "debug")
    spawnCode = Trim(spawnCode)
    MySQL.query.await("UPDATE dealership_vehicles SET brand = ?, model = ?, category = ?, price = ? WHERE spawn_code = ?", {
        brand,
        model,
        category,
        price,
        spawnCode
    })
    
    if #dealerships > 0 then
        MySQL.query.await("DELETE FROM dealership_stock WHERE vehicle = ? AND dealership NOT IN (?)", {
            spawnCode,
            dealerships
        })
    else
        MySQL.query.await("DELETE FROM dealership_stock WHERE vehicle = ?", {spawnCode})
    end
    
    for _, dealership in ipairs(dealerships) do
        MySQL.query.await("INSERT IGNORE INTO dealership_stock (vehicle, dealership, price) VALUES (?, ?, ?)", {
            spawnCode,
            dealership,
            price
        })
    end
    if updateDealerPrices then
        MySQL.query.await("UPDATE dealership_stock SET price = ? WHERE vehicle = ?", {
            price,
            spawnCode
        })
    end
    SendWebhook(source, Webhooks.Admin, "Admin: Vehicle Updated", nil, {
        {key = "Vehicle", value = spawnCode},
        {key = "Name", value = brand .. " " .. model},
        {key = "Category", value = category},
        {key = "Price", value = price},
        {key = "Dealerships", value = #dealerships .. " dealership(s)"}
    })
    UpdateAllDealershipsShowroomCache()
    return true
end)
lib.callback.register("jg-dealerships:server:delete-vehicle", function(source, spawnCode)
    if not Framework.Server.IsAdmin(source) then
        Framework.Server.Notify(source, "INSUFFICIENT_PERMISSIONS", "error")
        DebugPrint("Player " .. source .. " tried to delete a vehicle without permission", "warning")
        return {error = true}
    end
    MySQL.query.await("DELETE FROM dealership_stock WHERE vehicle = ?", {spawnCode})
    MySQL.query.await("DELETE FROM dealership_sales WHERE vehicle = ?", {spawnCode})
    MySQL.query.await("DELETE FROM dealership_orders WHERE vehicle = ?", {spawnCode})
    MySQL.query.await("DELETE FROM dealership_dispveh WHERE vehicle = ?", {spawnCode})
    MySQL.query.await("DELETE FROM dealership_vehicles WHERE spawn_code = ?", {spawnCode})
    SendWebhook(source, Webhooks.Admin, "Admin: Vehicle Deleted", "danger", {
        {key = "Vehicle", value = spawnCode}
    })
    UpdateAllDealershipsShowroomCache()
    return true
end)
lib.callback.register("jg-dealerships:server:delete-dealership-data", function(source, dealershipId)
    if not Framework.Server.IsAdmin(source) then
        Framework.Server.Notify(source, "INSUFFICIENT_PERMISSIONS", "error")
        DebugPrint("Player " .. source .. " tried to delete a dealership without permission", "warning")
        return {error = true}
    end
    MySQL.query.await("DELETE FROM dealership_stock WHERE dealership = ?", {dealershipId})
    MySQL.query.await("DELETE FROM dealership_sales WHERE dealership = ?", {dealershipId})
    MySQL.query.await("DELETE FROM dealership_orders WHERE dealership = ?", {dealershipId})
    MySQL.query.await("DELETE FROM dealership_dispveh WHERE dealership = ?", {dealershipId})
    MySQL.query.await("DELETE FROM dealership_data WHERE name = ?", {dealershipId})
    SendWebhook(source, Webhooks.Admin, "Admin: Dealership Data Deleted", "danger", {
        {key = "Dealership", value = dealershipId}
    })
    UpdateAllDealershipsShowroomCache()
    return true
end)
lib.callback.register("jg-dealerships:server:set-dealership-owner", function(source, dealershipId, playerId)
    if not Framework.Server.IsAdmin(source) then
        Framework.Server.Notify(source, "INSUFFICIENT_PERMISSIONS", "error")
        DebugPrint("Player " .. source .. " tried to set a dealership owner without permission", "warning")
        return {error = true}
    end
    local playerIdentifier = Framework.Server.GetPlayerIdentifier(tonumber(playerId) or 0)
    DebugPrint("Setting dealership owner for " .. dealershipId .. " to " .. playerIdentifier, "debug")
    local playerInfo = Framework.Server.GetPlayerInfo(tonumber(playerId) or 0)
    if not playerInfo or not playerIdentifier then
        Framework.Server.Notify(source, "PLAYER_NOT_ONLINE", "error")
        return {error = true}
    end
    MySQL.update.await("UPDATE dealership_data SET owner_id = ?, owner_name = ? WHERE name = ?", {
        playerIdentifier,
        playerInfo.name,
        dealershipId
    })
    TriggerClientEvent("jg-dealerships:client:update-blips-text-uis", -1)
    SendWebhook(source, Webhooks.Admin, "Admin: Dealership Owner Updated", nil, {
        {key = "Dealership", value = dealershipId},
        {key = "Owner", value = playerInfo.name}
    })
    return true
end)
local function ClearAllDealershipData()
    MySQL.query.await("DELETE FROM dealership_dispveh")
    MySQL.query.await("DELETE FROM dealership_orders")
    MySQL.query.await("DELETE FROM dealership_sales")
    MySQL.query.await("DELETE FROM dealership_stock")
    MySQL.query.await("DELETE FROM dealership_vehicles")
end
lib.callback.register("jg-dealerships:server:import-vehicles-data", function(source, location, behaviour)
    if Config.Framework == "QBCore" then
        if location == "qbshared" then
            local vehicles = QBCore.Shared.Vehicles
            if behaviour == "Overwrite" then
                ClearAllDealershipData()
            end
            for spawnCode, vehicleData in pairs(vehicles) do
                MySQL.query.await("INSERT IGNORE INTO dealership_vehicles (spawn_code, hashkey, brand, model, category, price) VALUES(?, ?, ?, ?, ?, ?)", {
                    Trim(spawnCode),
                    joaat(spawnCode),
                    vehicleData.brand,
                    vehicleData.name,
                    vehicleData.category,
                    vehicleData.price
                })
                local shops = {}
                if type(vehicleData.shop) == "string" then
                    shops[1] = vehicleData.shop
                elseif type(vehicleData.shop) == "table" then
                    shops = vehicleData.shop
                end
                for _, shop in ipairs(shops) do
                    if Config.DealershipLocations[shop] then
                        MySQL.query.await("INSERT IGNORE INTO dealership_stock (vehicle, dealership, stock, price) VALUES(?, ?, ?, ?)", {
                            Trim(spawnCode),
                            shop,
                            0,
                            vehicleData.price
                        })
                    end
                end
            end
            local count = MySQL.scalar.await("SELECT COUNT(*) as count FROM dealership_vehicles")
            Framework.Server.Notify(source, "Import successful! Vehicle count: " .. count, "success")
            SendWebhook(source, Webhooks.Admin, "Admin: Vehicles Imported", "success", {
                {key = "Method", value = "QBCore Shared"},
                {key = "Rows Imported", value = count}
            })
            UpdateAllDealershipsShowroomCache()
            return true
        end
  elseif Config.Framework == "Qbox" then
    if location == "qbx_shared" then
      local vehicles = exports.qbx_core:GetVehiclesByHash()
      if behaviour == "Overwrite" then
        ClearAllDealershipData()
      end
      for hash, vehicleData in pairs(vehicles) do
        MySQL.query.await("INSERT IGNORE INTO dealership_vehicles (spawn_code, hashkey, brand, model, category, price) VALUES(?, ?, ?, ?, ?, ?)", {
          Trim(vehicleData.model),
          hash,
          vehicleData.brand,
          vehicleData.name,
          vehicleData.category,
          vehicleData.price
        })
        if vehicleData.shop then
          local shops = {}
          if type(vehicleData.shop) == "string" then
            shops[1] = vehicleData.shop
          elseif type(vehicleData.shop) == "table" then
            shops = vehicleData.shop
          end
          for _, shop in ipairs(shops) do
            if Config.DealershipLocations[shop] then
              MySQL.query.await("INSERT IGNORE INTO dealership_stock (vehicle, dealership, stock, price) VALUES(?, ?, ?, ?)", {
                Trim(vehicleData.model),
                shop,
                0,
                vehicleData.price
              })
            end
          end
        else
          for dealershipId, dealershipConfig in pairs(Config.DealershipLocations) do
            if IsItemInList(dealershipConfig.categories, vehicleData.category) then
              MySQL.query.await("INSERT IGNORE INTO dealership_stock (vehicle, dealership, stock, price) VALUES(?, ?, ?, ?)", {
                Trim(vehicleData.model),
                dealershipId,
                0,
                vehicleData.price
              })
            end
          end
        end
      end
      local count = MySQL.scalar.await("SELECT COUNT(*) as count FROM dealership_vehicles")
      Framework.Server.Notify(source, "Import successful! Vehicle count: " .. count, "success")
      SendWebhook(source, Webhooks.Admin, "Admin: Vehicles Imported", "success", {
        {key = "Method", value = "QBox Shared"},
        {key = "Rows Imported", value = count}
      })
      UpdateAllDealershipsShowroomCache()
      return true
    end
  elseif Config.Framework == "ESX" and location == "esxdb" then
    if behaviour == "Overwrite" then
      ClearAllDealershipData()
    end
    local vehicles = MySQL.query.await("SELECT * FROM vehicles ORDER BY name DESC")
    for _, vehicleData in pairs(vehicles) do
      MySQL.query.await("INSERT IGNORE INTO dealership_vehicles (spawn_code, hashkey, brand, model, category, price) VALUES(?, ?, ?, ?, ?, ?)", {
        Trim(vehicleData.model),
        joaat(vehicleData.model),
        nil,
        vehicleData.name,
        vehicleData.category,
        vehicleData.price
      })
      for dealershipId, dealershipConfig in pairs(Config.DealershipLocations) do
        if IsItemInList(dealershipConfig.categories, vehicleData.category) then
          MySQL.query.await("INSERT IGNORE INTO dealership_stock (vehicle, dealership, stock, price) VALUES(?, ?, ?, ?)", {
            Trim(vehicleData.model),
            dealershipId,
            0,
            vehicleData.price
          })
        end
      end
    end
    local count = MySQL.scalar.await("SELECT COUNT(*) as count FROM dealership_vehicles")
    Framework.Server.Notify(source, "Import successful! Vehicle count: " .. count, "success")
    SendWebhook(source, Webhooks.Admin, "Admin: Vehicles Imported", "success", {
      {key = "Method", value = "ESX"},
      {key = "Rows Imported", value = count}
    })
    UpdateAllDealershipsShowroomCache()
    return true
  end
  return {error = "UNSUPPORTED_SOURCE"}
end)
