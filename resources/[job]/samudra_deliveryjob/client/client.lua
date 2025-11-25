-- Local state (names are generic where original intent isn't clear)
local jobData         = nil     -- originally L0_1
local routeData       = nil     -- originally L1_1
local someFlag        = false   -- originally L2_1

OnDuty                = false   -- global
JobVehicleNetId       = nil     -- global

local isJobActive                 = false  -- originally L3_1
local isVehicleInteractionBlocked = false  -- originally L4_1
local someCounter                 = 0      -- originally L5_1
local someToggle                  = false  -- originally L6_1

-- Can interact with vehicle helper
function canInteractWithVeh()
    return not isVehicleInteractionBlocked
end

local someList       = {}       -- originally L8_1
local someIndex      = 0        -- originally L9_1
local someOtherTable = {}       -- originally L10_1

-- Player server id
local playerServerId = GetPlayerServerId(PlayerId())

local someBoolFlag     = true   -- originally L12_1
local currentTutorial  = ""     -- originally L13_1
local isDriverLoaded   = false  -- originally L14_1
local isNuiLoaded      = false  -- originally L15_1

-- Keep references to original natives
local originalNetToObj = NetToObj   -- originally L16_1
local originalNetToVeh = NetToVeh   -- originally L17_1

-- Safe wrappers around NetToObj / NetToVeh
function NetToObj(netId)
    if NetworkDoesNetworkIdExist(netId) then
        return originalNetToObj(netId)
    else
        return 0
    end
end

function NetToVeh(netId)
    if NetworkDoesNetworkIdExist(netId) then
        return originalNetToVeh(netId)
    else
        return 0
    end
end

-- NUI callbacks
RegisterNUICallback("driverLoaded", function()
    isDriverLoaded = true
end)

RegisterNUICallback("nuiLoaded", function()
    isNuiLoaded = true
end)

-- UI init thread
CreateThread(function()
    -- Wait until driver is loaded
    while not isDriverLoaded do
        Citizen.Wait(100)
    end

    -- Select UI version
    if Config.useModernUI then
        SendNUIMessage({
            ui = "new"
        })
    else
        SendNUIMessage({
            ui = "old"
        })

        -- For old UI we mark NUI as loaded immediately
        isNuiLoaded = true
        Citizen.Wait(500)
    end

    -- Wait until NUI is ready
    while not isNuiLoaded do
        Citizen.Wait(100)
    end

    -- Configure progress bar alignment
    SendNUIMessage({
        action = "setProgressBarAlign",
        align  = Config.ProgressBarAlign,
        offset = Config.ProgressBarOffset
    })

    -- Optionally hide cloakroom
    if not Config.EnableCloakroom then
        SendNUIMessage({
            action = "hideCloakroom"
        })
    end
end)

-- Tutorial closed callback
RegisterNUICallback("tutorialClosed", function()
    SetNuiFocus(false, false)
    currentTutorial = ""
end)

-- NUI: menu closed
RegisterNUICallback("menuClosed", function()
    -- originally L12_1 = false
    someBoolFlag = false
    SetNuiFocus(false, false)
end)

-- NUI: "don't show this tutorial again"
RegisterNUICallback("dontShowTutorialAgain", function(data, cb)
    -- Save flag: 17mov_Tutorials:<tutorialName> = 1
    SetResourceKvpInt("17mov_Tutorials:" .. currentTutorial, 1)
    -- original code did NOT call cb, so we leave it that way
end)

-- Net event: update my reward
RegisterNetEvent("samudra_deliveryjob:SetMyReward")
AddEventHandler("samudra_deliveryjob:SetMyReward", function(reward)
    SendNUIMessage({
        action = "updateMyReward",
        reward = reward
    })
end)

-- Net event: update host reward percentages
RegisterNetEvent("samudra_deliveryjob:UpdateHostPercentages")
AddEventHandler("samudra_deliveryjob:UpdateHostPercentages", function(value)
    SendNUIMessage({
        action = "updateHostRewards",
        value  = value
    })
end)

-- Boss can (or cannot) split rewards
if Config.letBossSplitReward then
    -- NUI: boss checks if chosen reward split is valid
    RegisterNUICallback("checkIfThisRewardIsFine", function(data, cb)
        local value  = math.floor(data.value)
        local plyId  = data.plyId

        -- Range check
        if value > 100 or value < 0 then
            Notify(Config.Lang.wrongReward1)
            cb(false)
            return
        end

        -- Ask server to validate this reward split
        TriggerServerCallback(
            "samudra_deliveryjob:CheckThisReward",
            function(isOk)
                if isOk then
                    cb(true)
                else
                    cb(false)
                    Notify(Config.Lang.wrongReward2)
                end
            end,
            value,
            plyId
        )
    end)
else
    -- If boss splitting is disabled, hide that section in the UI once NUI is loaded
    CreateThread(function()
        while not isNuiLoaded do
            Citizen.Wait(100)
        end

        SendNUIMessage({
            action = "hideManageRewards"
        })
    end)
end

-----------------------------------------------------------------------
-- Clear lobby + re-init from server
-----------------------------------------------------------------------

RegisterNetEvent("samudra_deliveryjob:clearMyLobby")
AddEventHandler("samudra_deliveryjob:clearMyLobby", function()
    -- Clear local lobby cache
    lobbyData = {}

    -- Re-init from server
    TriggerServerCallback("samudra_deliveryjob:init", function(data)
        SendNUIMessage({
            action = "Init",
            name   = data.name,
            myId   = data.source
        })

        -- originally L6_1 = true
        isInitFinished = true
    end)
end)

-----------------------------------------------------------------------
-- Simple client/server callback system
-----------------------------------------------------------------------

-- serverCallbacks[name][id] = cb
serverCallbacks        = serverCallbacks or {}
serverCallbackCounter  = serverCallbackCounter or 0

function TriggerServerCallback(name, cb, ...)
    serverCallbackCounter = serverCallbackCounter + 1
    local requestId = serverCallbackCounter

    -- NOTE: original code always reset the table for this name
    serverCallbacks[name] = {}
    serverCallbacks[name][requestId] = cb

    TriggerServerEvent(
        "17mov_Callbacks:GetResponse" .. GetCurrentResourceName(),
        name,
        requestId,
        ...
    )
end

RegisterNetEvent("17mov_Callbacks:receiveData" .. GetCurrentResourceName())
AddEventHandler("17mov_Callbacks:receiveData" .. GetCurrentResourceName(), function(name, requestId, ...)
    if not serverCallbacks[name] or not serverCallbacks[name][requestId] then
        return
    end

    local cb = serverCallbacks[name][requestId]
    local response = ...       -- original code only passed the first vararg
    cb(response)

    -- Clean up callback
    if serverCallbacks[name] and serverCallbacks[name][requestId] then
        serverCallbacks[name][requestId] = nil
    end

    if serverCallbacks[name] and #serverCallbacks[name] == 0 then
        serverCallbacks[name] = nil
    end
end)

-----------------------------------------------------------------------
-- Job / marker logic
-----------------------------------------------------------------------

-- Controls whether this whole loop is running (was L18_1)
local isDelivererRunning = false

-- playerData == A0_2 in original
function StartDelivererJobLoop(playerData)
    -- Already running? Do nothing.
    if isDelivererRunning then
        return
    end

    -- Required job check (only at start)
    local requiredJob = Config.RequiredJob
    if requiredJob ~= "none" then
        if playerData.job.name ~= requiredJob then
            isDelivererRunning = false
            return
        end
    end

    isDelivererRunning = true

    -- Use target ped or markers
    if Config.UseTarget then
        ----------------------------------------------------------------
        -- TARGET MODE: only use FinishJob location with a ped
        ----------------------------------------------------------------
        SpawnStartingPed()

        local locations = {
            FinishJob = Config.Locations.FinishJob
        }

        while isDelivererRunning do
            Citizen.Wait(0)

            local playerCoords = GetEntityCoords(PlayerPedId())
            local isInMarker          = false  -- originally L3_2
            local didExitMarker       = false  -- originally L4_2
            local shouldSlowLoop      = true   -- originally L5_2
            local currentStation      = nil    -- originally L6_2
            local currentPart         = nil    -- originally L7_2
            local currentPartNum      = nil    -- originally L8_2

            -- NOTE: In the decompiled code this entire block only runs
            -- if Config.RequiredJob == "none". This matches the original logic.
            if Config.RequiredJob == "none" then
                for stationKey, station in pairs(locations) do
                    -- grade restriction
                    if station.grade and playerData.job.grade < station.grade then
                        goto continue_target_station
                    end

                    -- duty restriction
                    if not OnDuty and station.type ~= "duty" then
                        goto continue_target_station
                    end

                    for _, pos in pairs(station.Coords) do
                        local distance = #(playerCoords - pos)

                        if distance < 20.0 then
                            local radius = station.scale.x

                            if distance > radius then
                                DrawMarker(
                                    6,
                                    pos.x, pos.y, pos.z - 1.0,
                                    0.0, 0.0, 0.0,
                                    -90.0, 0.0, 0.0,
                                    station.scale.x, station.scale.y, station.scale.z,
                                    Config.MarkerSettings.UnActive.r,
                                    Config.MarkerSettings.UnActive.g,
                                    Config.MarkerSettings.UnActive.b,
                                    Config.MarkerSettings.UnActive.a,
                                    false, false, 2, false, false, false, false
                                )
                                shouldSlowLoop = false
                            else
                                shouldSlowLoop = false
                                DrawMarker(
                                    6,
                                    pos.x, pos.y, pos.z - 1.0,
                                    0.0, 0.0, 0.0,
                                    -90.0, 0.0, 0.0,
                                    station.scale.x, station.scale.y, station.scale.z,
                                    Config.MarkerSettings.Active.r,
                                    Config.MarkerSettings.Active.g,
                                    Config.MarkerSettings.Active.b,
                                    Config.MarkerSettings.Active.a,
                                    false, false, 2, false, false, false, false
                                )

                                -- These assignments mirror the decompiled code
                                isInMarker     = true
                                currentStation = stationKey
                                currentPart    = stationKey
                                currentPartNum = Iterator
                            end
                        end
                    end

                    ::continue_target_station::
                end
            end

            -- Enter / exit marker handling
            if isInMarker then
                if not HasAlreadyEnteredMarker then
                    if LastStation and LastPart and LastPartNum then
                        if LastStation ~= currentStation
                        or LastPart ~= currentPart
                        or LastPartNum ~= currentPartNum then

                            TriggerEvent(
                                "samudra_deliveryjob:ExitedMarker",
                                LastStation,
                                LastPart,
                                LastPartNum
                            )
                            didExitMarker = true
                        end
                    end

                    HasAlreadyEnteredMarker = true
                    LastStation = currentStation
                    LastPart    = currentPart
                    LastPartNum = currentPartNum

                    TriggerEvent("samudra_deliveryjob:EnteredMarker", currentPart)
                else
                    if LastStation ~= currentStation
                    or LastPart ~= currentPart
                    or LastPartNum ~= currentPartNum then

                        if LastStation and LastPart and LastPartNum then
                            TriggerEvent(
                                "samudra_deliveryjob:ExitedMarker",
                                LastStation,
                                LastPart,
                                LastPartNum
                            )
                            didExitMarker = true
                        end

                        HasAlreadyEnteredMarker = true
                        LastStation = currentStation
                        LastPart    = currentPart
                        LastPartNum = currentPartNum

                        TriggerEvent("samudra_deliveryjob:EnteredMarker", currentPart)
                    end
                end
            end

            if not didExitMarker and not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent(
                    "samudra_deliveryjob:ExitedMarker",
                    LastStation,
                    LastPart,
                    LastPartNum
                )
            end

            if shouldSlowLoop then
                Citizen.Wait(500)
            end
        end

        -- Cleanup spawned peds (both variants from original)
        if spawnedPed then
            DeleteEntity(spawnedPed)
        end

        if SpawnedPed then
            DeleteEntity(SpawnedPed)
        end

    else
        ----------------------------------------------------------------
        -- MARKER MODE: use all Config.Locations
        ----------------------------------------------------------------
        while isDelivererRunning do
            Citizen.Wait(0)

            local playerCoords = GetEntityCoords(PlayerPedId())
            local isInMarker          = false  -- originally L2_2
            local didExitMarker       = false  -- originally L3_2
            local shouldSlowLoop      = true   -- originally L4_2
            local currentStation      = nil    -- originally L5_2
            local currentPart         = nil    -- originally L6_2
            local currentPartNum      = nil    -- originally L7_2

            if Config.RequiredJob == "none" then
                for stationKey, station in pairs(Config.Locations) do
                    -- grade restriction
                    if station.grade and playerData.job.grade < station.grade then
                        goto continue_marker_station
                    end

                    -- duty restriction
                    if not OnDuty and station.type ~= "duty" then
                        goto continue_marker_station
                    end

                    for _, pos in pairs(station.Coords) do
                        local distance = #(playerCoords - pos)

                        if distance < 20.0 then
                            local radius = station.scale.x

                            if distance > radius then
                                DrawMarker(
                                    6,
                                    pos.x, pos.y, pos.z - 1.0,
                                    0.0, 0.0, 0.0,
                                    -90.0, 0.0, 0.0,
                                    station.scale.x, station.scale.y, station.scale.z,
                                    Config.MarkerSettings.UnActive.r,
                                    Config.MarkerSettings.UnActive.g,
                                    Config.MarkerSettings.UnActive.b,
                                    Config.MarkerSettings.UnActive.a,
                                    false, false, 2, false, false, false, false
                                )
                                shouldSlowLoop = false
                            else
                                DrawMarker(
                                    6,
                                    pos.x, pos.y, pos.z - 1.0,
                                    0.0, 0.0, 0.0,
                                    -90.0, 0.0, 0.0,
                                    station.scale.x, station.scale.y, station.scale.z,
                                    Config.MarkerSettings.Active.r,
                                    Config.MarkerSettings.Active.g,
                                    Config.MarkerSettings.Active.b,
                                    Config.MarkerSettings.Active.a,
                                    false, false, 2, false, false, false, false
                                )

                                -- These assignments mirror the decompiled code
                                local inMarkerTemp   = true
                                local stationTemp1   = stationKey
                                local stationTemp2   = stationKey

                                currentPartNum = Iterator
                                currentPart    = stationTemp2
                                currentStation = stationTemp1
                                isInMarker     = inMarkerTemp
                                shouldSlowLoop = false
                            end
                        end
                    end

                    ::continue_marker_station::
                end
            end

            -- Enter / exit marker handling
            if isInMarker then
                if not HasAlreadyEnteredMarker then
                    if LastStation and LastPart and LastPartNum then
                        if LastStation ~= currentStation
                        or LastPart ~= currentPart
                        or LastPartNum ~= currentPartNum then

                            TriggerEvent(
                                "samudra_deliveryjob:ExitedMarker",
                                LastStation,
                                LastPart,
                                LastPartNum
                            )
                            didExitMarker = true
                        end
                    end

                    HasAlreadyEnteredMarker = true
                    LastStation = currentStation
                    LastPart    = currentPart
                    LastPartNum = currentPartNum

                    TriggerEvent("samudra_deliveryjob:EnteredMarker", currentPart)
                else
                    if LastStation ~= currentStation
                    or LastPart ~= currentPart
                    or LastPartNum ~= currentPartNum then

                        if LastStation and LastPart and LastPartNum then
                            TriggerEvent(
                                "samudra_deliveryjob:ExitedMarker",
                                LastStation,
                                LastPart,
                                LastPartNum
                            )
                            didExitMarker = true
                        end

                        HasAlreadyEnteredMarker = true
                        LastStation = currentStation
                        LastPart    = currentPart
                        LastPartNum = currentPartNum

                        TriggerEvent("samudra_deliveryjob:EnteredMarker", currentPart)
                    end
                end
            end

            if not didExitMarker and not isInMarker and HasAlreadyEnteredMarker then
                HasAlreadyEnteredMarker = false
                TriggerEvent(
                    "samudra_deliveryjob:ExitedMarker",
                    LastStation,
                    LastPart,
                    LastPartNum
                )
            end

            if shouldSlowLoop then
                Citizen.Wait(500)
            end
        end
    end
end





-----------------------------------------------------------------------
-- Startup thread: load anims, get PlayerData, create blips, start markers
-----------------------------------------------------------------------

Citizen.CreateThread(function()
    -- Initial PlayerData fetch
    PlayerData = GetPlayerData()

    -- Ensure the box-carry anim dict is loaded
    while not HasAnimDictLoaded("anim@heists@box_carry@") do
        RequestAnimDict("anim@heists@box_carry@")
        Citizen.Wait(5)
    end

    -- Wait for PlayerData.job to be available
    PlayerData = GetPlayerData()
    while not PlayerData or not PlayerData.job do
        PlayerData = GetPlayerData()
        Citizen.Wait(1000)
    end

    -- Create blips on map if allowed by config
    if not Config.RestrictBlipToRequiredJob
       or Config.RequiredJob == PlayerData.job.name then
        MakeBlip()
    end

    Citizen.Wait(5000)

    -- Start marker loop for current player data
    StartDelivererJobLoop(PlayerData)
end)

-----------------------------------------------------------------------
-- Blip handling
-----------------------------------------------------------------------

local blipsCreated = false  -- originally L19_1

function MakeBlip()
    if blipsCreated then
        return
    end

    blipsCreated = true

    for _, cfg in pairs(Config.Blips) do
        local blip = AddBlipForCoord(cfg.Pos.x, cfg.Pos.y, cfg.Pos.z)
        cfg.blip = blip

        SetBlipSprite(blip,  cfg.Sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip,   cfg.Scale)
        SetBlipColour(blip,  cfg.Color)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(cfg.Label)
        EndTextCommandSetBlipName(blip)
    end
end

function DeleteBlip()
    blipsCreated = false

    for _, cfg in pairs(Config.Blips) do
        RemoveBlip(cfg.blip)
        cfg.blip = nil
    end
end

-----------------------------------------------------------------------
-- Script initialization (only runs once)
-----------------------------------------------------------------------

local scriptInitialized = false  -- originally L2_1

function InitalizeScript(skipExtraWait)
    if scriptInitialized then
        return
    end

    -- Wait for NUI (modern) or fixed delay (old)
    if Config.useModernUI then
        while not isNuiLoaded do
            Citizen.Wait(100)
        end
    else
        Citizen.Wait(5500)
    end

    PlayerData = GetPlayerData()

    -- Extra wait if not explicitly skipped
    if not skipExtraWait then
        Citizen.Wait(5500)
    end

    scriptInitialized = true

    -- Job / blip logic (kept exactly as in original, even if odd)
    if Config.RequiredJob ~= "none" then
        if Config.RestrictBlipToRequiredJob then
            -- Wait until job is definitely loaded
            while not (PlayerData and PlayerData.job) do
                PlayerData = GetPlayerData()
                Citizen.Wait(100)
            end

            local jobName   = PlayerData.job.name
            local required  = Config.RequiredJob
            local tmp       = Config.RestrictBlipToRequiredJob

            if jobName ~= required then
                tmp = Config.RestrictBlipToRequiredJob
            end

            if not tmp then
                MakeBlip()
            end
        end
    else
        -- No required job -> always create blips
        MakeBlip()
    end

    -- Initial NUI data from server
    TriggerServerCallback("samudra_deliveryjob:init", function(data)
        SendNUIMessage({
            action = "Init",
            name   = data.name,
            myId   = data.source
        })

        -- originally L6_1 = true
        isInitFinished = true
    end)
end

-----------------------------------------------------------------------
-- Player loaded events
-----------------------------------------------------------------------

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    InitalizeScript()
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    InitalizeScript()
end)

-----------------------------------------------------------------------
-- Job change: QBCore
-----------------------------------------------------------------------

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(newJob)
    -- Original code ignores newJob and re-reads from core:
    PlayerData = GetPlayerData()

    -- Blip logic (kept 1:1 with original)
    local restrict = Config.RestrictBlipToRequiredJob

    if Config.RequiredJob ~= "none" then
        if restrict then
            local name     = PlayerData.job.name
            local required = Config.RequiredJob

            if name == required then
                -- In original, L1_2 here becomes a string (job name),
                -- so "if not L1_2" is always false -> DeleteBlip()
                DeleteBlip()
            else
                restrict = Config.RestrictBlipToRequiredJob
                if not restrict then
                    MakeBlip()
                else
                    DeleteBlip()
                end
            end
        else
            -- restrict = false
            MakeBlip()
        end
    else
        -- RequiredJob == "none"
        if not restrict then
            MakeBlip()
        else
            DeleteBlip()
        end
    end

    -- Start/stop markers depending on required job
    local required = Config.RequiredJob
    if required ~= "none" then
        if PlayerData.job.name == required then
            required = Config.RequiredJob
        end
    else
        required = Config.RequiredJob
    end

    if required == "none" then
        StartDelivererJobLoop(PlayerData)
    else
        -- originally L18_1 = false
        isDelivererRunning = false
    end
end)

-----------------------------------------------------------------------
-- Job change: ESX
-----------------------------------------------------------------------

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    -- Wait until PlayerData & PlayerData.job exist
    while not (PlayerData and PlayerData.job) do
        PlayerData = GetPlayerData()
        Citizen.Wait(1000)
    end

    -- Apply new job
    PlayerData.job = job

    -- Blip logic (same pattern as QBCore handler)
    local restrict = Config.RestrictBlipToRequiredJob

    if Config.RequiredJob ~= "none" then
        if restrict then
            local name     = PlayerData.job.name
            local required = Config.RequiredJob

            if name == required then
                -- same "string as bool" quirk as original
                DeleteBlip()
            else
                restrict = Config.RestrictBlipToRequiredJob
                if not restrict then
                    MakeBlip()
                else
                    DeleteBlip()
                end
            end
        else
            MakeBlip()
        end
    else
        if not restrict then
            MakeBlip()
        else
            DeleteBlip()
        end
    end

    -- Start/stop markers depending on required job
    local required = Config.RequiredJob
    if required ~= "none" then
        if PlayerData.job.name == required then
            required = Config.RequiredJob
        end
    else
        required = Config.RequiredJob
    end

    if required == "none" then
        StartDelivererJobLoop(PlayerData)
    else
        isDelivererRunning = false
    end
end)
-----------------------------------------------------------------------
-- Marker enter / exit
-----------------------------------------------------------------------
AddEventHandler("samudra_deliveryjob:EnteredMarker", function(locationKey)
    local cfg = Config.Locations[locationKey]
    if not cfg then return end

    CurrentAction        = cfg.CurrentAction
    CurrentActionMsg     = cfg.CurrentActionMsg
    CurrentActionStation = locationKey

    -- Tampilkan ox_lib TextUI
    if CurrentActionMsg then
        lib.showTextUI(CurrentActionMsg, {
            position = "left-center",
            icon = "fa-solid fa-truck",
            style = {
                borderRadius = 8,
                color = "white",
                fontSize = "14px",
                padding = "8px 12px"
            }
        })
    end
end)

AddEventHandler("samudra_deliveryjob:ExitedMarker", function(_)
    CurrentAction        = nil
    CurrentActionMsg     = nil
    CurrentActionStation = nil

    lib.hideTextUI()
end)

-- AddEventHandler("samudra_deliveryjob:EnteredMarker", function(locationKey)
--     local cfg = Config.Locations[locationKey]
--     if not cfg then return end

--     CurrentAction        = cfg.CurrentAction
--     CurrentActionMsg     = cfg.CurrentActionMsg
--     CurrentActionStation = locationKey

--     -- Show help text for a short time
--     for i = 1, 500 do
--         Citizen.Wait(0)
--         ShowHelpNotification(CurrentActionMsg)
--     end
-- end)

-- AddEventHandler("samudra_deliveryjob:ExitedMarker", function(_)
--     CurrentAction        = nil
--     CurrentActionMsg     = nil
--     CurrentActionStation = nil
-- end)

-----------------------------------------------------------------------
-- E key interaction (start marker action)
-----------------------------------------------------------------------

RegisterCommand("+delivererStartMarkerAction", function() end, false)

RegisterCommand("-delivererStartMarkerAction", function()
    if not CurrentAction then
        return
    end

    if CurrentAction == "open_dutyToggle" then
        OpenDutyMenu()
    elseif CurrentAction == "finish_job" then
        TriggerServerCallback("samudra_deliveryjob:IfPlayerIsHost", function(isHost)
            if isHost then
                EndJob()
            else
                Notify(Config.Lang.no_permission)
            end
        end)
    end
end, false)

-----------------------------------------------------------------------
-- End job logic + warning
-----------------------------------------------------------------------

local canEndJob = true

function EndJob()
    if not canEndJob then
        return
    end
    canEndJob = false

    local playerPed = PlayerPedId()
    local veh       = GetVehiclePedIsIn(playerPed, false)
    local driverPed = GetPedInVehicleSeat(veh, -1)

    -- If in a vehicle but not the driver, deny
    if driverPed ~= playerPed then
        if IsPedInAnyVehicle(playerPed, false) then
            Notify(Config.Lang.notADriver)
            canEndJob = true
            return
        end
    end

    -- If in the job vehicle, delete it and end immediately
    if veh ~= 0 then
        local model    = GetEntityModel(veh)
        local jobModel = GetHashKey(Config.JobVehicleModel)

        if model == jobModel then
            DeleteVehicleByCore(veh)
            TriggerServerEvent("samudra_deliveryjob:endJob_sv", true)
            canEndJob = true
            return
        end
    end

    -- Otherwise open warning NUI
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "openWarning" })
    canEndJob = true
end

RegisterNUICallback("acceptWarning", function(_)
    TriggerServerEvent("samudra_deliveryjob:endJob_sv", false)

    if Config.DeleteVehicleWithPenalty then
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            DeleteVehicleByCore(veh)
        end
    end
end)

-- Remove old chat suggestions and bind key
TriggerEvent("chat:removeSuggestion", "/+delivererStartMarkerAction")
TriggerEvent("chat:removeSuggestion", "/-delivererStartMarkerAction")

RegisterKeyMapping(
    "+delivererStartMarkerAction",
    Config.Lang.keybind,
    "keyboard",
    "E"
)

-----------------------------------------------------------------------
-- Lobby + duty menu
-----------------------------------------------------------------------

-- Global lobby table (same one used in clearMyLobby / RefreshMugs)
lobbyData   = lobbyData or {}   -- [id] = { name, id, isHost, rewardPercent, itsMe }
local nearbyCache = {}
local menuOpen    = false

-- scriptInitialized / isInitFinished should already exist from earlier chunks:
--   scriptInitialized  -- was L2_1
--   isInitFinished     -- was L6_1

if Config.useModernUI then
    -------------------------------------------------------------------
    -- Modern UI duty menu
    -------------------------------------------------------------------
    OpenDutyMenu = function()
        if not scriptInitialized then
            InitalizeScript(true)
            print("SCRIPT NOT READY - WAIT UNTIL SCRIPT PROPERLY LOAD")
            return
        end

        if not isInitFinished then
            TriggerServerCallback("samudra_deliveryjob:init", function(res)
                SendNUIMessage({
                    action = "Init",
                    name   = res.name,
                    myId   = res.source
                })
                isInitFinished = true
            end)

            print("SCRIPT NOT READY - WAIT UNTIL SCRIPT PROPERLY LOAD")
            return
        end

        SendNUIMessage({ action = "OpenWorkMenu" })
        SetNuiFocus(true, true)
        menuOpen = true

        local hasPlayersTab     = false
        local hidingPlayersTab  = false
        local showingPlayersTab = false

        CreateThread(function()
            while menuOpen do
                local players = GetActivePlayers()
                local myPos   = GetEntityCoords(PlayerPedId())
                local list    = {}

                for _, pid in pairs(players) do
                    if pid ~= PlayerId() then
                        local ped  = GetPlayerPed(pid)
                        local pPos = GetEntityCoords(ped)

                        if #(myPos - pPos) < 10.0 then
                            table.insert(list, GetPlayerServerId(pid))
                        end
                    end
                end

                if #list ~= 0 or showingPlayersTab then
                    TriggerServerCallback("17mov_postman:GetPlayersNames", function(out)
                        local added = false

                        -- Add / track nearby players
                        for _, info in pairs(out) do
                            if not lobbyData[info.id] then
                                added = true

                                if not nearbyCache[info.id] then
                                    nearbyCache[info.id] = {
                                        id   = info.id,
                                        name = info.name
                                    }

                                    CreateThread(function()
                                        while not showingPlayersTab do
                                            Citizen.Wait(10)
                                        end

                                        SendNUIMessage({
                                            action = "addNewNearbyPlayer",
                                            id     = info.id,
                                            name   = info.name
                                        })
                                    end)
                                end
                            end
                        end

                        showingPlayersTab = false

                        -- Remove from nearby cache if they disappeared
                        for id, _ in pairs(nearbyCache) do
                            hidingPlayersTab = true
                            local stillThere = false

                            for _, s in pairs(out) do
                                if s.id == id then
                                    stillThere = true
                                    break
                                end
                            end

                            if not stillThere then
                                nearbyCache[id] = nil

                                SendNUIMessage({
                                    action = "DeleteNearbyPlayer",
                                    id     = id
                                })

                                CreateThread(function()
                                    Citizen.Wait(250)
                                    hidingPlayersTab = false
                                end)
                            end
                        end

                        -- Show / hide nearby players tab
                        if not added then
                            if hasPlayersTab then
                                CreateThread(function()
                                    while hidingPlayersTab do
                                        Citizen.Wait(10)
                                    end

                                    SendNUIMessage({ action = "hideNearbyPlayersTab" })
                                    CreateThread(function()
                                        Citizen.Wait(250)
                                        hasPlayersTab = false
                                    end)
                                end)
                            end
                        else
                            if not hasPlayersTab then
                                SendNUIMessage({ action = "showNearbyPlayersTab" })
                                CreateThread(function()
                                    Citizen.Wait(250)
                                    hasPlayersTab = true
                                end)
                            end
                        end
                    end, list)
                end

                Citizen.Wait(2500)
            end
        end)
    end
else
    -------------------------------------------------------------------
    -- Old UI duty menu
    -------------------------------------------------------------------
    OpenDutyMenu = function()
        if not scriptInitialized then
            InitalizeScript(true)
            print("SCRIPT NOT READY - WAIT UNTIL SCRIPT PROPERLY LOAD")
            return
        end

        if not isInitFinished then
            TriggerServerCallback("samudra_deliveryjob:init", function(res)
                SendNUIMessage({
                    action = "Init",
                    name   = res.name,
                    myId   = res.source
                })
                isInitFinished = true
            end)

            print("SCRIPT NOT READY - WAIT UNTIL SCRIPT PROPERLY LOAD")
            return
        end

        TriggerServerCallback("samudra_deliveryjob:IfPlayerIsHost", function(isHost)
            SendNUIMessage({
                action = "HostStatusUpdate",
                status = isHost
            })

            SendNUIMessage({ action = "OpenWorkMenu" })
            SetNuiFocus(true, true)
        end)
    end
end

-----------------------------------------------------------------------
-- Clothes (work / citizen)
-----------------------------------------------------------------------

local inWorkClothes = false

RegisterNUICallback("changeClothes", function(data)
    if data.type == "work" then
        inWorkClothes = true
        ChangeClothes("work")
    else
        inWorkClothes = false
        ChangeClothes("citizen")
    end
end)

-----------------------------------------------------------------------
-- Nearby players (for invite UI)
-----------------------------------------------------------------------

RegisterNUICallback("GetClosestPlayers", function(_, cb)
    local players  = GetActivePlayers()
    local myCoords = GetEntityCoords(PlayerPedId())
    local nearby   = {}

    for _, pid in pairs(players) do
        if pid ~= PlayerId() then
            local ped    = GetPlayerPed(pid)
            local pCoord = GetEntityCoords(ped)

            if #(myCoords - pCoord) < 20.0 then
                table.insert(nearby, GetPlayerServerId(pid))
            end
        end
    end

    TriggerServerCallback("samudra_deliveryjob:IfPlayerIsHost", function(isHost)
        if isHost then
            TriggerServerCallback("samudra_deliveryjob:GetPlayersNames", function(out)
                cb(out)

                if #out == 0 then
                    Notify(Config.Lang.nobodyNearby)
                end
            end, nearby)
        else
            Notify(Config.Lang.no_permission)
        end
    end)
end)

-----------------------------------------------------------------------
-- Various NUI callbacks
-----------------------------------------------------------------------

RegisterNUICallback("requestReacted", function(data)
    TriggerServerEvent("samudra_deliveryjob:ClientReactRequest", data.boolean)
end)

RegisterNUICallback("sendRequest", function(data)
    if OnDuty then
        Notify(Config.Lang.cantInvite)
        return
    end

    TriggerServerEvent(
        "samudra_deliveryjob:SendRequestToClient_sv",
        tonumber(data.id)
    )
end)

RegisterNUICallback("kickPlayerFromLobby", function(data)
    local id = tonumber(data.id)
    if not id or not lobbyData[id] then
        return
    end

    Notify(string.format(Config.Lang.kicked, lobbyData[id].name))
    TriggerServerEvent("samudra_deliveryjob:KickPlayerFromLobby", id, true)
end)

RegisterNUICallback("focusOff", function(_)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("notify", function(data)
    Notify(data.msg)
end)

-----------------------------------------------------------------------
-- Invite popup from server
-----------------------------------------------------------------------

RegisterNetEvent("samudra_deliveryjob:SendRequestToClient_cl")
AddEventHandler("samudra_deliveryjob:SendRequestToClient_cl", function(name, _)
    SendNUIMessage({
        action = "ShowInviteBox",
        name   = name
    })

    SetNuiFocus(true, true)
end)

-----------------------------------------------------------------------
-- Refresh lobby (mugs) - different for modern / old UI
-----------------------------------------------------------------------

if Config.useModernUI then
    RegisterNetEvent("samudra_deliveryjob:RefreshMugs")
    AddEventHandler("samudra_deliveryjob:RefreshMugs", function(players, myId)
        -- Wait until base NUI init is done
        while not isInitFinished do
            Citizen.Wait(100)
        end

        -- Add / update members
        for _, info in pairs(players) do
            -- Remove from nearby list if there
            SendNUIMessage({
                action = "DeleteNearbyPlayer",
                id     = info.id
            })

            if lobbyData[info.id] == nil then
                lobbyData[info.id] = {
                    name          = info.name,
                    id            = info.id,
                    isHost        = info.isHost,
                    rewardPercent = info.rewardPercent,
                    itsMe         = (playerServerId == info.id)
                }

                SendNUIMessage({
                    action        = "addNewMember",
                    name          = info.name,
                    id            = info.id,
                    isHost        = info.isHost,
                    rewardPercent = info.rewardPercent,
                    showQuitBtn   = lobbyData[info.id].itsMe
                })
            end
        end

        -- Remove members that are no longer in the list
        local count = 0

        for id, member in pairs(lobbyData) do
            local stillThere = false

            for _, info in pairs(players) do
                if info.id == id then
                    stillThere = true
                    break
                end
            end

            if not stillThere then
                lobbyData[id] = nil
                SendNUIMessage({
                    action = "DeletePlayer",
                    id     = id
                })
            else
                count = count + 1
            end
        end

        -- If only me left, re-init my data
        if count == 1 then
            TriggerServerCallback("samudra_deliveryjob:init", function(data)
                SendNUIMessage({
                    action = "Init",
                    name   = data.name,
                    myId   = data.source
                })
                isInitFinished = true
            end)
        end

        -- Toggle host HUD depending on ownership
        TriggerServerCallback("samudra_deliveryjob:IfPlayerOwnsTeam", function(ownsTeam)
            SendNUIMessage({
                action  = "ToggleHostHUD",
                boolean = ownsTeam
            })
        end)
    end)
else
    RegisterNetEvent("samudra_deliveryjob:RefreshMugs")
    AddEventHandler("samudra_deliveryjob:RefreshMugs", function(names, myId)
        while not isInitFinished do
            Citizen.Wait(100)
        end

        Citizen.Wait(100)

        SendNUIMessage({
            action = "refreshMugs",
            names  = names,
            myId   = myId
        })

        TriggerServerCallback("samudra_deliveryjob:IfPlayerIsHost", function(isHost)
            SendNUIMessage({
                action = "HostStatusUpdate",
                status = isHost
            })
        end)
    end)
end

-----------------------------------------------------------------------
-- Spawn point check
-----------------------------------------------------------------------

function IsSpawnPointClear()
    local spawn = vec3(
        Config.SpawnPoint.x,
        Config.SpawnPoint.y,
        Config.SpawnPoint.z
    )

    local vehicles = GetGamePool("CVehicle")

    if not vehicles or type(vehicles) ~= "table" then
        print("FAILED TO FETCH GAMEPOOL - Returning CLEAR")
        return true
    end

    for _, veh in pairs(vehicles) do
        local dist = #(GetEntityCoords(veh) - spawn)
        if dist < 6.0 then
            return false
        end
    end

    return true
end

-----------------------------------------------------------------------
-- Start job + leave lobby
-----------------------------------------------------------------------

RegisterNUICallback("startJob", function(_)
    if not OnDuty then
        if IsSpawnPointClear() then
            TriggerServerEvent("samudra_deliveryjob:StartJob_sv")
        else
            Notify(Config.Lang.spawnpointOccupied)
        end
    else
        Notify(Config.Lang.alreadyWorking)
    end
end)

RegisterNUICallback("leaveLobby", function(data)
    if OnDuty then
        Notify(Config.Lang.cantLeaveLobby)
        return
    end

    local id = tonumber(data.id)

    TriggerServerEvent(
        "samudra_deliveryjob:KickPlayerFromLobby",
        id,
        false,
        GetPlayerServerId(PlayerId())
    )

    Notify(Config.Lang.quit)
end)

-----------------------------------------------------------------------
-- Spawn job vehicle
-----------------------------------------------------------------------

function SpawnVehicle(model, spawn)
    -- Prepare world / player for spawning (defined elsewhere)
    PrepeareVehicle()

    -- Request model with a max of 100 tries
    local attempts = 100
    RequestModel(model)

    while not HasModelLoaded(model) and attempts > 0 do
        Citizen.Wait(100)
        attempts = attempts - 1
        RequestModel(model)
    end

    -- Create the vehicle
    local vehicle = CreateVehicle(
        model,
        spawn.x, spawn.y, spawn.z,
        spawn.w,
        true,  -- isNetwork
        false  -- thisScriptCheck
    )

    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetVehRadioStation(vehicle, "OFF")
    SetVehicleFuelLevel(vehicle, 100.0)

    -- Optionally warp player into the driver seat
    if Config.EnableVehicleTeleporting then
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end

    -- Custom vehicle setup (locks, plates, keys, etc.)
    SetVehicle(vehicle)

    -- Sanity check that entity exists
    local checkAttempts = 100
    while not DoesEntityExist(vehicle) and checkAttempts > 0 do
        Citizen.Wait(100)
        checkAttempts = checkAttempts - 1
    end

    return vehicle
end

-----------------------------------------------------------------------
-- Start job client event
-----------------------------------------------------------------------

RegisterNetEvent("samudra_deliveryjob:StartJob_cl")
AddEventHandler("samudra_deliveryjob:StartJob_cl", function(hostId, myId, _, lobbySize, _, isRejoin)
    OnDuty = true

    -- Make sure we are in work clothes if required
    CreateThread(function()
        if not inWorkClothes and Config.RequireWorkClothes then
            inWorkClothes = true
            ChangeClothes("work")
        end
    end)

    -------------------------------------------------------------------
    -- Spawn / obtain job vehicle (host vs members)
    -------------------------------------------------------------------

    if hostId == myId and not isRejoin then
        -- Host: spawn the vehicle
        if Config.EnableVehicleTeleporting then
            DoScreenFadeOut(500)
            Citizen.Wait(500)
        end

        local veh = SpawnVehicle(Config.JobVehicleModel, Config.SpawnPoint)
        Citizen.Wait(500)
        DoScreenFadeIn(500)

        JobVehicle        = veh
        JobVehicleNetId   = VehToNet(JobVehicle)

        TriggerServerEvent("samudra_deliveryjob:uploadJobVehicle", JobVehicleNetId)
    else
        -- Party members: wait until server tells us which network vehicle is ours
        Citizen.Wait(150)

        while true do
            local result = nil

            TriggerServerCallback("samudra_deliveryjob:getPartyVeh", function(netId)
                if netId ~= nil then
                    JobVehicleNetId = netId

                    local veh = NetToVeh(netId)
                    -- Wait for network vehicle to exist
                    while veh == 0 do
                        print("Waiting For Vehicle")
                        Citizen.Wait(100)
                        veh = NetToVeh(netId)
                    end

                    Citizen.Wait(1500)
                    JobVehicle = veh
                    result     = true
                else
                    result = false
                end
            end)

            -- Wait until callback finishes
            while result == nil do
                Citizen.Wait(10)
            end

            if result then
                break
            end

            Citizen.Wait(500)
        end

        if Config.GiveKeysToAllLobby then
            SetVehicle(JobVehicle)
        end
    end

    -------------------------------------------------------------------
    -- Keep local JobVehicle synced with network ID
    -------------------------------------------------------------------

    CreateThread(function()
        while OnDuty do
            if JobVehicleNetId ~= 0 and JobVehicleNetId ~= nil then
                if NetworkDoesNetworkIdExist(JobVehicleNetId) then
                    local veh = NetToVeh(JobVehicleNetId)

                    if JobVehicle ~= veh
                       and veh ~= JobVehicleNetId
                       and veh ~= 0
                       and veh ~= nil then
                        JobVehicle = veh
                    end
                end
            end

            Citizen.Wait(5000)
        end
    end)

    Citizen.Wait(500)

    -------------------------------------------------------------------
    -- Tutorial + job counter
    -------------------------------------------------------------------

    if not isRejoin then
        local kvpName = "17mov_Tutorials:" .. "delivererTutorial"
        local seen    = GetResourceKvpInt(kvpName)

        if seen == 0 then
            currentTutorial = "delivererTutorial"

            SetNuiFocus(true, true)
            SendNUIMessage({
                action    = "showTutorial",
                customText = Config.Lang.tutorial
            })
        end
    end

    -- Show counter
    SendNUIMessage({ action = "showCounter" })

    if not isRejoin then
        SendNUIMessage({
            action = "updateCounter",
            value  = "0"
        })
    end

    -------------------------------------------------------------------
    -- Block host from working if configured (e.g. lobby size 2)
    -------------------------------------------------------------------

    if Config.BlockHostFromWorking
       and hostId == myId
       and lobbySize == 2 then
        return
    end

    -------------------------------------------------------------------
    -- Interaction with vehicle (take parcels) or target system
    -------------------------------------------------------------------

    if not Config.UseTarget then
        -- Classic 3D text interaction near the back of the van
        while OnDuty do
            Citizen.Wait(0)

            if not isCarryingPackage then
                local ped        = PlayerPedId()
                local playerPos  = GetEntityCoords(ped)

                -- Vehicle back bone position
                local boneIndex  = GetEntityBoneIndexByName(JobVehicle, Config.VehicleBackBone)
                local backPos    = GetWorldPositionOfEntityBone(JobVehicle, boneIndex)

                if Config.Debug ~= nil then
                    local dist = #(playerPos - backPos)
                    local sitting = IsPedSittingInAnyVehicle(ped)
                    print("Vh:", JobVehicle, "Distance:", dist, "Native:", sitting)
                end

                local dist = #(playerPos - backPos)

                if dist < 2.0 then
                    if not IsPedSittingInAnyVehicle(ped) then
                        if Config.Debug ~= nil then
                            print("DRAWING")
                        end

                        DrawText3Ds(
                            backPos.x,
                            backPos.y,
                            backPos.z,
                            Config.keybindSettings.bagsInteractionkeyString ..
                            Config.Lang.takeParcel
                        )

                        local key = Config.keybindSettings.bagsInteractionKey or 38

                        if IsControlJustReleased(0, key) then
                            Pick(
                                "hei_prop_heist_box",
                                "anim@heists@box_carry@",
                                "idle",
                                backPos
                            )
                        end
                    end
                else
                    Citizen.Wait(500)
                end
            else
                Citizen.Wait(500)
            end
        end
    else
        -- Target-based interaction system
        AddJobVehicleToTargetSystem(JobVehicle)
    end
end)

-----------------------------------------------------------------------
-- Pick up parcel from vehicle
-----------------------------------------------------------------------

function Pick(propModel, animDict, animName, targetCoords)
    -- Already carrying something? Do nothing.
    if isCarryingPackage then
        return
    end

    local ped         = PlayerPedId()
    local playerPos   = GetEntityCoords(ped)

    -- Too far from job area?
    if JobAreaCenter then
        local distFromOrigin = #(playerPos - JobAreaCenter)
        if distFromOrigin > 75.0 then
            Notify(Config.Lang.tooFar)
            return
        end
    end

    -- Move player slightly backwards (for nicer alignment)
    local pos      = GetEntityCoords(ped)
    local forward  = GetEntityForwardVector(ped) * 0.5
    pos            = pos - forward

    SetEntityCoords(
        ped,
        pos.x,
        pos.y,
        pos.z - 1.0,
        false, false, false, false
    )

    -- Open back doors
    SetVehicleDoorOpen(JobVehicle, 2, false, false)
    SetVehicleDoorOpen(JobVehicle, 3, false, false)

    -- Ensure anim dict is loaded
    while not HasAnimDictLoaded(animDict) do
        RequestAnimDict(animDict)
        Citizen.Wait(5)
    end

    -- Slide toward the back of the vehicle
    TaskPedSlideToCoord(
        ped,
        targetCoords.x,
        targetCoords.y,
        targetCoords.z,
        GetEntityHeading(ped),
        1500
    )

    Citizen.Wait(750)
    ClearPedTasks(ped)

    -- Search scenario at vehicle
    TaskStartScenarioInPlace(
        ped,
        Config.VehicleSearchingScenario,
        0,
        true
    )

    Citizen.Wait(2000)
    ClearPedTasks(ped)
    Citizen.Wait(500)

    -- Create box object and attach to hand
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local obj = CreateObject(
        GetHashKey(propModel),
        x, y, z + 0.2,
        true, true, true
    )

    carriedPackageObj = obj

    AttachEntityToEntity(
        obj,
        ped,
        GetPedBoneIndex(ped, 60309),   -- right hand
        0.025, 0.08, 0.255,
        -145.0, 290.0, 180.0,
        true, true, false, true, 1, true
    )

    -- Start carry animation
    TaskPlayAnim(
        ped,
        animDict,
        animName,
        3.0,
        -8.0,
        -1,
        63,
        0.0,
        false,
        false,
        false
    )

    Citizen.Wait(1500)

    -- Close doors again
    SetVehicleDoorShut(JobVehicle, 2, false)
    SetVehicleDoorShut(JobVehicle, 3, false)

    isCarryingPackage = true

    -- Small delay before animation refresh loop
    Citizen.Wait(1000)

    -- Keep animation playing while we are carrying
    while isCarryingPackage do
        Citizen.Wait(300)

        local playing = IsEntityPlayingAnim(
            ped,
            animDict,
            animName,
            3
        )

        if not playing and isCarryingPackage then
            TaskPlayAnim(
                ped,
                animDict,
                animName,
                3.0,
                -8.0,
                -1,
                63,
                0.0,
                false,
                false,
                false
            )
        end
    end
end

-----------------------------------------------------------------------
-- End job (client)
-----------------------------------------------------------------------

RegisterNetEvent("samudra_deliveryjob:endJob_cl")
AddEventHandler("samudra_deliveryjob:endJob_cl", function()
    -- Remove keys if framework provides that
    if RemoveKeys ~= nil then
        RemoveKeys()
    end

    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)

    -- Teleport back to duty location if close enough
    local dutyPos  = Config.Locations.DutyToggle.Coords[1]
    local distance = #(playerPos - dutyPos)

    if distance < 20.0 and Config.EnableVehicleTeleporting then
        DoScreenFadeOut(250)
        Citizen.Wait(250)

        SetEntityCoords(
            playerPed,
            dutyPos.x, dutyPos.y, dutyPos.z,
            false, false, false, false
        )
    end

    -- Reset clothes if using work clothes without cloakroom
    if Config.RequireWorkClothes and not Config.EnableCloakroom then
        inWorkClothes = false
        ChangeClothes("citizen")
    end

    -- Hide counter
    SendNUIMessage({ action = "hideCounter" })

    -- Remove current delivery blip
    if deliveryBlip then
        RemoveBlip(deliveryBlip)
    end

    -- Reset job state
    OnDuty         = false
    JobVehicleNetId = 0
    JobVehicle      = 0
    isCarryingPackage = false

    -- Same clothes reset block appears twice in original; kept for parity
    if Config.RequireWorkClothes and not Config.EnableCloakroom then
        inWorkClothes = false
        ChangeClothes("citizen")
    end

    -- Delete carried box object if it exists, plus any duplicate nearby
    if carriedPackageObj then
        DeleteObject(carriedPackageObj)

        local pool = GetGamePool("CObject")
        if pool and type(pool) == "table" then
            for _, obj in pairs(pool) do
                if obj then
                    local basePos = GetEntityCoords(carriedPackageObj)
                    local objPos  = GetEntityCoords(obj)

                    -- Original compared vectors directly
                    if basePos == objPos then
                        SetEntityAsMissionEntity(obj, true, true)
                        DeleteObject(obj)
                        DeleteEntity(obj)
                    end
                end
            end
        end

        carriedPackageObj = nil
    end

    Citizen.Wait(250)
    DoScreenFadeIn(250)
end)

-----------------------------------------------------------------------
-- Counter update
-----------------------------------------------------------------------

RegisterNetEvent("samudra_deliveryjob:updateCounter")
AddEventHandler("samudra_deliveryjob:updateCounter", function(value)
    if deliveryBlip then
        RemoveBlip(deliveryBlip)
    end

    controlsLocked = false

    SendNUIMessage({
        action = "updateCounter",
        value  = value
    })
end)

-----------------------------------------------------------------------
-- New delivery target
-----------------------------------------------------------------------

RegisterNetEvent("samudra_deliveryjob:SendNewTarget")
AddEventHandler("samudra_deliveryjob:SendNewTarget", function(hostId, myId, lobbySize, coords)
    -- Save area center (used to prevent going too far away)
    JobAreaCenter = coords

    -- Remove old blip
    if deliveryBlip then
        RemoveBlip(deliveryBlip)
    end

    -- Create new blip
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    deliveryBlip = blip

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Lang.TargetCoords)
    EndTextCommandSetBlipName(blip)

    SetBlipRoute(deliveryBlip, true)

    controlsLocked = false

    if Config.Debug ~= nil then
        print("NEW LOCATION RECEIVED")
    end

    -- Block host from working if configured (2-man lobby)
    if Config.BlockHostFromWorking and hostId == myId and lobbySize == 2 then
        return
    end

    if Config.Debug ~= nil then
        print("GRANTED ACCESS TO DELIVERING")
    end

    -- Target system path vs classic 3D text
    if Config.UseTarget then
        Citizen.Wait(2000)
        AddBoxZoneToTargetSystem(coords)
    else
        if Config.Debug ~= nil then
            print("STARTING LOOP")
        end

        while OnDuty do
            Citizen.Wait(0)

            local ped      = PlayerPedId()
            local playerPos = GetEntityCoords(ped)
            local dist      = #(playerPos - coords)

            if Config.Debug ~= nil then
                print(playerPos, coords, dist)
                print("OnDuty:", OnDuty, "isCarrying:", isCarryingPackage)
            end

            if dist < 10.0 then
                if OnDuty and isCarryingPackage then
                    DrawText3Ds(
                        coords.x,
                        coords.y,
                        coords.z,
                        Config.keybindSettings.bagsInteractionkeyString ..
                        Config.Lang.deliverParcel
                    )

                    local key = Config.keybindSettings.bagsInteractionKey or 38
                    if IsControlJustReleased(0, key) then
                        local innerDist = #(playerPos - coords)
                        if innerDist < 2.0 then
                            KnockDoorAnim(coords)
                            isCarryingPackage = false
                            break
                        end
                    end
                end
            else
                Citizen.Wait(500)
            end
        end
    end
end)

-----------------------------------------------------------------------
-- Knock door + handover animation
-----------------------------------------------------------------------

function KnockDoorAnim(targetCoords)
    if not isCarryingPackage then
        Notify(Config.Lang.missingParcel)
        return false
    end

    isCarryingPackage = false
    controlsLocked    = true

    -- Disable movement while doing the whole knock / handover sequence
    CreateThread(function()
        while controlsLocked do
            Citizen.Wait(0)

            DisableControlAction(0, 32, true) -- W
            DisableControlAction(0, 33, true) -- S
            DisableControlAction(0, 34, true) -- A
            DisableControlAction(0, 35, true) -- D
            DisableControlAction(0, 31, true) -- S (alt)
            DisableControlAction(0, 30, true) -- A (alt)
        end
    end)

    local animDict = "timetable@jimmy@doorknock@"
    local animName = "knockdoor_idle"
    local ped      = PlayerPedId()

    -- Load anim dict
    while not HasAnimDictLoaded(animDict) do
        RequestAnimDict(animDict)
        Wait(100)
    end

    -- Place the parcel in front of the player
    if carriedPackageObj then
        local pos     = GetEntityCoords(ped)
        local forward = GetEntityForwardVector(ped) * 0.25
        pos           = pos + forward

        DetachEntity(carriedPackageObj, false, false)
        FreezeEntityPosition(carriedPackageObj, true)
        SetEntityCoords(
            carriedPackageObj,
            pos.x, pos.y, pos.z,
            false, false, false, false
        )
    end

    ClearPedTasks(ped)

    -- Knock loop
    TaskPlayAnim(
        ped,
        animDict,
        animName,
        3.0, 3.0,
        -1,
        1,
        0.0,
        false, false, false
    )

    Wait(3500)

    -- Exit knock
    TaskPlayAnim(
        ped,
        animDict,
        "exit",
        3.0, 3.0,
        -1,
        1,
        0.0,
        false, false, false
    )

    Citizen.Wait(1000)

    -- Back to carry anim
    TaskPlayAnim(
        ped,
        "anim@heists@box_carry@",
        "idle",
        3.0,
        -8.0,
        -1,
        63,
        0.0,
        false, false, false
    )

    Citizen.Wait(120)

    -- Reattach parcel closer to player
    if carriedPackageObj then
        local pos     = GetEntityCoords(ped)
        local forward = GetEntityForwardVector(ped) * 0.15
        pos           = pos - forward

        SetEntityCoords(
            carriedPackageObj,
            pos.x, pos.y, pos.z,
            false, false, false, false
        )

        AttachEntityToEntity(
            carriedPackageObj,
            ped,
            GetPedBoneIndex(ped, 60309), -- right hand
            0.025, 0.08, 0.255,
            -145.0, 290.0, 180.0,
            true, true, false, true, 1, true
        )
    end

    Citizen.Wait(500)

    -- Slide a bit away from the door
    local slidePos = GetEntityCoords(ped)
    local slideFwd = GetEntityForwardVector(ped) * 1.0
    slidePos       = slidePos - slideFwd

    TaskPedSlideToCoord(
        ped,
        slidePos.x,
        slidePos.y,
        slidePos.z,
        GetEntityHeading(ped),
        1500
    )

    Citizen.Wait(2500)

    -- Convert parcel to network object and pass to server
    local netObj
    if carriedPackageObj then
        netObj = ObjToNet(carriedPackageObj)

        -- Original loops until a non-0, non-bogus id is returned
        while netObj == 0 or netObj == carriedPackageObj do
            Citizen.Wait(100)
            netObj = ObjToNet(carriedPackageObj)
        end

        savedParcelObject = carriedPackageObj
    end

    TriggerServerEvent(
        "samudra_deliveryjob:CreatePed",
        targetCoords,
        netObj,
        GetEntityHeading(ped) - 180.0
    )

    return true
end

-----------------------------------------------------------------------
-- Request came back / reset vars
-----------------------------------------------------------------------

RegisterNetEvent("samudra_deliveryjob:returnRequest")
AddEventHandler("samudra_deliveryjob:returnRequest", function()
    isCarryingPackage = true
    carriedPackageObj = savedParcelObject
end)

RegisterNetEvent("samudra_deliveryjob:ResetVariables")
AddEventHandler("samudra_deliveryjob:ResetVariables", function()
    isCarryingPackage = false
    carriedPackageObj = nil
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent("samudra_deliveryjob:AnimPed")
AddEventHandler("samudra_deliveryjob:AnimPed", function(doorCoords, doorHeading, parcelNetId)
    -- Only run if player is close enough to the door
    local playerPos = GetEntityCoords(PlayerPedId())
    local dist      = #(playerPos - doorCoords)

    if dist >= 125.0 then
        return
    end

    -- Get parcel object from net id
    local parcelObj = NetToObj(parcelNetId)

    -- If we stored a specific parcel object earlier, use that instead
    if savedParcelObject ~= 0 then
        parcelObj       = savedParcelObject
        savedParcelObject = 0
    end

    if Config.enableSpawningPedsInDoors then
        ----------------------------------------------------------------
        -- Spawn a customer ped, attach parcel to their hand, then clean up
        ----------------------------------------------------------------

        -- Wait up to 2.5s for the parcel entity to exist
        local timeout = GetGameTimer() + 2500
        while (parcelObj == 0 or parcelObj == parcelNetId) and GetGameTimer() < timeout do
            Citizen.Wait(100)
            parcelObj = NetToObj(parcelNetId)
        end

        -- Pick a random ped model from config
        local pedModels = Config.PedModels
        local randomIdx = math.random(1, #pedModels)
        local pedModel  = pedModels[randomIdx]

        -- Request model (max ~2.5s)
        RequestModel(pedModel)
        timeout = GetGameTimer() + 2500
        while not HasModelLoaded(pedModel) and GetGameTimer() < timeout do
            Citizen.Wait(50)
        end

        -- Create ped slightly below the door coords (so they stand on ground)
        local ped = CreatePed(
            0,
            pedModel,
            doorCoords.x,
            doorCoords.y,
            doorCoords.z - 1.0,
            doorHeading,
            false,
            true
        )

        -- Make ped static & invincible
        SetEntityVisible(ped, false, false)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
        SetEntityVisible(ped, true, false)

        Citizen.Wait(3000)

        -- Play carry-box anim on ped
        TaskPlayAnim(
            ped,
            "anim@heists@box_carry@",
            "idle",
            3.0,
            -8.0,
            -1,
            63,
            0.0,
            false,
            false,
            false
        )

        Citizen.Wait(125)

        -- Attach parcel to ped hand
        AttachEntityToEntity(
            parcelObj,
            ped,
            GetPedBoneIndex(ped, 60309), -- right hand
            0.025, 0.08, 0.255,
            -145.0, 290.0, 180.0,
            true, true, false, true, 1, true
        )

        Citizen.Wait(3000)

        -- Clean up parcel + ped
        DeleteEntity(parcelObj)
        DeletePed(ped)
    else
        ----------------------------------------------------------------
        -- No ped spawning: just let the parcel exist a bit, then delete
        ----------------------------------------------------------------
        Citizen.Wait(3125)
        DeleteEntity(parcelObj)
    end
end)
