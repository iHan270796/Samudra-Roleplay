local QBCore = exports['qb-core']:GetCoreObject()
local hudVisible = true
local function UpdateHUD()
    if not hudVisible then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    if not PlayerData or not PlayerData.job then return end

    local jobLabel
    if PlayerData.job.onduty == false then
        jobLabel = 'Off Duty'
    else
        jobLabel = PlayerData.job.label or 'Unemployed'
    end

    local gangLabel = PlayerData.gang and PlayerData.gang.label or 'No Gang'

    local info = {
        name = PlayerData.charinfo and (PlayerData.charinfo.firstname .. ' ' .. PlayerData.charinfo.lastname) or 'Unknown',
        id = GetPlayerServerId(PlayerId()),
        job = jobLabel,
        grade = PlayerData.job.grade and PlayerData.job.grade.name or '',
        cash = PlayerData.money['cash'] or 0,
        bank = PlayerData.money['bank'] or 0,
        gang = gangLabel,
    }

    SendNUIMessage({
        action = 'updateHUD',
        data = info
    })
end

exports('HideHUD', function()
    hudVisible = false
    SendNUIMessage({ action = 'hideHUD' })
end)

exports('ShowHUD', function()
    hudVisible = true
    SendNUIMessage({ action = 'showHUD' })
    UpdateHUD()
end)

CreateThread(function()
    while true do
        if hudVisible then
            UpdateHUD()
        end
        Wait(5000)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', UpdateHUD)
RegisterNetEvent('QBCore:Client:OnJobUpdate', UpdateHUD)
RegisterNetEvent('QBCore:Player:SetPlayerData', UpdateHUD)
RegisterNetEvent('QBCore:Client:SetDuty', function() UpdateHUD() end)
RegisterNetEvent('QBCore:Client:OnGangUpdate', UpdateHUD)

CreateThread(function()
    while true do
        if hudVisible then
            local hour = GetClockHours()
            local minute = GetClockMinutes()
            local day = GetClockDayOfMonth()
            local month = GetClockMonth() + 1
            local year = GetClockYear()

            SendNUIMessage({
                action = 'updateTime',
                time = string.format("%02d:%02d", hour, minute),
                date = string.format("%02d/%02d/%04d", month, day, year)
            })
        end
        Wait(1000)
    end
end)

CreateThread(function()
    local wasPauseMenu = false
    while true do
        local inPause = IsPauseMenuActive()
        if inPause and not wasPauseMenu then
            wasPauseMenu = true
            exports['samudra_playerhud']:HideHUD()
        elseif not inPause and wasPauseMenu then
            wasPauseMenu = false
            exports['samudra_playerhud']:ShowHUD()
        end
        Wait(500)
    end
end)
