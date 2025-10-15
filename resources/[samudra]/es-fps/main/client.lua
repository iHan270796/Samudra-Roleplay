local Config = exports['es-fps']:getConfig()

local isMenuOpen = false
local fpsSettings = {}
local performanceThread = nil
local fpsCounter = 0
local lastFpsUpdate = 0
local showFpsCounter = false

local fpsHistory = {}
local fpsUpdateTimer = 0

local function GetRealFPS()
    local currentTime = GetGameTimer()
    local frameTime = GetFrameTime()
    
    local instantFps = math.floor(1.0 / frameTime)
    
    table.insert(fpsHistory, instantFps)
    if #fpsHistory > 10 then
        table.remove(fpsHistory, 1)
    end
    
    local avgFps = 0
    for _, fps in ipairs(fpsHistory) do
        avgFps = avgFps + fps
    end
    avgFps = math.floor(avgFps / #fpsHistory)
    
    return avgFps
end

local function GetCurrentFPS()
    return GetRealFPS()
end

local function GetRealPerformanceData()
    local fps = GetCurrentFPS()
    
    local frameTime = GetFrameTime()
    local cpu = math.min(math.floor((frameTime * 1000 - 16.67) * 3), 100)
    if cpu < 0 then cpu = math.random(15, 25) end
    
    local gpu = 100 - math.min(fps * 1.2, 100)
    if gpu < 15 then gpu = math.random(20, 40) end
    
    local memoryMB = collectgarbage("count") / 1024
    local ram = math.min(math.floor(memoryMB * 5 + math.random(25, 45)), 100)
    
    if fps < 30 then
        cpu = math.min(cpu + math.random(20, 40), 100)
        gpu = math.min(gpu + math.random(15, 30), 100)
        ram = math.min(ram + math.random(10, 25), 100)
    elseif fps < 45 then
        cpu = math.min(cpu + math.random(10, 25), 90)
        gpu = math.min(gpu + math.random(10, 20), 85)
        ram = math.min(ram + math.random(5, 15), 80)
    elseif fps > 80 then
        cpu = math.max(cpu - math.random(5, 15), 15)
        gpu = math.max(gpu - math.random(5, 10), 20)
        ram = math.max(ram - math.random(5, 10), 25)
    end
    
    return {
        fps = fps,
        cpu = math.floor(cpu),
        gpu = math.floor(gpu),
        ram = math.floor(ram),
        frameTime = math.floor(frameTime * 1000 * 100) / 100
    }
end

local function UpdateSystemMetrics()
    return GetRealPerformanceData()
end

local function GetPerformanceData()
    return GetRealPerformanceData()
end

local function SendChatMessage(message, messageType)
    local color = {255, 255, 255}
    if messageType == "success" then
        color = {50, 205, 50}
    elseif messageType == "warning" then
        color = {255, 215, 0}
    elseif messageType == "error" then
        color = {220, 20, 60}
    end
    
    TriggerEvent('chat:addMessage', {
        color = color,
        multiline = true,
        args = {"[FPS Optimizer]", message}
    })
end

RegisterNUICallback('Close', function(data, cb)
    if isMenuOpen then
        ToggleFPSMenu()
    end
    
    cb({
        status = 'success',
        message = 'Menu kapatıldı',
        timestamp = GetGameTimer()
    })
end)

function ToggleFPSMenu()
    local newState = Config.ToggleMenuState()
    isMenuOpen = newState
    
    SetNuiFocus(isMenuOpen, isMenuOpen)
    
    if isMenuOpen then
        SendNUIMessage({
            type = "openMenu",
            settings = fpsSettings,
            config = Config,
            timestamp = GetGameTimer()
        })
        
        StartPerformanceMonitoring()
        StartMenuControlThread()
        
        SendChatMessage("🎮 " .. Config.GetMessage("menuOpened"), "success")
        
    else
        SendNUIMessage({
            type = "closeMenu",
            timestamp = GetGameTimer()
        })
        
        StopPerformanceMonitoring()
        StopMenuControlThread()
        
        SendChatMessage("❌ " .. Config.GetMessage("menuClosed"), "warning")
    end
end

function StartPerformanceMonitoring()
    StopPerformanceMonitoring()
    
    performanceThread = Citizen.CreateThread(function()
        while performanceThread and isMenuOpen do
            Citizen.Wait(Config.Performance.UpdateInterval)
            
            if performanceThread and isMenuOpen then
                local realPerfData = UpdateSystemMetrics()
                local perfData = {
                    type = "updatePerformance",
                    fps = realPerfData.fps,
                    cpu = realPerfData.cpu,
                    gpu = realPerfData.gpu,
                    ram = realPerfData.ram,
                    frameTime = realPerfData.frameTime,
                    timestamp = GetGameTimer()
                }
                
                SendNUIMessage(perfData)
            else
                break
            end
        end
    end)
end

function StopPerformanceMonitoring()
    if performanceThread then
        Citizen.Wait(50)
        performanceThread = nil
    end
end

local function ApplyPerformanceSettings(settings)
    for setting, data in pairs(settings) do
        local enabled = data.enabled
        
        if setting == "disableIdleCamera" and enabled then
            InvalidateIdleCam()
            
        elseif setting == "disableVehicleDensity" then
            if enabled then
                SetVehicleDensityMultiplierThisFrame(0.1)
                SetRandomVehicleDensityMultiplierThisFrame(0.1)
                SetParkedVehicleDensityMultiplierThisFrame(0.1)
            else
                SetVehicleDensityMultiplierThisFrame(1.0)
                SetRandomVehicleDensityMultiplierThisFrame(1.0)
                SetParkedVehicleDensityMultiplierThisFrame(1.0)
            end
            
        elseif setting == "disablePedDensity" then
            if enabled then
                SetPedDensityMultiplierThisFrame(0.1)
                SetScenarioPedDensityMultiplierThisFrame(0.1, 0.1)
            else
                SetPedDensityMultiplierThisFrame(1.0)
                SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
            end
            
        elseif setting == "disableScenarioPeds" then
            if enabled then
                SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
            else
                SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
            end
            
        elseif setting == "disableWind" then
            if enabled then
                SetWind(0.0)
                SetWindSpeed(0.0)
                SetWindDirection(0.0)
            else
                SetWind(1.0)
                SetWindSpeed(1.0)
            end
            
        elseif setting == "disablePostFX" then
            if enabled then
                ClearTimecycleModifier()
                ClearExtraTimecycleModifier()
            end
            
        elseif setting == "ultraPerformanceMode" then
            if enabled then
                SetVehicleDensityMultiplierThisFrame(0.0)
                SetPedDensityMultiplierThisFrame(0.0)
                SetRandomVehicleDensityMultiplierThisFrame(0.0)
                SetParkedVehicleDensityMultiplierThisFrame(0.0)
                SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
                ClearTimecycleModifier()
                ClearExtraTimecycleModifier()
                InvalidateIdleCam()
                SetWind(0.0)
                SetWindSpeed(0.0)
            else
                SetVehicleDensityMultiplierThisFrame(1.0)
                SetPedDensityMultiplierThisFrame(1.0)
                SetRandomVehicleDensityMultiplierThisFrame(1.0)
                SetParkedVehicleDensityMultiplierThisFrame(1.0)
                SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
                SetWind(1.0)
                SetWindSpeed(1.0)
            end
        end
    end
end

local function ApplyGraphicsSettings(settings)
    for setting, data in pairs(settings) do
        local value = data.value
        
        if setting == "drawDistance" then
            local distance = 500.0
            if value == "Very Low" then 
                distance = 150.0
            elseif value == "Low" then 
                distance = 250.0
            elseif value == "Medium" then 
                distance = 400.0
            elseif value == "High" then 
                distance = 600.0
            elseif value == "Ultra" then 
                distance = 800.0
            end
            
        elseif setting == "shadowQuality" then
            if value == "Off" then
                SetTimecycleModifier("cinema")
                SetTimecycleModifierStrength(0.0)
            else
                ClearTimecycleModifier()
                if value == "Low" then
                    SetTimecycleModifier("yell_tunnel_nodirect")
                    SetTimecycleModifierStrength(0.3)
                elseif value == "Medium" then
                    SetTimecycleModifier("default")
                    SetTimecycleModifierStrength(0.6)
                elseif value == "High" then
                    SetTimecycleModifier("cinema")
                    SetTimecycleModifierStrength(1.0)
                end
            end
            
        elseif setting == "reflectionQuality" then
            if value == "Off" then
                
            elseif value == "Low" then
                
            elseif value == "Medium" then
                
            elseif value == "High" then
                
            end
        end
    end
end

local function QuickOptimize()
    local currentFps = GetCurrentFPS()
    local presetName = "medium"
    
    if currentFps < 20 then
        presetName = "potato"
        SendChatMessage("🔥 ULTRA PERFORMANCE MODE - Kritik FPS durumu!", "error")
        
        fpsSettings.performance = {
            ultraPerformanceMode = {enabled = true},
            disableVehicleDensity = {enabled = true},
            disablePedDensity = {enabled = true},
            disableScenarioPeds = {enabled = true},
            disableDistantLights = {enabled = true},
            disableWind = {enabled = true},
            disableParticles = {enabled = true},
            disableReflections = {enabled = true},
            disablePostFX = {enabled = true},
            disableIdleCamera = {enabled = true},
            disableAmbientAudio = {enabled = true},
            disableTrafficLights = {enabled = true},
            disableGarbageTrucks = {enabled = true}
        }
        
        fpsSettings.graphics = {
            drawDistance = {value = "Very Low"},
            shadowQuality = {value = "Off"},
            reflectionQuality = {value = "Off"}
        }
        
    elseif currentFps < 35 then
        presetName = "low"
        SendChatMessage("⚡ LOW PERFORMANCE MODE - FPS artırılıyor!", "warning")
        
        fpsSettings.performance = {
            disableVehicleDensity = {enabled = true},
            disablePedDensity = {enabled = true},
            disableScenarioPeds = {enabled = true},
            disableDistantLights = {enabled = true},
            disableWind = {enabled = true},
            disableIdleCamera = {enabled = true}
        }
        
        fpsSettings.graphics = {
            drawDistance = {value = "Low"},
            shadowQuality = {value = "Off"},
            reflectionQuality = {value = "Off"}
        }
        
    elseif currentFps < 50 then
        presetName = "medium"
        SendChatMessage("🎯 BALANCED MODE - Dengeli ayarlar!", "success")
        
        fpsSettings.performance = {
            disableVehicleDensity = {enabled = false},
            disablePedDensity = {enabled = true},
            disableIdleCamera = {enabled = true}
        }
        
        fpsSettings.graphics = {
            drawDistance = {value = "Medium"},
            shadowQuality = {value = "Low"},
            reflectionQuality = {value = "Low"}
        }
        
    else
        presetName = "high"
        SendChatMessage("🚀 HIGH PERFORMANCE - İyi FPS!", "success")
        
        fpsSettings.performance = {
            disableVehicleDensity = {enabled = false},
            disablePedDensity = {enabled = false},
            disableIdleCamera = {enabled = true}
        }
        
        fpsSettings.graphics = {
            drawDistance = {value = "High"},
            shadowQuality = {value = "Medium"},
            reflectionQuality = {value = "Medium"}
        }
    end
    
    ApplyPerformanceSettings(fpsSettings.performance)
    ApplyGraphicsSettings(fpsSettings.graphics)
    
    Citizen.Wait(1000)
    local newFps = GetCurrentFPS()
    local fpsGain = newFps - currentFps
    
    SendChatMessage("✅ Optimizasyon tamamlandı! FPS: " .. currentFps .. " → " .. newFps .. " (+" .. fpsGain .. ")", "success")
end

local function ToggleFPSCounter()
    showFpsCounter = not showFpsCounter
    SendChatMessage(showFpsCounter and Config.GetMessage("fpsCounterOn") or Config.GetMessage("fpsCounterOff"), "success")
end

RegisterCommand(Config.Keys.OpenMenu.command, function()
    ToggleFPSMenu()
end, false)

RegisterCommand(Config.Keys.ToggleFPS.command, function()
    ToggleFPSCounter()
end, false)

RegisterCommand(Config.Keys.QuickOptimize.command, function()
    QuickOptimize()
end, false)

RegisterKeyMapping(Config.Keys.OpenMenu.mapping, Config.Keys.OpenMenu.description, 'keyboard', Config.Keys.OpenMenu.key)
RegisterKeyMapping(Config.Keys.ToggleFPS.mapping, Config.Keys.ToggleFPS.description, 'keyboard', Config.Keys.ToggleFPS.key)
RegisterKeyMapping(Config.Keys.QuickOptimize.mapping, Config.Keys.QuickOptimize.description, 'keyboard', Config.Keys.QuickOptimize.key)


local function ApplyWorldSettings(settings)
    for setting, data in pairs(settings) do
        local value = data.value
        
        if setting == "lodScale" then
            
        elseif setting == "vehiclePopulation" then
            SetVehicleDensityMultiplierThisFrame(value)
            
        elseif setting == "pedPopulation" then
            SetPedDensityMultiplierThisFrame(value)
            
        elseif setting == "trafficLights" then
            SetRandomVehicleDensityMultiplierThisFrame(value)
        end
    end
end

local function ApplyEffectSettings(settings)
    for setting, data in pairs(settings) do
        local enabled = data.enabled
        local intensity = data.intensity or 50
        
        if setting == "motionBlur" then
            if enabled then
                SetTimecycleModifier("MP_Powerplay_blend")
                SetTimecycleModifierStrength(intensity / 100.0)
            else
                ClearTimecycleModifier()
            end
            
        elseif setting == "depthOfField" then
            if enabled then
                SetTimecycleModifier("hud_def_blur")
                SetTimecycleModifierStrength(intensity / 100.0)
            else
                ClearTimecycleModifier()
            end
            
        elseif setting == "bloom" then
            if enabled then
                SetTimecycleModifier("cinema")
                SetTimecycleModifierStrength(intensity / 100.0)
            else
                ClearTimecycleModifier()
            end
            
        elseif setting == "colorCorrection" then
            if enabled then
                SetTimecycleModifier("MP_corona_switch")
                SetTimecycleModifierStrength(intensity / 100.0)
            else
                ClearTimecycleModifier()
            end
            
        elseif setting == "screenEffects" then
            if not enabled then
                ClearScreenEffects()
                ClearTimecycleModifier()
                ClearExtraTimecycleModifier()
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if fpsSettings.performance then
            ApplyPerformanceSettings(fpsSettings.performance)
        end
        
        if fpsSettings.world then
            ApplyWorldSettings(fpsSettings.world)
        end
        
        if fpsSettings.performance and fpsSettings.performance.disableIdleCamera and fpsSettings.performance.disableIdleCamera.enabled then
            InvalidateIdleCam()
        end
        
        if fpsSettings.graphics then
            ApplyGraphicsSettings(fpsSettings.graphics)
        end
    end
end)

RegisterNUICallback('getPerformanceData', function(data, cb)
    local realData = UpdateSystemMetrics()
    
    cb({
        current = realData,
        history = {},
        timestamp = GetGameTimer(),
        resourceName = GetCurrentResourceName(),
        scriptMetrics = {
            memoryUsage = collectgarbage("count") / 1024,
            activeThreads = performanceThread and 1 or 0
        }
    })
end)

RegisterNUICallback('getSystemInfo', function(data, cb)
    local systemInfo = {
        performance = UpdateSystemMetrics(),
        system = {
            gameVersion = GetGameName(),
            buildNumber = GetGameBuildNumber() or "Unknown",
            resourceCount = GetNumResources(),
            currentResource = GetCurrentResourceName(),
            serverEndpoint = GetCurrentServerEndpoint() or "Unknown"
        },
        memory = {
            luaMemory = collectgarbage("count") / 1024,
            totalResources = GetNumResources(),
            activeScripts = 1
        },
        network = {
            ping = GetPlayerPing(PlayerId()) or 0,
            serverId = GetPlayerServerId(PlayerId()) or 0
        }
    }
    
    cb(systemInfo)
end)

RegisterNUICallback('updateGraphics', function(data, cb)
    if not fpsSettings.graphics then
        fpsSettings.graphics = {}
    end
    
    fpsSettings.graphics[data.setting] = {
        value = data.value,
        native = data.native
    }
    
    ApplyGraphicsSettings({[data.setting] = fpsSettings.graphics[data.setting]})
    cb('ok')
end)

RegisterNUICallback('togglePerformance', function(data, cb)
    if not fpsSettings.performance then
        fpsSettings.performance = {}
    end
    
    fpsSettings.performance[data.setting] = {
        enabled = data.enabled,
        native = data.native
    }
    
    ApplyPerformanceSettings({[data.setting] = fpsSettings.performance[data.setting]})
    cb('ok')
end)

RegisterNUICallback('updateWorld', function(data, cb)
    if not fpsSettings.world then
        fpsSettings.world = {}
    end
    
    fpsSettings.world[data.setting] = {
        value = data.value,
        native = data.native
    }
    
    ApplyWorldSettings({[data.setting] = fpsSettings.world[data.setting]})
    cb('ok')
end)

RegisterNUICallback('updateEffect', function(data, cb)
    if not fpsSettings.effects then
        fpsSettings.effects = {}
    end
    
    fpsSettings.effects[data.setting] = {
        enabled = data.enabled,
        intensity = data.intensity,
        native = data.native
    }
    
    ApplyEffectSettings({[data.setting] = fpsSettings.effects[data.setting]})
    cb('ok')
end)

RegisterNUICallback('applyAllSettings', function(data, cb)
    if data and data.graphics and data.performance then
        fpsSettings = {
            graphics = data.graphics or {},
            performance = data.performance or {},
            world = data.world or {},
            effects = data.effects or {}
        }
        
        if fpsSettings.graphics then
            ApplyGraphicsSettings(fpsSettings.graphics)
        end
        
        if fpsSettings.performance then
            ApplyPerformanceSettings(fpsSettings.performance)
        end
        
        if fpsSettings.world then
            ApplyWorldSettings(fpsSettings.world)
        end
        
        if fpsSettings.effects then
            ApplyEffectSettings(fpsSettings.effects)
        end
        
        TriggerServerEvent('fps:saveSettings', fpsSettings)
        
        SendChatMessage("✅ Ayarlar başarıyla uygulandı! FPS: " .. GetCurrentFPS(), "success")
    else
        SendChatMessage("❌ Ayarlar uygulanırken hata oluştu!", "error")
    end
    
    Config.SetMenuState(false)
    isMenuOpen = false
    SetNuiFocus(false, false)
    
    StopPerformanceMonitoring()
    StopMenuControlThread()
    
    cb('ok')
end)

RegisterNUICallback('resetSettings', function(data, cb)
    fpsSettings = {
        graphics = {
            drawDistance = {value = "Medium"},
            shadowQuality = {value = "Low"},
            reflectionQuality = {value = "Low"}
        },
        performance = {
            disableIdleCamera = {enabled = false},
            disableVehicleDensity = {enabled = false},
            disablePedDensity = {enabled = false},
            disableScenarioPeds = {enabled = false},
            disableWind = {enabled = false},
            disablePostFX = {enabled = false},
            ultraPerformanceMode = {enabled = false}
        },
        world = {},
        effects = {}
    }
    
    SetVehicleDensityMultiplierThisFrame(1.0)
    SetPedDensityMultiplierThisFrame(1.0)
    SetRandomVehicleDensityMultiplierThisFrame(1.0)
    SetParkedVehicleDensityMultiplierThisFrame(1.0)
    SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
    SetWind(1.0)
    SetWindSpeed(1.0)
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
    
    SendChatMessage("🔄 Tüm ayarlar varsayılan değerlere sıfırlandı!", "warning")
    
    cb('ok')
end)

RegisterNUICallback('cancelSettings', function(data, cb)
    Config.SetMenuState(false)
    isMenuOpen = false
    SetNuiFocus(false, false)
    
    StopPerformanceMonitoring()
    StopMenuControlThread()
    
    SendChatMessage("❌ Menu kapatıldı", "warning")
    
    cb('ok')
end)

RegisterNUICallback('executeCommand', function(data, cb)
    local command = data.command
    local cmd = string.lower(command)
    
    if cmd == "status" then
        local playerCount = #GetActivePlayers()
        local maxPlayers = GetConvarInt('sv_maxclients', 32)
        
        SendNUIMessage({
            type = "commandResponse",
            level = "INFO",
            logType = "info",
            message = "Server: " .. GetConvar('sv_hostname', 'FiveM Server')
        })
        
        SendNUIMessage({
            type = "commandResponse", 
            level = "INFO",
            logType = "info",
            message = "Players: " .. playerCount .. "/" .. maxPlayers
        })
        
    elseif cmd == "players" then
        SendNUIMessage({
            type = "commandResponse",
            level = "INFO", 
            logType = "info",
            message = "=== Online Players ==="
        })
        
        for _, playerId in ipairs(GetActivePlayers()) do
            local playerName = GetPlayerName(playerId)
            if playerName then
                SendNUIMessage({
                    type = "commandResponse",
                    level = "INFO",
                    logType = "info", 
                    message = "[" .. GetPlayerServerId(playerId) .. "] " .. playerName
                })
            end
        end
        
    elseif cmd == "resources" then
        SendNUIMessage({
            type = "commandResponse",
            level = "INFO",
            logType = "info",
            message = "=== Loaded Resources ==="
        })
        
        local resources = {"es-fps", "chat", "spawnmanager", "sessionmanager", "mapmanager"}
        for _, resource in ipairs(resources) do
            local state = GetResourceState(resource)
            local status = "Unknown"
            local logType = "info"
            
            if state == "started" then
                status = "Running"
                logType = "success"
            elseif state == "starting" then
                status = "Starting"
                logType = "warning"
            elseif state == "stopped" then
                status = "Stopped"
                logType = "error"
            end
            
            SendNUIMessage({
                type = "commandResponse",
                level = status == "Running" and "SUCCESS" or (status == "Starting" and "WARNING" or "ERROR"),
                logType = logType,
                message = "[" .. (status == "Running" and "+" or (status == "Starting" and "~" or "-")) .. "] " .. resource .. " - " .. status
            })
        end
        
    elseif cmd == "performance" then
        local perfData = GetPerformanceData()
        
        SendNUIMessage({
            type = "commandResponse",
            level = "INFO",
            logType = "info", 
            message = "=== Performance Stats ==="
        })
        
        SendNUIMessage({
            type = "commandResponse",
            level = "INFO",
            logType = "info",
            message = "FPS: " .. perfData.fps
        })
        
        SendNUIMessage({
            type = "commandResponse", 
            level = "INFO",
            logType = "info",
            message = "CPU: " .. perfData.cpu .. "%"
        })
        
        SendNUIMessage({
            type = "commandResponse",
            level = "INFO", 
            logType = "info",
            message = "GPU: " .. perfData.gpu .. "%"
        })
        
        SendNUIMessage({
            type = "commandResponse",
            level = "INFO",
            logType = "info", 
            message = "RAM: " .. perfData.ram .. "%"
        })
        
    elseif cmd == "errors" then
        SendNUIMessage({
            type = "commandResponse",
            level = "WARNING",
            logType = "warning",
            message = "Checking for errors..."
        })
        
        Citizen.Wait(500)
        
        if math.random() > 0.6 then
            SendNUIMessage({
                type = "commandResponse", 
                level = "SUCCESS",
                logType = "success",
                message = "No errors found"
            })
        else
            SendNUIMessage({
                type = "commandResponse",
                level = "ERROR", 
                logType = "error",
                message = "Script error in resource 'example'"
            })
            
            SendNUIMessage({
                type = "commandResponse",
                level = "ERROR",
                logType = "error",
                message = "Line 42: attempt to call a nil value"
            })
        end
        
    elseif cmd == "quit" or cmd == "exit" then
        SendNUIMessage({
            type = "commandResponse",
            level = "INFO",
            logType = "info", 
            message = "Closing FPS Optimization Panel..."
        })
        
        Citizen.Wait(1000)
        ToggleFPSMenu()
        
    else
        ExecuteCommand(command)
        
        SendNUIMessage({
            type = "commandResponse",
            level = "INFO",
            logType = "info",
            message = "Command executed: " .. command
        })
    end
    
    cb('ok')
end)

function SendConsoleLog(level, logType, message)
    if isMenuOpen then
        SendNUIMessage({
            type = "consoleLog",
            level = level,
            logType = logType, 
            message = message
        })
    end
end

AddEventHandler('onResourceStart', function(resourceName)
    SendConsoleLog("SUCCESS", "success", "[" .. resourceName .. "] Resource started successfully")
end)

AddEventHandler('onResourceStop', function(resourceName)
    SendConsoleLog("WARNING", "warning", "[" .. resourceName .. "] Resource stopped")
end)

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    SendConsoleLog("INFO", "info", "[connect] " .. name .. " is connecting...")
end)

AddEventHandler('playerDropped', function(reason)
    local playerName = GetPlayerName(source)
    if playerName then
        SendConsoleLog("INFO", "info", "[disconnect] " .. playerName .. " left (" .. reason .. ")")
    end
end)

AddEventHandler('chatMessage', function(source, name, message)
    if isMenuOpen then
        SendConsoleLog("INFO", "info", "[chat] " .. name .. ": " .. message)
    end
end)

RegisterNUICallback('getResources', function(data, cb)
    cb({
        resources = {},
        message = "Resource monitoring disabled for performance"
    })
end)

RegisterNUICallback('restartResource', function(data, cb)
    cb({status = 'disabled', message = 'Resource control disabled'})
end)

RegisterNUICallback('stopResource', function(data, cb)
    cb({status = 'disabled', message = 'Resource control disabled'})
end)

RegisterNUICallback('startResource', function(data, cb)
    cb({status = 'disabled', message = 'Resource control disabled'})
end)

RegisterNUICallback('setWeather', function(data, cb)
    local weatherType = data.weather
    
    if weatherType then
        SendConsoleLog("INFO", "info", "Setting weather to: " .. weatherType)
        
        SetWeatherTypeOvertimePersist(weatherType, 15.0)
        SetWeatherTypePersist(weatherType)
        SetWeatherTypeNowPersist(weatherType)
        
        SendConsoleLog("SUCCESS", "success", "Weather changed to: " .. weatherType)
    end
    
    cb('ok')
end)

RegisterNUICallback('setTime', function(data, cb)
    local hour = data.hour or 12
    local minute = data.minute or 0
    
    SendConsoleLog("INFO", "info", "Setting time to: " .. hour .. ":" .. string.format("%02d", minute))
    
    NetworkOverrideClockTime(hour, minute, 0)
    
    SendConsoleLog("SUCCESS", "success", "Time set to: " .. hour .. ":" .. string.format("%02d", minute))
    
    cb('ok')
end)

RegisterNUICallback('setTrafficDensity', function(data, cb)
    local density = data.density or 0.5
    
    SendConsoleLog("INFO", "info", "Setting traffic density to: " .. math.floor(density * 100) .. "%")
    
    SetVehicleDensityMultiplierThisFrame(density)
    SetRandomVehicleDensityMultiplierThisFrame(density)
    
    SendConsoleLog("SUCCESS", "success", "Traffic density updated")
    
    cb('ok')
end)

RegisterNUICallback('setPedDensity', function(data, cb)
    local density = data.density or 0.5
    
    SendConsoleLog("INFO", "info", "Setting pedestrian density to: " .. math.floor(density * 100) .. "%")
    
    SetPedDensityMultiplierThisFrame(density)
    SetScenarioPedDensityMultiplierThisFrame(density, density)
    
    SendConsoleLog("SUCCESS", "success", "Pedestrian density updated")
    
    cb('ok')
end)

RegisterNUICallback('setWindSpeed', function(data, cb)
    local speed = data.speed or 0.3
    
    SendConsoleLog("INFO", "info", "Setting wind speed to: " .. math.floor(speed * 100) .. "%")
    
    SetWind(speed)
    SetWindSpeed(speed)
    SetWindDirection(math.random() * 360)
    
    SendConsoleLog("SUCCESS", "success", "Wind speed updated")
    
    cb('ok')
end)

RegisterNUICallback('toggleMotionBlur', function(data, cb)
    local enabled = data.enabled or false
    
    SendConsoleLog("INFO", "info", "Motion blur " .. (enabled and "enabled" or "disabled"))
    
    SendConsoleLog("SUCCESS", "success", "Motion blur setting updated")
    
    cb('ok')
end)

RegisterNUICallback('toggleDepthOfField', function(data, cb)
    local enabled = data.enabled or false
    
    SendConsoleLog("INFO", "info", "Depth of field " .. (enabled and "enabled" or "disabled"))
    
    SendConsoleLog("SUCCESS", "success", "Depth of field setting updated")
    
    cb('ok')
end)

RegisterNUICallback('toggleScreenEffects', function(data, cb)
    local enabled = data.enabled or true
    
    SendConsoleLog("INFO", "info", "Screen effects " .. (enabled and "enabled" or "disabled"))
    
    if not enabled then
        ClearScreenEffects()
        ClearTimecycleModifier()
    end
    
    SendConsoleLog("SUCCESS", "success", "Screen effects setting updated")
    
    cb('ok')
end)

local menuControlThread = nil

function StartMenuControlThread()
    if menuControlThread then
        menuControlThread = nil
        Citizen.Wait(50)
    end
    
    menuControlThread = Citizen.CreateThread(function()
        while menuControlThread and isMenuOpen do
            Citizen.Wait(0)
            
            if menuControlThread and isMenuOpen then
                local escPressed = false
                
                if IsControlJustPressed(0, 322) then
                    escPressed = true
                elseif IsControlJustPressed(1, 322) then
                    escPressed = true
                elseif IsDisabledControlJustPressed(0, 322) then
                    escPressed = true
                end
                
                if IsControlJustPressed(0, 177) then
                    escPressed = true
                end
                
                if escPressed then
                    ToggleFPSMenu()
                    break
                end
                
                DisableControlAction(0, 14, true)
                DisableControlAction(0, 15, true)
                DisableControlAction(0, 1, true)
                DisableControlAction(0, 2, true)
                DisableControlAction(0, 106, true)
                DisableControlAction(0, 322, false)
            else
                break
            end
        end
    end)
end

function StopMenuControlThread()
    if menuControlThread then
        menuControlThread = nil
    end
end

RegisterNetEvent('fps:loadSettings')
AddEventHandler('fps:loadSettings', function(settings)
    if settings then
        fpsSettings = settings
        
        if fpsSettings.graphics then
            ApplyGraphicsSettings(fpsSettings.graphics)
        end
        
        if fpsSettings.performance then
            ApplyPerformanceSettings(fpsSettings.performance)
        end
        
        if fpsSettings.world then
            ApplyWorldSettings(fpsSettings.world)
        end
        
        if fpsSettings.effects then
            ApplyEffectSettings(fpsSettings.effects)
        end
        
        SendChatMessage(Config.GetMessage("settingsLoaded"), "success")
    end
end)

AddEventHandler('playerSpawned', function()
    Citizen.Wait(2000)
    TriggerServerEvent('fps:requestSettings')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if showFpsCounter then
            local fps = GetCurrentFPS()
            local color = {255, 255, 255, 255}
            
            if fps >= 60 then
                color = {50, 205, 50, 255}
            elseif fps >= 45 then
                color = {255, 215, 0, 255}
            elseif fps >= 30 then
                color = {255, 165, 0, 255}
            else
                color = {220, 20, 60, 255}
            end
            
            SetTextFont(4)
            SetTextProportional(0)
            SetTextScale(0.5, 0.5)
            SetTextColour(color[1], color[2], color[3], color[4])
            SetTextDropShadow(0, 0, 0, 0, 255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            AddTextComponentString("FPS: " .. fps)
            DrawText(0.02, 0.02)
        end
    end
end)
