local sharedConfig = require 'config.shared'
InBedDict = 'anim@gangops@morgue@table@'
InBedAnim = 'body_search'
IsInHospitalBed = false
HealAnimDict = 'mini@cpr@char_a@cpr_str'
HealAnim = 'cpr_pumpchest'

HealAnimDict1 = 'anim@scripted@heist@ig9_control_tower@male@'
HealAnim1 = 'loop'
HealAnimFlag = 1
EmsNotified = false
CanLeaveBed = true
OnPainKillers = false

-- local sentDeathAlert = false

-- CreateThread(function()
--     while true do
--         local ped = PlayerPedId()
--         local health = GetEntityHealth(ped)

--         if health <= 0 and not sentDeathAlert then
--             local coords = GetEntityCoords(ped)
--             exports.yseries:SendCompanyMessage(
--                 'ambulance',
--                 'A citizen is in need of medical assistance',
--                 { x = coords.x, y = coords.y },
--                 false
--             )
--             sentDeathAlert = true
--         elseif health > 0 then
--             sentDeathAlert = false
--         end

--         Wait(500) -- periksa setiap 0.5 detik
--     end
-- end)

---Notifies EMS of a injury at a location
---@param coords vector3
---@param text string
RegisterNetEvent('hospital:client:ambulanceAlert', function(coords, text)
    if GetInvokingResource() then return end
    local streets = qbx.getStreetName(coords)
    exports.qbx_core:Notify(locale('text.alert'), 'inform', nil, text .. ' | ' .. streets.main .. ' ' .. streets.cross)
    PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', false, 0, true)
    local transG = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    local blip2 = AddBlipForCoord(coords.x, coords.y, coords.z)
    local blipText = locale('info.ems_alert', text)
    SetBlipSprite(blip, 153)
    SetBlipSprite(blip2, 161)
    SetBlipColour(blip, 1)
    SetBlipColour(blip2, 1)
    SetBlipDisplay(blip, 4)
    SetBlipDisplay(blip2, 8)
    SetBlipAlpha(blip, transG)
    SetBlipAlpha(blip2, transG)
    SetBlipScale(blip, 0.8)
    SetBlipScale(blip2, 2.0)
    SetBlipAsShortRange(blip, false)
    SetBlipAsShortRange(blip2, false)
    PulseBlip(blip2)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blipText)
    EndTextCommandSetBlipName(blip)
    while transG ~= 0 do
        Wait(720)
        transG -= 1
        SetBlipAlpha(blip, transG)
        SetBlipAlpha(blip2, transG)
        if transG == 0 then
            RemoveBlip(blip)
            return
        end
    end
end)

RegisterNetEvent('hospital:client:requestEmsDispatch', function(text)
    if GetInvokingResource() then return end
    local coords = GetEntityCoords(PlayerPedId())
    local streets = qbx.getStreetName(coords)
    exports['wasabi_mdt']:SendPremadeDispatch('civ_down', {
        location = streets.main .. (streets.cross and ' | ' .. streets.cross or 'Unknown'),
        coords = { x = coords.x, y = coords.y, z = coords.z },
        description = text or 'Laporan Warga Pingsan!'
    })
end)

---Revives player, healing all injuries
---Intended to be called from client or server.
-- RegisterNetEvent('hospital:client:Revive', function()
--     if IsInHospitalBed then
--         lib.playAnim(cache.ped, InBedDict, InBedAnim, 8.0, 1.0, -1, 1, 0, false, false, false)
--         TriggerEvent('qbx_medical:client:playerRevived')
--         CanLeaveBed = true
--     end

--     EmsNotified = false
-- end)

RegisterNetEvent('hospital:client:Revive', function()
    local ped = cache.ped

    if IsInHospitalBed then
        lib.playAnim(ped, InBedDict, InBedAnim, 8.0, 1.0, -1, 1, 0, false, false, false)
        TriggerEvent('qbx_medical:client:playerRevived')
        CanLeaveBed = true
    else
        TriggerEvent('qbx_medical:client:playerRevived')
    end

    Wait(500)

    local recoveryTime = 180
    local injuredClip = "move_m@injured"
    local recovering = true

    RequestAnimSet(injuredClip)
    while not HasAnimSetLoaded(injuredClip) do Wait(0) end
    SetPedMovementClipset(ped, injuredClip, true)

    exports["deanix_textui"]:ShowCountdown(
        "🩹 PEMULIHAN",
        "Kamu Baru Sadar. \nTunggu Sampai Waktu Pemulihan Selesai.",
        recoveryTime
    )

    local endTime = GetGameTimer() + (recoveryTime * 1000)
    CreateThread(function()
        while recovering and GetGameTimer() < endTime do
            if not HasAnimSetLoaded(injuredClip) then
                RequestAnimSet(injuredClip)
                while not HasAnimSetLoaded(injuredClip) do Wait(0) end
            end
            if not IsPedUsingAnyScenario(ped) and not IsPedInAnyVehicle(ped, false) then
                if not IsPedWalking(ped) or GetPedMovementClipset(ped) ~= injuredClip then
                    SetPedMovementClipset(ped, injuredClip, true)
                end
            end

            DisablePlayerFiring(PlayerId(), true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 263, true)

            Wait(0)
        end
    end)

    Wait(recoveryTime * 1000)
    recovering = false

    exports.qbx_core:Notify("Recovery process complete, you feel healthy again.", "success")

    ResetPedMovementClipset(ped, 0.0)
    ResetPedWeaponMovementClipset(ped)
    ResetPedStrafeClipset(ped)
    ClearPedSecondaryTask(ped)
    ClearPedTasksImmediately(ped)
    SetPedMoveRateOverride(ped, 1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)

    EmsNotified = false
end)


-- RegisterNetEvent('hospital:client:Revive', function()
--     local ped = cache.ped

--     if IsInHospitalBed then
--         lib.playAnim(ped, InBedDict, InBedAnim, 8.0, 1.0, -1, 1, 0, false, false, false)
--         TriggerEvent('qbx_medical:client:playerRevived')
--         CanLeaveBed = true
--     else
--         TriggerEvent('qbx_medical:client:playerRevived')
--     end

--     Wait(500)

--     local recoveryTime = 180 -- detik
--     local injuredClip = "move_m@injured"

--     RequestAnimSet(injuredClip)
--     while not HasAnimSetLoaded(injuredClip) do Wait(0) end
--     SetPedMovementClipset(ped, injuredClip, true)

--     exports["deanix_textui"]:ShowCountdown(
--         "🩹 RECOVERY",
--         "You just woke up. \nPlease wait for the recovery process to complete.",
--         recoveryTime
--     )

--     local endTime = GetGameTimer() + (recoveryTime * 1000)
--     CreateThread(function()
--         while GetGameTimer() < endTime do
--             if not HasAnimSetLoaded(injuredClip) then
--                 RequestAnimSet(injuredClip)
--                 while not HasAnimSetLoaded(injuredClip) do Wait(0) end
--             end
--             if not IsPedUsingAnyScenario(ped) and not IsPedInAnyVehicle(ped, false) then
--                 if not IsPedWalking(ped) or GetPedMovementClipset(ped) ~= injuredClip then
--                     SetPedMovementClipset(ped, injuredClip, true)
--                 end
--             end

--             DisablePlayerFiring(PlayerId(), true) -- blokir tembak
--             DisableControlAction(0, 24, true) -- attack
--             DisableControlAction(0, 25, true) -- aim
--             DisableControlAction(0, 140, true) -- melee light
--             DisableControlAction(0, 141, true) -- melee heavy
--             DisableControlAction(0, 142, true) -- melee alternative
--             DisableControlAction(0, 263, true) -- melee attack in vehicle

--             Wait(0)
--         end
--     end)

--     Wait(recoveryTime * 1000)
--     exports.qbx_core:Notify("Recovery process complete, you feel healthy again.", "success")
--     ResetPedMovementClipset(ped, 0)
--     ClearPedTasks(ped)

--     EmsNotified = false
-- end)

RegisterNetEvent('qbx_medical:client:playerRevived', function()
    EmsNotified = false
end)

---Sends player phone email with hospital bill.
---@param amount number
RegisterNetEvent('hospital:client:SendBillEmail', function(amount)
    if GetInvokingResource() then return end
    SetTimeout(math.random(2500, 4000), function()
        local charInfo = QBX.PlayerData.charinfo
        local gender = charInfo.gender == 1 and locale('info.mrs') or locale('info.mr')
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = locale('mail.sender'),
            subject = locale('mail.subject'),
            message = locale('mail.message', gender, charInfo.lastname, amount),
            button = {}
        })
    end)
end)

---Sets blips for stations on map
CreateThread(function()
    for _, station in pairs(sharedConfig.locations.stations) do
        local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
        SetBlipSprite(blip, 61)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 25)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(station.label)
        EndTextCommandSetBlipName(blip)
    end
end)

function GetClosestPlayer()
    return lib.getClosestPlayer(GetEntityCoords(cache.ped), 5.0, false)
end

function OnKeyPress(cb)
    if IsControlJustPressed(0, 38) then
        lib.hideTextUI()
        cb()
    end
end
