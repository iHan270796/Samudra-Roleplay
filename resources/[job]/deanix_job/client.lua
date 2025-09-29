local QBCore = exports['qb-core']:GetCoreObject()
local isMining = false
local isChopping = false
local failedAttempts = 0
local failedChopAttempts = 0
local rockSpawned = {}
local treeSpawned = {}
local rockProps = {}
local treeProps = {}
local rockSpawnDistance = 50.0
local rockDespawnDistance = 60.0
local treeSpawnDistance = 50.0
local treeDespawnDistance = 60.0
local CurrentDrill
local lastRockHarvest = {}
local lastTreeHarvest = {}
local CurrentRockEntity = nil
local CurrentTreeEntity = nil
local isInMiningZone = false
local isInLumberZone = false
local miningZone = nil
local lumberZone = nil
local CurrentAxe = nil
local spawnedRocks = 0
local rockEntities = {}
local Washing = false

function Notify(msg, tipe)
    lib.notify({
        title = 'Info',
        description = msg,
        type = tipe or 'inform' -- default ke 'inform'
    })
end

CreateThread(function()
    miningZone = ComboZone:Create({
        BoxZone:Create(vector3(2961.71, 2758.03, 42.87), 90.0, 130.0, {
            name = "mining_area",
            heading = 0,
            minZ = 38.0,
            maxZ = 58.0
        }),
    }, {
        name = "mining_zone",
        debugPoly = false
    })

    miningZone:onPlayerInOut(function(isInside)
        isInMiningZone = isInside
    end)
end)

CreateThread(function()
    lumberZone = ComboZone:Create({
        BoxZone:Create(vector3(-536.12, 5466.57, 68.93), 100.0, 100.0, {
            name = "lumber_area",
            heading = 0,
            minZ = 60.0,
            maxZ = 85.0
        }),
    }, {
        name = "lumber_zone",
        debugPoly = false
    })

    lumberZone:onPlayerInOut(function(isInside)
        isInLumberZone = isInside
    end)
end)

local function ValidateRockCoord(coord)
    local validate = true
    if spawnedRocks > 0 then
        for _, v in pairs(rockEntities) do
            if #(coord - GetEntityCoords(v)) < 5.0 then
                validate = false
                break
            end
        end
    end
    return validate
end

local function ValidateTreeCoord(coord)
    local validate = true
    if treeSpawned and next(treeSpawned) ~= nil then
        for _, v in pairs(treeSpawned) do
            if #(coord - GetEntityCoords(v)) < 5.0 then
                validate = false
                break
            end
        end
    end
    return validate
end

local function SpawnRockAt(coords, index)
    if not ValidateRockCoord(coords) then return end

    local prop = Config.RockProps[math.random(#Config.RockProps)]
    local model = GetHashKey(prop)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    local rock = CreateObject(model, coords.x, coords.y, coords.z - 1.0, false, true, false)
    PlaceObjectOnGroundProperly(rock)
    FreezeEntityPosition(rock, true)
    SetEntityAsMissionEntity(rock, true, true)

    exports.ox_target:addLocalEntity(rock, {
        {
            icon = "fas fa-hammer",
            label = "Mulai Menambang",
            onSelect = function()
                StartMining(rock)
            end,
            canInteract = function()
                return isInMiningZone
            end
        }
    })

    rockSpawned[index] = rock
    spawnedRocks = spawnedRocks + 1
end

local function SpawnTreeAt(coords, index)
    if not ValidateTreeCoord(coords) then return end

    local prop = Config.TreeProps[math.random(#Config.TreeProps)]
    local model = GetHashKey(prop)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    local tree = CreateObject(model, coords.x, coords.y, coords.z - 1.0, false, true, false)
    PlaceObjectOnGroundProperly(tree)
    FreezeEntityPosition(tree, true)
    SetEntityAsMissionEntity(tree, true, true)

    exports.ox_target:addLocalEntity(tree, {
        {
            icon = "fas fa-tree",
            label = "Mulai Menebang",
            onSelect = function()
                StartChopping(tree, index)
            end,
            canInteract = function()
                return isInLumberZone
            end
        }
    })

    treeSpawned[index] = tree
end

CreateThread(function()
    while true do
        if isInMiningZone then
            local playerCoords = GetEntityCoords(PlayerPedId())
            for i, coords in ipairs(Config.MiningLocations) do
                local dist = #(playerCoords - coords)

                if dist < rockSpawnDistance then
                    if not rockSpawned[i] and (not lastRockHarvest[i] or (GetGameTimer() - lastRockHarvest[i]) >= Config.RockRespawnTime) then
                        SpawnRockAt(coords, i)
                    end

                elseif dist > rockDespawnDistance and rockSpawned[i] then
                    if DoesEntityExist(rockSpawned[i]) then
                        exports.ox_target:removeLocalEntity(rockSpawned[i])
                        DeleteEntity(rockSpawned[i])
                        spawnedRocks = spawnedRocks - 1
                    end
                    rockSpawned[i] = nil
                end
            end

        else
            for i, ent in pairs(rockSpawned) do
                if DoesEntityExist(ent) then
                    exports.ox_target:removeLocalEntity(ent)
                    DeleteEntity(ent)
                end
                rockSpawned[i] = nil
            end
            spawnedRocks = 0
        end

        Wait(2000)
    end
end)

-- ========================= LUMBERJACK SYSTEM =========================

CreateThread(function()
    while true do
        if isInLumberZone then
            local playerCoords = GetEntityCoords(PlayerPedId())
            for i, coords in ipairs(Config.TreeLocations) do
                local dist = #(playerCoords - coords)

                if dist < treeSpawnDistance then
                    if not treeSpawned[i] and (not lastTreeHarvest[i] or (GetGameTimer() - lastTreeHarvest[i]) >= Config.TreeRespawnTime) then
                        SpawnTreeAt(coords, i)
                    end
                elseif dist > treeDespawnDistance and treeSpawned[i] then
                    if DoesEntityExist(treeSpawned[i]) then
                        exports.ox_target:removeLocalEntity(treeSpawned[i])
                        DeleteEntity(treeSpawned[i])
                    end
                    treeSpawned[i] = nil
                end
            end
        else
            for i, ent in pairs(treeSpawned) do
                if DoesEntityExist(ent) then
                    exports.ox_target:removeLocalEntity(ent)
                    DeleteEntity(ent)
                end
                treeSpawned[i] = nil
            end
        end

        Wait(2000)
    end
end)

-- ========================= INTERAKSI =========================

function LoadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

function loadPtfxDict(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        RequestNamedPtfxAsset(dict)
        Wait(10)
    end
    UseParticleFxAssetNextCall(dict)
end

function StartMining(entity)
    if isMining then return end

    local hasLaser = QBCore.Functions.HasItem("drill")
    if not hasLaser then
        Notify("Kamu Butuh Drill Untuk Menambang!", "error")
        return
    end

    isMining = true
    CurrentRockEntity = entity

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local drill = CreateObject(GetHashKey("ch_prop_laserdrill_01a"), coords.x, coords.y, coords.z, true, true, true)
    AttachEntityToEntity(drill, ped, GetPedBoneIndex(ped, 57005), 0.14, 0, -0.01, 90.0, -90.0, 180.0, true, true, false, true, 1, true)
    CurrentDrill = drill

    RequestAmbientAudioBank("DLC_HEIST_BIOLAB_DELIVER_EMP_SOUNDS", 0)
    RequestAmbientAudioBank("dlc_xm_silo_laser_hack_sounds", 0)
    LoadAnimDict(Config.MiningAnim.dict)
    TaskPlayAnim(ped, Config.MiningAnim.dict, Config.MiningAnim.anim, 8.0, -8.0, Config.MiningTime, 1, 0, false, false, false)
    local rockcoords = GetEntityCoords(entity)
    CreateThread(function()
        loadPtfxDict("core")
        while isMining do
            local lasercoords = GetOffsetFromEntityInWorldCoords(drill, 0.0,-0.5, 0.02)

            UseParticleFxAssetNextCall("core")
            StartNetworkedParticleFxNonLoopedAtCoord("muz_railgun", lasercoords.x, lasercoords.y, lasercoords.z, 0.0, -10.0, GetEntityHeading(drill)+270.0, 1.0, false, false, false)

            UseParticleFxAssetNextCall("core")
            StartNetworkedParticleFxNonLoopedAtCoord("ent_dst_rocks", rockcoords.x, rockcoords.y, rockcoords.z, 0.0, 0.0, GetEntityHeading(ped)-180.0, 1.0, false, false, false)

            Wait(60)
        end
    end)

    local soundId = GetSoundId()
    PlaySoundFromEntity(soundId, "Pass", drill, "dlc_xm_silo_laser_hack_sounds", 1, 0)

    SetNuiFocus(true, false)
    SendNUIMessage({ action = "startMinigame" })
end

function StartChopping(entity, index)
    if isChopping then return end

    local hasAxe = QBCore.Functions.HasItem('axe')
    if not hasAxe then
        Notify("Anda Butuh Kapak Untuk Menebang Kayu.", "error")
        return
    end

    isChopping = true
    CurrentTreeEntity = entity
    CurrentTreeIndex = index

    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local axeProp = GetHashKey("prop_tool_fireaxe")
    RequestModel(axeProp)
    while not HasModelLoaded(axeProp) do Wait(10) end
    local axe = CreateObject(axeProp, coords.x, coords.y, coords.z, true, true, true)
    AttachEntityToEntity(
        axe, ped, GetPedBoneIndex(ped, 57005),
        0.15, 0.02, -0.01,
        0.0, 90.0, 100.0,
        true, true, false, true, 1, true
    )
    CurrentAxe = axe

    LoadAnimDict(Config.AxeAnim.dict)
    TaskPlayAnim(ped, Config.AxeAnim.dict, Config.AxeAnim.anim, 8.0, -8.0, -1, 1, 0, false, false, false)

    SetNuiFocus(true, false)
    SendNUIMessage({ action = "startMinigame" })
end

-- ========================= NUI CALLBACK =========================
RegisterNUICallback("minigameDone", function(data, cb)
    SetNuiFocus(false, false)
    SetCursorLocation(0.5, 0.5)
    local ped = PlayerPedId()
    ClearPedTasks(ped)

    if CurrentDrill then
        DeleteObject(CurrentDrill)
        CurrentDrill = nil
    end

    if CurrentAxe and DoesEntityExist(CurrentAxe) then
        DeleteEntity(CurrentAxe)
        CurrentAxe = nil
    end

    local successCount = tonumber(data.success) or 0
    if isMining then
        if successCount < Config.MinigameCount then
            failedAttempts = failedAttempts + 1
            if failedAttempts >= Config.DrillMaxDurability then
                failedAttempts = 0
                TriggerServerEvent("deanix_mining:breakDrill")
                lib.notify({
                    title = 'Mining',
                    description = Config.Notifications.DrillBroken,
                    type = 'error'
                })
            else
                lib.notify({
                    title = 'Mining',
                    description = Config.Notifications.MiningFailed,
                    type = 'error'
                })
            end
        else
            failedAttempts = 0
            TriggerServerEvent("deanix_mining:giveStone")
            for i, rock in pairs(rockSpawned) do
                if rock == CurrentRockEntity then
                    DeleteEntity(rock)
                    exports.ox_target:removeLocalEntity(rock)
                    rockSpawned[i] = nil
                    break
                end
            end
        end
        isMining = false
        CurrentRockEntity = nil

    elseif isChopping then
        if successCount >= Config.MinigameCount then
            failedChopAttempts = 0
            TriggerServerEvent("deanix_mining:giveWood")
            for i, tree in pairs(treeSpawned) do
                if tree == CurrentTreeEntity then
                    DeleteEntity(tree)
                    exports.ox_target:removeLocalEntity(tree)
                    treeSpawned[i] = nil
                    break
                end
            end
        else
            failedChopAttempts = failedChopAttempts + 1
            if failedChopAttempts >= Config.AxeMaxDurability then
                failedChopAttempts = 0
                TriggerServerEvent("deanix_mining:breakAxe")
                lib.notify({
                    title = 'Tukang Kayu',
                    description = Config.Notifications.AxeBroken,
                    type = 'error'
                })
            else
                lib.notify({
                    title = 'Tukang Kayu',
                    description = "Anda Gagal Menebang Pohon.",
                    type = 'error'
                })
            end
        end
        isChopping = false
        CurrentTreeEntity = nil
    end
    cb("ok")
end)

-- ========================= CUCI & LEBUR =========================

exports.ox_target:addBoxZone({
    coords = Config.WashingSpot,
    size = vec3(7.0, 7.0, 2.0), -- X, Y, Z (tinggi area interaksi)
    rotation = 0,
    debug = false, -- ubah ke true kalau mau lihat zona
    options = {
        {
            name = 'wash_stone',
            label = '🧼 Cuci Batu',
            icon = 'fas fa-water',
            onSelect = function()
                WashStone()
            end,
            -- canInteract = function(entity, distance, coords, name)
            --     return LocalPlayer.state.miningUniform == true
            -- end
        }
    }
})


exports.ox_target:addBoxZone({
    coords = Config.SmeltingSpot,
    size = vec3(2.0, 2.0, 2.0), -- X, Y, Z (tinggi zona interaksi)
    rotation = 0,
    debug = false, -- ubah ke true kalau mau lihat zona
    options = {
        {
            name = 'smelt_stone',
            label = '🔥 Lebur Batu',
            icon = 'fas fa-fire',
            onSelect = function()
                SmeltStone()
            end,
            -- canInteract = function(entity, distance, coords, name)
            --     return LocalPlayer.state.miningUniform == true
            -- end
        }
    }
})


exports.ox_target:addBoxZone({
    coords = Config.WoodProcessingSpot,
    size = vec3(7.0, 7.0, 2.0), -- Panjang, Lebar, Tinggi
    rotation = 0,
    debug = false, -- true kalau mau lihat zona
    options = {
        {
            name = 'process_wood',
            label = '🪓 Proses Kayu',
            icon = 'fas fa-tools',
            onSelect = function()
                ProcessWood()
            end,
            -- canInteract = function(entity, distance, coords, name)
            --     return LocalPlayer.state.lumberjackUniform == true
            -- end
        }
    }
})

function WashStone()
    local ped = PlayerPedId()
    if Washing then return end

    local cost = 1
    if exports.ox_inventory:Search('count', 'stone') < cost then
        Notify("Kamu Butuh Batu Untuk DI Cuci.")
        return
    end

    Washing = true
    local rockModel = `prop_rock_5_smash1`
    RequestModel(rockModel)
    while not HasModelLoaded(rockModel) do Wait(10) end
    local rock = CreateObject(rockModel, 0.0, 0.0, 0.0, true, true, false)
    AttachEntityToEntity(rock, ped, GetPedBoneIndex(ped, 60309), 0.1, 0.0, 0.05, 90.0, -90.0, 90.0, true, true, false, true, 1, true)
    TaskStartScenarioInPlace(ped, "PROP_HUMAN_BUM_BIN", 0, true)
    local waterFx
    CreateThread(function()
        Wait(3000)
        RequestNamedPtfxAsset("core")
        while not HasNamedPtfxAssetLoaded("core") do Wait(10) end
        while Washing do
            UseParticleFxAssetNextCall("core")
            waterFx = StartNetworkedParticleFxLoopedOnEntity(
                "water_splash_veh_out",
                ped,
                0.0, 1.0, -0.2,
                0.0, 0.0, 0.0,
                2.0, false, false, false
            )
            Wait(500)
        end
    end)
    QBCore.Functions.Progressbar("washing_stone", "Washing Stone...", 7500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        Washing = false

        if waterFx then
            StopParticleFxLooped(waterFx, 0)
        end

        DeleteEntity(rock)
        ClearPedTasks(ped)

        TriggerServerEvent("deanix_mining:washStone", cost)
    end, function() -- cancel
        Washing = false

        if waterFx then
            StopParticleFxLooped(waterFx, 0)
        end

        DeleteEntity(rock)
        ClearPedTasks(ped)

        Notify("You cancelled stone washing.", "error")
    end)
end

function SmeltStone()
    local ped = PlayerPedId()
    local cost = 1

    if exports.ox_inventory:Search('count', 'batu_bersih') < cost then
        Notify("Kamu Butuh Batu Yang Sudah DI cuci.")
        return
    end

    QBCore.Functions.Progressbar("smelt_stone", "Melting rocks...", Config.SmeltTime or 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_bum_bin@base",
        anim = "base",
        flags = 49,
    }, {}, {}, function()
        ClearPedTasks(ped)
        TriggerServerEvent("deanix_mining:smeltStone")
    end, function()
        ClearPedTasks(ped)
        Notify("Melt cancelled.", "error")
    end)
end

function ProcessWood()
    local ped = PlayerPedId()
    local cost = 1

    if exports.ox_inventory:Search('count', 'kayu') < cost then
        Notify("Kamu Butuh Kayu Untuk Di Proses.")
        return
    end

    RequestAnimDict("amb@world_human_hammering@male@base")
    while not HasAnimDictLoaded("amb@world_human_hammering@male@base") do Wait(10) end
    TaskPlayAnim(ped, "amb@world_human_hammering@male@base", "base", 8.0, -8, -1, 1, 0, false, false, false)

    QBCore.Functions.Progressbar("processing_wood", "Processing wood...", 7500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        ClearPedTasks(ped)
        TriggerServerEvent("deanix_mining:processWood")
    end, function()
        ClearPedTasks(ped)
        Notify("The wood process is cancelled.")
    end)
end

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for _, rock in ipairs(rockProps) do if DoesEntityExist(rock) then DeleteEntity(rock) end end
    for _, tree in ipairs(treeProps) do if DoesEntityExist(tree) then DeleteEntity(tree) end end
end)
