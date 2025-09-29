return {
	isSeatbeltOn = function()
        if GetResourceState('qbx_seatbelt') == 'started' then
            return LocalPlayer.state.seatbelt or LocalPlayer.state.harness or false
        else
            return false
        end
    end,
	-- isSeatbeltOn = function()
	-- 	if GetResourceState('jim-mechanic') == 'started' then
	-- 		return exports['jim-mechanic']:seatBeltOn()
	-- 	else
	-- 		return LocalPlayer.state.isSeatbeltOn or false -- Adjust based on your framework
	-- 	end
	-- end,
	getVehicleFuel = function(currentVehicle)
		if GetResourceState('ps-fuel') == 'started' then
			return exports['ps-fuel']:GetFuel(currentVehicle)
		elseif GetResourceState('lc_fuel') == 'started' then
			return exports['lc_fuel']:GetFuel(currentVehicle)
		elseif GetResourceState('LegacyFuel') == 'started' then
			return exports['LegacyFuel']:GetFuel(currentVehicle)
		elseif GetResourceState('ox_fuel') == 'started' then
			return Entity(currentVehicle).state.fuel
		else
			return GetVehicleFuelLevel(currentVehicle)
		end
	end,
	getNosLevel = function(currentVehicle) -- Replace this with your own logic to grab the nos level of the vehicle.
		return 0
	end,
}
