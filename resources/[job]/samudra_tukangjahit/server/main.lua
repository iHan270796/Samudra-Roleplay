local QBCore = exports['qb-core']:GetCoreObject()

local activeWorkers = {}

local function canDoJob(src)
    if not Config.UseJobCheck then return true end
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return false end
    return Player.PlayerData.job and Player.PlayerData.job.name == Config.JobName
end

RegisterNetEvent('tailorjob:server:startJob', function()
    local src = source
    if not canDoJob(src) then
        TriggerClientEvent('QBCore:Notify', src, 'Tidak punya akses pekerjaan ini', 'error')
        return
    end
    if activeWorkers[src] then
        TriggerClientEvent('QBCore:Notify', src, 'Kamu sudah bekerja', 'error')
        return
    end
    activeWorkers[src] = {
        stage = 'kapas',
        tasks = {
            kapas = {done = 0, required = Config.TasksForKapas},
            benang = {done = 0, required = Config.TasksForBenang},
            kain = {done = 0, required = Config.TasksForKain},
            baju = {done = 0, required = Config.TasksForBaju},
        }
    }
    TriggerClientEvent('tailorjob:client:jobStarted', src, activeWorkers[src])
end)

RegisterNetEvent('tailorjob:server:stopJob', function()
    local src = source
    if activeWorkers[src] then
        activeWorkers[src] = nil
        TriggerClientEvent('tailorjob:client:jobStopped', src)
    end
end)

-- server-validated complete task (remove/add via ox_inventory exports)
RegisterNetEvent('tailorjob:server:completeTask', function(stage, clothType)
    local src = source
    local info = activeWorkers[src]
    if not info then
        TriggerClientEvent('QBCore:Notify', src, 'Kamu belum mulai kerja', 'error')
        return
    end

    local t = info.tasks[stage]
    if not t then return end

    -- tambahkan progress
    t.done = t.done + 1
    TriggerClientEvent('QBCore:Notify', src, ('Progres %s: %d/%d'):format(stage, t.done, t.required), 'primary')

    -- kalau belum selesai, kirim update aja
    if t.done < t.required then
        TriggerClientEvent('tailorjob:client:updateProgress', src, info)
        return
    end

    -- semua selesai
    if stage == 'kapas' then
        exports.ox_inventory:AddItem(src, Config.ItemKapas, Config.KapasGiveAmount)
        info.stage = 'benang'
        TriggerClientEvent('QBCore:Notify', src, 'Selesai kumpul Kapas! Lanjut ke Benang.', 'success')

    elseif stage == 'benang' then
        local removed = exports.ox_inventory:RemoveItem(src, Config.ItemKapas, Config.BenangRequired)
        if not removed then
            TriggerClientEvent('QBCore:Notify', src, 'Butuh Kapas dulu untuk bikin Benang', 'error')
            t.done = t.done - 1
            return
        end
        exports.ox_inventory:AddItem(src, Config.ItemBenang, Config.BenangGiveAmount)
        info.stage = 'kain'
        TriggerClientEvent('QBCore:Notify', src, 'Selesai bikin Benang! Lanjut ke Kain.', 'success')

    elseif stage == 'kain' then
        local removed = exports.ox_inventory:RemoveItem(src, Config.ItemBenang, Config.KainRequired)
        if not removed then
            TriggerClientEvent('QBCore:Notify', src, 'Butuh Benang dulu untuk bikin Kain', 'error')
            t.done = t.done - 1
            return
        end
        exports.ox_inventory:AddItem(src, Config.ItemKain, Config.KainGiveAmount)
        info.stage = 'baju'
        TriggerClientEvent('QBCore:Notify', src, 'Selesai bikin Kain! Lanjut ke Baju.', 'success')

    elseif stage == 'baju' then
        local removed = exports.ox_inventory:RemoveItem(src, Config.ItemKain, Config.BajuRequired)
        if not removed then
            TriggerClientEvent('QBCore:Notify', src, 'Butuh Kain dulu untuk bikin Pakaian', 'error')
            t.done = t.done - 1
            return
        end

        -- ambil nama item hasil dari Config.ItemHasil
        local hasil = Config.ItemHasil[clothType or "Baju"] or Config.ItemBaju
        local jumlah = math.random(Config.HasilMin, Config.HasilMax)

        exports.ox_inventory:AddItem(src, hasil, jumlah)
        info.stage = 'finished'

        TriggerClientEvent('QBCore:Notify', src, ('Selesai menjahit %s! Kamu mendapat %d item.'):format(clothType or "Baju", jumlah), 'success')
    end

    TriggerClientEvent('tailorjob:client:updateProgress', src, info)
end)


AddEventHandler('playerDropped', function()
    local src = source
    activeWorkers[src] = nil
end)

QBCore.Functions.CreateCallback('tailorjob:server:isWorking', function(source, cb)
    cb(activeWorkers[source] ~= nil)
end)
