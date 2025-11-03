Bridge = {}

Bridge.Events = {
    OnPlayerLoaded = "QBCore:Client:OnPlayerLoaded",
    PlayerUnload = "QBCore:Client:OnPlayerUnload",
    SetPlayerData = "QBCore:Player:SetPlayerData",
    ESXOnly = {
        StatusOnTick = "esx_status:onTick"
    }
}

Bridge.Notify = function(message, type, duration)
    if Config.Framework == "qb" or Config.Framework == "qbx" then
        if GetResourceState('SK-UI') ~= "missing" then
            exports["SK-UI"]:Notify("prp", {message = message, type = type, duration = duration})
            return
        end
        QB.Functions.Notify(message, type, duration)
    elseif Config.Framework == "esx" then
        if GetResourceState('SK-UI') ~= "missing" then
            exports["SK-UI"]:Notify("prp", {message = message, type = type, duration = duration})
            return
        end
        lib.notify({message = message, type = type, duration = duration})
    end
end

Bridge.OnRadio = function()
    if Config.Framework == "qb" or Config.Framework == "qbx" then
        return LocalPlayer.state['radioChannel'] or 0 > 0
    elseif Config.Framework == "esx" then
        local plyState = LocalPlayer.state
        if plyState.radioChannel >= 1 then
            onRadio = 1
        elseif plyState.radioChannel == 0 then
            onRadio = 0
        end
    end
end

Bridge.OnPhone = function()
    if Config.Framework == "qb" or Config.Framework == "qbx" then
        return LocalPlayer.state['callChannel'] or 0 > 0
    elseif Config.Framework == "esx" then
        local plyState = LocalPlayer.state
        if plyState.callChannel >= 1 then
            onPhone = 1
        elseif plyState.callChannel == 0 then
            onPhone = 0
        end
    end
end

Bridge.GetPlayerData = function()
    -- return { -- The format that needs to be returned.
    --     metadata = {
    --         hunger = hunger,
    --         thirst = thirst,
    --         stress = stress,
    --     }
    -- }

    if Config.Framework == "qb" or Config.Framework == "qbx" then
        return QB.Functions.GetPlayerData()
    end
end