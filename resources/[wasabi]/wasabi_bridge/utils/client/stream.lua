WSB.stream = {}

-- Load animation dictionary with timeout
function WSB.stream.animDict(dictName, timeoutMs)
    if not timeoutMs then
        timeoutMs = 5000
    end
    
    RequestAnimDict(dictName)
    local startTime = GetGameTimer()
    
    while not HasAnimDictLoaded(dictName) do
        Wait(0)
        
        local elapsedTime = GetGameTimer() - startTime
        if timeoutMs < elapsedTime then
            print("^0[^3WARNING^0] failed to load animation dictionary ^1" .. dictName .. "^0 after ^1" .. string.format("%.2f", elapsedTime) .. " MS^0")
            return false
        end
    end
    
    return true
end

-- Load animation set with timeout
function WSB.stream.animSet(setName, timeoutMs)
    if not timeoutMs then
        timeoutMs = 5000
    end
    
    RequestAnimSet(setName)
    local startTime = GetGameTimer()
    
    while not HasAnimSetLoaded(setName) do
        Wait(0)
        
        local elapsedTime = GetGameTimer() - startTime
        if timeoutMs < elapsedTime then
            print("^0[^3WARNING^0] failed to load animation set ^1" .. setName .. "^0 after ^1" .. string.format("%.2f", elapsedTime) .. " MS^0")
            return false
        end
    end
    
    return true
end

-- Load model with timeout
function WSB.stream.model(modelHash, timeoutMs)
    if not timeoutMs then
        timeoutMs = 5000
    end
    
    RequestModel(modelHash)
    local startTime = GetGameTimer()
    
    while not HasModelLoaded(modelHash) do
        Wait(0)
        
        local elapsedTime = GetGameTimer() - startTime
        if timeoutMs < elapsedTime then
            print("^0[^3WARNING^0] failed to load model ^1" .. modelHash .. "^0 after ^1" .. string.format("%.2f", elapsedTime) .. " MS^0")
            return false
        end
    end
    
    return true
end

-- Load weapon asset with timeout
function WSB.stream.weapon(weaponHash, timeoutMs)
    if not timeoutMs then
        timeoutMs = 5000
    end
    
    RequestWeaponAsset(weaponHash)
    local startTime = GetGameTimer()
    
    while not HasWeaponAssetLoaded(weaponHash) do
        Wait(0)
        
        local elapsedTime = GetGameTimer() - startTime
        if timeoutMs < elapsedTime then
            print("^0[^3WARNING^0] failed to load weaponType ^1" .. weaponHash .. "^0 after ^1" .. string.format("%.2f", elapsedTime) .. " MS^0")
            return false
        end
    end
    
    return true
end

-- Load particle effect asset with timeout
function WSB.stream.ptfx(assetName, timeoutMs)
    if not timeoutMs then
        timeoutMs = 5000
    end
    
    RequestNamedPtfxAsset(assetName)
    local startTime = GetGameTimer()
    
    while not HasNamedPtfxAssetLoaded(assetName) do
        Wait(0)
        
        local elapsedTime = GetGameTimer() - startTime
        if timeoutMs < elapsedTime then
            print("^0[^3WARNING^0] failed to load PtfxAsset ^1" .. assetName .. "^0 after ^1" .. string.format("%.2f", elapsedTime) .. " MS^0")
            return false
        end
    end
    
    return true
end

-- Load scaleform movie with timeout
function WSB.stream.scaleform(movieName, timeoutMs)
    if not timeoutMs then
        timeoutMs = 5000
    end
    
    local scaleformHandle = RequestScaleformMovie(movieName)
    local startTime = GetGameTimer()
    
    while not HasScaleformMovieLoaded(scaleformHandle) do
        Wait(0)
        
        local elapsedTime = GetGameTimer() - startTime
        if timeoutMs < elapsedTime then
            print("^0[^3WARNING^0] failed to load ScaleForm ^1" .. movieName .. "^0 after ^1" .. string.format("%.2f", elapsedTime) .. " MS^0")
            return false
        end
    end
    
    return scaleformHandle
end