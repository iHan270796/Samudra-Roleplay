QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-spawn:client:openUI", function(value)
    createBusStop()
    print("qb-spawn:client:openUI")
end)

RegisterNetEvent('qb-spawn:client:setupSpawns', function(cData, new, apps)
    APARTMENTS = {}
    local cid = cData.citizenid
    GetOwnedHouses(cid)

    if apps and type(apps) == "table" then
        for k, v in pairs(apps) do
            local coords = v.enter or (v.coords and v.coords.enter)
            local heading = (v.enter and v.enter.w) or (v.coords and v.coords.enter and v.coords.enter.w) or 0.0
            local id = v.name or k
            local name = v.label or v.name or k

            if coords then
                APARTMENTS[#APARTMENTS + 1] = {
                    id = id,
                    name = name,
                    coords = vector3(coords.x, coords.y, coords.z),
                    heading = heading
                }
            else
                print("^1[ERROR]^7 Failed to load coords for apartment: " .. tostring(k))
            end
        end
    end
end)



RegisterNetEvent("gfx-spawn:client:openUI", function(value)
    createBusStop()
    print("gfx-spawn:client:openUI")
end)

RegisterNetEvent('gfx-spawn:client:setupSpawns', function(cData, new, apps)
    APARTMENTS = {}
    local cid = cData.citizenid
    GetOwnedHouses(cid)

    if apps and type(apps) == "table" then
        for k, v in pairs(apps) do
            local coords = v.enter or (v.coords and v.coords.enter)
            local heading = (v.enter and v.enter.w) or (v.coords and v.coords.enter and v.coords.enter.w) or 0.0
            local id = v.name or k
            local name = v.label or v.name or k

            if coords then
                APARTMENTS[#APARTMENTS + 1] = {
                    id = id,
                    name = name,
                    coords = vector3(coords.x, coords.y, coords.z),
                    heading = heading
                }
            else
                print("^1[ERROR]^7 Failed to load coords for apartment: " .. tostring(k))
            end
        end
    end
end)

function DisableWeatherSync()
    TriggerEvent('qb-weathersync:client:DisableSync')
end

function EnableWeatherSync()
    TriggerEvent('qb-weathersync:client:EnableSync')
end

function GetLastLocation()
    local coords = QBCore.Functions.GetPlayerData().position
    return vector3(coords.x, coords.y, coords.z)
end

-- @param location table
--         @field id string
--         @field name string
--         @field coords vector3
--         @field heading number

--sn_multicharacter
function SpawnPlayerAtLocation(location, isApartment)
    local ped = PlayerPedId()
    local coords = location.coords
    local heading = location.heading or 0.0

    DoScreenFadeOut(500)
    Wait(500)
    FreezeEntityPosition(ped, true)
    SetEntityVisible(ped, false, false)
    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    RequestAdditionalCollisionAtCoord(coords.x, coords.y, coords.z)
    NewLoadSceneStartSphere(coords.x, coords.y, coords.z, 150.0, 0)

    local timeout = GetGameTimer() + 8000
    while not IsNewLoadSceneLoaded() and GetGameTimer() < timeout do
        Wait(0)
    end

    NewLoadSceneStop()
    SetFocusArea(coords.x, coords.y, coords.z, 0.0, 0.0, 0.0)
    SetHdArea(coords.x, coords.y, coords.z, 100.0)

    if isApartment then
        TriggerServerEvent("ps-housing:server:createNewApartment", location.id)
        Wait(500)
    end

    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false)
    SetEntityHeading(ped, heading)

    local t = GetGameTimer()
    while not HasCollisionLoadedAroundEntity(ped) and (GetGameTimer() - t) < 5000 do
        RequestCollisionAtCoord(coords.x, coords.y, coords.z)
        Wait(50)
    end

    EnableWeatherSync()
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')

    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true, false)
    DoScreenFadeIn(1000)
    Wait(500)
    ClearFocus()
    -- exports["deanix_hud"]:ToggleHud(true)
end

--um multicharacter
-- function SpawnPlayerAtLocation(location, isApartment)
--     local ped = PlayerPedId()

--     if isApartment then
--         DoScreenFadeOut(500)
--         TriggerServerEvent("ps-housing:server:createNewApartment", location.id)
--         local coords = location.coords
--         RequestCollisionAtCoord(coords.x, coords.y, coords.z)
--         SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false)
--         SetEntityHeading(ped, location.heading)

--         local timeout = 0
--         while not HasCollisionLoadedAroundEntity(ped) and timeout < 2000 do
--             Wait(50)
--             timeout = timeout + 50
--         end

--         FreezeEntityPosition(ped, false)
--         SetEntityVisible(ped, true)
--         TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
--         TriggerEvent('QBCore:Client:OnPlayerLoaded')
--         DoScreenFadeIn(500)
--         return
--     end

--     FreezeEntityPosition(ped, true)
--     SetEntityVisible(ped, false)

--     SetEntityCoords(ped, location.coords.x, location.coords.y, location.coords.z)
--     SetEntityHeading(ped, location.heading)
--     DoScreenFadeOut(0)

--     RequestCollisionAtCoord(location.coords.x, location.coords.y, location.coords.z)
--     local timeout = 0
--     while not HasCollisionLoadedAroundEntity(ped) and timeout < 2000 do
--         Wait(50)
--         timeout = timeout + 50
--     end

--     Wait(250)

--     local PlayerData = QBCore.Functions.GetPlayerData()
--     local insideMeta = PlayerData.metadata["inside"]

--     if insideMeta and insideMeta.property_id then
--         TriggerServerEvent('ps-housing:server:enterProperty', tostring(insideMeta.property_id))
--     end

--     TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
--     TriggerEvent('QBCore:Client:OnPlayerLoaded')

--     FreezeEntityPosition(ped, false)
--     SetEntityVisible(ped, true)
--     DoScreenFadeIn(500)
--     EnableWeatherSync()
-- end

function ApplyCharacterSkin()
    local p = promise:new()
    local t = GetGameTimer()
    local skinApplied = false

    CreateThread(function()
        while not skinApplied do
            Wait(0)
            if GetGameTimer() - t > 5000 then
                print("^1[ERROR]^7 Applying skin took too long")
                p:resolve()
                return
            end
        end
    end)

    if GetResourceState("illenium-appearance") == "started" then
        lib.callback("illenium-appearance:server:getAppearance", false, function(appearance)
            if not appearance then
                skinApplied = true
                p:resolve()
                return
            end

            exports["illenium-appearance"]:setPlayerAppearance(appearance)

            skinApplied = true
            p:resolve()
        end)
    elseif GetResourceState("fivem-appearance") == "started" then
        QBCore.Functions.TriggerCallback('fivem-appearance:server:getAppearance', function(appearance)
            if not appearance then
                return
            end
            exports['fivem-appearance']:setPlayerAppearance(appearance)

            skinApplied = true
            p:resolve()
        end)
    elseif GetResourceState("qb-clothing") == "started" then
        TriggerServerEvent("qb-clothes:loadPlayerSkin")
        skinApplied = true
        p:resolve()
    else
        skinApplied = true
        p:resolve()
        print("^3[WARN]^7 No appearance/clothing resource found check gfx-spawn/client/cl_open.lua:67")
    end
    return Citizen.Await(p)
end

local Houses = {}

RegisterNetEvent('qb-houses:client:setHouseConfig', function(houseConfig)
    Houses = houseConfig
end)

-- function GetOwnedHouses(cid)
--     local p = promise:new()
--     local gotHouses = false
--     local t = GetGameTimer()
--     TriggerServerEvent("qb-houses:server:setHouses")
--     CreateThread(function()
--         while not gotHouses do
--             Wait(0)
--             if GetGameTimer() - t > 10000 then
--                 print("^1[ERROR]^7 Houses not loaded in time")
--                 p:resolve()
--                 return
--             end
--         end
--     end)
--     QBCore.Functions.TriggerCallback('gfx-spawn:server:getOwnedHouses', function(houses)
--         if houses ~= nil then
--             for i = 1, (#houses), 1 do
--                 if Houses == nil then
--                     return
--                 end
--                 local coods = Houses[houses[i].house].coords.enter
--                 local vector = vector3(coods.x, coods.y, coods.z)
--                 LOCATIONS[#LOCATIONS+1] = {
--                     id = houses[i].house,
--                     name = Houses[houses[i].house].adress,
--                     coords = vector,
--                     heading = Houses[houses[i].house].heading,
--                     house = true,
--                 }
--             end
--             gotHouses = true
--         end
--         p:resolve()
--     end, cid)
--     return Citizen.Await(p)
-- end

function GetOwnedHouses(cid)
    local p = promise:new()
    local gotProps = false
    local t = GetGameTimer()

    QBCore.Functions.TriggerCallback('gfx-spawn:server:getOwnedHouses', function(properties)
        if properties ~= nil then
            for i = 1, (#properties), 1 do
                local prop = properties[i]
                local coords = vector3(prop.entrance_x, prop.entrance_y, prop.entrance_z)
                LOCATIONS[#LOCATIONS + 1] = {
                    id = prop.property_id,
                    name = prop.street or ("Property " .. prop.property_id),
                    coords = coords,
                    heading = prop.heading or 0.0,
                    house = true,
                }
            end
            gotProps = true
        end
        p:resolve()
    end, cid)

    CreateThread(function()
        while not gotProps do
            Wait(0)
            if GetGameTimer() - t > 10000 then
                print("^1[ERROR]^7 Properties not loaded in time")
                p:resolve()
                return
            end
        end
    end)
    return Citizen.Await(p)
end