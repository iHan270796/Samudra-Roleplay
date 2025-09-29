CreateThread(function()
    while true do
        Wait(100)
        local myVeh = GetVehiclePedIsIn(PlayerPedId())
        if myVeh ~= 0 then
            SetVehicleRadioEnabled(myVeh,false)
        end
    end
end)