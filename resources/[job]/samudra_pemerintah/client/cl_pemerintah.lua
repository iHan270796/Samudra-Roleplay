local QBCore = exports['qb-core']:GetCoreObject()
local Config = require 'c_pemerintah'

local negara = {
    { value = 'Indonesia', label = 'Indonesia' },
    { value = 'Malaysia', label = 'Malaysia' },
    { value = 'Singapore', label = 'Singapore' },
    { value = 'United States', label = 'United States' },
    { value = 'Japan', label = 'Japan' },
    { value = 'India', label = 'India' },
    -- tambah negara lain sesuai kebutuhan
}

CreateThread(function()
    for _, zone in ipairs(Config.TargetZones) do
        exports.ox_target:addBoxZone({
            coords = zone.coords,
            size = zone.size,
            rotation = zone.rotation or 0.0,
            debug = zone.debug or false,
            distance = zone.distance or 2.0,
            options = (function()
                local opts = {}
                for _, o in ipairs(zone.options) do
                    table.insert(opts, {
                        name = o.name,
                        icon = o.icon,
                        label = o.label,
                        groups = o.groups,
                        onSelect = function()
                            if o.serverEvent then
                                TriggerServerEvent(o.serverEvent)
                            end
                            if o.clientEvent then
                                TriggerEvent(o.clientEvent)
                            end
                        end
                    })
                end
                return opts
            end)()
        })
    end
end)

local function getToday()
    local year, month, day = 2025, 10, 20 -- ganti sesuai kebutuhan, atau ambil dari server time
    return string.format("%04d-%02d-%02d", year, month, day)
end

RegisterNetEvent("Pilihmenu:utama", function(targetId)
    lib.registerContext({
        id = 'Pemerintah_open_menu',
        title = '🎫 Menu Lisensi Pemerintah',
        options = {
            {
                title = '🎫 Beri ID Card',
                description = 'Berikan ID Card ke warga',
                event = 'Pemerintah:client:giveLicense',
                args = { type = "id_card", targetId = targetId } -- teruskan targetId
            },
            {
                title = '🎫 Ganti Identitas',
                description = 'Ganti Identitas Warga',
                event = 'changeidentity:openForm',
                args = { targetId = targetId } -- teruskan targetId
            }
        }
    })
    lib.showContext('Pemerintah_open_menu')
end)

RegisterNetEvent('changeidentity:openForm', function(args)
    local targetId = args.targetId
    if not targetId then return end

    local input = lib.inputDialog('Formulir Perubahan Identitas', {
        { type = 'input', label = 'Nama Depan', placeholder = 'Contoh: John', required = true },
        { type = 'input', label = 'Nama Belakang', placeholder = 'Contoh: Doe', required = true },
        { type = 'select', label = 'Negara', options = negara, required = true },
        { type = 'date', label = 'Tanggal Lahir', required = true, format = 'YYYY-MM-DD', returnString = true, min = '1900-01-01', max = getToday(), default = getToday() },
        { type = 'select', label = 'Jenis Kelamin', options = {
            { value = '0', label = 'Laki-Laki' },
            { value = '1', label = 'Perempuan' }
        }, default = '0', required = true }
    })

    if not input then return end

    local newData = {
        firstname = input[1],
        lastname = input[2],
        nationality = input[3],
        birthdate = input[4],
        gender = tonumber(input[5]),
        targetId = targetId
    }

    TriggerServerEvent('changeidentity:apply', newData)
end)

RegisterNetEvent('changeidentity:chooseTarget', function(players)
    local nearby = {}
    for _, v in pairs(players) do
        table.insert(nearby, { label = ('ID %s - %s'):format(v.id, v.name), value = v.id })
    end

    local dialog = lib.inputDialog('Pilih Warga', {
        { type = 'select', label = 'Warga di Sekitar', options = nearby }
    })

    if not dialog then return end
    local targetId = tonumber(dialog[1])
    TriggerEvent('Pilihmenu:utama', targetId)
end)

RegisterNetEvent('changeidentity:updateCharinfo', function(newCharinfo)
    local pdata = QBCore.Functions.GetPlayerData()
    if pdata then
        pdata.charinfo = newCharinfo
    end

    lib.notify({
        title = 'Identitas Diperbarui',
        description = ('Nama sekarang: %s %s'):format(newCharinfo.firstname, newCharinfo.lastname),
        type = 'success'
    })
end)

RegisterNetEvent("Pemerintah:client:giveLicense", function(args)
    if not args or not args.targetId or not args.type then return end
    TriggerServerEvent("Pemerintah:server:giveLicense", args.targetId, args.type)
end)