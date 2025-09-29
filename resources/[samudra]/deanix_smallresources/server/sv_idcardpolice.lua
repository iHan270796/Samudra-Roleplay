local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("police:server:giveLicense", function(targetId, licenseType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayer(tonumber(targetId))

    if not Player or not Target then return end
    if Player.PlayerData.job.name ~= "pemerintah" then return end

    local validLicenses = {
        ["id_card"] = true,
        -- ["driver_license"] = true,
        -- ["weaponlicense"] = true,
        -- ["licensehunting"] = true
    }

    if not validLicenses[licenseType] then
        print(src, "Eksploitasi terdeteksi.")
        return
    end

    exports.qbx_idcard:CreateMetaLicense(Target.PlayerData.source, licenseType)

    TriggerClientEvent('ox_lib:notify', src, {
        description = "License berhasil diberikan ke ID "..targetId,
        type = 'success' -- atau 'success'
    })
    TriggerClientEvent('ox_lib:notify', src, {
        description = Target.PlayerData.source, "Kamu menerima "..licenseType,
        type = 'success' -- atau 'success'
    })
end)

RegisterServerEvent("police:server:giveLicense2", function(targetId, licenseType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Target = QBCore.Functions.GetPlayer(tonumber(targetId))

    if not Player or not Target then return end
    if Player.PlayerData.job.name ~= "police" then return end

    local validLicenses = {
        ["id_card"] = true,
        ["driver_license"] = true,
        ["driver_licenseb"] = true,
        ["driver_licensec"] = true,
        ["weaponlicense"] = true,
        ["licensehunting"] = true
    }

    if not validLicenses[licenseType] then
        print(src, "Eksploitasi terdeteksi.")
        return
    end

    exports.qbx_idcard:CreateMetaLicense(Target.PlayerData.source, licenseType)

    TriggerClientEvent('ox_lib:notify', src, {
        description = "License berhasil diberikan ke ID "..targetId,
        type = 'success' -- atau 'success'
    })
    TriggerClientEvent('ox_lib:notify', src, {
        description = Target.PlayerData.source, "Kamu menerima "..licenseType,
        type = 'success' -- atau 'success'
    })
end)
