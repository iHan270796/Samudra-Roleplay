-- Get player by source
---@return number PlayerIdentifier
function server.GetPlayer(source)
    return exports.qbx_core:GetPlayer(source)
end

-- Give money to player
---@return boolean
function server.PlayerAddMoney(source, type, amount)
    local xPlayer = server.GetPlayer(source)
    if xPlayer then
        return xPlayer.Functions.AddMoney(type, tonumber(amount), cache.resource)
    end
    return false
end

-- Retrieves the player's job name
function server.GetPlayerJob(source)
    local xPlayer = server.GetPlayer(source)
    return xPlayer?.PlayerData?.job?.name
end

function server.CreateUseableItem(item, callback)
    server.framework.Functions.CreateUseableItem(item, callback)
end
