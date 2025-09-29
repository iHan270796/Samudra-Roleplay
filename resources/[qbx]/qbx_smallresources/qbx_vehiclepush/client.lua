local QBCore = exports['qb-core']:GetCoreObject()

local isInFront = false

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

RegisterNetEvent('vehiclepush:client:push', function(veh)
    if veh then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local vehPos = GetEntityCoords(veh)
        local dimension = GetModelDimensions(GetEntityModel(veh))
        local vehClass = GetVehicleClass(veh)
        if not IsEntityAttachedToEntity(ped, veh) and IsVehicleSeatFree(veh, -1) then
        -- if not IsEntityAttachedToEntity(ped, veh) and IsVehicleSeatFree(veh, -1) and GetVehicleEngineHealth(veh) <= Config.DamageNeeded and GetVehicleEngineHealth(veh) >= 0 then
            if vehClass ~= 13 or vehClass ~= 14 or vehClass ~= 15 or vehClass ~= 16 then
                NetworkRequestControlOfEntity(veh)
                if #(pos - vehPos) < 3.0 and not IsPedInAnyVehicle(ped, false) then
                    if #(vehPos + GetEntityForwardVector(veh) - pos) > #(vehPos + GetEntityForwardVector(veh) * -1 - pos) then
                        isInFront = false
                        AttachEntityToEntity(ped, veh, GetPedBoneIndex(ped, 6286), 0.0, dimension.y - 0.3, dimension.z + 1.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true)
                    else
                        isInFront = true
                        AttachEntityToEntity(ped, veh, GetPedBoneIndex(ped, 6286), 0.0, dimension.y * -1 + 0.1, dimension.z + 1.0, 0.0, 0.0, 180.0, false, false, false, true, 0, true)
                    end
                    loadAnimDict('missfinale_c2ig_11')
                    TaskPlayAnim(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0, -8.0, -1, 35, 0, false, false, false)
                    lib.showTextUI('[E] Stop Pushing', {
                        position = 'left-center',
                        icon = 'fas fa-hand-paper'
                    })
                    while true do
                        Wait(0)
                        if IsDisabledControlPressed(0, 34) then
                            TaskVehicleTempAction(ped, veh, 11, 1000)
                        end

                        if IsDisabledControlPressed(0, 9) then
                            TaskVehicleTempAction(ped, veh, 10, 1000)
                        end

                        SetVehicleForwardSpeed(veh, isInFront and -1.0 or 1.0)

                        if HasEntityCollidedWithAnything(veh) then
                            SetVehicleOnGroundProperly(veh)
                        end

                        if IsControlJustPressed(0, 38) then
                            lib.hideTextUI()
                            DetachEntity(ped, false, false)
                            StopAnimTask(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0)
                            FreezeEntityPosition(ped, false)
                            break
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('vehiclepush:client:flip', function(veh)
    if veh then
        local roll = GetEntityRoll(veh)
        if roll > 75.0 or roll < -75.0 then
            NetworkRequestControlOfEntity(veh)
            Wait(100)
            local heading = GetEntityHeading(veh)
            local coords = GetEntityCoords(veh)
            SetEntityRotation(veh, 0.0, 0.0, heading, 2, true)
            SetEntityCoords(veh, coords.x, coords.y, coords.z + 0.5, true, true, true, false)
            lib.notify({
                title = 'Kendaraan berhasil dibalik.',
                type = 'success',
                icon = 'fa-solid fa-car'
            })
        else
            lib.notify({
                title = 'Kendaraan tidak terlihat terbalik.',
                type = 'error',
                icon = 'fa-solid fa-car'
            })
        end
    end
end)


CreateThread(function()
    exports.ox_target:addGlobalVehicle({
        {
            bones = { 'bonnet', 'boot' },
            icon = 'fas fa-wrench',
            label = 'Push Vehicle',
            onSelect = function(data)
                TriggerEvent('vehiclepush:client:push', data.entity)
            end,
            distance = 1.3
        },
        {
            bones = { 'bonnet', 'boot' },
            icon = 'fas fa-sync-alt',
            label = 'Balikkan Kendaraan',
            onSelect = function(data)
                TriggerEvent('vehiclepush:client:flip', data.entity)
            end,
            distance = 1.3
        }
    })
end)

