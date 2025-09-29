local QBCore = exports['qb-core']:GetCoreObject()
local isShaking = false
local function StartCamShake()
    isShaking = true
    CreateThread(function()
        while isShaking do
            if IsGameplayCamRendering() then
                ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.03)
            end
            Wait(250)
        end
    end)
end


local function StopCamShake()
    isShaking = false
    StopGameplayCamShaking(true)
end


RegisterNetEvent("deanix_fishing:startMinigameWithFish", function(fishData, rounds)
    StartCamShake()
    SetNuiFocus(true, false)

    SendNUIMessage({
        action = "cacheFishData", 
        fish = fishData
    })

    SendNUIMessage({
        action = "start",
        rounds = rounds or 5
    })

    RegisterNUICallback("minigameResult", function(data, cb)
        StopCamShake()
        SetNuiFocus(false, false)

        if data.success then
        TriggerEvent("deanix_fishing:showFish", {
            label = data.item:gsub("^%l", string.upper):gsub("_", " "),
            item = data.item,
            meta = data.meta
        })
        else
        TriggerServerEvent("deanix_fishing:removeBait")
        lib.notify({title = 'Fishing', description = "The fish escaped!", type = "error"})
                TriggerEvent("deanix_fishing:checkBaitAndMenu")
            end
        cb({})
    end)
end)

RegisterNetEvent("deanix_fishing:minigame", function(rounds)
    SetNuiFocus(true, false)
    SendNUIMessage({
        action = "start",
        rounds = rounds or 5
    })

    RegisterNUICallback("minigameResult", function(data, cb)
        SetNuiFocus(false, false)

        if data.success then
            TriggerServerEvent("deanix_fishing:reward")
        else
            TriggerServerEvent("deanix_fishing:removeBait")
            lib.notify({title = 'Fishing', description = "The fish escaped!", type = "error"})
            TriggerEvent("deanix_fishing:checkBaitAndMenu")
        end

        cb({})
    end)
end)


RegisterNetEvent("deanix_fishing:showFish", function(fishData)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "showFish",
        fish = fishData
    })
end)

RegisterNUICallback("fishAction", function(data, cb)
    SetNuiFocus(false, false)

    if data.take then
        TriggerServerEvent("deanix_fishing:removeBait")
        TriggerServerEvent("deanix_fishing:addFish", data.item, data.meta)
        TriggerEvent("deanix_fishing:checkBaitAndMenu")
    else
        TriggerServerEvent("deanix_fishing:removeBait")
        TriggerEvent("deanix_fishing:checkBaitAndMenu")
    end

    cb({})
end)
