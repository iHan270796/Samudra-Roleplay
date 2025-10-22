local QBCore = exports['qb-core']:GetCoreObject()
local generatedCode = nil
local canOpenVault = false
local wrongCodeAttempts = 0
local maxAttempts = 3
local computerZonesSpawned = false
local computerUsed = false 

CreateThread(function()
    for i, data in ipairs(Config.CashierZones) do
        exports.ox_target:addBoxZone({
            coords = data.coords,
            size = vec3(data.length, data.width, (data.maxZ - data.minZ)),
            rotation = data.heading,
            debug = false,
            options = {
                {
                    name = "cashier_zone_"..i,
                    icon = Config.CashierTarget.icon,
                    label = Config.CashierTarget.label,
                    canInteract = function(entity, distance, coords, name)
                        return QBCore.Functions.HasItem(Config.CashierTarget.item)
                    end,
                    onSelect = function(data)
                        StartCashierRobbery(i)
                    end
                }
            }
        })
    end
    for i, data in ipairs(Config.VaultZones) do
        exports.ox_target:addBoxZone({
            coords = data.coords,
            size = vec3(data.length, data.width, data.maxZ - data.minZ),
            rotation = data.heading,
            debug = false,
            options = {
                {
                    name = "vault_zone_"..i,
                    icon = Config.VaultTarget.icon,
                    label = Config.VaultTarget.label,
                    distance = 2.0,
                    canInteract = function(entity, distance, coords, name)
                        return canOpenVault
                    end,
                    onSelect = function(data)
                        OpenVaultUI()
                    end
                }
            }
        })
    end
end)

function SpawnComputerZones()
    if computerZonesSpawned then return end
    computerZonesSpawned = true

    for i, data in ipairs(Config.ComputerZones) do
        exports.ox_target:addBoxZone({
            coords = data.coords,
            size = vec3(data.length, data.width, data.maxZ - data.minZ),
            rotation = data.heading,
            debug = false,
            options = {
                {
                    name = "computer_zone_"..i,
                    icon = Config.ComputerTarget.icon,
                    label = Config.ComputerTarget.label,
                    distance = 2.0,
                    canInteract = function(entity, distance, coords, name)
                        return (not computerUsed) and QBCore.Functions.HasItem(Config.ComputerTarget.item)
                    end,
                    onSelect = function(data)
                        StartComputerHack()
                    end
                }
            }
        })
    end
end

function StartCashierRobbery(zoneId)
    currentZoneId = zoneId
    QBCore.Functions.TriggerCallback('deanix_shoprobbery:canRob', function(canRob, reason)
        if not canRob then
            lib.notify({
                title = reason,
                type = 'error',
                icon = 'fa-solid fa-people-robbery'
            })
            return
        end

        if Config.PoliceAlert.Enable and Config.PoliceAlert.AtCashier then
            notifyshoprobb("Seseorang mencoba membobol kasir!")
        end

        exports['ps-ui']:Circle(function(success)
            if not success then
                lib.notify({ title = 'Gagal membobol!', type = 'error' })
                if Config.LoseItemOnFail then
                    TriggerServerEvent("deanix_shoprobbery:removeItem", Config.CashierTarget.item)
                end
                return
            end

            local ped = PlayerPedId()
            QBCore.Functions.Progressbar("take_cash", "Mengambil uang...", 20000, false, true, {
                disableMovement = true, disableCarMovement = true,
                disableMouse = false, disableCombat = true,
            }, {
                animDict = "anim@heists@ornate_bank@grab_cash",
                anim = "grab",
                flags = 49,
            }, {}, {}, function()
                ClearPedTasks(ped)
                TriggerServerEvent("deanix_shoprobbery:giveReward")
                TriggerServerEvent("deanix_shoprobbery:setLastRobbery", zoneId)
                SpawnComputerZones()
            end, function()
                ClearPedTasks(ped)
                lib.notify({ title = 'Batal mengambil uang', type = 'error' })
            end)
        end, 3, 20)
    end, zoneId)
end

function StartComputerHack()
    QBCore.Functions.TriggerCallback('deanix_shoprobbery:canRob', function(canRob, reason)
        if not canRob then
            lib.notify({
                    title = reason,
                    type = 'error',
                    icon = 'fa-solid fa-people-robbery'
                })
            return
        end
        if Config.PoliceAlert.Enable and Config.PoliceAlert.AtComputer then
            notifyshoprobb("Seseorang mencoba membuka pintu brankas Warung!")
        end
        local ped = PlayerPedId()
        exports['ps-ui']:VarHack(function(success)
            ClearPedTasks(ped)

            if not success then
                lib.notify({
                    title = 'Gagal hack komputer!',
                    type = 'error',
                    icon = 'fa-solid fa-people-robbery'
                })
                if Config.LoseItemOnFail then
                    TriggerServerEvent("deanix_shoprobbery:removeItem", Config.ComputerTarget.item)
                end
                return
            end
            SetNuiFocus(true, true)
            SendNUIMessage({ action = "showCodePanel" })
        end, 4, 10)
    end)
end

RegisterNUICallback("ambilKode", function(_, cb)
    QBCore.Functions.Progressbar("ambil_kode", "Mengambil kode...", 5000, false, true, {
        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("deanix_shoprobbery:generateCode", currentZoneId)
        cb(true)
    end, function()
        lib.notify({ title = 'Batal mengambil kode', type = 'error' })
        cb(false)
    end)
end)

RegisterNetEvent("deanix_shoprobbery:receiveCode", function(code, zoneId)
    generatedCode = code
    canOpenVault = true
    computerUsed = true

    SendNUIMessage({
        action = "showCodeResult",
        code = code
    })
end)

function notifyshoprobb(message)
    local coords = GetEntityCoords(PlayerPedId())

    -- kirim dispatch pakai wasabi_mdt
    exports['wasabi_mdt']:SendPremadeDispatch('store_robbery', {
        location = '24/7 Store - Vinewood Boulevard',
        coords = { x = coords.x, y = coords.y, z = coords.z },
        description = message or 'Alarm dipicu di Warung, lapor tersangka bersenjata!'
    })
end

-- function notifyshoprobb(message)
--     exports['ps-dispatch']:CustomAlert({
--         message = message,
--         dispatchCode = "10-90",
--         code = "10-90",
--         icon = "fas fa-vault",
--         priority = 1,
--         jobs = { "leo" },
--         sound = "Lose_1st",
--         sound2 = "GTAO_FM_Events_Soundset",
--         flash = true,
--         scale = 1.5,
--         sprite = 161,
--         color = 1,
--         length = 5,
--         coords = GetEntityCoords(PlayerPedId())
--     })
-- end

RegisterNUICallback("closeUI", function(_, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "hideAll" })
    ClearPedTasks(PlayerPedId())
    cb(true)
end)

function OpenVaultUI()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "showVaultInput"
    })
end

RegisterNUICallback("submitCode", function(data, cb)
    local input = tostring(data.code)
    QBCore.Functions.TriggerCallback("deanix_shoprobbery:checkCode", function(correct)
        if correct then
            lib.notify({ title = 'Kode benar, mengambil uang...', type = 'success' })
            SendNUIMessage({ action = "showFinalReward", item = Config.RewardItem, amount = Config.RewardAmount or 1 })
        else
            wrongCodeAttempts = wrongCodeAttempts + 1
            lib.notify({ title = "Kode salah! (" .. wrongCodeAttempts .. "/" .. maxAttempts .. ")", type = 'error' })

            if wrongCodeAttempts >= maxAttempts then
                lib.notify({ title = "Terlalu banyak percobaan. Sistem terkunci!", type = 'error' })
                SetNuiFocus(false, false)
                SendNUIMessage({ action = "hideAll" })
                TriggerServerEvent("deanix_shoprobbery:setLastRobbery", currentZoneId)
                wrongCodeAttempts = 0
                canOpenVault = false
            end
        end
        cb(true)
    end, input, currentZoneId)
end)

RegisterNUICallback("ambilUangMerah", function(_, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "hideAll" })
    TriggerServerEvent("deanix_shoprobbery:giveReward")
    TriggerServerEvent("deanix_shoprobbery:setLastRobbery", currentZoneId)
    generatedCode = nil
    canOpenVault = false
    wrongCodeAttempts = 0
    cb(true)
end)
