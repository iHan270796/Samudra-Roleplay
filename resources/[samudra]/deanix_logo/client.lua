local QBCore = exports['qb-core']:GetCoreObject()
local HudVisible, PlayerData = true, {}
local icons = Config.Icons
local function UpdateHud()
    if not HudVisible or not PlayerData then return end
    SendNUIMessage({
        action = "update",
        id = GetPlayerServerId(PlayerId()),
        job = PlayerData.job and ("%s (%s)%s"):format(
            PlayerData.job.label,
            PlayerData.job.grade and PlayerData.job.grade.name or "",
            PlayerData.job.onduty and " | On Duty" or " | Off Duty"
        ) or "None",
        jobIcon = icons.job[PlayerData.job and PlayerData.job.name] or icons.job.default,
        gang = PlayerData.gang and ("%s (%s)"):format(
            PlayerData.gang.label,
            PlayerData.gang.grade and PlayerData.gang.grade.name or ""
        ) or "None",
        gangIcon = icons.gang[PlayerData.gang and PlayerData.gang.name] or icons.gang.default,
        bank = PlayerData.money and PlayerData.money.bank or 0,
        cash = PlayerData.money and PlayerData.money.cash or 0
    })
end

CreateThread(function()
    local ped, weapon
    local lastWeaponCheck, lastVoiceCheck, lastVehicleCheck, lastPauseCheck = 0, 0, 0, 0
    local lastState = false

    while true do
        local sleep = HudVisible and 250 or 1000
        Wait(sleep)
        ped = PlayerPedId()
        local now = GetGameTimer()

        if now - lastPauseCheck > 500 then
            lastPauseCheck = now
            local pauseActive = IsPauseMenuActive()
            if pauseActive and not lastState then
                lastState = true
                HudVisible = false
                SendNUIMessage({ action = "hide" })
                SendNUIMessage({ action = "updateWeapon", weapon = false })
                SendNUIMessage({ action = "voice", talking = false })
            elseif not pauseActive and lastState then
                lastState = false
                HudVisible = true
                UpdateHud()
                SendNUIMessage({ action = "show" })
            end
        end

        if not HudVisible then
            goto continue
        end

        if now - lastWeaponCheck > 300 then
            lastWeaponCheck = now
            weapon = GetSelectedPedWeapon(ped)
            if weapon ~= `WEAPON_UNARMED` then
                local _, ammoClip = GetAmmoInClip(ped, weapon)
                local ammoTotal = GetAmmoInPedWeapon(ped, weapon)
                SendNUIMessage({
                    action = "updateWeapon",
                    weapon = { icon = icons.weapon },
                    ammoClip = ammoClip,
                    ammoTotal = ammoTotal,
                    crosshair = Config.Crosshair
                })
            else
                SendNUIMessage({ action = "updateWeapon", weapon = false, crosshair = false })
            end
        end

        if now - lastVoiceCheck > 200 then
            lastVoiceCheck = now
            local talking = NetworkIsPlayerTalking(PlayerId())
            SendNUIMessage({ action = "voice", talking = talking })
        end

        if now - lastVehicleCheck > 1000 then
            lastVehicleCheck = now
            local inVehicle = IsPedInAnyVehicle(ped, false)
            SendNUIMessage({ action = "vehicleHud", inVehicle = inVehicle })
        end
    ::continue::
    end
end)

AddStateBagChangeHandler('radioChannel', ('player:%s'):format(cache.serverId), function(_, _, value)
    local radioActive = value ~= 0
    SendNUIMessage({ action = "radio", enabled = radioActive })
end)


AddEventHandler("onResourceStart", function(resName)
    if GetCurrentResourceName() ~= resName then return end
    CreateThread(function()
        while not LocalPlayer.state.isLoggedIn do Wait(200) end
        PlayerData = QBCore.Functions.GetPlayerData()
        Wait(500)
        UpdateHud()
    end)
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    if PlayerData and PlayerData.job then
        PlayerData.job.onduty = duty
    end
    UpdateHud()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    Wait(500)
    UpdateHud()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
    UpdateHud()
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    PlayerData.gang = gang
    UpdateHud()
end)

RegisterNetEvent('QBCore:Client:OnMoneyChange', function()
    PlayerData.money = QBCore.Functions.GetPlayerData().money
    UpdateHud()
end)

local function ShowHud()
    HudVisible = true
    UpdateHud()
    SendNUIMessage({ action = "show" })
end

local function HideHud()
    HudVisible = false
    SendNUIMessage({ action = "hide" })
    SendNUIMessage({ action = "updateWeapon", weapon = false })
    SendNUIMessage({ action = "voice", talking = false })
end

exports('showhud', ShowHud)
exports('hidehud', HideHud)