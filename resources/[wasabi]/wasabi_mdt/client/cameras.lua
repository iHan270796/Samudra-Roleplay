-- ============================================
-- WASABI MDT CAMERA SYSTEM
-- Handles security camera placement, viewing, and management
-- ============================================

-- Global State Tables
local cameras = {}
local spawnedCameraObjects = {}
local cameraPoints = {}
local isViewingCamera = false
local activeCameraEntity = nil
local currentCameraData = nil
local isPlacementMode = false
local placementData = nil

-- Configuration
local CAMERA_SPAWN_DISTANCE = (Config and Config.Cameras and Config.Cameras.spawnDistance) or 100.0

-- ============================================
-- CAMERA OBJECT MANAGEMENT
-- ============================================

function SpawnCameraObject(cameraData)
    if spawnedCameraObjects[cameraData.id] then
        return
    end

    local modelHash = joaat(cameraData.model or "prop_cctv_cam_01a")
    
    wsb.stream.model(modelHash)
    
    local cameraObject = CreateObject(
        modelHash,
        cameraData.coords.x,
        cameraData.coords.y,
        cameraData.coords.z,
        false, false, false
    )
    
    SetEntityRotation(
        cameraObject,
        cameraData.rotation.x,
        cameraData.rotation.y,
        cameraData.rotation.z,
        2, true
    )
    
    SetEntityInvincible(cameraObject, false)
    FreezeEntityPosition(cameraObject, true)
    
    spawnedCameraObjects[cameraData.id] = cameraObject
end

function RemoveCameraObject(cameraId)
    local cameraObject = spawnedCameraObjects[cameraId]
    if cameraObject then
        DeleteObject(cameraObject)
        spawnedCameraObjects[cameraId] = nil
    end
end

-- ============================================
-- PROXIMITY POINT MANAGEMENT
-- ============================================

function CreateCameraPoint(cameraData)
    cameraPoints[cameraData.id] = wsb.points.new({
        coords = vec3(cameraData.coords.x, cameraData.coords.y, cameraData.coords.z),
        heading = cameraData.rotation,
        id = cameraData.id,
        data = cameraData,
        distance = CAMERA_SPAWN_DISTANCE,
        
        onEnter = function(point)
            if not spawnedCameraObjects[point.id] then
                SpawnCameraObject(point.data)
            end
        end,
        
        onExit = function(point)
            RemoveCameraObject(point.id)
        end
    })
end

-- ============================================
-- NETWORK EVENT HANDLERS
-- ============================================

RegisterNetEvent("wasabi_mdt:spawnCamera", function(cameraData)
    cameras[cameraData.id] = cameraData
    CreateCameraPoint(cameraData)
end)

RegisterNetEvent("wasabi_mdt:updateCamera", function(cameraId, updateData)
    if not cameras[cameraId] then return end
    
    for key, value in pairs(updateData) do
        cameras[cameraId][key] = value
    end
    
    if updateData.coords or updateData.rotation then
        if cameraPoints[cameraId] then
            cameraPoints[cameraId]:remove()
            RemoveCameraObject(cameraId)
        end
        
        SpawnCameraObject(cameras[cameraId])
    end
end)

RegisterNetEvent("wasabi_mdt:cameraReplaced", function(cameraData)
    if spawnedCameraObjects[cameraData.id] then
        DeleteObject(spawnedCameraObjects[cameraData.id])
        spawnedCameraObjects[cameraData.id] = nil
    end
    
    if cameraPoints[cameraData.id] then
        cameraPoints[cameraData.id]:remove()
        cameraPoints[cameraData.id] = nil
    end
    
    cameras[cameraData.id] = cameraData
    CreateCameraPoint(cameraData)
end)

RegisterNetEvent("wasabi_mdt:removeCamera", function(cameraId)
    RemoveCameraObject(cameraId)
    
    if cameraPoints[cameraId] then
        cameraPoints[cameraId]:remove()
    end
    
    cameras[cameraId] = nil
end)

-- ============================================
-- CAMERA VIEWING SYSTEM
-- ============================================

function AddScaleformText(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function CreateInstructionalButtons(scaleformName)
    local scaleform = RequestScaleformMovie(scaleformName)
    
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(100)
    end
    
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()
    
    -- Rotate Camera Controls
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    _ENV["PushScaleformMovieMethodParameterButtonName"](GetControlInstructionalButton(0, 174, true))
    _ENV["PushScaleformMovieMethodParameterButtonName"](GetControlInstructionalButton(0, 175, true))
    AddScaleformText("Rotate Camera")
    PopScaleformMovieFunctionVoid()
    
    -- Close Camera Control
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    _ENV["PushScaleformMovieMethodParameterButtonName"](GetControlInstructionalButton(0, 194, true))
    AddScaleformText("Close Camera")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()
    
    return scaleform
end

function GetCameraOffsets(cameraModel)
    if Config and Config.Cameras and Config.Cameras.models then
        for _, modelConfig in ipairs(Config.Cameras.models) do
            if modelConfig.model == cameraModel then
                local viewOffset = modelConfig.viewOffset or {x = 0, y = 0, z = -0.1}
                local rotationOffset = modelConfig.rotationOffset or {x = -10.0, y = 0, z = 180.0}
                return viewOffset, rotationOffset
            end
        end
    end
    
    return {x = 0, y = 0, z = -0.1}, {x = -10.0, y = 0, z = 180.0}
end

function SetupCameraView(cameraData)
    if activeCameraEntity then
        DestroyCam(activeCameraEntity, 0)
        activeCameraEntity = nil
    end
    
    activeCameraEntity = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    
    local viewOffset, rotationOffset = GetCameraOffsets(cameraData.model)
    
    SetCamCoord(
        activeCameraEntity,
        cameraData.coords.x + viewOffset.x,
        cameraData.coords.y + viewOffset.y,
        cameraData.coords.z + viewOffset.z
    )
    
    SetCamRot(
        activeCameraEntity,
        cameraData.rotation.x + rotationOffset.x,
        cameraData.rotation.y + rotationOffset.y,
        cameraData.rotation.z + rotationOffset.z,
        2
    )
    
    RenderScriptCams(1, 0, 0, 1, 1)
end

function CloseCameraView()
    DestroyCam(activeCameraEntity, 0)
    RenderScriptCams(0, 0, 1, 1, 1)
    activeCameraEntity = nil
    
    ClearTimecycleModifier("scanline_cam_cheap")
    SetFocusEntity(GetPlayerPed(PlayerId()))
    
    local cameraId = (currentCameraData and currentCameraData.id) or nil
    isViewingCamera = false
    
    if cameraId then
        TriggerEvent("wasabi_mdt:openMDT", "cameras", cameraId)
    else
        TriggerEvent("wasabi_mdt:openMDT", "cameras")
    end
end

function ViewCameras(cameraList)
    if not cameraList or #cameraList == 0 then
        TriggerEvent("wasabi_bridge:notify", _L("notify_title"), "No cameras found", "error")
        return
    end
    
    cameras = cameraList
    currentCameraData = cameraList[1]
    isViewingCamera = true
    
    local viewOffset, rotationOffset = GetCameraOffsets(currentCameraData.model)
    local rotationX = currentCameraData.rotation.x + rotationOffset.x
    local rotationY = currentCameraData.rotation.y + rotationOffset.y
    local rotationZ = currentCameraData.rotation.z + rotationOffset.z
    
    SetFocusPosAndVel(
        currentCameraData.coords.x, currentCameraData.coords.y, currentCameraData.coords.z,
        currentCameraData.coords.x, currentCameraData.coords.y, currentCameraData.coords.z
    )
    
    SetupCameraView(currentCameraData)
    DisablePlayerMovement(wsb.cache.playerId, true)
    
    while isViewingCamera do
        DisableAllControlActions(0)
        
        local instructionalButtons = CreateInstructionalButtons("instructional_buttons")
        DrawScaleformMovieFullscreen(instructionalButtons, 255, 255, 255, 255, 0)
        
        SetTimecycleModifier("scanline_cam_cheap")
        SetTimecycleModifierStrength(2.0)
        
        if IsDisabledControlPressed(0, 174) then
            rotationZ = rotationZ + 2.0
            SetCamRot(activeCameraEntity, rotationX, rotationY, rotationZ, 2)
        end
        
        if IsDisabledControlPressed(0, 175) then
            rotationZ = rotationZ - 2.0
            SetCamRot(activeCameraEntity, rotationX, rotationY, rotationZ, 2)
        end
        
        if IsDisabledControlJustPressed(0, 194) or IsDisabledControlJustPressed(0, 177) then
            CloseCameraView()
        end
        
        Wait(0)
    end
    
    DisablePlayerMovement(wsb.cache.playerId, false)
end

function ViewSingleCamera(cameraData)
    ViewCameras({cameraData})
end

RegisterNetEvent("wasabi_mdt:viewCamera", function(cameraData)
    ViewSingleCamera(cameraData)
end)

RegisterNetEvent("wasabi_mdt:viewCameras", function(cameraList)
    ViewCameras(cameraList)
end)

-- ============================================
-- CAMERA PLACEMENT SYSTEM
-- ============================================

function StartCameraPlacement(placementConfig)
    if isPlacementMode then return end
    
    isPlacementMode = true
    placementData = placementConfig
    
    local playerPed = PlayerPedId()
    local cameraModel = (placementConfig and placementConfig.model) or 
                       (Config and Config.Cameras and Config.Cameras.models and Config.Cameras.models[1] and Config.Cameras.models[1].model) or 
                       "prop_cctv_cam_01a"
    
    local modelHash = joaat(cameraModel)
    local playerCoords = GetEntityCoords(playerPed)
    local forwardVector = GetEntityForwardVector(playerPed) * 3
    local spawnCoords = playerCoords + forwardVector
    
    wsb.stream.model(modelHash)
    
    local cameraObject = CreateObject(
        modelHash,
        spawnCoords.x, spawnCoords.y, spawnCoords.z + 1.5,
        false, false, false
    )
    
    local objectPlaced = OBJECTGIZMO:useGizmo(cameraObject)
    
    if objectPlaced then
        local finalCoords = GetEntityCoords(cameraObject)
        local finalRotation = GetEntityRotation(cameraObject, 2)
        
        local streetHash, crossingHash = GetStreetNameAtCoord(finalCoords.x, finalCoords.y, finalCoords.z)
        local streetName = GetStreetNameFromHashKey(streetHash)
        
        if crossingHash ~= 0 then
            streetName = streetName .. " & " .. GetStreetNameFromHashKey(crossingHash)
        end
        
        wsb.serverCallback("wasabi_mdt:placeCamera", function(cameraId)
            if cameraId then
                TriggerEvent("wasabi_mdt:openMDT", "cameras", cameraId)
            end
        end, {
            name = placementData.name,
            model = cameraModel,
            departments = placementData.departments,
            coords = {x = finalCoords.x, y = finalCoords.y, z = finalCoords.z},
            rotation = {x = finalRotation.x, y = finalRotation.y, z = finalRotation.z},
            location = streetName
        })
        
        if DoesEntityExist(cameraObject) then
            DeleteObject(cameraObject)
        end
    else
        if DoesEntityExist(cameraObject) then
            DeleteObject(cameraObject)
        end
        
        TriggerEvent("wasabi_bridge:notify", _L("notify_title"), _L("camera_placement_cancelled"), "info")
    end
    
    isPlacementMode = false
    placementData = nil
end

function ReplaceCameraPlacement(replacementConfig)
    if isPlacementMode then return end
    
    isPlacementMode = true
    placementData = replacementConfig
    
    local oldCoords = replacementConfig.currentCoords
    
    cameras[replacementConfig.replaceId] = nil
    
    if spawnedCameraObjects[replacementConfig.replaceId] then
        DeleteObject(spawnedCameraObjects[replacementConfig.replaceId])
        spawnedCameraObjects[replacementConfig.replaceId] = nil
    end
    
    if oldCoords then
        local nearbyObjects = GetGamePool("CObject")
        for _, obj in ipairs(nearbyObjects) do
            local objCoords = GetEntityCoords(obj)
            local distance = #(objCoords - vector3(oldCoords.x, oldCoords.y, oldCoords.z))
            
            if distance < 1.0 then
                local objModel = GetEntityModel(obj)
                local expectedModel = joaat(replacementConfig.model or "prop_cctv_cam_01a")
                
                if objModel == expectedModel then
                    DeleteObject(obj)
                end
            end
        end
    end
    
    local playerPed = wsb.cache.ped
    local cameraModel = replacementConfig.model or "prop_cctv_cam_01a"
    local modelHash = joaat(cameraModel)
    
    local playerCoords = GetEntityCoords(playerPed)
    local forwardVector = GetEntityForwardVector(playerPed) * 3
    local spawnCoords = playerCoords + forwardVector
    
    wsb.stream.model(modelHash)
    
    local cameraObject = CreateObject(
        modelHash,
        spawnCoords.x, spawnCoords.y, spawnCoords.z + 1.5,
        false, false, false
    )
    
    local objectPlaced = OBJECTGIZMO:useGizmo(cameraObject)
    
    if objectPlaced then
        local finalCoords = GetEntityCoords(cameraObject)
        local finalRotation = GetEntityRotation(cameraObject, 2)
        
        local streetHash, crossingHash = GetStreetNameAtCoord(finalCoords.x, finalCoords.y, finalCoords.z)
        local streetName = GetStreetNameFromHashKey(streetHash)
        
        if crossingHash ~= 0 then
            streetName = streetName .. " & " .. GetStreetNameFromHashKey(crossingHash)
        end
        
        TriggerServerEvent("wasabi_mdt:replaceCamera", {
            id = replacementConfig.replaceId,
            coords = {x = finalCoords.x, y = finalCoords.y, z = finalCoords.z},
            rotation = {x = finalRotation.x, y = finalRotation.y, z = finalRotation.z},
            location = streetName
        })
        
        TriggerEvent("wasabi_mdt:openMDT", "cameras", replacementConfig.replaceId)
        
        if DoesEntityExist(cameraObject) then
            DeleteObject(cameraObject)
        end
    else
        if DoesEntityExist(cameraObject) then
            DeleteObject(cameraObject)
        end
        
        TriggerEvent("wasabi_bridge:notify", _L("notify_title"), _L("camera_replacement_cancelled"), "info")
    end
    
    isPlacementMode = false
    placementData = nil
end

-- ============================================
-- NUI CALLBACKS
-- ============================================

RegisterNUICallback("startCameraPlacement", function(data, cb)
    if OBJECTGIZMO then
        StartCameraPlacement(data)
        cb(true)
    else
        TriggerEvent("wasabi_bridge:notify", _L("notify_title"), "object_gizmo resource is required for camera placement", "error")
        cb(false)
    end
end)

RegisterNUICallback("replaceCameraPlacement", function(data, cb)
    if not OBJECTGIZMO then
        TriggerEvent("wasabi_bridge:notify", _L("notify_title"), "object_gizmo resource is required for camera placement", "error")
        cb(false)
        return
    end
    
    local cameraData = wsb.awaitServerCallback("wasabi_mdt:cameraAction", "getCameraById", {id = data.id})
    
    if cameraData then
        ReplaceCameraPlacement({
            replaceId = cameraData.id,
            name = cameraData.name,
            location = cameraData.location,
            departments = cameraData.departments,
            model = cameraData.model,
            currentCoords = cameraData.coords
        })
        cb(true)
    else
        TriggerEvent("wasabi_bridge:notify", _L("notify_title"), _L("camera_not_found"), "error")
        cb(false)
    end
end)

-- ============================================
-- INITIALIZATION
-- ============================================

CreateThread(function()
    while not (wsb and wsb.playerLoaded and wsb.playerData) do
        Wait(1000)
    end
    
    local allCameras = wsb.awaitServerCallback("wasabi_mdt:cameraAction", "getAllCameras")
    
    if allCameras then
        for _, cameraData in ipairs(allCameras) do
            cameras[cameraData.id] = cameraData
        end
    end
    
    for _, cameraData in pairs(cameras) do
        CreateCameraPoint(cameraData)
    end
end)

-- ============================================
-- CLEANUP ON RESOURCE STOP
-- ============================================

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    
    for _, cameraObject in pairs(spawnedCameraObjects) do
        if DoesEntityExist(cameraObject) then
            DeleteObject(cameraObject)
        end
    end
    spawnedCameraObjects = {}
    
    if isViewingCamera then
        RenderScriptCams(false, false, 0, true, false)
        
        if activeCameraEntity then
            DestroyCam(activeCameraEntity, 0)
        end
        
        ClearTimecycleModifier("scanline_cam_cheap")
        SetFocusEntity(GetPlayerPed(wsb.cache.playerId))
        
        isViewingCamera = false
        activeCameraEntity = nil
        currentCameraData = nil
    end
end)