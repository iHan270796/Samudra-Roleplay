Bridge = {}

Bridge.GetPlayerMetadata = function(src)
    if Config.Framework == "qb" or Config.Framework == "qbx" then
        return QB.Functions.GetPlayer(src).PlayerData.metadata
    end
end

Bridge.GetJob = function(src)
    if Config.Framework == "qb" or Config.Framework == "qbx" then
        return QB.Functions.GetPlayer(src).PlayerData.job.name
    end
end

Bridge.SetPlayerMetadata = function(src, type, val)
    if Config.Framework == "qb" or Config.Framework == "qbx" then
        return QB.Functions.GetPlayer(src).Functions.SetMetaData(type, val)
    end
end

Bridge.Notify = function(message, type, duration)
    if Config.Framework == "qb" or Config.Framework == "qbx" and not GetResourceState("SK-UI") == 'started' then
        QB.Functions.Notify(message, type, duration)
    elseif Config.Framework == "qb" or Config.Framework == "qbx" and GetResourceState("SK-UI") == 'started' then
        exports["SK-UI"]:Notify("prp", {message = message, type = type, duration = duration})
    elseif Config.Framework == "esx" and not GetResourceState("SK-UI") == 'started' then
        TriggerClientEvent("ox_lib:notify", source, {message = message, type = type, duration = duration})
    elseif Config.Framework == "esx" and GetResourceState("SK-UI") == 'started'then
        exports["SK-UI"]:Notify("prp", {message = message, type = type, duration = duration})
    end
end