local QBCore = exports['qb-core']:GetCoreObject()
local CamHandle = nil
local CurrentFov = 60.0
local CurrentHeightAdd = 0.0
local CamActive = false
local AnimPlaying = false

local LastIndexes = {
    mask = nil, hat = nil, glasses = nil, shirt = nil,
    undershirt = nil, vest = nil, chain = nil,
    watch = nil, bracelet = nil, pants = nil,
    bag = nil, shoes = nil
}

local LastTextureIndexes = table.clone(LastIndexes)

local ClothingTable = {
    mask = { type = 'component', id = 1 },
    hat = { type = 'prop', id = 0 },
    glasses = { type = 'prop', id = 1 },
    shirt = {
        type = 'component',
        id = 11,
        extras = {
            { name = 'undershirt', type = 'component', id = 8, default = 15 },
            { name = 'gloves', type = 'component', id = 3, default = 15 },
            { name = 'decals', type = 'component', id = 10, default = 0 }
        }
    },
    undershirt = { type = 'component', id = 8 },
    vest = { type = 'component', id = 9 },
    chain = { type = 'component', id = 7 },
    watch = { type = 'prop', id = 6 },
    bracelet = { type = 'prop', id = 7 },
    pants = { type = 'component', id = 4 },
    bag = { type = 'component', id = 5 },
    shoes = { type = 'component', id = 6 }
}

--- Get clothing state (buat NUI)
local function GetClothingState()
    return {
        mask = GetPedDrawableVariation(PlayerPedId(), 1) ~= 0,
        hat = GetPedPropIndex(PlayerPedId(), 0) ~= -1,
        glasses = GetPedPropIndex(PlayerPedId(), 1) ~= -1,
        shirt = GetPedDrawableVariation(PlayerPedId(), 11) ~= 15,
        undershirt = GetPedDrawableVariation(PlayerPedId(), 8) ~= 15,
        vest = GetPedDrawableVariation(PlayerPedId(), 9) ~= 0,
        chain = GetPedDrawableVariation(PlayerPedId(), 7) ~= 0,
        watch = GetPedPropIndex(PlayerPedId(), 6) ~= -1,
        bracelet = GetPedPropIndex(PlayerPedId(), 7) ~= -1,
        pants = GetPedDrawableVariation(PlayerPedId(), 4) ~= 14,
        bag = GetPedDrawableVariation(PlayerPedId(), 5) ~= 0,
        shoes = GetPedDrawableVariation(PlayerPedId(), 6) ~= 34
    }
end

--- Buka UI dan aktifkan kamera
local function OpenMenu()
    local ped = PlayerPedId()
    local pedHeading = GetEntityHeading(ped) + 180.0
    local camCoords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 2.0, 0.0)

    CamHandle = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', camCoords.x, camCoords.y, camCoords.z, 0.0, 0.0, pedHeading, CurrentFov, false, 0)
    SetCamUseShallowDofMode(CamHandle, true)
    SetCamNearDof(CamHandle, 0.2)
    SetCamFarDof(CamHandle, 5.0)
    SetCamDofStrength(CamHandle, 1.0)
    SetCamActive(CamHandle, true)
    RenderScriptCams(true, true, 500, true, true)

    CamActive = true
    SetNuiFocus(true, true)
    SendNUIMessage({ type = 'OpenMenu', clothingStates = GetClothingState() })
    -- exports['minimal-hud']:toggleMap(false)
end

--- Scale (zoom)
RegisterNuiCallback('changeScale', function(data, cb)
    CurrentFov = CurrentFov + data.scale
    CurrentFov = math.clamp(CurrentFov, Config.MinFov, Config.MaxFov)
    SetCamFov(CamHandle, CurrentFov)
end)

--- Rotate karakter
RegisterNuiCallback('changeRotation', function(data, cb)
    local ped = PlayerPedId()
    local heading = GetEntityHeading(ped)
    local rotation = heading + (data.side == 'right' and 4.0 or -4.0)
    SetEntityHeading(ped, rotation % 360)
end)

--- Naik / turun kamera
RegisterNuiCallback('changeHeight', function(data, cb)
    if data.direction == 'up' then
        CurrentHeightAdd = math.min(CurrentHeightAdd + 0.01, Config.MaxHeight)
    elseif data.direction == 'down' then
        CurrentHeightAdd = math.max(CurrentHeightAdd - 0.01, 0)
    end
    local camCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
    SetCamCoord(CamHandle, camCoords.x, camCoords.y, camCoords.z + CurrentHeightAdd)
    PointCamAtEntity(CamHandle, PlayerPedId(), 0.0, 0.0, CurrentHeightAdd)
end)

--- Ganti status pakaian
RegisterNuiCallback('changeClothesState', function(data, cb)
    if AnimPlaying then return end

    local ped = PlayerPedId()
    local clothingData = ClothingTable[data.clothing]
    local anim = Config.Clothing[data.clothing] and Config.Clothing[data.clothing].animation
    if not anim then return end

    RequestAnimDict(anim.dict)
    while not HasAnimDictLoaded(anim.dict) do Wait(100) end
    if IsPedInAnyVehicle(ped) then anim.move = 51 end

    local isFemale = IsPedModel(ped, `mp_f_freemode_01`)
    local femaleDefault = Config.FemaleDefaults[data.clothing]

    if LastIndexes[data.clothing] then
        -- 🔄 Balikin
        TaskPlayAnim(ped, anim.dict, anim.name, 3.0, 3.0, anim.duration, anim.move, 0, false, false, false)
        AnimPlaying = true
        Wait(anim.duration - 400)
        AnimPlaying = false

        if clothingData.type == 'component' then
            SetPedComponentVariation(ped, clothingData.id, LastIndexes[data.clothing], LastTextureIndexes[data.clothing])
        else
            SetPedPropIndex(ped, clothingData.id, LastIndexes[data.clothing], LastTextureIndexes[data.clothing])
        end

        LastIndexes[data.clothing], LastTextureIndexes[data.clothing] = nil, nil

        if clothingData.extras then
            for _, extra in ipairs(clothingData.extras) do
                if LastIndexes[extra.name] then
                    SetPedComponentVariation(ped, extra.id, LastIndexes[extra.name], LastTextureIndexes[extra.name])
                    LastIndexes[extra.name], LastTextureIndexes[extra.name] = nil, nil
                end
            end
        end
    else
        -- ❌ Lepas
        local clothingStates = GetClothingState()
        if not clothingStates[data.clothing] then return Config.Notification("You don't have that part on") end

        TaskPlayAnim(ped, anim.dict, anim.name, 3.0, 3.0, anim.duration, anim.move, 0, false, false, false)
        AnimPlaying = true
        Wait(anim.duration - 400)
        AnimPlaying = false

        if clothingData.type == 'component' then
            LastIndexes[data.clothing] = GetPedDrawableVariation(ped, clothingData.id)
            LastTextureIndexes[data.clothing] = GetPedTextureVariation(ped, clothingData.id)
            local default = isFemale and femaleDefault or Config.Clothing[data.clothing].default
            SetPedComponentVariation(ped, clothingData.id, default or 15, 0)
        else
            LastIndexes[data.clothing] = GetPedPropIndex(ped, clothingData.id)
            LastTextureIndexes[data.clothing] = GetPedPropTextureIndex(ped, clothingData.id)
            ClearPedProp(ped, clothingData.id)
        end

        if clothingData.extras then
            for _, extra in ipairs(clothingData.extras) do
                LastIndexes[extra.name] = GetPedDrawableVariation(ped, extra.id)
                LastTextureIndexes[extra.name] = GetPedTextureVariation(ped, extra.id)
                SetPedComponentVariation(ped, extra.id, extra.default, 0)
            end
        end
    end

    SendNUIMessage({ type = 'UpdateStates', clothingStates = GetClothingState() })
end)

--- Tutup menu
RegisterNuiCallback('close', function(data, cb)
    RenderScriptCams(false, true, 500, 1, 0)
    DestroyCam(CamHandle, false)
    SetNuiFocus(false, false)
    -- exports['minimal-hud']:toggleMap(true)
    CamActive = false
end)

--- Loop kamera
CreateThread(function()
    while true do
        if CamActive then SetUseHiDof() else Wait(1000) end
        Wait(0)
    end
end)

--- Command buka menu
RegisterCommand(Config.Open.command, function() OpenMenu() end)
RegisterKeyMapping(Config.Open.command, Config.Open.label, 'keyboard', Config.Open.key)
