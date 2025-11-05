local function LoadWaterData()
    local success = LoadWaterFromPath(GetCurrentResourceName(), 'water.xml')
    if success ~= 1 then
        print('Failed to load water.xml')
    end
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    LoadWaterData()
end)

RegisterCommand('fixWater', function()
    LoadWaterData()
end,false)