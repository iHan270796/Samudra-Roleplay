local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('changeidentity:checkJob', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local job = Player.PlayerData.job.name

    if job == 'pemerintah' then
        local players = GetPlayers()
        local nearby = {}

        local srcPed = GetPlayerPed(src)
        local srcCoords = GetEntityCoords(srcPed)

        for _, id in pairs(players) do
            local ped = GetPlayerPed(id)
            local coords = GetEntityCoords(ped)
            if #(srcCoords - coords) < 3.0 and id ~= src then
                local data = QBCore.Functions.GetPlayer(id)
                if data then
                    table.insert(nearby, {
                        id = id,
                        name = ("%s %s"):format(data.PlayerData.charinfo.firstname, data.PlayerData.charinfo.lastname)
                    })
                end
            end
        end

        TriggerClientEvent('changeidentity:chooseTarget', src, nearby)
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Akses Ditolak',
            description = 'Kamu bukan pegawai pemerintah!',
            type = 'error'
        })
    end
end)

RegisterNetEvent('changeidentity:apply', function(data)
    local src = source
    local officer = QBCore.Functions.GetPlayer(src)
    if not officer then return end

    if officer.PlayerData.job.name ~= 'pemerintah' then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Akses Ditolak',
            description = 'Kamu tidak memiliki izin untuk mengganti identitas!',
            type = 'error'
        })
        return
    end

    local target = QBCore.Functions.GetPlayer(tonumber(data.targetId))
    if not target then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Gagal',
            description = 'Warga tidak ditemukan.',
            type = 'error'
        })
        return
    end

    target.PlayerData.charinfo.firstname = data.firstname
    target.PlayerData.charinfo.lastname = data.lastname
    target.PlayerData.charinfo.birthdate = data.birthdate
    target.PlayerData.charinfo.nationality = data.nationality
    target.PlayerData.charinfo.gender = tonumber(data.gender) or 0

    MySQL.update.await('UPDATE players SET charinfo = ? WHERE citizenid = ?', {
        json.encode(target.PlayerData.charinfo),
        target.PlayerData.citizenid
    })

    target.Functions.SetPlayerData("charinfo", target.PlayerData.charinfo)
    target.Functions.Save()
    target.Functions.UpdatePlayerData(false)
    TriggerClientEvent('QBCore:Player:UpdatePlayerData', target.PlayerData.source)

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Berhasil',
        description = ('Identitas %s %s berhasil diubah.'):format(data.firstname, data.lastname),
        type = 'success'
    })
    TriggerClientEvent('ox_lib:notify', target.PlayerData.source, {
        title = 'Pemberitahuan',
        description = 'Identitas kamu telah diubah oleh pemerintah.',
        type = 'info'
    })
end)


RegisterServerEvent("Pemerintah:server:giveLicense", function(targetId, licenseType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayer(tonumber(targetId))

    if not Player or not Target then return end

    local validLicenses = { ["id_card"] = true }

    if not validLicenses[licenseType] then return end

    exports.qbx_idcard:CreateMetaLicense(Target.PlayerData.source, licenseType)

    TriggerClientEvent('ox_lib:notify', src, {
        description = "License berhasil diberikan ke ID "..targetId,
        type = 'success'
    })
    TriggerClientEvent('ox_lib:notify', Target.PlayerData.source, {
        description = "Kamu menerima "..licenseType,
        type = 'success'
    })
end)