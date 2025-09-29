local QBCore = exports['qb-core']:GetCoreObject()
local Config = require 'c_badside'
local createdObjects = {}
local PlayerData = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    PlayerData.gang = gang
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

CreateThread(function()
    while true do
        Wait(500)
        local data = QBCore.Functions.GetPlayerData()
        if data and data.gang and data.gang.name then
            PlayerData = data
            break
        end
    end
end)

CreateThread(function()
    for zoneName, zoneData in pairs(Config.GangStashZones) do
        if zoneData.useProp then
            -- === MODE PROP ===
            RequestModel(`prop_box_wood02a_pu`)
            while not HasModelLoaded(`prop_box_wood02a_pu`) do Wait(50) end

            local obj = CreateObject(`prop_box_wood02a_pu`, zoneData.coords.x, zoneData.coords.y, zoneData.coords.z - 1.0, false, false, false)
            SetEntityHeading(obj, zoneData.rotation)
            FreezeEntityPosition(obj, true)
            SetEntityAsMissionEntity(obj, true, true)
            createdObjects[zoneName] = obj

            exports.ox_target:addLocalEntity(obj, {
                {
                    name = zoneName .. '_stash',
                    icon = "fas fa-box-open",
                    label = "Buka Brankas Gang",
                    distance = 2.0,
                    canInteract = function(entity, distance, coords, name)
                        return PlayerData.gang
                            and PlayerData.gang.name == zoneData.gang
                            and tonumber(PlayerData.gang.grade.level or 0) >= (zoneData.minGrade or 0)
                    end,
                    onSelect = function(data)
                        local stash = zoneData.stashId
                        local label = "Brankas Gang " .. zoneData.gangLabel
                        TriggerServerEvent("gang:server:registerGangStash", stash, label)
                        TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
                    end
                }
            })
        else
            -- === MODE ZONA ===
            exports.ox_target:addBoxZone({
                coords = zoneData.coords,
                size = zoneData.size or vec3(1.5, 1.5, 1.0),
                rotation = zoneData.rotation or 0.0,
                debug = false,
                options = {
                    {
                        name = zoneName .. '_stash',
                        icon = "fas fa-box-open",
                        label = "Buka Brankas Gang",
                        canInteract = function(entity, distance, coords, name)
                            return PlayerData.gang
                                and PlayerData.gang.name == zoneData.gang
                                and tonumber(PlayerData.gang.grade.level or 0) >= (zoneData.minGrade or 0)
                        end,
                        onSelect = function(data)
                            local stash = zoneData.stashId
                            local label = "Brankas Gang " .. zoneData.gangLabel
                            TriggerServerEvent("gang:server:registerGangStash", stash, label)
                            TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
                        end
                    }
                }
            })
        end
    end
end)

-- cleanup prop saat resource stop
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for _, obj in pairs(createdObjects) do
            DeleteEntity(obj)
        end
    end
end)
