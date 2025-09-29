-- Get player by source
---@return number PlayerIdentifier
function server.GetPlayer(source)
    return server.framework.GetPlayerFromId(source)
end

-- Give money to player
---@return boolean
function server.PlayerAddMoney(source, type, amount)
    local xPlayer = server.GetPlayer(source)
    if xPlayer then
        type = type == 'cash' and 'money' or type
        return xPlayer.addAccountMoney(type, tonumber(amount))
    end
    return false
end

-- Retrieves the player's job name
function server.GetPlayerJob(source)
    local xPlayer = server.GetPlayer(source)
    return xPlayer?.job?.name
end

function server.CreateUseableItem(item, callback)
    server.framework.RegisterUsableItem(item, callback)
end
