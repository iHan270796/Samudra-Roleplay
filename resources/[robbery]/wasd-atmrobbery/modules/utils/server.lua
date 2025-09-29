---
--[[ Contains server-side helper functions. ]]
---

local Utils = {}

function Utils.GetPoliceCount()
    local count = 0
    for _, playerId in ipairs(GetPlayers()) do
        local xPlayerJob = server.GetPlayerJob(tonumber(playerId))
        if xPlayerJob and Config.PoliceJobName[string.lower(xPlayerJob)] then
            count = count + 1
        end
    end
    return count
end

function Utils.debug(...)
    if not Config.debug then return end
    lib.print.info(...)
end

return Utils
