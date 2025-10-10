-- local QBCore = exports['qb-core']:GetCoreObject()
local Config = require 'c_asuransi'
local SafeZones = {}

for _, zone in pairs(Config.SafeZones) do
    SafeZones[#SafeZones+1] = zone.points
end

local function pointInPoly(point, poly)
    local x, y = point.x, point.y
    local inside = false
    local j = #poly
    for i = 1, #poly do
        local xi, yi = poly[i].x, poly[i].y
        local xj, yj = poly[j].x, poly[j].y
        local intersect = ((yi > y) ~= (yj > y)) and
            (x < (xj - xi) * (y - yi) / ((yj - yi) + 0.00001) + xi)
        if intersect then
            inside = not inside
        end
        j = i
    end
    return inside
end

RegisterNetEvent('c_asuransi:startCountdown', function(totalTime)
    if not totalTime then return end
    CreateThread(function()
        local remaining = totalTime
        while remaining > 0 do
            lib.showTextUI(('🚨 Asuransi keliling dalam %d detik. Tolong masuk ke dalam kendaraan!'):format(remaining), {
                position = 'top-center',
                icon = 'car',
            })
            Wait(1000)
            remaining -= 1
        end
        lib.hideTextUI()
    end)
end)

RegisterNetEvent('c_asuransi:done', function()
    lib.notify({
        title = 'Asuransi',
        description = 'Semua kendaraan yang terparkir sembarangan telah dibawa oleh pihak asuransi',
        icon = 'circle-check',
        iconColor = '#04d60b',
        duration = 8000,
        type = 'success'
    })

    local function kursiKosong(v)
        local seat = GetVehicleMaxNumberOfPassengers(v)
        for i = -1, seat do
            if GetPedInVehicleSeat(v, i) ~= 0 then
                return false
            end
        end
        return true
    end

    local smuaKendaraan = GetGamePool('CVehicle')
    for i = 1, #smuaKendaraan do
        local kendaraan = smuaKendaraan[i]

        if DoesEntityExist(kendaraan) and kursiKosong(kendaraan) then
            local model = GetEntityModel(kendaraan)

            if lib.table.contains(Config.IgnoreVehicles, model) then
                goto continue
            end

            local pos = GetEntityCoords(kendaraan)
            local inSafe = false
            for _, poly in pairs(SafeZones) do
                if pointInPoly(pos, poly) then
                    inSafe = true
                    break
                end
            end

            if inSafe then
                goto continue
            end
            DeleteVehicle(kendaraan)
        end
        ::continue::
    end
end)
