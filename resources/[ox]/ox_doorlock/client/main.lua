if not LoadResourceFile(cache.resource, 'web/build/index.html') then
	error('Unable to load UI. Build ox_doorlock or download the latest release.\n	^3https://github.com/overextended/ox_doorlock/releases/latest/download/ox_doorlock.zip^0')
end

if not lib.checkDependency('ox_lib', '3.30.4', true) then return end

local math = require 'glm'
local doors = {}
_ENV.doors = doors


local function createDoor(door)
	local oldDoor = doors[door.id]

	if oldDoor then
		lib.grid.removeEntry(oldDoor)
	end

	doors[door.id] = door
	local double = door.doors
	door.zone = GetLabelText(GetNameOfZone(door.coords.x, door.coords.y, door.coords.z))
	door.radius = door.maxDistance

	if double then
		for i = 1, 2 do
			AddDoorToSystem(double[i].hash, double[i].model, double[i].coords.x, double[i].coords.y, double[i].coords.z, false, false, false)
			DoorSystemSetDoorState(double[i].hash, 4, false, false)
			DoorSystemSetDoorState(double[i].hash, door.state, false, false)

			if door.doorRate or not door.auto then
				DoorSystemSetAutomaticRate(double[i].hash, door.doorRate or 10.0, false, false)
			end
		end
	else
		AddDoorToSystem(door.hash, door.model, door.coords.x, door.coords.y, door.coords.z, false, false, false)
		DoorSystemSetDoorState(door.hash, 4, false, false)
		DoorSystemSetDoorState(door.hash, door.state, false, false)

		if door.doorRate or not door.auto then
			DoorSystemSetAutomaticRate(door.hash, door.doorRate or 10.0, false, false)
		end
	end

	lib.grid.addEntry(door)
end

local nearbyDoors = lib.array:new()
local nearbyDoorsCount = 0
local Entity = Entity
local ratio = GetAspectRatio(true)

lib.callback('ox_doorlock:getDoors', false, function(data)
    for _, door in pairs(data) do createDoor(door) end
    local MAX_HEAVY_PER_TICK = 20
    local modelDimCache = {}
    local scanIndex = 1

    while true do
        local coords = GetEntityCoords(cache.ped)
        nearbyDoors = lib.grid.getNearbyEntries(coords)
        nearbyDoorsCount = #nearbyDoors
        ratio = GetAspectRatio(true)

        for i = 1, nearbyDoorsCount do
            local door = nearbyDoors[i]
            door.distance = #(coords - door.coords)
        end

        local processed = 0
        local idx = scanIndex
        if nearbyDoorsCount > 0 then
            while processed < MAX_HEAVY_PER_TICK do
                if idx > nearbyDoorsCount then
                    idx = 1
                end

                local door = nearbyDoors[idx]
                if door then
                    local double = door.doors
                    if door.distance < 50.0 then
                        if double then
                            for j = 1, 2 do
                                local dDoor = double[j]
                                if IsModelValid(dDoor.model) then
                                    if not dDoor.entity then
                                        local entity = GetClosestObjectOfType(dDoor.coords.x, dDoor.coords.y, dDoor.coords.z, 1.0, dDoor.model, false, false, false)
                                        if entity and entity ~= 0 then
                                            dDoor.entity = entity
                                            Entity(entity).state.doorId = door.id
                                        else
                                            dDoor.entity = nil
                                        end
                                    end
                                end
                            end
                        else
                            if IsModelValid(door.model) then
                                if not door.entity then
                                    local entity = GetClosestObjectOfType(door.coords.x, door.coords.y, door.coords.z, 1.0, door.model, false, false, false)
                                    if entity and entity ~= 0 then
                                        local dim = modelDimCache[door.model]
                                        if not dim then
                                            local min, max = GetModelDimensions(door.model)
                                            dim = { min = min, max = max }
                                            modelDimCache[door.model] = dim
                                        end

                                        local dCoords = GetEntityCoords(entity)
                                        local min, max = dim.min, dim.max
                                        local center = vec3((min.x + max.x) / 2, (min.y + max.y) / 2, (min.z + max.z) / 2)
                                        local heading = GetEntityHeading(entity) * (math.pi / 180)
                                        local sin, cos = math.sincos(heading)
                                        local rotatedX = cos * center.x - sin * center.y
                                        local rotatedY = sin * center.x + cos * center.y
                                        door.coords = vec3(dCoords.x + rotatedX, dCoords.y + rotatedY, dCoords.z + center.z)

                                        door.entity = entity
                                        Entity(entity).state.doorId = door.id
                                    else
                                        door.entity = nil
                                    end
                                end
                            end
                        end
                    else
                        if double then
                            for j = 1, 2 do
                                local dDoor = double[j]
                                dDoor.entity = nil
                            end
                        else
                            door.entity = nil
                        end
                    end
                end

                processed = processed + 1
                idx = idx + 1
                if processed >= nearbyDoorsCount then break end
            end
        end

        scanIndex = idx
        if scanIndex > nearbyDoorsCount then scanIndex = 1 end
        Wait(1000)
    end
end)


RegisterNetEvent('ox_doorlock:setState', function(id, state, source, data)
	if not doors then return end

	if data then
		createDoor(data)

		if NuiHasLoaded then
			SendNuiMessage(json.encode({
				action = 'updateDoorData',
				data = data
			}))
		end
	end

	if Config.Notify and source == cache.serverId then
		if state == 0 then
			lib.notify({
				type = 'success',
				icon = 'unlock',
				description = locale('unlocked_door')
			})
		else
			lib.notify({
				type = 'success',
				icon = 'lock',
				description = locale('locked_door')
			})
		end
	end

	local door = data or doors[id]
	local double = door.doors
	door.state = state

	if double then
		DoorSystemSetDoorState(double[1].hash, door.state, false, false)
		DoorSystemSetDoorState(double[2].hash, door.state, false, false)

		if door.holdOpen then
			DoorSystemSetHoldOpen(double[1].hash, door.state == 0)
			DoorSystemSetHoldOpen(double[2].hash, door.state == 0)
		end

		while door.state == 1 and (not IsDoorClosed(double[1].hash) or not IsDoorClosed(double[2].hash)) do Wait(0) end
	else
		DoorSystemSetDoorState(door.hash, door.state, false, false)

		if door.holdOpen then DoorSystemSetHoldOpen(door.hash, door.state == 0) end
		while door.state == 1 and not IsDoorClosed(door.hash) do Wait(0) end
	end

	if door.state == state and door.distance and door.distance < 20 then
		if Config.NativeAudio then
			RequestScriptAudioBank('dlc_oxdoorlock/oxdoorlock', false)
			local sound = state == 0 and door.unlockSound or door.lockSound or 'door_bolt'
			local soundId = GetSoundId()

			PlaySoundFromCoord(soundId, sound, door.coords.x, door.coords.y, door.coords.z, 'DLC_OXDOORLOCK_SET', false, 0, false)
			ReleaseSoundId(soundId)
			ReleaseNamedScriptAudioBank('dlc_oxdoorlock/oxdoorlock')
		else
			local volume = (0.01 * GetProfileSetting(300)) / (door.distance / 2)
			if volume > 1 then volume = 1 end
			local sound = state == 0 and door.unlockSound or door.lockSound or 'door-bolt-4'

			SendNUIMessage({
				action = 'playSound',
				data = {
					sound = sound,
					volume = volume
				}
			})
		end
	end
end)

RegisterNetEvent('ox_doorlock:editDoorlock', function(id, data)
	if source == '' then return end

	local door = doors[id]
	local double = door.doors
	local doorState = data and data.state or 0

	lib.grid.removeEntry(door)

	if data then
		data.zone = door.zone or GetLabelText(GetNameOfZone(door.coords.x, door.coords.y, door.coords.z))
		data.radius = data.maxDistance

		if door.distance < 20 then door.distance = 80 end

		lib.grid.addEntry(data)
	elseif ClosestDoor?.id == id then
		ClosestDoor = nil
	end

	if double then
		for i = 1, 2 do
			local doorHash = double[i].hash

			if data then
				if data.doorRate or door.doorRate or not data.auto then
					DoorSystemSetAutomaticRate(doorHash, data.doorRate or door.doorRate and 0.0 or 10.0, false, false)
				end

				DoorSystemSetDoorState(doorHash, doorState, false, false)

				if data.holdOpen then DoorSystemSetHoldOpen(doorHash, doorState == 0) end
			else
				DoorSystemSetDoorState(doorHash, 4, false, false)
				DoorSystemSetDoorState(doorHash, 0, false, false)

				if double[i].entity then
					Entity(double[i].entity).state.doorId = nil
				end
			end
		end
	else
		if data then
			if data.doorRate or door.doorRate or not data.auto then
				DoorSystemSetAutomaticRate(door.hash, data.doorRate or door.doorRate and 0.0 or 10.0, false, false)
			end

			DoorSystemSetDoorState(door.hash, doorState, false, false)

			if data.holdOpen then DoorSystemSetHoldOpen(door.hash, doorState == 0) end
		else
			DoorSystemSetDoorState(door.hash, 4, false, false)
			DoorSystemSetDoorState(door.hash, 0, false, false)

			if door.entity then
				Entity(door.entity).state.doorId = nil
			end
		end
	end

	doors[id] = data

	if NuiHasLoaded then
		SendNuiMessage(json.encode({
			action = 'updateDoorData',
			data = data or id
		}))
	end
end)

ClosestDoor = nil

lib.callback.register('ox_doorlock:inputPassCode', function()
	return ClosestDoor?.passcode and lib.inputDialog(locale('door_lock'), {
		{
			type = 'input',
			label = locale('passcode'),
			password = true,
			icon = 'lock'
		},
	})?[1]
end)

local lastTriggered = 0

local function useClosestDoor()
	if not ClosestDoor then return false end

	local gameTimer = GetGameTimer()

	if gameTimer - lastTriggered > 500 then
		lastTriggered = gameTimer
		TriggerServerEvent('ox_doorlock:setState', ClosestDoor.id, ClosestDoor.state == 1 and 0 or 1)
	end
end

CreateThread(function()
    local lockDoor = locale('lock_door')
    local unlockDoor = locale('unlock_door')
    local showUI, lastDoor
    local drawSprite = Config.DrawSprite

    if drawSprite then
        if drawSprite[0] and drawSprite[0][1] then RequestStreamedTextureDict(drawSprite[0][1], true) end
        if drawSprite[1] and drawSprite[1][1] then RequestStreamedTextureDict(drawSprite[1][1], true) end
    end

    local SetDrawOrigin, ClearDrawOrigin, DrawSprite = SetDrawOrigin, ClearDrawOrigin, DrawSprite

    while true do
        local sleep = 500
        local nearest = nearbyDoors[1]

        if nearbyDoorsCount > 0 then
            for i = 2, nearbyDoorsCount do
                local d = nearbyDoors[i]
                if d.distance < (nearest and nearest.distance or 99999) then
                    nearest = d
                end
            end
        end

        if nearest and nearest.distance < nearest.maxDistance then
            ClosestDoor = nearest

            -- TextUI (hanya update kalau berubah)
            if Config.DrawTextUI and not ClosestDoor.hideUi then
                if ClosestDoor ~= lastDoor or ClosestDoor.state ~= showUI then
                    lib.showTextUI(ClosestDoor.state == 0 and lockDoor or unlockDoor)
                    showUI = ClosestDoor.state
                    lastDoor = ClosestDoor
                end
            end

            -- Control (E untuk gunakan pintu)
            if not PickingLock and IsControlJustReleased(0, 38) then
                useClosestDoor()
            end

            -- Sprite pintu (digambar setiap frame)
            if drawSprite and not ClosestDoor.hideUi and ClosestDoor.distance < math.min(15.0, ClosestDoor.maxDistance) then
                local sprite = drawSprite[ClosestDoor.state]
                if sprite then
                    SetDrawOrigin(ClosestDoor.coords.x, ClosestDoor.coords.y, ClosestDoor.coords.z)
                    DrawSprite(sprite[1], sprite[2], sprite[3], sprite[4], sprite[5],
                        sprite[6] * ratio, sprite[7], sprite[8], sprite[9], sprite[10], sprite[11])
                    ClearDrawOrigin()
                end
                sleep = 0 -- frame by frame → tidak kedip
            else
                sleep = 100
            end
        else
            -- Hanya hide UI sekali saat keluar dari jarak
            if showUI then
                lib.hideTextUI()
                showUI, lastDoor = nil, nil
                ClosestDoor = nil
            end
            sleep = 500
        end

        Wait(sleep)
    end
end)

exports('useClosestDoor', useClosestDoor)
exports('getClosestDoor', function() return ClosestDoor end)