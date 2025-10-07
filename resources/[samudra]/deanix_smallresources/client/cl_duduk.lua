local lastsiton = false
local Config = require 'c_duduk'

CreateThread(function()
    local modellist = {}
    for k, _ in pairs(Config.Objects) do
        modellist[#modellist + 1] = k
    end

    if GetResourceState("ox_target") ~= "missing" then
        exports.ox_target:addModel(modellist, {
            {
                name = 'bc_sit:use',
                event = 'bc_sit:use',
                icon = 'fa-solid fa-chair',
                label = Config.Texts["use"],
            }
        })
    elseif GetResourceState("qb-target") ~= "missing" then
        exports['qb-target']:AddTargetModel(modellist, {
            options = {
                {
                    type = "client",
                    event = "bc_sit:use",
                    icon = 'fas fa-chair',
                    label = Config.Texts["use"],
                }
            },
            distance = 2.5,
        })
    else
        print("^1[bc_sit]^7 ERROR: Tidak ada sistem target (ox_target atau qb-target)!")
    end
end)

CreateThread(function()
    for _, zone in pairs(Config.Zones or {}) do
        exports.ox_target:addBoxZone({
            coords = zone.coords,
            size = zone.size,
            rotation = zone.heading,
            debug = zone.debug or false,
            options = {
                {
                    name = 'bc_sit:zone_' .. zone.name,
                    icon = 'fa-solid fa-chair',
                    label = Config.Texts["use"],
                    onSelect = function()
                        SitOnZone(zone)
                    end
                }
            }
        })
    end
end)

AddEventHandler('bc_sit:use', function(response)
    if not response or not response.entity then return end
    if lastsiton then
        return lib.notify({
            title = 'Sudah Duduk',
            description = Config.Texts["already_sit"],
            type = 'error'
        })
    end

    local entity = response.entity
    if not DoesEntityExist(entity) then return end

    local model = GetEntityModel(entity)
    local object = Config.Objects[model]
    if not object then return end

    local animobj = Config.Anims[object.type]
    if not animobj then return end

    local objcoords = GetEntityCoords(entity)
    if not IsSeatFree(objcoords, animobj) then
        return lib.notify({
            title = 'Tempat Penuh',
            description = Config.Texts["seat_taken"],
            type = 'error'
        })
    end

    lastsiton = entity
    local ped = PlayerPedId()
    SetEntityCoords(ped, objcoords + object.offsets, true, false, false, false)

    if animobj.scenario then
        TaskStartScenarioAtPosition(
            ped,
            animobj.scenario,
            objcoords + object.offsets,
            GetEntityHeading(entity) + object.heading,
            0, true, true
        )
    else
        RequestAnimDict(animobj.dict)
        while not HasAnimDictLoaded(animobj.dict) do Wait(10) end
        TaskPlayAnim(ped, animobj.dict, animobj.anim, 8.0, -8.0, -1, 1, 0, false, false, false)
    end

    ShowGetUpUI(ped, animobj)
end)

function IsSeatFree(objcoords, animobj)
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            if #(GetEntityCoords(ped) - objcoords) < 0.3 then
                if animobj.scenario and IsPedUsingScenario(ped, animobj.scenario) then
                    return false
                elseif animobj.dict and IsEntityPlayingAnim(ped, animobj.dict, animobj.anim, 3) then
                    return false
                end
            end
        end
    end
    return true
end

function SitOnZone(zone)
    if lastsiton then
        return lib.notify({
            title = 'Sudah Duduk',
            description = Config.Texts["already_sit"],
            type = 'error'
        })
    end

    local ped = PlayerPedId()
    local animobj = Config.Anims[zone.type]
    if not animobj then return end

    -- Rotasi offset mengikuti heading kursi
    local heading = math.rad(zone.heading)
    local ox, oy, oz = zone.offsets.x, zone.offsets.y, zone.offsets.z
    local rotatedOffset = vector3(
        ox * math.cos(heading) - oy * math.sin(heading),
        ox * math.sin(heading) + oy * math.cos(heading),
        oz
    )

    local sitCoords = zone.coords + rotatedOffset
    lastsiton = true

    SetEntityCoordsNoOffset(ped, sitCoords.x, sitCoords.y, sitCoords.z, true, false, false)
    SetEntityHeading(ped, zone.heading)

    if animobj.scenario then
        TaskStartScenarioAtPosition(ped, animobj.scenario, sitCoords, zone.heading, 0, true, true)
    else
        RequestAnimDict(animobj.dict)
        while not HasAnimDictLoaded(animobj.dict) do Wait(10) end
        TaskPlayAnim(ped, animobj.dict, animobj.anim, 8.0, -8.0, -1, 1, 0, false, false, false)
    end

    ShowGetUpUI(ped, animobj)
end

function ShowGetUpUI(ped, animobj)
    lib.showTextUI(Config.Texts["get_up"], {
        position = 'left-center',
        icon = 'fa-solid fa-person-walking-arrow-loop-left',
    })

    CreateThread(function()
        while lastsiton do
            if IsControlJustReleased(0, Config.GetUpKey) then
                lastsiton = false
            end
            Wait(0)
        end
        ClearPedTasksImmediately(ped)
        if animobj and animobj.dict then RemoveAnimDict(animobj.dict) end
        lib.hideTextUI()
    end)
end
