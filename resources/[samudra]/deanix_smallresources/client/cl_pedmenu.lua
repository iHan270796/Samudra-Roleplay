local Config = require 'c_peds'

exports('usetiketped', function(data, slot)
    -- panggil event utama kamu
    TriggerEvent('custom-ped:openMenu')
end)

RegisterNetEvent("custom-ped:openMenu", function()
    TriggerServerEvent("custom-ped:requestPedMenu")
end)

RegisterNetEvent("custom-ped:showMenu", function(allowed)
    if not allowed then
        QBCore.Functions.Notify("Kamu tidak punya akses ke menu ped.", "error")
        return
    end

    local options = {}

    for _, ped in pairs(allowed) do
        table.insert(options, {
            title = ped.label,
            description = "Ganti menjadi model ini",
            icon = "fa-solid fa-user",
            onSelect = function()
                TriggerEvent("custom-ped:applyPed", ped.model)
            end
        })
    end

    lib.registerContext({
        id = 'custom_ped_menu',
        title = 'Pilih Model Ped',
        options = options
    })

    lib.showContext('custom_ped_menu')
end)


RegisterNetEvent("custom-ped:applyPed", function(model)
    TriggerServerEvent("custom-ped:savePedModel", model)

    local hash = GetHashKey(model)
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(10) end

    SetPlayerModel(PlayerId(), hash)
    SetModelAsNoLongerNeeded(hash)

    exports['illenium-appearance']:setPlayerAppearance({
        model = model,
        components = {},
        props = {}
    })
end)