Config = {}

-- Client Trigger to open is TriggerEvent("deanix_vehicleshop:open", ID_OF_VEHICLESHOP)

Config.DistanceViewMarker = 20.0
Config.DistanceView3DText = 5.0
Config.DistanceAccess = 2.0 -- The distance in which it will be possible to take a seat by pressing the E key
Config.KeyOpen = 38 -- 38 = E

Config.Core = "QB-Core" -- "ESX" or "QB-Core"
Config.CoreDefine = nil
	-- ESX: "esx:getSharedObject" 
	-- QBCore: ""
	-- Or your custom trigger event also you can set nil to core define by exports["es_extended"]:getSharedObject

Config.CoreExport = function()
	return exports['qb-core']:GetCoreObject()
	-- return exports['qb-core']:GetCoreObject()
end

-- @PlayerLoaded for ESX: "esx:playerLoaded"
-- @PlayerLoaded for QB-Core: "QBCore:Client:OnPlayerLoaded"
Config.PlayerLoaded = 'QBCore:Client:OnPlayerLoaded' -- its a trigger to load players tattoos

-- @JobUpdated for ESX: "esx:setJob"
-- @JobUpdated for QB-Core: "QBCore:Client:OnJobUpdate"
Config.JobUpdated = 'QBCore:Client:OnJobUpdate' -- its a trigger to check players job

Config.UseVehicleColorsRGB = true

Config.UseFadeWithSpawn = true
Config.SoundsEffects = true -- if you want to sound effects by clicks set true

Config.Hud = {
	Enable = function()
		DisplayRadar(true)
		exports['minimal-hud']:toggleHud(true)
		exports['minimal-hud']:toggleMap(true)
		exports['samudra_logo']:showhud()
	end,
	Disable = function()
		DisplayRadar(false)
		exports['minimal-hud']:toggleHud(false)
		exports['minimal-hud']:toggleMap(false)
		exports['samudra_logo']:hidehud()
	end
}

Config.Notification = function(message, time, type)
    if type == "success" then
        TriggerEvent('QBCore:Notify', message, 'success', time)
    elseif type == "error" then
       TriggerEvent('QBCore:Notify', message, 'error', time)
    end
end


Config.AccessOnMarker = true -- if you want to use this with marker acces, set true, if you want to use this script with for e.g vms_npctalk set false.

Config.UseTarget = true
Config.TargetResource = 'anes_interaction'

Config.Target = function(id, data)
    if Config.TargetResource == 'anes_interaction' then
        exports['anes_interaction']:AddInteraction({
            id = 'vehicleshop-'..id,
            label = data.name,
            icon = data.icon or "fa-car", -- fallback kalau icon kosong
            coords = data.coords,
            distance = 2.0,      -- jarak buat interaksi
            distancedot = 8.0,   -- jarak muncul dot
            options = {
                {
                    actionlabel = "Open Menu",
                    actionkey = "E",
                    action = function()
                        TriggerEvent("deanix_vehicleshop:open", id)
                    end
                }
            }
        })
    end
end

Config.UseRoutingBucketsInShowRoom = true
Config.UseRoutingBucketsOnTestDrive = true

Config.PlateCustomPrefix = nil -- "PREFIX" or nil
Config.PlateLetters = 3
Config.PlateNumbers = 4

Config.GiveKeysBuy = function(veh, plate, model)
	exports["lc_fuel"]:SetFuel(veh, 100)
	TriggerEvent("vehiclekeys:client:SetOwner", plate)
end

Config.GiveKeysTestDrive = function(veh, plate, model)
	exports["lc_fuel"]:SetFuel(veh, 100)
	TriggerEvent("vehiclekeys:client:SetOwner", plate)
end

Config.TestDrive = {
	displayTimer = true, -- this option runs DrawText3D over the vehicle with a countdown timer to the end of the test drive.
	time = 15, -- in seconds
	coords = vector4(-1267.47, -3374.01, 12.94, 327.4), -- coords of spawn the vehicle
	maxDistance = 500, -- maximum distance from coords
}

Config.VehicleShops = {
    [1] = {
		blip = {sprite = 225, scale = 0.65, color = 30, display = 4},
		categories = {'dealersipmotors', 'dealersipcompact', 'dealersipclassic', 'dealersipmuscle', 'dealersipcoupe', 'dealersipsedan', 'dealersipsport', 'dealersipsupercar', 'dealersipoffroad', 'dealersipsuv', 'dealersippickup'}, -- if you adding new categories, you need add also .svg file at the same name for @deanix_vehicleshop/html/icons/
		testDrive = false,
		testDrivePrice = 0,
		type = 'car',
		icon = 'fa-solid fa-car',
		name = "Dealership",
		-- requiredJob = 'police',
		-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
		targetSystemRotation = -20.0,
        coords = vector3(-55.57, -1097.36, 26.32),
		carCoords = vector4(-69.79, -824.51, 221.0, 61.72),
		camCoord = vector3(-74.72, -824.49, 223.15),
		buyCoords = vector4(-31.04, -1090.45, 25.42, 334.67),
		drawable = {
			['marker'] = false,
			['3dtext'] = false
		},
		vehicles = Vehicles[1] -- Vehicles in the config.vehicles.lua
	},
	[2] = {
		blip = {sprite = 821, scale = 0.65, color = 2, display = 4},
		categories = {'luxurymotors', 'luxurysports', 'luxurysupercar', 'luxuryclassic', 'luxuryoffroad'}, -- if you adding new categories, you need add also .svg file at the same name for @deanix_vehicleshop/html/icons/
		testDrive = false,
		testDrivePrice = 0,
		type = 'car',
		icon = 'fa-solid fa-car',
		name = "Luxury Autos",
		targetSystemRotation = -20.0,
        coords = vector3(126.55, -143.01, 54.83),
		carCoords = vector4(-69.79, -824.51, 221.0, 61.72),
		camCoord = vector3(-74.72, -824.49, 223.15),
		buyCoords = vector4(116.28, -140.14, 54.8, 344.43),
		drawable = {
			['marker'] = false,
			['3dtext'] = false
		},
		vehicles = Vehicles[2] -- Vehicles in the config.vehicles.lua
	},
	[3] = {
		blip = {sprite = 821, scale = 0.65, color = 2, display = 4},
		categories = {'JDM'}, -- if you adding new categories, you need add also .svg file at the same name for @deanix_vehicleshop/html/icons/
		testDrive = false,
		testDrivePrice = 0,
		type = 'car',
		icon = 'fa-solid fa-car',
		name = "JDM",
		targetSystemRotation = -20.0,
        coords = vector3(-338.73, -1369.54, 31.92),
		carCoords = vector4(-69.79, -824.51, 221.0, 61.72),
		camCoord = vector3(-74.72, -824.49, 223.15),
		buyCoords = vector4(-346.46, -1359.56, 31.89, 0.8),
		drawable = {
			['marker'] = false,
			['3dtext'] = false
		},
		vehicles = Vehicles[3] -- Vehicles in the config.vehicles.lua
	},
	-- [2] = {
	-- 	blip = {sprite = 821, scale = 0.65, color = 2, display = 4},
	-- 	categories = {'luxurysports', 'dealersipcompact'}, -- if you adding new categories, you need add also .svg file at the same name for @deanix_vehicleshop/html/icons/
	-- 	testDrive = false,
	-- 	testDrivePrice = 0,
	-- 	type = 'car',
	-- 	icon = 'fa-solid fa-car',
	-- 	name = "Luxury Autos",
	-- 	-- requiredJob = 'police',
	-- 	-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
	-- 	targetSystemRotation = -20.0,
    --     coords = vector3(126.55, -143.01, 54.83),
	-- 	carCoords = vector4(-69.79, -824.51, 221.0, 61.72),
	-- 	camCoord = vector3(-74.72, -824.49, 223.15),
	-- 	buyCoords = vector4(116.28, -140.14, 54.8, 344.43),
	-- 	drawable = {
	-- 		['marker'] = false,
	-- 		['3dtext'] = false
	-- 	},
	-- 	Vehicles = Vehicles[2] -- Vehicles in the config.vehicles.lua
	-- },
	-- [2] = {
	-- 	blip = {sprite = 90, scale = 0.65, color = 30, display = 4},
	-- 	categories = {'helicopter', 'airplane'}, -- if you adding new categories, you need add also .svg file at the same name for @deanix_vehicleshop/html/icons/
	-- 	testDrive = false,
	-- 	testDrivePrice = 0,
	-- 	type = 'fly',
	-- 	icon = 'fa-solid fa-plane',
	-- 	name = "PLANE DEALER",
	-- 	-- requiredJob = 'police',
	-- 	-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
	-- 	targetSystemRotation = 60.0,
	-- 	coords = vector3(-941.26, -2954.54, 12.8),
	-- 	carCoords = vector4(-974.58, -3000.76, 12.95, 58.63),
	-- 	camCoord = vector3(-988.33, -3001.73, 14.95),
	-- 	buyCoords = vector4(-974.89, -3082.39, 12.94, 58.0),
	-- 	drawable = {
	-- 		['marker'] = true,
	-- 		['3dtext'] = true
	-- 	},
	-- 	vehicles = Vehicles[2]
	-- },
	-- [3] = {
	-- 	blip = {sprite = 427, scale = 0.65, color = 30, display = 4},
	-- 	categories = {}, -- if you adding new categories, you need add also .svg file at the same name for @deanix_vehicleshop/html/icons/
	-- 	testDrive = false,
	-- 	testDrivePrice = 0,
	-- 	type = 'boat',
	-- 	icon = 'fa-solid fa-ship',
	-- 	name = "BOATS DEALER",
	-- 	-- requiredJob = 'police',
	-- 	-- requiredJobGrade = {'boss'}, -- string: 'boss' or table: {'boss', 'manager'}
	-- 	targetSystemRotation = 50.0,
	-- 	coords = vector3(-704.18, -1398.44, 4.4),
	-- 	carCoords = vector4(-797.95, -1502.53, -0.45, 112.22),
	-- 	camCoord = vector3(-802.24, -1512.52, 2.69),
	-- 	buyCoords = vector4(-783.76, -1436.2, -0.06, 136.22),
	-- 	drawable = {
	-- 		['marker'] = true,
	-- 		['3dtext'] = true
	-- 	},
	-- 	vehicles = Vehicles[3]
	-- },
}

Config.Translate = {
	['notify.you_bought'] = "%s %s satın aldınız. Fiyatı: %s₺.",
	['notify.enought_money'] = "%s %s için yeterli paranız yok.",
	['notify.you_bought_test'] = "Test sürüşü satın aldınız. Fiyatı: %s₺.",
	['notify.enought_money_for_test'] = "Test sürüşü için yeterli paranız yok.",
	['3dtext.time_remaining'] = "%s saniye kaldı",
	['3dtext.open'] = "Açmak için [E] tuşuna basın",
}
