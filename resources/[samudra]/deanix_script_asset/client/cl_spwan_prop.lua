local Config = require 'c_props'
local spawnedProps = {}

CreateThread(function()
    for _, propData in pairs(Config.Props) do
        local model = propData.model
        local coords = propData.coords
        local heading = propData.heading or 0.0

        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(10)
        end

        local obj = CreateObjectNoOffset(model, coords.x, coords.y, coords.z, false, false, false)
        SetEntityHeading(obj, heading)
        if propData.freeze then
            FreezeEntityPosition(obj, true)
        end
        spawnedProps[#spawnedProps+1] = obj
        SetModelAsNoLongerNeeded(model)
    end
end)

AddEventHandler('onResourceStop', function(resName)
    if resName == GetCurrentResourceName() then
        for _, obj in pairs(spawnedProps) do
            if DoesEntityExist(obj) then
                DeleteEntity(obj)
            end
        end
    end
end)
