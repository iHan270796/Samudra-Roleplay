local CamHandle = nil

local CurrentFov = 60.0

local CurrentHeightAdd = 0.0

local CamActive = false

local LastIndexes = { mask = nil, hat = nil, glasses = nil, shirt = nil, undershirt = nil, vest = nil, chain = nil, watch = nil, bracelet = nil, pants = nil, bag = nil, shoes = nil }

local LastTextureIndexes = { mask = nil, hat = nil, glasses = nil, shirt = nil, undershirt = nil, vest = nil, chain = nil, watch = nil, bracelet = nil, pants = nil, bag = nil, shoes = nil }

local ClothingTable = {
    mask = { type = 'component', id = 1 },
    hat = { type = 'prop', id = 0 },
    glasses = { type = 'prop', id = 1 },
    shirt = {
        type = 'component',
        id = 11,
        extras = { -- 🔥 extras ikut di-handle
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
local AnimPlaying = false

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

local function OpenMenu()
    local pedHeading = GetEntityHeading(PlayerPedId()) + 180.0
    local camCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
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
    exports['minimal-hud']:toggleMap(false)
    -- if Config.HideMinimap then DisplayRadar(false) end
end

RegisterNuiCallback('changeScale', function(data, cb)
    CurrentFov = CurrentFov + data.scale
    if CurrentFov > Config.MaxFov then CurrentFov = Config.MaxFov end
    if CurrentFov < Config.MinFov then CurrentFov = Config.MinFov end
    SetCamFov(CamHandle, CurrentFov)
end)

RegisterNuiCallback('changeRotation', function(data, cb)
    if data.side == 'right' then
        local playerHeading = GetEntityHeading(PlayerPedId())
        local playerRotation = playerHeading + 4.0
        SetEntityHeading(PlayerPedId(), playerRotation % 360)
    elseif data.side == 'left' then
        local playerHeading = GetEntityHeading(PlayerPedId())
        local playerRotation = playerHeading + -4.0
        SetEntityHeading(PlayerPedId(), playerRotation % 360)
    end
end)

RegisterNuiCallback('changeHeight', function(data, cb)
    if data.direction == 'up' then
        CurrentHeightAdd = CurrentHeightAdd + 0.01
        if CurrentHeightAdd > Config.MaxHeight then CurrentHeightAdd = Config.MaxHeight end
        local camCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
        SetCamCoord(CamHandle, camCoords.x, camCoords.y, camCoords.z + CurrentHeightAdd)
        PointCamAtEntity(CamHandle, PlayerPedId(), 0.0, 0.0, CurrentHeightAdd)
    elseif data.direction == 'down' then
        CurrentHeightAdd = CurrentHeightAdd - 0.01
        if CurrentHeightAdd < 0 then CurrentHeightAdd = 0 end
        local camCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
        SetCamCoord(CamHandle, camCoords.x, camCoords.y, camCoords.z + CurrentHeightAdd)
        PointCamAtEntity(CamHandle, PlayerPedId(), 0.0, 0.0, CurrentHeightAdd)
    end
end)

RegisterNuiCallback('changeClothesState', function(data, cb)
    if AnimPlaying then return end
    local clothingData = ClothingTable[data.clothing]

    if LastIndexes[data.clothing] then
        -- 🔄 Balikin item utama
        local anim = Config.Clothing[data.clothing].animation
        while not HasAnimDictLoaded(anim.dict) do RequestAnimDict(anim.dict) Wait(100) end
        if IsPedInAnyVehicle(PlayerPedId()) then anim.move = 51 end
        TaskPlayAnim(PlayerPedId(), anim.dict, anim.name, 3.0, 3.0, anim.duration, anim.move, 0, false, false, false)
        AnimPlaying = true
        Wait(math.max(anim.duration - 500, 500))
        AnimPlaying = false

        if clothingData.type == 'component' then
            SetPedComponentVariation(PlayerPedId(), clothingData.id, LastIndexes[data.clothing], LastTextureIndexes[data.clothing])
        else
            SetPedPropIndex(PlayerPedId(), clothingData.id, LastIndexes[data.clothing], LastTextureIndexes[data.clothing])
        end
        LastIndexes[data.clothing], LastTextureIndexes[data.clothing] = nil, nil

        -- 🔄 Balikin extras
        if clothingData.extras then
            for _, extra in ipairs(clothingData.extras) do
                if LastIndexes[extra.name] then
                    SetPedComponentVariation(PlayerPedId(), extra.id, LastIndexes[extra.name], LastTextureIndexes[extra.name])
                    LastIndexes[extra.name], LastTextureIndexes[extra.name] = nil, nil
                end
            end
        end

    else
        -- ❌ Lepasin item utama
        local clothingStates = GetClothingState()
        if not clothingStates[data.clothing] then return Config.Notification("You don't have that part on") end

        local anim = Config.Clothing[data.clothing].animation
        while not HasAnimDictLoaded(anim.dict) do RequestAnimDict(anim.dict) Wait(100) end
        if IsPedInAnyVehicle(PlayerPedId()) then anim.move = 51 end
        AnimPlaying = true
        TaskPlayAnim(PlayerPedId(), anim.dict, anim.name, 3.0, 3.0, anim.duration, anim.move, 0, false, false, false)
        Wait(math.max(anim.duration - 500, 500))
        AnimPlaying = false

        if clothingData.type == 'component' then
            LastIndexes[data.clothing] = GetPedDrawableVariation(PlayerPedId(), clothingData.id)
            LastTextureIndexes[data.clothing] = GetPedTextureVariation(PlayerPedId(), clothingData.id)
            SetPedComponentVariation(PlayerPedId(), clothingData.id, Config.Clothing[data.clothing].default, 0)
        else
            LastIndexes[data.clothing] = GetPedPropIndex(PlayerPedId(), clothingData.id)
            LastTextureIndexes[data.clothing] = GetPedPropTextureIndex(PlayerPedId(), clothingData.id)
            ClearPedProp(PlayerPedId(), clothingData.id)
        end

        -- ❌ Copot extras
        if clothingData.extras then
            for _, extra in ipairs(clothingData.extras) do
                LastIndexes[extra.name] = GetPedDrawableVariation(PlayerPedId(), extra.id)
                LastTextureIndexes[extra.name] = GetPedTextureVariation(PlayerPedId(), extra.id)
                SetPedComponentVariation(PlayerPedId(), extra.id, extra.default, 0)
            end
        end
    end

    SendNUIMessage({ type = 'UpdateStates', clothingStates = GetClothingState() })
end)

RegisterNuiCallback('close', function(data, cb)
    RenderScriptCams(false, true, 500, 1, 0)
    DestroyCam(CamHandle, false)
    SetNuiFocus(false, false)
    exports['minimal-hud']:toggleMap(true)
    -- if Config.HideMinimap then DisplayRadar(true) end
    CamActive = false
end)

CreateThread(function()
    while true do
        if CamActive then
            SetUseHiDof()
        else
            Wait(1000)
        end
        Wait(0)
    end
end)

RegisterCommand(Config.Open.command, function()
    OpenMenu()
end)

RegisterKeyMapping(Config.Open.command, Config.Open.label, 'keyboard', Config.Open.key)