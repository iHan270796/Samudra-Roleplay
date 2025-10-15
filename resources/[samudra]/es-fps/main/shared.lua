-- FPS Optimization Panel - Shared Configuration
Config = {}

-- Menu Ayarları
Config.Menu = {
    -- Varsayılan açılma tuşu
    DefaultKey = 'F7',
    
    -- Menu komut adı
    Command = 'fps',
    
    -- Menu başlığı
    Title = 'FPS OPTIMIZATION PANEL',
    
    -- Açılma/Kapanma animasyon süresi (ms)
    AnimationDuration = 300,
    
    -- Menu boyutları
    Width = 960,  -- 60rem * 16px
    Height = 600,
    
    -- ESC ile kapatma
    CloseWithEscape = true,
    
    -- Mouse scroll devre dışı bırakma
    DisableMouseScroll = true
}

-- Tuş Ayarları
Config.Keys = {
    -- Ana menu tuşu
    OpenMenu = {
        key = 'F7',
        description = 'Panel Pengoptimalan FPS',
        command = 'fps',
        mapping = 'fps'
    },
    
    -- Hızlı FPS gösterge tuşu
    ToggleFPS = {
        key = 'F8',
        description = 'Indikator FPS Hidup/Mati',
        command = 'showfps',
        mapping = 'showfps'
    },
    
    -- Hızlı optimizasyon tuşu
    QuickOptimize = {
        key = 'F9',
        description = 'Optimasi Cepat',
        command = 'quickopt',
        mapping = 'quickopt'
    }
}

-- Menu Durumu
Config.MenuState = {
    isOpen = false,
    currentTab = 'graphics',
    lastUpdate = 0
}

-- Performans Ayarları
Config.Performance = {
    -- FPS güncelleme sıklığı (ms)
    UpdateInterval = 1000,
    
    -- Performans izleme thread sıklığı (ms)
    MonitorInterval = 0,
    
    -- Optimizasyon preset'leri
    Presets = {
        potato = {
            name = "Patates PC",
            description = "En düşük ayarlar, maksimum performans",
            graphics = {
                drawDistance = "Very Low",
                shadowQuality = "Off",
                reflectionQuality = "Off"
            },
            performance = {
                disableVehicleDensity = true,
                disablePedDensity = true,
                disableScenarioPeds = true,
                disableDistantLights = true,
                disableWind = true,
                disableParticles = true,
                disableReflections = true,
                disablePostFX = true,
                disableIdleCamera = true,
                disableAmbientAudio = true,
                disableTrafficLights = true,
                disableGarbageTrucks = true
            }
        },
        
        low = {
            name = "Düşük",
            description = "Düşük ayarlar, iyi performans",
            graphics = {
                drawDistance = "Low",
                shadowQuality = "Off",
                reflectionQuality = "Off"
            },
            performance = {
                disableVehicleDensity = true,
                disablePedDensity = true,
                disableScenarioPeds = true,
                disableDistantLights = true,
                disableWind = true
            }
        },
        
        medium = {
            name = "Orta",
            description = "Dengeli ayarlar",
            graphics = {
                drawDistance = "Medium",
                shadowQuality = "Low",
                reflectionQuality = "Low"
            },
            performance = {
                disableVehicleDensity = false,
                disablePedDensity = true,
                disableIdleCamera = true
            }
        },
        
        high = {
            name = "Yüksek",
            description = "Yüksek kalite ayarları",
            graphics = {
                drawDistance = "High",
                shadowQuality = "Medium",
                reflectionQuality = "Medium"
            },
            performance = {
                disableIdleCamera = true
            }
        },
        
        ultra = {
            name = "Ultra",
            description = "Maksimum kalite",
            graphics = {
                drawDistance = "Ultra",
                shadowQuality = "High",
                reflectionQuality = "High"
            },
            performance = {}
        }
    }
}

-- Console Ayarları
Config.Console = {
    -- Maksimum log sayısı
    MaxLogs = 100,
    
    -- Log seviyeleri
    LogLevels = {
        'INFO',
        'WARNING', 
        'ERROR',
        'SUCCESS',
        'COMMAND'
    },
    
    -- Hızlı komutlar
    QuickCommands = {
        'status',
        'players',
        'resources',
        'performance',
        'errors',
        'clear',
        'help'
    }
}

-- Resource Monitor Ayarları
Config.ResourceMonitor = {
    -- Güncelleme sıklığı (ms)
    UpdateInterval = 5000,
    
    -- Resmon uyarı seviyeleri (ms)
    WarningLevels = {
        low = 5.0,
        medium = 15.0,
        high = 25.0
    },
    
    -- Memory uyarı seviyeleri (MB)
    MemoryLevels = {
        low = 20.0,
        medium = 50.0,
        high = 100.0
    }
}

-- Weather & Time Ayarları
Config.Weather = {
    -- Mevcut hava türleri
    Types = {
        'CLEAR',
        'CLOUDS', 
        'RAIN',
        'THUNDER',
        'FOG',
        'SNOW',
        'SMOG',
        'OVERCAST'
    },
    
    -- Varsayılan hava
    Default = 'CLEAR',
    
    -- Hava değişim süresi (saniye)
    TransitionTime = 15.0
}

-- Mesajlar
Config.Messages = {
    menuOpened = "FPS Optimizasyon Paneli açıldı",
    menuClosed = "FPS Optimizasyon Paneli kapatıldı", 
    settingsApplied = "Ayarlar başarıyla uygulandı!",
    settingsSaved = "Ayarlar kaydedildi",
    settingsLoaded = "Ayarlar yüklendi",
    quickOptimized = "Hızlı optimizasyon uygulandı",
    fpsCounterOn = "FPS göstergesi açıldı",
    fpsCounterOff = "FPS göstergesi kapatıldı",
    presetApplied = "Preset uygulandı: ",
    commandExecuted = "Komut çalıştırıldı: ",
    resourceRestarted = "Resource yeniden başlatıldı: ",
    resourceStopped = "Resource durduruldu: ",
    resourceStarted = "Resource başlatıldı: ",
    weatherChanged = "Hava değiştirildi: ",
    timeChanged = "Zaman değiştirildi: "
}

-- Debug Ayarları
Config.Debug = {
    enabled = false,
    logLevel = 'INFO',
    showPerformanceMetrics = false
}

-- Fonksiyonlar
function Config.GetPreset(presetName)
    return Config.Performance.Presets[presetName]
end

function Config.IsValidWeather(weatherType)
    for _, weather in pairs(Config.Weather.Types) do
        if weather == weatherType then
            return true
        end
    end
    return false
end

function Config.GetMessage(key, ...)
    local message = Config.Messages[key]
    if message and ... then
        return string.format(message, ...)
    end
    return message or key
end

function Config.DebugPrint(message, level)
    if Config.Debug.enabled then
        local prefix = "[FPS-DEBUG]"
        if level == "ERROR" then
            prefix = "^1" .. prefix .. "^7"
        elseif level == "WARNING" then  
            prefix = "^3" .. prefix .. "^7"
        elseif level == "SUCCESS" then
            prefix = "^2" .. prefix .. "^7"
        else
            prefix = "^5" .. prefix .. "^7"
        end
        print(prefix .. " " .. tostring(message))
    end
end

-- Menu State Management
function Config.SetMenuState(isOpen, tab)
    Config.MenuState.isOpen = isOpen
    if tab then
        Config.MenuState.currentTab = tab
    end
    Config.MenuState.lastUpdate = GetGameTimer()
    
    Config.DebugPrint("Menu state changed: " .. (isOpen and "OPEN" or "CLOSED") .. " | Tab: " .. (tab or Config.MenuState.currentTab))
end

function Config.GetMenuState()
    return Config.MenuState.isOpen, Config.MenuState.currentTab
end

function Config.ToggleMenuState()
    local newState = not Config.MenuState.isOpen
    Config.SetMenuState(newState)
    return newState
end

-- Export functions for other scripts
exports('getConfig', function()
    return Config
end)

exports('getMenuState', function()
    return Config.GetMenuState()
end)

exports('setMenuState', function(isOpen, tab)
    Config.SetMenuState(isOpen, tab)
end)
