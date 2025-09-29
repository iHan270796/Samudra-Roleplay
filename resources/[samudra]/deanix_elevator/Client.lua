
local QBCore = exports['qb-core']:GetCoreObject()
local interactions = {}
-- opens the ui
RegisterNetEvent('deanix_elevator:showmenu', function(playerId)
    SendNUIMessage({action = 'showlift'})
    SetNuiFocus(true, true)
end)
-- hides the ui
RegisterNetEvent('deanix_elevator:hidemenu', function(playerId)
    SendNUIMessage({action = 'hidelift'})
    SetNuiFocus(false, false)
end)

-- handles changing floors
local function UseElevator(data)
    local ped = PlayerPedId()

    QBCore.Functions.Progressbar("Call_Lift", Config.Locals[Config.UseLanguage].Waiting, Config.WaitTime, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@apt_trans@elevator",
        anim = "elev_1",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "anim@apt_trans@elevator", "elev_1", 1.0)
        DoScreenFadeOut(500)
        Wait(1000)
        if Config.UseSoundEffect then
            TriggerServerEvent("InteractSound_SV:PlayOnSource", Config.Elevators[data.lift].Sound, 0.05)
        end
        SetEntityCoords(ped, data.floor.Coords.x, data.floor.Coords.y, data.floor.Coords.z, 0, 0, 0, false)
        SetEntityHeading(ped, data.floor.Coords.w)
        Wait(1000)
        DoScreenFadeIn(600)
        
    end)
end

function AddInteraction(index, coords)
    exports['anes_interaction']:AddInteraction({
        id = 'elevator_'..index,
        label = "Elevator",
        icon = "fa-elevator",
        coords = vec3(coords.x, coords.y, coords.z + 0.5),
        distance = 1.0,
        distancedot = 1.0,
        options = {
            {
                actionlabel = "Use Elevator",
                actionkey = "E",
                action = function()
                    TriggerEvent("deanix_elevator:showmenu")
                end,
            },
        }
    })
end

CreateThread(function()
    for k, v in pairs(Config.Elevator) do
        for _, location in ipairs(v.locations) do
            AddInteraction(v.name .. "_" .. _, location)
        end
    end
end)


function NearestElevator()
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)
    
    local nearestElevator = nil
    local nearestDistance = math.huge

    for _, elevator in pairs(Config.Elevator) do 
        for _, location in ipairs(elevator.locations) do
            local distance = Vdist(playerCoords, location)
            
            if distance < nearestDistance then
                nearestElevator = elevator
                nearestDistance = distance
            end
        end
    end

    return nearestElevator, nearestDistance
end


RegisterNUICallback('selectfloor', function(data, cb)
    local floorNumber = tonumber(data.number)
    local nearestElevator, nearestDistance = NearestElevator()
    if nearestElevator then
        local selectedFloor = nearestElevator.Floors[floorNumber]
        
        if selectedFloor then
            UseElevator({ lift = nearestElevator, floor = selectedFloor })
            cb({ success = true, message = "Floor selected successfully" })
            TriggerEvent("deanix_elevator:hidemenu")
        else
            cb({ success = false, message = "Invalid floor selection" })
            TriggerEvent("deanix_elevator:hidemenu")
        end
    else
        cb({ success = false, message = "No elevator found" })
    end
end)



RegisterNUICallback('escape', function(_, cb)
    TriggerEvent("deanix_elevator:hidemenu")
    cb("ok")
end)
