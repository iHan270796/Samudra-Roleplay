-- Server-side HUD functionality
-- Handles player count, vehicle events, and stress management

-- Global state for player count
local playerCount = 0

-- Update player count thread
CreateThread(function()
    while true do
        GlobalState.playerCount = GetNumPlayerIndices()
        Wait(15000)
    end
end)

-- Vehicle entry/exit events
RegisterServerEvent("baseevents:enteredVehicle", function()
    TriggerClientEvent("izzy-hudv5:enteredVehicle", source)
end)

RegisterServerEvent("baseevents:leftVehicle", function()
    TriggerClientEvent("izzy-hudv5:leftVehicle", source)
end)

-- YouTube video info extraction
function getYouTubeVideoInfo(url)
    local promise = promise.new()
    
    PerformHttpRequest(url, function(statusCode, response, headers)
        if statusCode == 200 then
            local photo = string.match(response, '<meta property="og:image" content="(.-)">')
            local title = string.match(response, '<meta property="og:title" content="(.-)">')
            local author = string.match(response, '"ownerChannelName":"(.-)"')
            
            promise:resolve({
                photo = photo,
                title = title,
                author = author,
                url = url
            })
        else
            promise:resolve(false)
        end
    end, "GET", "", {
        ["Content-Type"] = "text/html"
    })
    
    return Citizen.Await(promise)
end

-- Sound management
local vehicleSounds = {}

RegisterNetEvent("izzy-hudv5:server:playSound", function(plate, soundData)
    if soundData and soundData.url then
        local videoInfo = getYouTubeVideoInfo(soundData.url)
        if videoInfo then
            soundData.photo = videoInfo.photo
            soundData.title = videoInfo.title
            soundData.author = videoInfo.author
        end
        
        soundData.maxDuration = 100
        soundData.name = plate
        vehicleSounds[plate] = soundData
        
        TriggerClientEvent("izzy-hudv5:client:playSound", -1, soundData)
    end
end)

RegisterNetEvent("izzy-hudv5:server:updateSound", function(soundData, shouldDelete, shouldStop)
    if shouldDelete then
        vehicleSounds[soundData.name] = nil
    else
        vehicleSounds[soundData.name] = soundData
    end
    
    if not shouldStop then
        TriggerClientEvent("izzy-hudv5:client:updateSound", -1, soundData)
    end
end)

-- Music data callback
izzy.registerCallback("izzy-hudv5:server:getMusicData", function(source, cb, url)
    local videoInfo = getYouTubeVideoInfo(url)
    cb(videoInfo or false)
end)

-- Get sound by plate callback
izzy.registerCallback("izzy-hudv5:server:getSoundByPlate", function(source, cb, plate)
    cb(vehicleSounds[plate])
end)

-- Get player name callback
izzy.registerCallback("izzy-hudv5:server:getName", function(source, cb)
    cb(getPlayerName(source))
end)

-- Stress system
local playerStress = {}

RegisterNetEvent("izzy-hudv5:server:gainStress", function(amount)
    local src = source
    local identifier = getIdentifier(src)
    
    if not identifier then return end
    
    if not playerStress[identifier] then
        playerStress[identifier] = 0
    end
    
    playerStress[identifier] = math.min(playerStress[identifier] + amount, 100)
    TriggerClientEvent("izzy-hudv5:client:setStress", src, playerStress[identifier])
end)

RegisterNetEvent("izzy-hudv5:server:relieveStress", function(amount)
    local src = source
    local identifier = getIdentifier(src)
    
    if not identifier then return end
    
    if not playerStress[identifier] then
        playerStress[identifier] = 0
    end
    
    playerStress[identifier] = math.max(playerStress[identifier] - amount, 0)
    TriggerClientEvent("izzy-hudv5:client:setStress", src, playerStress[identifier])
end)

-- Legacy stress events for compatibility
RegisterNetEvent("hud:server:GainStress", function(amount)
    TriggerClientEvent("izzy-hudv5:client:gainStress", source, amount)
end)

RegisterNetEvent("hud:server:RelieveStress", function(amount)
    TriggerClientEvent("izzy-hudv5:client:relieveStress", source, amount)
end)

-- Get stress callback
izzy.registerCallback("izzy-hudv5:getStress", function(source, cb)
    local identifier = getIdentifier(source)
    cb(playerStress[identifier] or 0)
end)