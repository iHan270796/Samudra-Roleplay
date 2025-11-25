-----------------------------------------------------------------------
-- Lobby / Invite / Callback state
-----------------------------------------------------------------------

local lobbies          = {}  -- was L0_1 : [lobbyId] = { host = src, clients = {}, vehNetId = ..., rewardsOptions = {} }
local pendingInvites   = {}  -- was L1_1 : { { host = src, client = src }, ... }
local restoreData      = {}  -- was L2_1 : reserved for crash-restore (unused if disabled)
local MAX_TEAM_MEMBERS = 2   -- was L3_1
local serverCallbacks  = {}  -- was L4_1

-- Config tweak from original script
Config.EnableRestoreAfterCrash = false

-----------------------------------------------------------------------
-- Safe wrappers around natives (from decompiled code)
-----------------------------------------------------------------------

-- original GetPlayerIdentifierByType (if it exists) is stored here
local _GetPlayerIdentifierByType = GetPlayerIdentifierByType

--- Safe GetPlayerIdentifierByType
--- Falls back to GetPlayerIdentifier if the native does not exist.
function GetPlayerIdentifierByType(src, idType)
    if src == nil then
        return 0
    end

    if _GetPlayerIdentifierByType ~= nil then
        return _GetPlayerIdentifierByType(src, idType)
    else
        -- Older artifacts that don't have GetPlayerIdentifierByType
        return GetPlayerIdentifier(src, 1)
    end
end

-- Save original GetPlayerPing
local _GetPlayerPing = GetPlayerPing

--- Safe GetPlayerPing
--- Your decompiled version called the original but did NOT return anything.
--- That broke places where you compare the ping to 0.
function GetPlayerPing(src, ...)
    if src ~= nil then
        return _GetPlayerPing(src, ...)
    end
    return 0
end

-- Save original TriggerClientEvent
local _TriggerClientEvent = TriggerClientEvent

--- Safe TriggerClientEvent
--- Original decompiled version:
---   - dropped additional arguments (`...`)
---   - did nothing when target was nil (which is fine)
function TriggerClientEvent(eventName, target, ...)
    if target ~= nil then
        return _TriggerClientEvent(eventName, target, ...)
    end
end

-----------------------------------------------------------------------
-- Reward recalculation for a lobby
-----------------------------------------------------------------------

local function RecalculateRewards(hostSrc)
    -- Find lobby owned by this host
    local lobbyId = 0
    for id, lobby in pairs(lobbies) do
        if lobby.host == hostSrc then
            lobbyId = id
            break
        end
    end

    if lobbyId == 0 or not lobbies[lobbyId] then
        return
    end

    local lobby = lobbies[lobbyId]

    -- Reset reward options
    lobby.rewardsOptions = {}

    -- host + clients
    local memberCount = #lobby.clients + 1
    if memberCount <= 0 then
        return
    end

    local each = math.floor(100 / memberCount)

    -- Assign to each client
    for i = 1, memberCount - 1 do
        local clientId = lobby.clients[i]
        lobby.rewardsOptions[clientId] = each
    end

    -- Assign to host
    lobby.rewardsOptions[hostSrc] = each

    -- Update all members’ reward counters
    TriggerForAllMembers(hostSrc, "samudra_deliveryjob:SetMyReward", each)

    -- Update host’s UI percentages
    TriggerClientEvent("samudra_deliveryjob:UpdateHostPercentages", hostSrc, each)
end

_G.RecalculateRewards = RecalculateRewards -- keep same global name if something else uses it

-----------------------------------------------------------------------
-- Generic server callback system
-----------------------------------------------------------------------

function RegisterServerCallback(name, cb)
    serverCallbacks[name] = cb
end

-- RPC entry point from client (matches client TriggerServerCallback)
RegisterNetEvent("17mov_Callbacks:GetResponse" .. GetCurrentResourceName())
AddEventHandler("17mov_Callbacks:GetResponse" .. GetCurrentResourceName(), function(callbackName, requestId, ...)
    local src = source

    -- Find registered callback
    local cb = serverCallbacks[callbackName]
    if cb == nil then
        return
    end

    -- Execute callback: (src, ...)
    local r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11 = cb(src, ...)

    -- Send result back to caller
    TriggerClientEvent(
        "17mov_Callbacks:receiveData" .. GetCurrentResourceName(),
        src,
        callbackName,
        requestId,
        r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11
    )
end)

-----------------------------------------------------------------------
-- Register all deliverer server callbacks in one thread
-----------------------------------------------------------------------

Citizen.CreateThread(function()

    -------------------------------------------------------------------
    -- samudra_deliveryjob:GetPlayersNames
    --  in:  list of server IDs
    -- out:  { {id = id, name = "Player Name"}, ... }
    -------------------------------------------------------------------
    RegisterServerCallback("samudra_deliveryjob:GetPlayersNames", function(src, idList)
        local result = {}
        for i = 1, #idList do
            table.insert(result, {
                id   = idList[i],
                name = GetPlayerIdentity(idList[i])
            })
        end
        return result
    end)

    -------------------------------------------------------------------
    -- samudra_deliveryjob:GetLobbyMembers
    --  in:  hostId
    -- out:  array of member IDs (host + all clients)
    -------------------------------------------------------------------
    RegisterServerCallback("samudra_deliveryjob:GetLobbyMembers", function(src, hostId)
        if hostId == nil then
            return {}
        end

        local result = { hostId }

        for _, lobby in pairs(lobbies) do
            if lobby.host == hostId then
                for i = 1, #lobby.clients do
                    table.insert(result, lobby.clients[i])
                end
            end
        end

        return result
    end)

    -------------------------------------------------------------------
    -- samudra_deliveryjob:IfPlayerIsHost
    --  in:  src
    -- out:  boolean: is this player currently host of a team?
    --       If host goes offline (ping == 0), ownership can be transferred.
    -------------------------------------------------------------------
    RegisterServerCallback("samudra_deliveryjob:IfPlayerIsHost", function(playerSrc)
        local isHost = true
        local lobbyId = 0

        -- Is player part of any lobby as client?
        for id, lobby in pairs(lobbies) do
            for i = 1, #lobby.clients do
                if lobby.clients[i] == playerSrc then
                    isHost = false
                    lobbyId = id
                    break
                end
            end
        end

        -- If not host but current host is "dead"/ping 0, promote this player
        if not isHost and lobbyId ~= 0 and lobbies[lobbyId] then
            local hostPing = GetPlayerPing(lobbies[lobbyId].host)
            if hostPing == 0 then
                isHost = true
                lobbies[lobbyId].host = playerSrc
            end
        end

        return isHost
    end)

    -------------------------------------------------------------------
    -- samudra_deliveryjob:getPartyVeh
    --  in:  src
    -- out:  vehNetId or nil
    -------------------------------------------------------------------
    RegisterServerCallback("samudra_deliveryjob:getPartyVeh", function(playerSrc)
        local out = nil

        for _, lobby in pairs(lobbies) do
            if lobby.host == playerSrc then
                out = lobby.vehNetId
                break
            end

            for i = 1, #lobby.clients do
                if lobby.clients[i] == playerSrc and lobby.vehNetId ~= nil then
                    out = lobby.vehNetId
                    break
                end
            end
        end

        return out
    end)

    -------------------------------------------------------------------
    -- samudra_deliveryjob:init
    --  in:  src
    -- out: { name = "Player Name", source = src }
    -------------------------------------------------------------------
    RegisterServerCallback("samudra_deliveryjob:init", function(src)
        local out = {}
        out.name   = GetPlayerIdentity(src)
        out.source = src
        return out
    end)

    -------------------------------------------------------------------
    -- samudra_deliveryjob:CheckThisReward
    --  in : src, percent, targetId
    -- out: true if accepted, false if sum of rewards > 100
    -------------------------------------------------------------------
    RegisterServerCallback("samudra_deliveryjob:CheckThisReward", function(src, percent, targetId)
        local lobbyId = 0

        -- Find lobby this player belongs to (host or client)
        for id, lobby in pairs(lobbies) do
            if lobby.host == src then
                lobbyId = id
                break
            end
            for i = 1, #lobby.clients do
                if lobby.clients[i] == src then
                    lobbyId = id
                    break
                end
            end
        end

        if lobbyId == 0 or not lobbies[lobbyId] then
            return false
        end

        local totalWithoutTarget = 0
        for pid, value in pairs(lobbies[lobbyId].rewardsOptions) do
            if pid ~= targetId then
                totalWithoutTarget = totalWithoutTarget + value
            end
        end

        if totalWithoutTarget + percent > 100 then
            return false
        else
            lobbies[lobbyId].rewardsOptions[targetId] = percent
            TriggerClientEvent("samudra_deliveryjob:SetMyReward", targetId, percent)
            return true
        end
    end)

    -------------------------------------------------------------------
    -- samudra_deliveryjob:IfPlayerOwnsTeam
    --  in : src
    -- out: true if src is host of any lobby
    -------------------------------------------------------------------
    RegisterServerCallback("samudra_deliveryjob:IfPlayerOwnsTeam", function(src)
        local owns = false
        for _, lobby in pairs(lobbies) do
            if lobby.host == src then
                owns = true
                break
            end
        end
        return owns
    end)
end)

-----------------------------------------------------------------------
-- Invite handling: "samudra_deliveryjob:SendRequestToClient_sv"
-----------------------------------------------------------------------

RegisterNetEvent("samudra_deliveryjob:SendRequestToClient_sv")
AddEventHandler("samudra_deliveryjob:SendRequestToClient_sv", function(targetId)
    local src = source

    -------------------------------------------------------------------
    -- 1) Can't invite someone who is already host / in another lobby
    -------------------------------------------------------------------
    for _, lobby in pairs(lobbies) do
        if lobby.host == targetId then
            Notify(src, Config.Lang.isAlreadyHost)
            return
        else
            for i = 1, #lobby.clients do
                if lobby.clients[i] == targetId then
                    Notify(src, Config.Lang.isBusy)
                    return
                end
            end
        end
    end

    -------------------------------------------------------------------
    -- 2) Check active pending invites
    -------------------------------------------------------------------
    for _, invite in pairs(pendingInvites) do
        if invite.client == targetId then
            Notify(src, Config.Lang.hasActiveInvite)
            return
        end

        if invite.host == src and invite.client ~= nil then
            -- host already has an active invite
            Notify(src, Config.Lang.HaveActiveInvite)
            return
        end
    end

    -------------------------------------------------------------------
    -- 3) Check party size limit for this host
    -------------------------------------------------------------------
    local currentClients = {}

    for _, lobby in pairs(lobbies) do
        if lobby.host == src then
            currentClients = lobby.clients
        end
    end

    local futureCount = #currentClients + 1
    if futureCount >= MAX_TEAM_MEMBERS then
        Notify(src, Config.Lang.partyIsFull)
        return
    end

    -------------------------------------------------------------------
    -- 4) Store invite and notify both sides
    -------------------------------------------------------------------
    table.insert(pendingInvites, {
        host   = src,
        client = targetId
    })

    Notify(src, Config.Lang.inviteSent)

    TriggerClientEvent(
        "samudra_deliveryjob:SendRequestToClient_cl",
        targetId,
        GetPlayerIdentity(src)
    )
end)

-----------------------------------------------------------------------
-- Anti-spam: last delivery times per player
-----------------------------------------------------------------------
local lastDeliveryTime = {}   -- was L8_1

-----------------------------------------------------------------------
-- samudra_deliveryjob:CreatePed
-- Called from client (KnockDoorAnim) when player delivers a parcel.
-- Params:
--   targetCoords (vector3) - door coordinates
--   netObj      (int)      - network ID of the parcel object
--   heading     (float)    - ped heading
-----------------------------------------------------------------------
RegisterNetEvent("samudra_deliveryjob:CreatePed")
AddEventHandler("samudra_deliveryjob:CreatePed", function(targetCoords, netObj, heading)
    local src = source

    -------------------------------------------------------------------
    -- 1) Anti-spam: prevent deliveries < 10s apart
    -------------------------------------------------------------------
    local last = lastDeliveryTime[src]
    if last ~= nil then
        local diff = GetGameTimer() - last
        if diff < 10000 then
            print(("Rejected deliver for player with ID: %s. Reason: Player is too fast - only %s ms since last deliver!")
                :format(src, diff))
            TriggerClientEvent("samudra_deliveryjob:returnRequest", src)
            return
        end
    end

    -------------------------------------------------------------------
    -- 2) Distance check: player must be near the target door
    -------------------------------------------------------------------
    local ped = GetPlayerPed(src)
    local plyCoords = GetEntityCoords(ped)
    local distance = #(plyCoords - targetCoords)

    if distance > 15.0 then
        print(("Rejected deliver for player with ID: %s. Reason: Player is too far - %.2f meters away!")
            :format(src, distance))
        TriggerClientEvent("samudra_deliveryjob:returnRequest", src)
        return
    end

    -- Update cooldown
    lastDeliveryTime[src] = GetGameTimer()

    -------------------------------------------------------------------
    -- 3) Find which lobby this player belongs to
    -------------------------------------------------------------------
    local lobbyId  = -1
    local hostSrc  = nil

    for id, lobby in pairs(lobbies) do
        if lobby.host == src then
            lobbyId = id
            hostSrc = lobby.host
            break
        end

        for _, cl in ipairs(lobby.clients) do
            if cl == src then
                lobbyId = id
                hostSrc = lobby.host
                break
            end
        end

        if lobbyId ~= -1 then
            break
        end
    end

    if lobbyId == -1 or not lobbies[lobbyId] then
        print(("Rejected deliver for player with ID: %s. Reason: Player is not in any lobby!"):format(src))
        TriggerClientEvent("samudra_deliveryjob:returnRequest", src)
        return
    end

    local lobby = lobbies[lobbyId]

    -------------------------------------------------------------------
    -- 4) Disallow delivering to the exact same coords as last time
    -------------------------------------------------------------------
    if lobby.lastCoords and lobby.lastCoords == targetCoords then
        print(("Rejected deliver for player with ID: %s. Reason: Trying to deliver to the same point as last one!")
            :format(src))
        TriggerClientEvent("samudra_deliveryjob:returnRequest", src)
        return
    end

    lobby.lastCoords = targetCoords

    -------------------------------------------------------------------
    -- 5) Tell all clients to spawn / animate the door ped & parcel
    -- Client event signature: AnimPed(coords, heading, netObj)
    -------------------------------------------------------------------
    TriggerClientEvent("samudra_deliveryjob:AnimPed", -1, targetCoords, heading, netObj)

    -- Small wait while animation plays on clients
    Citizen.Wait(3125)

    -- Reset local client variables/controls
    TriggerClientEvent("samudra_deliveryjob:ResetVariables", src)

    if Config.enableSpawningPedsInDoors then
        Citizen.Wait(3000)
    end

    -------------------------------------------------------------------
    -- 6) Increment lobby counter and send new job
    -------------------------------------------------------------------
    lobby.counter = (lobby.counter or 0) + 1

    -- Update counter on all members HUD
    TriggerForAllMembers(hostSrc, "samudra_deliveryjob:updateCounter", lobby.counter)

    -- Ask server to assign next destination (server-side trigger!)
    TriggerEvent("samudra_deliveryjob:TakeNewJob", lobby.host)
end)

-----------------------------------------------------------------------
-- samudra_deliveryjob:TakeNewJob
-- This MUST be called only from server (we block direct client calls).
-- Param:
--   hostSrc (int) - host player ID
-----------------------------------------------------------------------
RegisterNetEvent("samudra_deliveryjob:TakeNewJob")
AddEventHandler("samudra_deliveryjob:TakeNewJob", function(hostSrc)
    -- Anti-exploit: if a client tries to call this directly, reject
    -- Anti-exploit: if a client tries to call this directly, reject
if source ~= nil then
    local s = tostring(source)
    if #s > 0 then
        print(("Rejected deliver for player with ID: %s. Reason: Trying to trigger event directly!")
            :format(source))
        return
    end
end


    -------------------------------------------------------------------
    -- 1) Find lobby by host
    -------------------------------------------------------------------
    local lobbyId, host = nil, nil

    for id, lobby in pairs(lobbies) do
        if lobby.host == hostSrc then
            lobbyId = id
            host    = lobby.host
            break
        end
    end

    if lobbyId == nil or host == nil or not lobbies[lobbyId] then
        return
    end

    local lobby = lobbies[lobbyId]

    -------------------------------------------------------------------
    -- 2) Choose / maintain "currentTask" (group of target locations)
    -------------------------------------------------------------------
    local taskIndex = lobby.currentTask

    if taskIndex == "none" or taskIndex == nil then
        local usedTasks = lobby.allTasks or {}
        lobby.allTasks = usedTasks

        -- Reset when we used all available target groups
        if #usedTasks == #Config.TargetLocations then
            lobby.allTasks  = {}
            usedTasks       = lobby.allTasks
        end

        local candidates = {}

        for i = 1, #Config.TargetLocations do
            local already = false
            for _, t in ipairs(usedTasks) do
                if t == i then
                    already = true
                    break
                end
            end
            if not already then
                table.insert(candidates, i)
            end
        end

        if #candidates == 0 then
            return
        end

        local rnd = math.random(1, #candidates)
        taskIndex = candidates[rnd]

        table.insert(lobby.allTasks, taskIndex)
        lobby.currentTask = taskIndex
    end

    -------------------------------------------------------------------
    -- 3) Choose a new target index within this "currentTask"
    -------------------------------------------------------------------
    local groupTargets = Config.TargetLocations[taskIndex]
    if not groupTargets or #groupTargets == 0 then
        return
    end

    lobby.targets = lobby.targets or {}
    local usedTargets = lobby.targets

    local targetCandidates = {}
    for i = 1, #groupTargets do
        local already = false
        for _, t in ipairs(usedTargets) do
            if t == i then
                already = true
                break
            end
        end
        if not already then
            table.insert(targetCandidates, i)
        end
    end

    if #targetCandidates == 0 then
        -- Safety: if everything is used, reset for this task
        lobby.currentTask = "none"
        lobby.targets     = {}
        return
    end

    local rndTargetIndex = targetCandidates[math.random(1, #targetCandidates)]
    table.insert(lobby.targets, rndTargetIndex)

    -- When we've used almost all targets in this task, reset it on next call
    if #lobby.targets >= (#groupTargets - 1) then
        lobby.currentTask = "none"
        lobby.targets     = {}
    end

    -------------------------------------------------------------------
    -- 4) Save and broadcast the chosen job coordinates
    -------------------------------------------------------------------
    local jobCoords = groupTargets[rndTargetIndex]
    lobby.currentJob = jobCoords

    -- TriggerForAllMembers decides per-member args,
    -- we just pass the host and the coords as extra data.
    TriggerForAllMembers(
        host,
        "samudra_deliveryjob:SendNewTarget",
        lobby.host,
        jobCoords
    )
end)

-----------------------------------------------------------------------
-- samudra_deliveryjob:ClientReactRequest
-- Client accepts/declines an invite popup.
-- Param:
--   accepted (boolean)
-----------------------------------------------------------------------
RegisterNetEvent("samudra_deliveryjob:ClientReactRequest")
AddEventHandler("samudra_deliveryjob:ClientReactRequest", function(accepted)
    local src       = source
    local hostSrc   = nil
    local joinedOld = false

    -------------------------------------------------------------------
    -- 1) Find matching pending invite and clear it
    -------------------------------------------------------------------
    for idx, inv in pairs(pendingInvites) do
        if inv.client == src then
            hostSrc = inv.host
            pendingInvites[idx] = nil
            break
        end
    end

    if accepted then
        if hostSrc ~= nil and src ~= nil then
            ----------------------------------------------------------------
            -- 2) Add to existing lobby if host already has one
            ----------------------------------------------------------------
            for _, lobby in pairs(lobbies) do
                if lobby.host == hostSrc then
                    table.insert(lobby.clients, src)
                    joinedOld = true
                    break
                end
            end

            ----------------------------------------------------------------
            -- 3) Or create a new lobby
            ----------------------------------------------------------------
            if not joinedOld then
                table.insert(lobbies, {
                    host        = hostSrc,
                    clients     = { src },
                    currentTask = "none",
                    allTasks    = {},
                    targets     = {},
                    counter     = 0,
                    working     = false,
                    vehNetId    = nil,
                    rewardsOptions = {},
                    lastCoords  = vec3(0, 0, -10)
                })
            end

            -- Rewards / UI refresh
            if Config.useModernUI then
                RecalculateRewards(hostSrc)
            end

            Notify(hostSrc, Config.Lang.InviteAccepted)

            local mugs = GetAllPartyMugs(hostSrc)
            TriggerForAllMembers(hostSrc, "samudra_deliveryjob:RefreshMugs", mugs)
        else
            -- Something went wrong (no invite / no host)
            Notify(src,     Config.Lang.error)
            if hostSrc then
                Notify(hostSrc, Config.Lang.error)
            end
        end
    else
        -- Invite declined
        if hostSrc then
            Notify(hostSrc, Config.Lang.InviteDeclined)
        end
    end
end)

-----------------------------------------------------------------------
-- samudra_deliveryjob:KickPlayerFromLobby
-- Params:
--   targetId (int)  : player to remove from lobby
--   notifyKick (bool): whether to show "kicked out" message to that player
--   byId (int|nil)  : optional third param – if present, we kick based on
--                     this ID instead of "source" (used for leaveLobby)
-----------------------------------------------------------------------
RegisterNetEvent("samudra_deliveryjob:KickPlayerFromLobby")
AddEventHandler("samudra_deliveryjob:KickPlayerFromLobby", function(targetId, notifyKick, byId)
    local kickedId = targetId
    local hostSrc  = nil

    -------------------------------------------------------------------
    -- 1) Remove from lobby as host (standard kick) or by explicit ID
    -------------------------------------------------------------------
    if byId == nil then
        -- standard case: host uses menu, "source" is the host
        local src = source
        for _, lobby in pairs(lobbies) do
            for i = 1, #lobby.clients do
                if lobby.host == src and lobby.clients[i] == kickedId then
                    lobby.clients[i] = nil
                    hostSrc = lobby.host
                    break
                end
            end
        end
    else
        -- "byId" is the player being used as reference to find the lobby
        for _, lobby in pairs(lobbies) do
            for i = 1, #lobby.clients do
                if lobby.clients[i] == byId then
                    hostSrc = lobby.host
                    lobby.clients[i] = nil
                    break
                end
            end
        end
    end

    -------------------------------------------------------------------
    -- 2) Notify kicked player
    -------------------------------------------------------------------
    if notifyKick then
        Notify(kickedId, Config.Lang.kickedOut)
    end

    -------------------------------------------------------------------
    -- 3) Refresh UIs
    -------------------------------------------------------------------
    if Config.useModernUI then
        -- For player that left / got kicked: reset his lobby UI to solo
        local solo = {
            {
                id     = kickedId,
                name   = GetPlayerIdentity(kickedId),
                isHost = true
            }
        }

        TriggerClientEvent("samudra_deliveryjob:RefreshMugs", kickedId, solo, kickedId)
        TriggerClientEvent("samudra_deliveryjob:clearMyLobby", kickedId)
        TriggerClientEvent("samudra_deliveryjob:SetMyReward", kickedId, 100)

        -- For remaining members
        if hostSrc then
            local mugs = GetAllPartyMugs(hostSrc)
            TriggerForAllMembers(hostSrc, "samudra_deliveryjob:RefreshMugs", mugs)
            RecalculateRewards(hostSrc)
        end

        -- Clean empty lobbies
        for id, lobby in pairs(lobbies) do
            if #lobby.clients == 0 and lobby.host == hostSrc then
                lobbies[id] = nil
                TriggerClientEvent("samudra_deliveryjob:clearMyLobby", hostSrc)
            end
        end
    else
        -- Old UI: we only refresh mugs; rewards are not dynamic
        local solo = {
            {
                id     = kickedId,
                name   = GetPlayerIdentity(kickedId),
                isHost = true
            }
        }

        TriggerClientEvent("samudra_deliveryjob:RefreshMugs", kickedId, solo, kickedId)

        if hostSrc then
            local mugs = GetAllPartyMugs(hostSrc)
            TriggerForAllMembers(hostSrc, "samudra_deliveryjob:RefreshMugs", mugs)
        end

        -- Clean empty lobbies
        for id, lobby in pairs(lobbies) do
            if #lobby.clients == 0 and lobby.host == hostSrc then
                lobbies[id] = nil
            end
        end
    end
end)

-----------------------------------------------------------------------
-- Job cooldown tracking
-----------------------------------------------------------------------

-- cooldownActive[license] = true if under cooldown
-- cooldownStart[license]  = os.time() when cooldown started
local cooldownActive  = {}
local cooldownStart   = {}

-----------------------------------------------------------------------
-- Finish job (host calls this)
-----------------------------------------------------------------------

RegisterNetEvent("samudra_deliveryjob:endJob_sv")
AddEventHandler("samudra_deliveryjob:endJob_sv", function(hadVehicle)
    local hostSrc = source

    -- Stop job client-side for host and all members
    TriggerForAllMembers(hostSrc, "samudra_deliveryjob:endJob_cl", 0)

    -- Find lobby where this player is host
    for lobbyIndex, lobby in pairs(lobbies) do
        if lobby.host == hostSrc then
            -- Collect all clients as a flat list
            local clients = {}
            for i = 1, #lobby.clients do
                table.insert(clients, lobby.clients[i])
            end

            -- Store and reset counter
            local deliveredCount = lobby.counter or 0
            lobby.counter  = 0
            lobby.working  = false
            lobby.vehNetId = nil

            -- Build full party (clients + host)
            local partyMembers = {}
            for i = 1, #lobby.clients do
                table.insert(partyMembers, lobby.clients[i])
            end
            table.insert(partyMembers, lobby.host)

            ----------------------------------------------------------------
            -- Total reward
            ----------------------------------------------------------------
            local totalReward = deliveredCount * Config.Price

            if Config.multiplyRewardWhileWorkingInGroup then
                totalReward = math.floor(totalReward * (#lobby.clients + 1))
            end

            -- Modern UI: if host ended alone, recalc his reward options
            if Config.useModernUI and #lobby.clients == 0 then
                RecalculateRewards(hostSrc)
            end

            ----------------------------------------------------------------
            -- Split reward between each party member
            ----------------------------------------------------------------
            local alreadyPaid = {}

            for i = 1, #partyMembers do
                local playerId = partyMembers[i]
                local rewardForThisPlayer = 0

                if Config.useModernUI then
                    if Config.letBossSplitReward then
                        -- Percentage defined per player in lobby.rewardsOptions
                        local percent = 0
                        if lobby.rewardsOptions then
                            percent = lobby.rewardsOptions[playerId] or 0
                        end
                        rewardForThisPlayer = math.floor(totalReward * (percent / 100.0))
                    else
                        -- Modern UI enabled but boss split off: pay full to everyone
                        rewardForThisPlayer = totalReward
                    end
                else
                    if Config.splitReward then
                        rewardForThisPlayer = math.floor(
                            totalReward / (#lobby.clients + 1)
                        )
                    else
                        -- No split: everyone gets full amount
                        rewardForThisPlayer = totalReward
                    end
                end

                ----------------------------------------------------------------
                -- Penalty if job ended without vehicle
                ----------------------------------------------------------------
                if not hadVehicle then
                    PayPenalty(playerId, Config.PenaltyAmount)
                    Notify(
                        playerId,
                        Config.Lang.penalty .. Config.PenaltyAmount
                    )
                end

                ----------------------------------------------------------------
                -- Optionally block reward if there is no vehicle
                ----------------------------------------------------------------
                local skipReward = false
                if not hadVehicle and Config.DontPayRewardWithoutVehicle ~= false then
                    skipReward = true
                end

                if not skipReward then
                    -- Avoid double-paying same id (just in case)
                    if not alreadyPaid[playerId] then
                        alreadyPaid[playerId] = true
                        Pay(playerId, rewardForThisPlayer, #partyMembers, deliveredCount)
                        Notify(
                            playerId,
                            Config.Lang.reward .. rewardForThisPlayer
                        )
                    end
                end
            end

            ----------------------------------------------------------------
            -- If host has no more clients, delete lobby
            ----------------------------------------------------------------
            if #lobby.clients == 0 then
                lobbies[lobbyIndex] = nil
                TriggerClientEvent("samudra_deliveryjob:clearMyLobby", hostSrc)
            end

            -- Only one lobby per host, so break
            break
        end
    end
end)

-----------------------------------------------------------------------
-- Start job (host presses start)
-----------------------------------------------------------------------

RegisterNetEvent("samudra_deliveryjob:StartJob_sv")
AddEventHandler("samudra_deliveryjob:StartJob_sv", function()
    local hostSrc = source
    local lobbyClients = nil
    local lobbyIndex   = 0

    ----------------------------------------------------------------
    -- Find lobby where this player is host (if any)
    ----------------------------------------------------------------
    for idx, lobby in pairs(lobbies) do
        if lobby.host == hostSrc then
            lobbyClients = lobby.clients
            lobbyIndex   = idx
            break
        end
    end

    ----------------------------------------------------------------
    -- Required job checks for friends
    ----------------------------------------------------------------
    if Config.RequireJobAlsoForFriends then
        if Config.RequiredJob ~= "none" and lobbyClients ~= nil then
            for i = 1, #lobbyClients do
                local friend = lobbyClients[i]
                local friendJob = GetPlayerJob(friend)
                if friendJob ~= Config.RequiredJob then
                    Notify(hostSrc, Config.Lang.notEverybodyHasRequiredJob)
                    return
                end
            end
        end
    end

    ----------------------------------------------------------------
    -- Required item for host
    ----------------------------------------------------------------
    if not IsHaveRequiredItem(hostSrc) then
        Notify(hostSrc, Config.Lang.dontHaveReqItem)
        return
    end

    ----------------------------------------------------------------
    -- Required item for whole team
    ----------------------------------------------------------------
    if Config.RequireItemFromWholeTeam and lobbyClients ~= nil then
        for i = 1, #lobbyClients do
            if not IsHaveRequiredItem(lobbyClients[i]) then
                Notify(hostSrc, Config.Lang.dontHaveReqItem)
                return
            end
        end
    end

    ----------------------------------------------------------------
    -- Job cooldown (host + friends)
    ----------------------------------------------------------------
    if Config.JobCooldown > 0 then
        local now = os.time()

        local function formatTimeLeft(secondsLeft)
            local hours   = math.floor(secondsLeft / 3600)
            local minutes = math.floor((secondsLeft % 3600) / 60)
            local seconds = secondsLeft % 60

            local text = ""
            if hours > 0 then
                text = text .. hours .. Config.Lang.hours .. " "
            end
            if minutes > 0 then
                text = text .. minutes .. Config.Lang.minutes .. " "
            end
            text = text .. seconds .. Config.Lang.seconds
            return text
        end

        -- Host cooldown
        local hostLicense = GetPlayerIdentifierByType(hostSrc, "license")

        if cooldownActive[hostLicense] then
            local elapsed = now - (cooldownStart[hostLicense] or now)
            if elapsed >= Config.JobCooldown then
                cooldownActive[hostLicense] = nil
                cooldownStart[hostLicense]  = nil
            else
                local left     = Config.JobCooldown - elapsed
                local timeText = formatTimeLeft(left)
                Notify(
                    hostSrc,
                    string.format(
                        Config.Lang.someoneIsOnCooldown,
                        GetPlayerIdentity(hostSrc),
                        timeText
                    )
                )
                return
            end
        end

        -- Friends cooldown
        if lobbyClients ~= nil then
            for i = 1, #lobbyClients do
                local friend   = lobbyClients[i]
                local license  = GetPlayerIdentifierByType(friend, "license")

                if cooldownActive[license] then
                    local elapsed = now - (cooldownStart[license] or now)
                    if elapsed >= Config.JobCooldown then
                        cooldownActive[license] = nil
                        cooldownStart[license]  = nil
                    else
                        local left     = Config.JobCooldown - elapsed
                        local timeText = formatTimeLeft(left)
                        Notify(
                            hostSrc,
                            string.format(
                                Config.Lang.someoneIsOnCooldown,
                                GetPlayerIdentity(friend),
                                timeText
                            )
                        )
                        return
                    end
                end
            end
        end

        -- Apply cooldown to host and friends
        cooldownActive[hostLicense] = true
        cooldownStart[hostLicense]  = now

        if lobbyClients ~= nil then
            for i = 1, #lobbyClients do
                local license = GetPlayerIdentifierByType(lobbyClients[i], "license")
                cooldownActive[license] = true
                cooldownStart[license]  = now
            end
        end
    end

    ----------------------------------------------------------------
    -- Require at least one friend (if configured)
    ----------------------------------------------------------------
    if Config.RequireOneFriendMinimum then
        if lobbyClients ~= nil and #lobbyClients > 0 then
            -- Start job for host and all lobby members
            TriggerForAllMembers(hostSrc, "samudra_deliveryjob:StartJob_cl", hostSrc)
            TriggerEvent("samudra_deliveryjob:TakeNewJob", hostSrc)

            if lobbyIndex ~= 0 and lobbies[lobbyIndex] then
                lobbies[lobbyIndex].working = true
            end
        else
            Notify(hostSrc, Config.Lang.RequireOneFriend)
        end
        return
    end

    ----------------------------------------------------------------
    -- No friend required: if host has no lobby, create solo lobby
    ----------------------------------------------------------------
    if lobbyClients == nil then
        table.insert(lobbies, {
            host        = hostSrc,
            clients     = {},
            currentTask = "none",
            allTasks    = {},
            targets     = {},
            counter     = 0,
            working     = false,
            lastCoords  = vec3(0.0, 0.0, -10.0)
        })
    end

    -- Start job for host and his lobby (if any)
    TriggerForAllMembers(hostSrc, "samudra_deliveryjob:StartJob_cl", hostSrc)
    TriggerEvent("samudra_deliveryjob:TakeNewJob", hostSrc)

    -- Re-find lobby index and set working = true
    lobbyIndex = 0
    for idx, lobby in pairs(lobbies) do
        if lobby.host == hostSrc then
            lobbyIndex = idx
            break
        end
    end

    if lobbyIndex ~= 0 and lobbies[lobbyIndex] then
        lobbies[lobbyIndex].working = true
    end
end)

-----------------------------------------------------------------------
-- Upload host's job vehicle net id
-----------------------------------------------------------------------

RegisterServerEvent("samudra_deliveryjob:uploadJobVehicle")
AddEventHandler("samudra_deliveryjob:uploadJobVehicle", function(vehNetId)
    local src = source

    for _, lobby in pairs(lobbies) do
        if lobby.host == src then
            lobby.vehNetId = vehNetId
            break
        end
    end
end)

-----------------------------------------------------------------------
-- GetAllPartyMugs(hostId)
-- Returns a list of players in the host's lobby for UI:
-- {
--   { id = src, name = "Player", isHost = true/false, rewardPercent = n? },
--   ...
-- }
-----------------------------------------------------------------------

function GetAllPartyMugs(hostId)
    local mugs       = {}
    local clients    = {}
    local lobbyIndex = 0

    -- Find lobby for this host
    for idx, lobby in pairs(lobbies) do
        if lobby.host == hostId then
            lobbyIndex = idx
            clients    = lobby.clients or {}
            break
        end
    end

    if lobbyIndex == 0 then
        return mugs
    end

    if Config.useModernUI then
        -- With reward percentages
        for _, clientId in ipairs(clients) do
            table.insert(mugs, {
                id            = clientId,
                name          = GetPlayerIdentity(clientId),
                isHost        = false,
                rewardPercent = (lobbies[lobbyIndex].rewardsOptions or {})[clientId]
            })
        end

        -- Add host as last entry
        table.insert(mugs, {
            id            = hostId,
            name          = GetPlayerIdentity(hostId),
            isHost        = true,
            rewardPercent = (lobbies[lobbyIndex].rewardsOptions or {})[hostId]
        })
    else
        -- Simple list without reward percentages
        for _, clientId in ipairs(clients) do
            table.insert(mugs, {
                id     = clientId,
                name   = GetPlayerIdentity(clientId),
                isHost = false
            })
        end

        table.insert(mugs, {
            id     = hostId,
            name   = GetPlayerIdentity(hostId),
            isHost = true
        })
    end

    return mugs
end

-----------------------------------------------------------------------
-- TriggerForAllMembers(hostId, eventName, arg1, arg2)
-- Sends an event to every member of host's party (all clients + host)
--
-- Event shapes (matching original logic):
--  - "samudra_deliveryjob:RefreshMugs" or "samudra_deliveryjob:StartJob_cl":
--        TriggerClientEvent(ev, target, arg1, target, index, partySize)
--  - "samudra_deliveryjob:SendNewTarget":
--        TriggerClientEvent(ev, target, hostId, target, partySize, coords)
--  - Any other:
--        TriggerClientEvent(ev, target, arg1)
-----------------------------------------------------------------------

function TriggerForAllMembers(hostId, eventName, arg1, arg2)
    local clients = {}

    -- Find lobby by host
    for _, lobby in pairs(lobbies) do
        if lobby.host == hostId then
            clients = lobby.clients or {}
            break
        end
    end

    local partySize = #clients + 1

    -- 1..#clients are clients, last slot is host
    for index = 1, partySize do
        local target = clients[index]
        if index > #clients then
            target = hostId
        end

        if target ~= nil and type(target) == "number" then
            if eventName == "samudra_deliveryjob:RefreshMugs"
            or eventName == "samudra_deliveryjob:StartJob_cl" then
                -- arg1: mug data (or hostId), then my id, my pos, party size
                TriggerClientEvent(eventName, target, arg1, target, index, partySize)

            elseif eventName == "samudra_deliveryjob:SendNewTarget" then
                -- arg1: hostId, arg2: coords
                local coords = arg2
                TriggerClientEvent(eventName, target, arg1, target, partySize, coords)

            else
                -- Generic single-arg event
                TriggerClientEvent(eventName, target, arg1)
            end
        end
    end
end

-----------------------------------------------------------------------
-- playerDropped: lobby / host handling
-----------------------------------------------------------------------

AddEventHandler("playerDropped", function(reason)
    local src      = source
    local lobbyKey = "waiting"

    -- Look for this player as host or client
    for idx, lobby in pairs(lobbies) do
        -- If player is host, try to promote a client
        if lobby.host == src then
            for i = 1, #lobby.clients do
                local clientId = lobby.clients[i]
                local ping     = GetPlayerPing(clientId)

                if ping ~= 0 then
                    -- Promote this client to host
                    lobby.host       = clientId
                    lobby.clients[i] = nil

                    Notify(clientId, Config.Lang.newBoss)
                    break
                end
            end

            lobbyKey = idx
            break
        else
            -- Otherwise check if player is a client in this lobby
            for i = 1, #lobby.clients do
                if lobby.clients[i] == src then
                    lobby.clients[i] = nil
                    lobbyKey         = idx
                    break
                end
            end
        end
    end

    -- Not found in any lobby
    if lobbyKey == "waiting" then
        return
    end

    local lobby = lobbies[lobbyKey]
    if not lobby then
        return
    end

    local host = lobby.host

    if lobby.working then
        -- If job is active
        if #lobby.clients == 0 then
            -- Only host left, just clear his lobby UI
            TriggerClientEvent("samudra_deliveryjob:clearMyLobby", host)
        else
            -- Still multiple people in lobby: refresh UI for everyone
            local mugs = GetAllPartyMugs(host)
            TriggerForAllMembers(host, "samudra_deliveryjob:RefreshMugs", mugs)

            if Config.useModernUI then
                RecalculateRewards(host)
            end
        end
    else
        -- Not working (idle lobby)
        if #lobby.clients == 0 then
            -- Only host was left, delete lobby
            TriggerClientEvent("samudra_deliveryjob:clearMyLobby", host)
            lobbies[lobbyKey] = nil
        end
    end
end)

-----------------------------------------------------------------------
-- playerDropped: clean simple per-player caches
-----------------------------------------------------------------------

AddEventHandler("playerDropped", function(reason)
    local src = source

    -- Anti-spam deliver cache (if present)
    if L8_1 and L8_1[src] ~= nil then
        L8_1[src] = nil
    end

    -- Cooldown tables or other player-indexed data (if they use src as key)
    if L9_1 and L9_1[src] ~= nil then
        L9_1[src] = nil
    end

    if L10_1 and L10_1[src] ~= nil then
        L10_1[src] = nil
    end

    -- Cached player names
    if CachedNames and CachedNames[src] ~= nil then
        CachedNames[src] = nil
    end
end)
