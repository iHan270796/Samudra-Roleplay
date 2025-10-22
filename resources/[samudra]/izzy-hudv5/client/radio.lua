-- Radio/Music System
-- Handles vehicle radio functionality and music playback

-- Update sound state (play/pause)
function updateSoundState()
    if current.sound then
        local soundInfo = exports.xsound:getInfo(current.sound.name)
        
        if not soundInfo then
            -- Sound doesn't exist, start playing
            exports.xsound:PlayUrl(current.sound.name, current.sound.url, 0.1, false)
            Wait(1000)
            exports.xsound:setTimeStamp(current.sound.name, current.sound.timeStamp or 0)
        else
            -- Toggle play/pause state
            current.sound.isPlaying = not current.sound.isPlaying
            current.sound.timeStamp = soundInfo.timeStamp
        end
        
        TriggerServerEvent("izzy-hudv5:server:updateSound", current.sound)
    else
        SendReactMessage("setRadio", nil)
  end
end

-- Play sound function
function playSound(soundData)
    soundData.timeStamp = 0
    soundData.isPlaying = true
    
    -- Normalize volume
    if soundData.volume then
        soundData.volume = soundData.volume / 100
    else
        soundData.volume = 0.1
    end
    
    local plate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false))
    TriggerServerEvent("izzy-hudv5:server:playSound", plate, soundData)
end

-- NUI Callbacks for music control
RegisterNUICallback("playMusic", function(data, cb)
    if current.sound and current.sound.url == data.url then
        updateSoundState()
    else
        playSound(data)
    end
    cb({ "ok" })
end)

RegisterNUICallback("updateSoundState", function(data, cb)
    updateSoundState()
    cb({ "ok" })
end)

-- Playlist management
RegisterNUICallback("getPlaylists", function(data, cb)
    local playlists = json.decode(GetResourceKvpString("playlists")) or {}
    cb(playlists)
end)

RegisterNUICallback("getFavoriteMusics", function(data, cb)
    local favorites = json.decode(GetResourceKvpString("favoriteMusics")) or {}
    cb(favorites)
end)

RegisterNUICallback("addPlaylist", function(data, cb)
    local playlists = json.decode(GetResourceKvpString("playlists")) or {}
    table.insert(playlists, data)
    SetResourceKvp("playlists", json.encode(playlists))
    SendReactMessage("setMusicData", { playlists = playlists })
    cb({ "ok" })
end)

RegisterNUICallback("editPlaylist", function(data, cb)
    local playlists = json.decode(GetResourceKvpString("playlists")) or {}
    local playlist = playlists[data.id + 1]
    if playlist then
        playlist.name = data.name
        playlist.description = data.description
        playlist.photo = data.photo
        SetResourceKvp("playlists", json.encode(playlists))
        SendReactMessage("setMusicData", { playlists = playlists })
    end
    cb({ "ok" })
end)

RegisterNUICallback("deletePlaylist", function(data, cb)
    local playlists = json.decode(GetResourceKvpString("playlists")) or {}
    local playlist = playlists[data + 1]
    if playlist then
        table.remove(playlists, data + 1)
        SetResourceKvp("playlists", json.encode(playlists))
        SendReactMessage("setMusicData", { playlists = playlists })
    end
    cb({ "ok" })
end)

RegisterNUICallback("deleteMusic", function(data, cb)
    local playlists = json.decode(GetResourceKvpString("playlists")) or {}
    local playlist = playlists[data.playlistId]
    
    if playlist then
        local music = playlist.musics[data.musicId]
        if music then
            -- Stop current music if it's the one being deleted
            if current.sound and music.url == current.sound.url then
                exports.xsound:Destroy(current.sound.name)
                TriggerServerEvent("izzy-hudv5:server:updateSound", 
                    GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)), 
                    true, true)
                SendReactMessage("setRadio", nil)
                current.sound = nil
            end
            
            table.remove(playlist.musics, data.musicId)
        end
    end
    
    SetResourceKvp("playlists", json.encode(playlists))
    SendReactMessage("setMusicData", { playlists = playlists })
    cb({ "ok" })
end)

RegisterNUICallback("addMusic", function(data, cb)
    local playlists = json.decode(GetResourceKvpString("playlists")) or {}
    local playlist = playlists[data.id + 1]
    
    if playlist then
        izzy.triggerCallback("izzy-hudv5:server:getMusicData", function(musicData)
            if musicData then
                table.insert(playlist.musics, musicData)
                SetResourceKvp("playlists", json.encode(playlists))
                SendReactMessage("setMusicData", { playlists = playlists })
            end
        end, data.url)
    end
    cb({ "ok" })
end)

-- Favorite music management
RegisterNUICallback("addFavorite", function(data, cb)
    local favorites = json.decode(GetResourceKvpString("favoriteMusics")) or {}
    table.insert(favorites, data)
    SetResourceKvp("favoriteMusics", json.encode(favorites))
    SendReactMessage("setMusicData", { favoriteMusics = favorites })
    cb({ "ok" })
end)

RegisterNUICallback("removeFavorite", function(data, cb)
    local favorites = json.decode(GetResourceKvpString("favoriteMusics")) or {}
    
    for i, favorite in pairs(favorites) do
        if favorite.url == data.url then
            table.remove(favorites, i)
      break
    end
    end
    
    SetResourceKvp("favoriteMusics", json.encode(favorites))
    SendReactMessage("setMusicData", { favoriteMusics = favorites })
    cb({ "ok" })
end)

-- Music navigation
RegisterNUICallback("previousMusic", function(data, cb)
    local musicList = current.sound and current.sound.favorite and 
        (json.decode(GetResourceKvpString("favoriteMusics")) or {}) or
        (json.decode(GetResourceKvpString("playlists")) or {})
    
    if #musicList > 0 then
        local targetList = current.sound and current.sound.favorite and musicList or
            musicList[current.sound.playlistId].musics
        
        local previousMusic = targetList[current.sound.musicId - 1]
        if previousMusic then
            previousMusic.playlistId = current.sound.playlistId
            previousMusic.musicId = current.sound.musicId - 1
            playSound(previousMusic)
        end
    end
    cb({ "ok" })
end)

RegisterNUICallback("nextMusic", function(data, cb)
    local musicList = current.sound and current.sound.favorite and 
        (json.decode(GetResourceKvpString("favoriteMusics")) or {}) or
        (json.decode(GetResourceKvpString("playlists")) or {})
    
    if #musicList > 0 then
        local targetList = current.sound and current.sound.favorite and musicList or
            musicList[current.sound.playlistId].musics
        
        local nextMusic = targetList[current.sound.musicId + 1]
        if nextMusic then
            nextMusic.playlistId = current.sound.playlistId
            nextMusic.musicId = current.sound.musicId + 1
            playSound(nextMusic)
      end
    end
    cb({ "ok" })
end)

RegisterNUICallback("updateVolume", function(data, cb)
    if current.sound then
        local soundInfo = exports.xsound:getInfo(current.sound.name)
        if soundInfo then
            exports.xsound:setVolume(current.sound.name, data / 100)
        end
    end
    cb({ "ok" })
end)

RegisterNUICallback("closeMusic", function(data, cb)
    if current.sound then
        local soundInfo = exports.xsound:getInfo(current.sound.name)
        if soundInfo then
            exports.xsound:Destroy(current.sound.name)
        end
        current.sound = nil
    end
    
    TriggerServerEvent("izzy-hudv5:server:updateSound", 
        GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false)), 
        true, true)
    SendReactMessage("setRadio", "{}")
    cb({ "ok" })
end)

-- Network events for sound synchronization
RegisterNetEvent("izzy-hudv5:client:playSound", function(soundData)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= 0 then
        local plate = GetVehicleNumberPlateText(vehicle)
        if plate == soundData.name then
            exports.xsound:PlayUrl(soundData.name, soundData.url, soundData.volume, false)
            current.sound = soundData
            SendReactMessage("setRadio", soundData)
        end
    end
end)

RegisterNetEvent("izzy-hudv5:client:updateSound", function(soundData)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= 0 then
        local plate = GetVehicleNumberPlateText(vehicle)
        if plate == soundData.name then
            local soundInfo = exports.xsound:getInfo(current.sound.name)
            
            if not soundInfo then
                if current.sound.isPlaying then
                    exports.xsound:PlayUrl(current.sound.name, current.sound.url, 0.1, false)
                    Wait(1000)
                    exports.xsound:setTimeStamp(current.sound.name, current.sound.timeStamp or 0)
    end
  end
            
            if not soundData.isPlaying then
                exports.xsound:Pause(soundData.name)
            else
                exports.xsound:Resume(soundData.name)
                exports.xsound:setTimeStamp(soundData.name, soundData.timeStamp)
            end
            
            SendReactMessage("setRadio", current.sound)
        end
      end
end)

-- Clear radio command
RegisterCommand(cfg.clearRadioCommand, function()
    if current.sound then
        local soundInfo = exports.xsound:getInfo(current.sound.name)
        if soundInfo then
            exports.xsound:Destroy(current.sound.name)
        end
        SendReactMessage("setRadio", "{}")
        current.sound = nil
    end
end)

-- Auto-advance music thread
CreateThread(function()
    while true do
        if current.sound then
            local maxDuration = 0
            local timeStamp = 0
            
            if exports.xsound:soundExists(current.sound.name) then
                maxDuration = exports.xsound:getMaxDuration(current.sound.name) or 0
                timeStamp = exports.xsound:getTimeStamp(current.sound.name) or 0
            end
            
            if exports.xsound:soundExists(current.sound.name) then
                SendReactMessage("setRadio", {
                    maxDuration = maxDuration,
                    timeStamp = timeStamp
                })
                
                -- Auto-advance to next song when current ends
                if maxDuration <= timeStamp then
                    if current.sound.musicId then
                        local musicList = current.sound.favorite and 
                            (json.decode(GetResourceKvpString("favoriteMusics")) or {}) or
                            (json.decode(GetResourceKvpString("playlists")) or {})
                        
                        if #musicList > 0 then
                            local targetList = current.sound.favorite and musicList or
                                musicList[current.sound.playlistId].musics
                            
                            local nextMusic = targetList[current.sound.musicId + 1]
                            if nextMusic then
                                nextMusic.playlistId = current.sound.playlistId
                                nextMusic.musicId = current.sound.musicId + 1
                                playSound(nextMusic)
                            else
                                -- Loop back to first song
                                local firstMusic = targetList[1]
                                if firstMusic then
                                    firstMusic.playlistId = current.sound.playlistId
                                    firstMusic.musicId = 1
                                    playSound(firstMusic)
              end
            end
          end
        end
      end
            end
            
            Wait(1000)
        else
            Wait(2000)
        end
    end
end)