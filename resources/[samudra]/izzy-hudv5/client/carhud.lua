-- Car HUD System
-- Handles vehicle display, speedometer, and driving modes

local drivingMode = "normal"
local isDriftMode = false

-- Vehicle entry event
RegisterNetEvent("izzy-hudv5:enteredVehicle", function()
    current.inVehicle = true
    SendReactMessage("setVehicleDisplay", true)
    
    -- Get sound data for the vehicle
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local plate = GetVehicleNumberPlateText(vehicle)
    izzy.triggerCallback("izzy-hudv5:server:getSoundByPlate", function(soundData)
        if soundData then
            current.sound = soundData
            
            if soundData.isPlaying then
                exports.xsound:PlayUrl(soundData.name, soundData.url, soundData.volume, false)
                Wait(1000)
                exports.xsound:setTimeStamp(soundData.name, soundData.timeStamp)
            else
                Wait(1000)
            end
            
            SendReactMessage("setRadio", soundData)
        end
    end, plate)
    
    -- Main vehicle data loop
    repeat
        Wait(cfg.speedoInterval)
        
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        
        if vehicle ~= 0 then
            local speed = math.ceil(GetEntitySpeed(vehicle) * (current.settings.speedType == "kmh" and 3.6 or 2.236936))
            local fuel = math.round(getFuel(vehicle))
            
            local gear = getGear(vehicle)
            local vehicleClass = GetVehicleClass(vehicle)
            
            -- Determine headlight state
            local headlights = 0
            local dashboardLights = GetVehicleDashboardLights()
            if dashboardLights == 128 or dashboardLights == 256 then
                headlights = 1
            elseif dashboardLights == 384 then
                headlights = 2
            end
            
            -- Prepare vehicle data
            local vehicleData = {
                speed = speed,
                fuel = fuel,
                headlights = headlights,
                seatbelt = getSeatbelt(vehicle),
                rpm = GetVehicleCurrentRpm(vehicle) * 12,
                nitrous = getNitrous(vehicle),
                engine = GetVehicleEngineHealth(vehicle) / 10,
                previousGear = gear == 0 and "R" or (gear == 1 and "N" or gear - 1),
                currentGear = gear == 0 and "N" or gear,
                nextGear = (gear + 1 <= GetVehicleHighGear(vehicle)) and (gear + 1 == GetVehicleHighGear(vehicle) and GetVehicleHighGear(vehicle) or gear + 1) or "",
                drivingMode = drivingMode,
                speedoType = (vehicleClass == 14 and "boat") or ((vehicleClass == 15 or vehicleClass == 16) and "heli") or "normal",
                direction = GetEntityHeading(vehicle)
            }
            
            SendReactMessage("setVehicleData", vehicleData)
            
            -- Handle drift mode
            if drivingMode == "drift" then
                if IsPedInAnyVehicle(playerPed, false) then
                    local carSpeed = GetEntitySpeed(vehicle) * 3.6
                    CarSpeed = carSpeed
                    
                    if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                        if carSpeed <= 200.0 then
                            if IsControlPressed(1, 21) then
                                SetVehicleReduceGrip(vehicle, true)
                            else
                                SetVehicleReduceGrip(vehicle, false)
                            end
                        end
                    end
                end
            end
        end
        
        -- Handle radar display
        if not current.settings.cinematic then
            DisplayRadar(1)
        end
        
    until not current.inVehicle
    
    -- Hide radar if set to only show in vehicle
    if current.settings.mapVisibility == "onlyInVehicle" then
        DisplayRadar(0)
    end
    
    -- Clean up sound when exiting vehicle
    if current.sound then
        local soundInfo = exports.xsound:getInfo(current.sound.name)
        if soundInfo then
            if current.sound.musicId then
                current.sound.timeStamp = soundInfo.timeStamp
                TriggerServerEvent("izzy-hud:server:updateSound", current.sound, true)
            end
            exports.xsound:Destroy(current.sound.name)
        end
        
        SendReactMessage("setRadio", nil)
        current.sound = nil
    end
end)

-- Vehicle exit event
RegisterNetEvent("izzy-hudv5:leftVehicle", function()
    current.inVehicle = false
    SendReactMessage("setVehicleDisplay", false)
    
    if current.settings.mapVisibility == "onlyInVehicle" then
        DisplayRadar(0)
    end
end)

-- Car modification command
if cfg.useCarMode then
    RegisterCommand(cfg.carModCommand, function()
        if current.inVehicle then
            SendReactMessage("setMusicDisplay", false)
            SendReactMessage("setModDisplay", true)
            SetNuiFocus(true, true)
        end
    end)
end

-- Music player command
if cfg.useMusicPlayer then
    RegisterCommand(cfg.musicCommand, function()
        if current.inVehicle then
            SendReactMessage("setModDisplay", false)
            SendReactMessage("setMusicDisplay", "full")
            SetNuiFocus(true, true)
        end
    end)
end

-- NUI callback for changing driving mode
RegisterNUICallback("changeDrivingMode", function(data, cb)
    drivingMode = data
    cb({ "ok" })
end)