local QBCore = exports['qb-core']:GetCoreObject()
local plasticSurgeryZone = vector3(1139.17, -1573.58, 35.38)
local showingText = false
local displayText = "ZONA-OPRASI"
local displayText2 = "🆄🅽🆃🆄🅺 🅰🅺🆂🅴🆂 \n Oprasi Plastik Gunakan Item"
local displayText3 = "TIKET-OPLAS"

local function isInSurgeryZone()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    return #(pos - plasticSurgeryZone) < 2.5
end

CreateThread(function()
    while true do
        Wait(500)
        if isInSurgeryZone() then
            if not showingText then
                showingText = true
                exports["deanix_textui"]:Show3(displayText, displayText2, displayText3)
            end
        elseif showingText then
            showingText = false
            exports["deanix_textui"]:Close()
        end
    end
end)

RegisterNetEvent("deanix:usePlasticSurgeryItem", function()
    if not isInSurgeryZone() then
        return lib.notify({
            title = "Anda Harus Berada Di Zona Oprasi!",
            type = 'error'
        })
    end

    exports["deanix_textui"]:Close()

    TriggerServerEvent("deanix:server:RemovePlasticSurgeryItem")
    TriggerEvent("illenium-appearance:client:OpenSurgeonShop")
end)