local isNewPlayer = false

RegisterNetEvent("deanix_newplayer:startCountdown", function(remainingTime)
    if remainingTime <= 0 then return end
    isNewPlayer = true

    exports["deanix_textui"]:ShowCountdown(
        "SELAMAT-DATANG",
        "🆂🅰🅼🆄🅳🆁🅰 🆁🅾🅻🅴🅿🅻🅰🆈\nAnda Harus Bermain Di Server Ini Dalam Waktu Yang Di tentukan.",
        remainingTime
    )

    local countdown = remainingTime
    local start = GetGameTimer()

    CreateThread(function()
        while countdown > 0 do
            local now = GetGameTimer()
            local elapsed = math.floor((now - start) / 1000)
            local timeLeft = countdown - elapsed

            if timeLeft <= 0 then
                isNewPlayer = false
                exports["deanix_textui"]:Close()
                break
            end

            Wait(1000)
        end
    end)
end)

CreateThread(function()
    while true do
        Wait(0)
        if isNewPlayer then
            local playerPed = PlayerPedId()
            DisableControlAction(0, 24, true)   -- Attack
            DisableControlAction(0, 25, true)   -- Aim
            DisableControlAction(0, 68, true)   -- Vehicle Attack
            DisableControlAction(0, 69, true)   -- Vehicle Attack 2
            DisableControlAction(0, 70, true)   -- Vehicle Drive-by Control
            DisableControlAction(0, 91, true)   -- Vehicle Aim/Look Behind
            DisableControlAction(0, 92, true)   -- Vehicle Aim 2
            DisableControlAction(0, 263, true)  -- Disable melee attack
            DisableControlAction(0, 140, true)  -- Melee Attack Light (R)
            DisableControlAction(0, 141, true)  -- Melee Attack Heavy
            DisableControlAction(0, 142, true)  -- Melee Alternate Attack
            DisableControlAction(0, 143, true)  -- Melee Block
            DisablePlayerFiring(playerPed, true) -- Disable firing in general
        else
            Wait(1000)
        end
    end
end)


CreateThread(function()
    Wait(3000)
    TriggerServerEvent("deanix_newplayer:playerLoaded")
end)
