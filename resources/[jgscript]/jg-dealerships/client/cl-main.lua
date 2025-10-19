DoScreenFadeIn(0)

AddEventHandler("onResourceStart", function(resourceName)
  if GetCurrentResourceName() ~= resourceName then
    return
  end

  CreateThread(function()
    Wait(2000)
    TriggerEvent("jg-dealerships:client:update-blips-text-uis")
    
    -- Ensure screen is not black on resource start
    if IsScreenFadedOut() or IsScreenFadingOut() then
      DoScreenFadeIn(500)
    end
  end)
end)

-- Recovery command for black screen issues
RegisterCommand("fixscreen", function()
  -- Force screen to fade in
  if IsScreenFadedOut() or IsScreenFadingOut() then
    DoScreenFadeIn(500)
  end
  
  -- Clean up any stuck UI
  SetNuiFocus(false, false)
  SendNUIMessage({type = "hideUI"})
  
  -- Reset test drive state if needed
  if Globals and Globals.IsTestDriving then
    Globals.IsTestDriving = false
    TriggerServerEvent("jg-dealerships:server:exit-bucket")
  end
  
  -- Reset showroom state if needed
  if Globals and Globals.CurrentDealership then
    if ExitShowroom then
      ExitShowroom()
    end
  end
  
  print("^2[INFO] Screen and UI state reset")
end, false)

-- Find a clear spawn point for vehicles
function FindVehicleSpawnCoords(coords)
    local spawnCoords = vector4(coords.x, coords.y, coords.z, coords.w or coords.h or 0.0)
    
    -- Check if the spawn point is clear
    local isPointClear = false
    local attempts = 0
    local maxAttempts = 10
    
    while not isPointClear and attempts < maxAttempts do
        -- Check for vehicles in the area
        local vehicle = GetClosestVehicle(spawnCoords.x, spawnCoords.y, spawnCoords.z, 3.0, 0, 71)
        
        if vehicle == 0 or not DoesEntityExist(vehicle) then
            isPointClear = true
        else
            -- Try to find another spot nearby
            local angle = math.random() * 2 * math.pi
            local distance = 5.0 + (attempts * 2.0)
            spawnCoords = vector4(
                coords.x + math.cos(angle) * distance,
                coords.y + math.sin(angle) * distance,
                coords.z,
                coords.w or coords.h or 0.0
            )
            attempts = attempts + 1
            Wait(100)
        end
    end
    
    return spawnCoords
end

-- Get vehicle type from vehicle class
function GetVehicleTypeFromClass(class)
    -- Based on GTA vehicle classes
    if class == 14 then -- Boats
        return "boat"
    elseif class == 15 then -- Helicopters
        return "air"
    elseif class == 16 then -- Planes
        return "air"
    elseif class == 8 then -- Motorcycles
        return "bike"
    else
        return "car"
    end
end

-- Set vehicle color based on color string or RGB values
function SetVehicleColour(vehicle, colour)
    if not colour then return end
    
    -- Always set up vehicle for paint modifications
    SetVehicleModKit(vehicle, 0)
    SetVehicleMod(vehicle, 48, -1, false) -- Paint type
    
    if type(colour) == "string" then
        -- Parse color string (format: "r,g,b" or "primary,secondary" or hex "#RRGGBB")
        if string.sub(colour, 1, 1) == "#" then
            -- Hex color
            local hex = string.sub(colour, 2)
            local r = tonumber(string.sub(hex, 1, 2), 16) or 255
            local g = tonumber(string.sub(hex, 3, 4), 16) or 255
            local b = tonumber(string.sub(hex, 5, 6), 16) or 255
            SetVehicleCustomPrimaryColour(vehicle, r, g, b)
            SetVehicleCustomSecondaryColour(vehicle, r, g, b)
        else
            -- Parse comma-separated values
            local colors = {}
            for color in string.gmatch(colour, "([^,]+)") do
                table.insert(colors, tonumber(color) or 0)
            end
            
            if #colors == 2 then
                -- Primary and secondary color indices
                -- Try to get RGB values from config if available
                if Config.UseRGBColors then
                    local colorData = nil
                    for _, configColor in ipairs(Config.VehicleColourOptions) do
                        if configColor.index == colors[1] then
                            colorData = configColor
                            break
                        end
                    end
                    
                    if colorData and colorData.rgb then
                        SetVehicleCustomPrimaryColour(vehicle, colorData.rgb[1], colorData.rgb[2], colorData.rgb[3])
                        SetVehicleCustomSecondaryColour(vehicle, colorData.rgb[1], colorData.rgb[2], colorData.rgb[3])
                    else
                        SetVehicleColours(vehicle, colors[1], colors[2])
                    end
                else
                    SetVehicleColours(vehicle, colors[1], colors[2])
                end
            elseif #colors >= 3 then
                -- RGB custom color
                SetVehicleCustomPrimaryColour(vehicle, colors[1], colors[2], colors[3])
                SetVehicleCustomSecondaryColour(vehicle, colors[1], colors[2], colors[3])
            end
        end
    elseif type(colour) == "table" then
        -- Handle color option objects from ShowroomVehicleColor
        if colour.rgb and Config.UseRGBColors then
            -- Use RGB values if available
            SetVehicleCustomPrimaryColour(vehicle, colour.rgb[1], colour.rgb[2], colour.rgb[3])
            SetVehicleCustomSecondaryColour(vehicle, colour.rgb[1], colour.rgb[2], colour.rgb[3])
        elseif colour.r and colour.g and colour.b then
            -- RGB table
            SetVehicleCustomPrimaryColour(vehicle, colour.r, colour.g, colour.b)
            SetVehicleCustomSecondaryColour(vehicle, colour.r, colour.g, colour.b)
        elseif colour.index then
            -- Single index from color option
            if Config.UseRGBColors then
                -- Try to get RGB values from config
                local colorData = nil
                for _, configColor in ipairs(Config.VehicleColourOptions) do
                    if configColor.index == colour.index then
                        colorData = configColor
                        break
                    end
                end
                
                if colorData and colorData.rgb then
                    SetVehicleCustomPrimaryColour(vehicle, colorData.rgb[1], colorData.rgb[2], colorData.rgb[3])
                    SetVehicleCustomSecondaryColour(vehicle, colorData.rgb[1], colorData.rgb[2], colorData.rgb[3])
                else
                    SetVehicleColours(vehicle, colour.index, colour.index)
                end
            else
                SetVehicleColours(vehicle, colour.index, colour.index)
            end
        elseif colour[1] and colour[2] then
            -- Color indices array
            SetVehicleColours(vehicle, colour[1], colour[2])
        elseif colour[1] then
            -- Single color in array
            SetVehicleColours(vehicle, colour[1], colour[1])
        end
    elseif type(colour) == "number" then
        -- Single color index for both primary and secondary
        if Config.UseRGBColors then
            -- Try to get RGB values from config
            local colorData = nil
            for _, configColor in ipairs(Config.VehicleColourOptions) do
                if configColor.index == colour then
                    colorData = configColor
                    break
                end
            end
            
            if colorData and colorData.rgb then
                SetVehicleCustomPrimaryColour(vehicle, colorData.rgb[1], colorData.rgb[2], colorData.rgb[3])
                SetVehicleCustomSecondaryColour(vehicle, colorData.rgb[1], colorData.rgb[2], colorData.rgb[3])
            else
                SetVehicleColours(vehicle, colour, colour)
            end
        else
            SetVehicleColours(vehicle, colour, colour)
        end
    end
end
