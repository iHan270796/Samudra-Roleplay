local countdownThread = nil
local countdownActive = false

function Show(title, content)
    SendNUIMessage({
        action = "open",
        title = title,
        content = content
    })
end

function Show3(title, content1, content2)
    SendNUIMessage({
        action = "open",
        title = title,
        content = content1,
        content3 = content2 -- baris ketiga
    })
end

function Close()
    SendNUIMessage({
        action = "close",
    })
end

--tambahan

function ShowCountdown(title, text, duration)
    StopCountdown() -- pastikan tidak tumpang tindih
    countdownActive = true

    local remaining = duration

    countdownThread = CreateThread(function()
        while remaining > 0 and countdownActive do
            SendNUIMessage({
                action = "open",
                title = title,
                content = text,
                timerDuration = remaining
            })

            Wait(1000)
            remaining = remaining - 1
        end

        if countdownActive then
            SendNUIMessage({ action = "close" })
        end

        countdownActive = false
        countdownThread = nil
    end)
end

function StopCountdown()
    countdownActive = false
    SendNUIMessage({ action = "close" })
end

-- function ShowCountdown(title, text, duration)
--     if countdownThread then
--         StopCountdown() -- hentikan countdown sebelumnya
--     end

--     countdownThread = CreateThread(function()
--         local remaining = duration

--         while remaining > 0 do
--             local minutes = math.floor(remaining / 60)
--             local seconds = remaining % 60

--             SendNUIMessage({
--                 action = "open",
--                 title = title,
--                 content = text,
--                 timerDuration = remaining
--             })

--             Wait(1000)
--             remaining = remaining - 1
--         end

--         SendNUIMessage({ action = "close" })
--         countdownThread = nil
--     end)
-- end

-- function StopCountdown()
--     if countdownThread then
--         TerminateThread(countdownThread)
--         countdownThread = nil
--         SendNUIMessage({ action = "close" })
--     end
-- end

exports("Show", Show)
exports("Show3", Show3)
exports("Close", Close)
exports("ShowCountdown", ShowCountdown)
exports("StopCountdown", StopCountdown)