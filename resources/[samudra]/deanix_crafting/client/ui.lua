local QBCore = exports['qb-core']:GetCoreObject()
local isOpen = false
local playerJob = nil
local playerGang = nil

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    playerJob = PlayerData.job.name
    playerGang = PlayerData.gang and PlayerData.gang.name or nil
end)

--buat all
RegisterNetEvent('deanix_crafting:client:ammobadside', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    local craftingData = {}

    local jobCrafting = Config.JobCrafting["ammobadside"]

    if jobCrafting then
        for _, item in ipairs(jobCrafting) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end

    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)

RegisterNetEvent('deanix_crafting:client:senjatabadside', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    local craftingData = {}

    local jobCrafting = Config.JobCrafting["senjatabadside"]

    if jobCrafting then
        for _, item in ipairs(jobCrafting) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end

    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)

RegisterNetEvent('deanix_crafting:client:armor', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    local craftingData = {}

    local jobCrafting = Config.JobCrafting["armor"]

    if jobCrafting then
        for _, item in ipairs(jobCrafting) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end

    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)

RegisterNetEvent('deanix_crafting:client:alatrampok', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    local craftingData = {}

    local jobCrafting = Config.JobCrafting["alatrampok"]

    if jobCrafting then
        for _, item in ipairs(jobCrafting) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end

    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)

RegisterNetEvent('deanix_crafting:client:openprosescocain1', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    local craftingData = {}

    local jobCrafting = Config.JobCrafting["prosescocain1"]

    if jobCrafting then
        for _, item in ipairs(jobCrafting) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end

    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)
RegisterNetEvent('deanix_crafting:client:openprosescocain2', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    local craftingData = {}
    local jobCrafting = Config.JobCrafting["prosescocain2"]

    if jobCrafting then
        for _, item in ipairs(jobCrafting) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end

    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)
RegisterNetEvent('deanix_crafting:client:openprosescocain3', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    --local playerJob = PlayerData.job.name
    local craftingData = {}

    local jobCrafting = Config.JobCrafting["prosescocain3"]

    if jobCrafting then
        for _, item in ipairs(jobCrafting) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end

    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)

RegisterNetEvent('deanix_crafting:client:openweedproses', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    --local playerJob = PlayerData.job.name
    local craftingData = {}

    local jobCrafting = Config.JobCrafting["weedproses"]

    if jobCrafting then
        for _, item in ipairs(jobCrafting) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end

    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)

RegisterNetEvent('deanix_crafting:client:openheroinproses', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    --local playerJob = PlayerData.job.name
    local craftingData = {}

    local jobCrafting = Config.JobCrafting["heroinproses"]

    if jobCrafting then
        for _, item in ipairs(jobCrafting) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end

    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)

RegisterNetEvent('deanix_crafting:client:burgershot2', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    --local playerJob = PlayerData.job.name
    local craftingData = {}

    local jobCrafting = Config.JobCrafting["burgershot2"]

    if jobCrafting then
        for _, item in ipairs(jobCrafting) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end

    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)

--buat job
RegisterNetEvent('deanix_crafting:client:openJobCrafting', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    local playerJob = PlayerData.job.name
    local craftingData = {}

    if playerJob and Config.JobCrafting[playerJob] then
        for _, item in ipairs(Config.JobCrafting[playerJob]) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk job kamu.',
            type = 'error'
        })
        return
    end
    local expLevel = GetExpAndLevel()

    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "job",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)

RegisterNetEvent('deanix_crafting:client:openGangCrafting', function()
    if isOpen then return end

    local PlayerData = QBCore.Functions.GetPlayerData()
    local playerGang = PlayerData.gang and PlayerData.gang.name or nil
    local craftingData = {}

    if playerGang and Config.GangCrafting[playerGang] then
        for _, item in ipairs(Config.GangCrafting[playerGang]) do
            table.insert(craftingData, {
                item = item.item,
                label = item.label,
                requirements = item.requirements,
                time = item.time,
                xp_gain = item.xp_gain or 10,
                level = item.level or 1,
            })
        end
    else
        lib.notify({
            title = 'Tidak ada item crafting untuk Gangs kamu.',
            type = 'error'
        })
        return
    end
    local expLevel = GetExpAndLevel()
    QBCore.Functions.TriggerCallback('deanix_crafting:getXP', function(xp)
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'openCraftingUI',
            items = craftingData,
            xp = xp,
            sourceType = "gang",
            maxXp = expLevel.maxXp,
            level = expLevel.level,
        })
        isOpen = true
    end)
end)

function GetExpAndLevel()
    local PlayerData = QBCore.Functions.GetPlayerData()

    local maxXp = Config.MaxXP
    local maxLevel = Config.MaxLevel
    local xpPerLevel = maxXp / maxLevel
    local xp = PlayerData.metadata['crafting_exp'] or 0

    local level = math.min(math.floor(xp / xpPerLevel), maxLevel) + 1

    local nextLevelXp = level < maxLevel and (level + 1) * xpPerLevel or maxXp

    return {
        xp = xp,
        level = level,
        maxXp = nextLevelXp
    }
end

RegisterNUICallback('getExpAndLevel', function(data, cb)
    cb(GetExpAndLevel())
end)

RegisterNUICallback('closeCraftingUI', function(_, cb)
    SetNuiFocus(false, false)
    isOpen = false
    cb({})
end)
