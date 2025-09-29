local QBCore = exports['qb-core']:GetCoreObject()
local craftingQueue = {}
local isCrafting = false

local function HasEnoughMaterials(requirements)
    local hasAll = true

    for _, req in pairs(requirements) do
        local count = exports.ox_inventory:Search('count', req.item)
        if count < req.amount then
            hasAll = false
            break
        end
    end

    return hasAll
end


RegisterNUICallback('startCrafting', function(data, cb)
    local itemData = data.item
    local amount = data.amount or 1
    local requirements = itemData.requirements
    local itemLevel = itemData.level or 1

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(playerXP)
        if playerXP < itemLevel then
            lib.notify({
                title = 'XP kamu belum cukup untuk membuat item ini.',
                type = 'error',
                icon = 'fa-solid fa-triangle-exclamation'
            })
            cb({ success = false })
            return
        end

        local scaledRequirements = {}
        for _, req in ipairs(requirements) do
            table.insert(scaledRequirements, {
                item = req.item,
                amount = req.amount * amount
            })
        end

        if not HasEnoughMaterials(scaledRequirements) then
            lib.notify({
                title = 'Bahan tidak cukup!',
                type = 'error',
                icon = 'fa-solid fa-box-open'
            })
            cb({ success = false })
            return
        end

        table.insert(craftingQueue, {
            item = itemData.item,
            label = itemData.label,
            requirements = scaledRequirements,
            amount = amount,
            time = itemData.time
        })

        lib.notify({
            title = itemData.label .. ' ditambahkan ke antrian!',
            type = 'success',
            icon = 'fa-solid fa-list-check'
        })
        ProcessCraftingQueue()
        cb({ success = true })
    end)
end)

RegisterNUICallback('getMaxCraftAmount', function(data, cb)
    local item = data.item
    local maxAmount = math.huge

    for _, req in ipairs(item.requirements) do
        local count = exports.ox_inventory:Search('count', req.item)
        local possible = math.floor(count / req.amount)

        if possible < maxAmount then
            maxAmount = possible
        end
    end

    cb({ max = maxAmount })
end)

function ProcessCraftingQueue()
    if #craftingQueue == 0 then return end
    if isCrafting then return end

    isCrafting = true
    local current = craftingQueue[1]
    QBCore.Functions.Progressbar("crafting_item", "Crafting " .. current.label .. "...", current.time, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('deanix_crafting:server:craftItem', current.item, current.amount, current.requirements)

        lib.notify({
            title = 'Berhasil membuat ' .. current.label,
            type = 'success',
            icon = 'fa-solid fa-check'
        })
        table.remove(craftingQueue, 1)
        craftingQueue.isCrafting = false
        ProcessCraftingQueue()
    end, function()
        lib.notify({
            title = 'Crafting dibatalkan',
            type = 'error',
            icon = 'fa-solid fa-times'
        })
        craftingQueue.isCrafting = false
        table.remove(craftingQueue, 1)
        ProcessCraftingQueue()
    end)
end

RegisterNUICallback('checkRequirements', function(data, cb)
    local item = data.item
    local amount = data.amount or 1
    local scaledRequirements = {}

    for _, req in ipairs(item.requirements) do
        if req.item and req.amount then
            table.insert(scaledRequirements, {
                item = req.item,
                amount = req.amount * amount
            })
        end
    end

    local hasAll = true

    for _, req in pairs(scaledRequirements) do
        local count = exports.ox_inventory:Search('count', req.item)
        if count < req.amount then
            hasAll = false
            break
        end
    end

    cb({ success = hasAll })
end)


RegisterNUICallback('notify', function(data, cb)
    local message = data.message or 'Notifikasi'
    local notifType = data.type or 'inform' -- 'success', 'error', 'info'

    lib.notify({
        title = message,
        type = notifType
    })

    cb({})
end)

RegisterNUICallback('startPlayerAnim', function(data, cb)
    local playerPed = PlayerPedId()
    RequestAnimDict('mini@repair')
    while not HasAnimDictLoaded('mini@repair') do
        Wait(100)
    end
    TaskPlayAnim(playerPed, 'mini@repair', 'fixing_a_ped', 8.0, -8.0, -1, 1, 0, false, false, false)
    cb('ok')
end)

RegisterNUICallback("stopPlayerAnim", function(_, cb)
    ClearPedTasks(PlayerPedId())
    cb({})
end)


RegisterNUICallback("failCrafting", function(data, cb)
    TriggerServerEvent("deanix_crafting:failCrafting", data)
    cb({})
end)

RegisterNUICallback("craftItem", function(data, cb)
    TriggerServerEvent("deanix_crafting:server:craftItem", data.item, data.amount, data.requirements)
    cb({})
end)

RegisterNUICallback('closeCraftingUI', function(_, cb)
    SetNuiFocus(false, false)
    cb({})
end)