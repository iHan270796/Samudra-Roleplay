Citizen.CreateThread( function()
    while true do
        REVEL = 1000
        if IsPedInAnyVehicle(PlayerPedId(), false) then
        REVEL = 1
      SetPedConfigFlag(PlayerPedId(), 35, false)
        end
      Citizen.Wait(REVEL)
    end
end)