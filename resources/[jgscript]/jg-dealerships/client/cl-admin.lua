RegisterNetEvent("jg-dealerships:client:open-admin", function()
    local adminData = lib.callback.await("jg-dealerships:server:get-admin-data", false)
    
    -- Check if there was an error or no data
    if not adminData or adminData.error then
        print("[JG-Dealerships] Error getting admin data or insufficient permissions")
        SetNuiFocus(false, false)
        return
    end
    
    -- Ensure all required fields exist with defaults and are arrays
    local dealers = {}
    if adminData.dealerships and type(adminData.dealerships) == "table" then
        -- Ensure it's an array, not an object
        if #adminData.dealerships > 0 then
            dealers = adminData.dealerships
        else
            -- Convert object to array if needed
            for k, v in pairs(adminData.dealerships) do
                if type(v) == "table" then
                    dealers[#dealers + 1] = v
                end
            end
        end
    end
    
    local vehicles = {}
    if adminData.vehicles and type(adminData.vehicles) == "table" then
        -- Ensure it's an array, not an object
        if #adminData.vehicles > 0 then
            vehicles = adminData.vehicles
        else
            -- Convert object to array if needed
            for k, v in pairs(adminData.vehicles) do
                if type(v) == "table" then
                    vehicles[#vehicles + 1] = v
                end
            end
        end
    end
    
    local nearbyPlayers = {}
    if adminData.nearbyPlayers and type(adminData.nearbyPlayers) == "table" then
        nearbyPlayers = adminData.nearbyPlayers
    end
    
    -- Get safe config and locale - ensure they're tables
    local safeConfig = GetSafeConfigForNUI()
    if not safeConfig or type(safeConfig) ~= "table" then
        safeConfig = {
            Currency = "USD",
            NumberAndDateFormat = "en-US",
            Categories = {},
            Framework = "Qbox",
            PlateFormat = "XXX XXX",
            ShowVehicleImages = true,
            HideVehicleStats = false,
            SpeedUnit = "mph",
            FinancePayments = 12,
            FinanceDownPayment = 0.1,
            FinanceInterest = 0.1,
            TestDriveTimeSeconds = 60,
            MyFinanceCommand = "myfinance",
            DirectSaleCommand = "directsale",
            DealerAdminCommand = "dealeradmin"
        }
    end
    
    local safeLocale = Locale
    if not safeLocale or type(safeLocale) ~= "table" then
        safeLocale = {
            vehiclesAdmin = "Vehicles Admin",
            dealershipsAdmin = "Dealerships Admin",
            search = "Search",
            noVehicles = "No vehicles found",
            noDealershipsFound = "No dealerships found",
            add = "Add",
            edit = "Edit",
            delete = "Delete",
            save = "Save",
            cancel = "Cancel",
            confirm = "Confirm",
            vehicle = "Vehicle",
            vehicles = "Vehicles",
            dealership = "Dealership",
            dealerships = "Dealerships",
            name = "Name",
            brand = "Brand",
            model = "Model",
            category = "Category",
            price = "Price",
            owner = "Owner",
            type = "Type",
            active = "Active",
            inactive = "Inactive",
            spawnCode = "Spawn Code",
            importVehicles = "Import Vehicles",
            deleteVehicle = "Delete Vehicle",
            updateVehicle = "Update Vehicle",
            addVehicle = "Add Vehicle",
            setOwner = "Set Owner",
            deleteDealership = "Delete Dealership"
        }
    end
    
    -- Ensure Categories is a proper object with all expected keys
    if not safeConfig.Categories or type(safeConfig.Categories) ~= "table" then
        safeConfig.Categories = {
            planes = "Planes",
            sportsclassics = "Sports Classics", 
            sedans = "Sedans",
            compacts = "Compacts",
            sports = "Sports",
            super = "Super",
            motorcycles = "Motorcycles",
            offroad = "Off-road",
            industrial = "Industrial",
            muscle = "Muscle",
            suvs = "SUVs",
            vans = "Vans",
            coupes = "Coupes",
            utility = "Utility",
            service = "Service",
            military = "Military",
            emergency = "Emergency",
            commercial = "Commercial",
            trains = "Trains",
            boats = "Boats",
            helicopters = "Helicopters",
            cycles = "Cycles"
        }
    end
    
    -- Add DealershipLocations to config if it exists
    if Config and Config.DealershipLocations then
        -- Create a simplified version without functions or complex objects
        local simplifiedLocations = {}
        for dealerId, dealerData in pairs(Config.DealershipLocations) do
            simplifiedLocations[dealerId] = {
                type = dealerData.type or "owned",
                categories = dealerData.categories or {},
                enableFinance = dealerData.enableFinance ~= false,
                enableTestDrive = dealerData.enableTestDrive ~= false,
                enableSellVehicle = dealerData.enableSellVehicle ~= false
            }
        end
        safeConfig.DealershipLocations = simplifiedLocations
    else
        safeConfig.DealershipLocations = {}
    end
    
    -- Add import options based on framework
    safeConfig.ImportOptions = {}
    if Config.Framework == "QBCore" then
        safeConfig.ImportOptions = {"qbshared"}
    elseif Config.Framework == "Qbox" then
        safeConfig.ImportOptions = {"qbx_shared"}
    elseif Config.Framework == "ESX" then
        safeConfig.ImportOptions = {"esxdb"}
    end
    
    -- Create a clean NUI message with no circular references
    local nuiMessage = {
        type = "vehiclesAdmin",
        dealers = dealers,
        vehicles = vehicles,
        nearbyPlayers = nearbyPlayers,
        config = safeConfig,
        locale = safeLocale
    }
    
    -- Try to encode to check for issues
    local success, encoded = pcall(json.encode, nuiMessage)
    if not success then
        print("[JG-Dealerships] Error encoding NUI message:", encoded)
        -- Send minimal data if encoding fails
        nuiMessage = {
            type = "vehiclesAdmin",
            dealers = {},
            vehicles = {},
            nearbyPlayers = {},
            config = {
                Currency = "USD",
                NumberAndDateFormat = "en-US",
                Categories = safeConfig.Categories,
                Framework = "Qbox",
                PlateFormat = "XXX XXX",
                ShowVehicleImages = true,
                HideVehicleStats = false
            },
            locale = {vehiclesAdmin = "Vehicles Admin"}
        }
    else
        print("[JG-Dealerships] Successfully encoded admin data, sending to NUI")
    end
    
    SetNuiFocus(true, true)
    SendNUIMessage(nuiMessage)
end)
RegisterNUICallback("open-admin", function()
    TriggerEvent("jg-dealerships:client:open-admin")
end)
RegisterNUICallback("add-vehicle", function(data, cb)
    local spawnCode = data.spawn_code
    local brand = data.brand
    local model = data.model
    local category = data.category
    local price = data.price
    local dealerships = data.dealerships or {}
    
    -- Ensure dealerships is an array
    if type(dealerships) ~= "table" then
        dealerships = {}
    end
    
    lib.callback.await("jg-dealerships:server:add-vehicle", false, spawnCode, brand, model, category, price, dealerships)
    cb({success = true})
end)
RegisterNUICallback("update-vehicle", function(data, cb)
    local spawnCode = data.spawn_code
    local brand = data.brand
    local model = data.model
    local category = data.category
    local price = data.price
    local dealerships = data.dealerships or {}
    local updateDealerPrices = data.updateDealerPrices
    
    -- Ensure dealerships is an array
    if type(dealerships) ~= "table" then
        dealerships = {}
    end
    
    lib.callback.await("jg-dealerships:server:update-vehicle", false, spawnCode, brand, model, category, price, dealerships, updateDealerPrices or false)
    cb({success = true})
end)
RegisterNUICallback("delete-vehicle", function(data, cb)
    local spawnCode = data.spawn_code
    lib.callback.await("jg-dealerships:server:delete-vehicle", false, spawnCode)
    cb({success = true})
end)
RegisterNUICallback("delete-dealership-data", function(data, cb)
    local dealershipId = data.dealershipId
    local result = lib.callback.await("jg-dealerships:server:delete-dealership-data", false, dealershipId)
    TriggerEvent("jg-dealerships:client:open-admin")
    cb(result)
end)
RegisterNUICallback("set-dealership-owner", function(data, cb)
    local dealershipId = data.dealershipId
    local player = data.player
    local result = lib.callback.await("jg-dealerships:server:set-dealership-owner", false, dealershipId, player)
    TriggerEvent("jg-dealerships:client:open-admin")
    cb(result)
end)
RegisterNUICallback("import-vehicles-data", function(data, cb)
    local location = data.location
    local behaviour = data.behaviour
    local result = lib.callback.await("jg-dealerships:server:import-vehicles-data", false, location, behaviour)
    TriggerEvent("jg-dealerships:client:open-admin")
    cb(result)
end)
RegisterNUICallback("verify-spawn-code", function(data, cb)
    local spawnCode = data.spawnCode
    if not spawnCode then
        return cb({valid = false})
    end
    local modelHash = GetHashKey(spawnCode)
    cb({
        valid = IsModelValid(modelHash) and true or false
    })
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
