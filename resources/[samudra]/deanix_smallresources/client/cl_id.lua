Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DisableControlAction(0, 19, true) -- penting biar IsDisabledControlPressed bisa detect

        if IsDisabledControlPressed(0, 19) then
            local nearbyPlayers = GetNeareastPlayers()
            for k, v in pairs(nearbyPlayers) do
                local x, y, z = table.unpack(v.coords)
                DrawText3D2(x, y, z + 1.03, ('ID %s'):format(v.playerId))
                --DrawText3D2(x, y, z + 1.03, v.playerId .. '')
            end
        end
    end
end)


function GetNeareastPlayers()
    local players = {}

    for _, i in ipairs(GetActivePlayers()) do        -- do stuff
        table.insert(players, 
        { 
            playerName = GetPlayerName(i), 
            playerId = GetPlayerServerId(i), 
            coords = GetEntityCoords(GetPlayerPed(i)) 
        })
    end

    return players
end

function DrawText3D2(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pcoords = GetEntityCoords(PlayerPedId())
    local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
    local scale = 1.5 * (1 / dist) * (1 / GetGameplayCamFov()) * 100
    local playerTalking = NetworkIsPlayerTalking(PlayerId(-1))

    if GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1) < 5.5 and onScreen then

        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        if playerTalking then
            SetTextColour(0,255,255,255)
        else
            SetTextColour(255, 255, 255, 255)
        end
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextEdge(4, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end