local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local QBCore = exports['qb-core']:GetCoreObject()

local isLoggedIn = true
local spawnChicken = false
local prop
local chickenPackage = false
local box_object, chicken_object, alive_chicken_object, knife_object
local isWorking = false
local chicken = {}
local getCaught = 0


local function StartCatching()
	local ped = PlayerPedId()
	local chickenModel = Config.SpawnChicken["model"]

	getCaught = 0

	for v in pairs(chicken) do
		DeleteEntity(chicken[v])
	end

	DoScreenFadeOut(500)
	Citizen.Wait(500)
	SetEntityCoordsNoOffset(ped, Config.CatchAliveChicken["spawnCoords"].x, Config.CatchAliveChicken["spawnCoords"].y, Config.CatchAliveChicken["spawnCoords"].z, 0, 0, 1)
	RequestModel(GetHashKey(chickenModel))

	while not HasModelLoaded(GetHashKey(chickenModel)) do
		Citizen.Wait(100)
	end

	for k, v in pairs(Config.SpawnChicken["quantity"]) do
		chicken[k] = CreatePed(26, chickenModel, v["coords"].x, v["coords"].y, v["coords"].z, v["coords"].h, true, false)
		TaskReactAndFleePed(chicken[k], ped)
	end

	Citizen.Wait(500)
	DoScreenFadeIn(500)
	spawnChicken = true
end

local function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

local function chickenGotCaught(pass)
    local ped = PlayerPedId()
    LoadDict('move_jump')
    TaskPlayAnim(ped, 'move_jump', 'dive_start_run', 8.0, -8.0, -1, 0, 0, 0, 0, 0)
    Citizen.Wait(600)

    SetEntityInvincible(ped, true)
    SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
    Citizen.Wait(1000)
    SetEntityInvincible(ped, false)

    local chance = math.random(1,100)
    if chance <= Config.SpawnChicken["catching_chance"] then
        getCaught = getCaught + 1
        MBNotify(Lang:t("notify.title"), "Ayam Berhasil Di Tangkap", "success")
        DeleteEntity(chicken[pass])
        TriggerServerEvent("mb-chicken:server:AddAliveChicken")
    else
        MBNotify(Lang:t("notify.title"), "Gagal Menangkap Ayam", "error")
    end
end

local function processAliveChicken(position)
    local Player = PlayerPedId()
    local PedCoords = GetEntityCoords(Player)

    if Player then
        local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
        LoadDict(dict)
        FreezeEntityPosition(Player, true)
        local knife_object = CreateObject(GetHashKey('prop_knife'), PedCoords.x, PedCoords.y, PedCoords.z, true, true, true)
        AttachEntityToEntity(knife_object, Player, GetPedBoneIndex(Player, 0xDEAD), 0.13, 0.14, 0.09, 40.0, 0.0, 0.0, false, false, false, false, 2, true)

        local alive_chicken_object = CreateObject(GetHashKey(Config.SlaughteredChicken[position]["prop"]["model"]),
            Config.SlaughteredChicken[position]["prop"]["coords"].x,
            Config.SlaughteredChicken[position]["prop"]["coords"].y,
            Config.SlaughteredChicken[position]["prop"]["coords"].z,
            true, true, true
        )
        SetEntityRotation(alive_chicken_object, 90.0, 0.0, Config.SlaughteredChicken[position]["prop"]["heading"], 1, true)

        local success = lib.progressBar({
            duration = Config.SlaughteredChicken[position]["processing_time"],
            label = "Memotong Ayam....",
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
            },
            anim = {
                dict = dict,
                clip = "coke_cut_v1_coccutter"
            },
        })
        DeleteEntity(alive_chicken_object)
        DeleteEntity(knife_object)
        ClearPedTasks(Player)
        FreezeEntityPosition(Player, false)

        if success then
            TriggerServerEvent("mb-chicken:server:SlaughteredChicken", position)
            MBNotify(Lang:t("notify.title"), Lang:t("success.keep_going_or_sell"), "success")
        else
            MBNotify(Lang:t("notify.title"), "Gagal Memotong Ayam", "error")
        end
    end
end


local function packChicken(position)
    local Player = PlayerPedId()
    local PedCoords = GetEntityCoords(Player)

    if Player then
        local dict = "anim@heists@ornate_bank@grab_cash_heels"
        LoadDict(dict)
        local chicken_object = CreateObject(GetHashKey('prop_cs_steak'), PedCoords.x, PedCoords.y, PedCoords.z, true, true, true)
        AttachEntityToEntity(chicken_object, Player, GetPedBoneIndex(Player, 0x49D9), 0.15, 0.0, 0.01, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        local box_object = CreateObject(GetHashKey('prop_cs_clothes_box'), PedCoords.x, PedCoords.y, PedCoords.z, true, true, true)
        AttachEntityToEntity(box_object, Player, GetPedBoneIndex(Player, 57005), 0.13, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
        local success = lib.progressBar({
            duration = Config.PackagedChicken[position]["processing_time"],
            label = "Paking Ayam...",
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
            },
            anim = {
                dict = dict,
                clip = "grab"
            },
        })
        DeleteEntity(chicken_object)
        DeleteEntity(box_object)
        ClearPedTasks(Player)

        if success then
            TriggerServerEvent("mb-chicken:server:PackagedChicken", position)
            -- MBNotify(Lang:t("notify.title"), Lang:t("success.keep_going_or_sell"), "success")
        else
            MBNotify(Lang:t("notify.title"), "Gagal Packing Ayam", "error")
        end
    end
end

-- Load data
Citizen.CreateThread(function()
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	-- Display blips
	displayAliveChickenBlips()
	displaySlaughteredChicken()
	-- displaySellingBlips()

	PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('mulaitangkap:ayam', function()
	StartCatching()
end)

Citizen.CreateThread(function()
    for farm, data in pairs(Config.SlaughteredChicken) do
        local coords = data.coords

        exports.ox_target:addSphereZone({
            coords = vec3(coords.x, coords.y, coords.z),
            radius = 1.0,
            debug = false,
            options = {
                {
                    name = 'cut_alive_chicken_' .. farm,
                    icon = 'fa-solid fa-drumstick-bite',
                    label = "Potong Ayam",
                    onSelect = function()
                        local hasItem = QBCore.Functions.HasItem('ayam')
                        if hasItem then
                            processAliveChicken(farm)
                        else
                            MBNotify(Lang:t("notify.title"), "Anda Tidak Punya Ayam Hidup", "error")
                        end
                    end,
                }
            }
        })
    end

    for spot, spotData in pairs(Config.PackagedChicken) do
        local coords = spotData.coords

        exports.ox_target:addSphereZone({
            coords = vec3(coords.x, coords.y, coords.z),
            radius = 1.0,
            debug = false,
            options = {
                {
                    name = 'pack_chicken_' .. spot,
                    icon = 'fa-solid fa-box',
                    label = "Paking Ayam",
                    onSelect = function()
                        if isWorking then return end
                        local hasItem = QBCore.Functions.HasItem('ayam_potong')
                        if hasItem then
                            packChicken(spot)
                        else
                            MBNotify(Lang:t("notify.title"), "Anda Tidak Punya Ayam Potong", "error")
                        end
                    end,
                }
            }
        })
    end
end)

Citizen.CreateThread(function()
    while true do
	    Citizen.Wait(5)
		local plyCoords = GetEntityCoords(PlayerPedId(), false)
		if spawnChicken then
			for k, v in pairs(chicken) do
				local chickenCoords = GetEntityCoords(v)
				local dist = #(plyCoords - chickenCoords)
				if dist < 1 then
					QBCore.Functions.DrawText3D(chickenCoords.x, chickenCoords.y, chickenCoords.z+0.5, "[E] Tangkap Ayam")
					if IsControlJustPressed(0, Keys['E']) then
						chickenGotCaught(k)
					end
				end
			end
			if getCaught == #(Config.SpawnChicken["quantity"]) then
                MBNotify(Lang:t("notify.title"), "Selesai Ambil Ayam", "success")
                spawnChicken = false
                ClearPedTasks(PlayerPedId())
            for v in pairs(chicken) do
                DeleteEntity(v)
            end
            local ped = PlayerPedId()
                DoScreenFadeOut(500)
                Citizen.Wait(500)
                SetEntityCoords(ped, Config.CatchAliveChicken["coords"].x, Config.CatchAliveChicken["coords"].y, Config.CatchAliveChicken["coords"].z)
                DoScreenFadeIn(500)
            end
		end
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        PlayerData = QBCore.Functions.GetPlayerData()
    end)
	isLoggedIn = true
end)