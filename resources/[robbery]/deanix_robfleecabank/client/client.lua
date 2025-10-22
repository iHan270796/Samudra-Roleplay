local QBCore = exports['qb-core']:GetCoreObject()
local inUse = false
local bankProgress = {}
RobberyCooldowns = {}


CreateThread(function()
    QBCore.Functions.TriggerCallback("deanix_robfleecabank:GetCooldowns", function(data)
        RobberyCooldowns = data or {}
    end)
end)

RegisterNetEvent("deanix_robfleecabank:client:UpdateBankProgress", function(bankId, progress)
    bankProgress[bankId] = progress
end)

RegisterNetEvent("deanix_robfleecabank:client:SetCooldowns", function(data)
    RobberyCooldowns = data or {}
end)

CreateThread(function()
    for bankId, data in pairs(Config.Banks) do
    exports.ox_target:addBoxZone({
        coords = data.hackComputer, -- Vector3 atau vector4
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        drawSprite = true,
        options = {
            {
                name = "hack_computer_" .. bankId,
                icon = "fas fa-laptop-code",
                label = "Hack Komputer",
                distance = 1.5,
                onSelect = function()
                    TriggerEvent("deanix_robfleecabank:StartHackComputer")
                end,
                canInteract = function()
                    if inUse then return false end
                    local count = exports.ox_inventory:Search('count', Config.Items.PhoneHack)
                    return count and count > 0
                end
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = data.secureSystem, -- pastikan ini vector3/vector4
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        drawSprite = true,
        options = {
            {
                name = "secure_system_" .. bankId,
                icon = "fas fa-shield-alt",
                label = "Hack Secure System",
                distance = 2.0,
                onSelect = function()
                    TriggerEvent("deanix_robfleecabank:StartSecureSystem")
                end,
                canInteract = function()
                    local ped = PlayerPedId()
                    local playerCoords = GetEntityCoords(ped)

                    for bank, data in pairs(Config.Banks) do
                        if #(playerCoords - data.secureSystem) < 2.5 then
                            if RobberyCooldowns[bank] and RobberyCooldowns[bank] > GetCloudTimeAsInt() then
                                return false
                            end

                            if bankProgress[bank] and bankProgress[bank].moneyTaken then
                                return false
                            end

                            local count = exports.ox_inventory:Search('count', Config.Items.Laptop)
                            local progress = bankProgress[bank]
                            return (count and count > 0) and progress ~= nil and progress.hasCode == true
                        end
                    end

                    return false
                end
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = data.inDoor, -- pastikan vector3/vector4
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        drawSprite = true,
        options = {
            {
                name = "inDoor" .. bankId,
                icon = "fas fa-shield-alt",
                label = "Hack System",
                distance = 2.0,
                onSelect = function()
                    TriggerEvent("deanix_robfleecabank:StartHackVaultDoor")
                end,
                canInteract = function()
                    local ped = PlayerPedId()
                    local playerCoords = GetEntityCoords(ped)

                    for bank, bankData in pairs(Config.Banks) do
                        if #(playerCoords - bankData.inDoor) < 2.5 then
                            if RobberyCooldowns[bank] and RobberyCooldowns[bank] > GetCloudTimeAsInt() then
                                return false
                            end

                            if bankProgress[bank] and bankProgress[bank].moneyTaken then
                                return false
                            end

                            local count = exports.ox_inventory:Search('count', Config.Items.inDoor)
                            return (not inUse) and (count and count > 0)
                        end
                    end

                    return false
                end
            }
        }
    })
    exports.ox_target:addBoxZone({
        coords = data.moneyTable,
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        drawSprite = true,
        options = {
            {
                name = "moneyTable" .. bankId,
                icon = "fas fa-money-bill-wave",
                label = "Ambil Uang",
                distance = 2.0,
                canInteract = function()
                    local bankId = GetClosestBank()
                    if not bankId then return false end

                    if not bankProgress[bankId] then
                        local progress = lib.callback.await("deanix_robfleecabank:server:GetBankProgress", false, bankId)
                        bankProgress[bankId] = progress
                    end

                    if RobberyCooldowns[bankId] and RobberyCooldowns[bankId] > GetCloudTimeAsInt() then
                        return false
                    end
                    if not bankProgress[bankId].vaultDoorOpen then return false end
                    if bankProgress[bankId].moneyTaken then return false end
                    return true
                end,
                onSelect = function()
                    if inUse then return end

                    local bankId = GetClosestBank()
                    if not bankId then return end

                    if bankProgress[bankId] and bankProgress[bankId].moneyTaken then
                        return lib.notify({description = "Uang sudah diambil!", type = "error"})
                    end

                    inUse = true
                    local ped = PlayerPedId()

                    local success = lib.progressBar({
                        duration = 7000,
                        label = "Mengambil uang...",
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                        },
                        anim = {
                            dict = "anim@heists@ornate_bank@grab_cash",
                            clip = "grab"
                        }
                    })

                    ClearPedTasksImmediately(ped)

                    if success then
                        if not bankProgress[bankId] then bankProgress[bankId] = {} end
                        TriggerServerEvent("deanix_robfleecabank:server:SetMoneyTaken", bankId)
                        SendNUIMessage({
                            action = "showLayout4",
                            item = Config.Reward.Item,
                            image = "ox_inventory/web/images/" .. Config.Reward.Item .. ".png"
                        })
                         SetNuiFocus(true, true)
                    else
                        lib.notify({description = "Gagal mengambil uang", type = "error"})
                    end

                    inUse = false
                end
            }
        }
    })
    end
end)

RegisterNetEvent("deanix_robfleecabank:StartHackComputer", function()
    if inUse then return end

    local bankId = GetClosestBank()
    if not bankId then
        return lib.notify({
            description = "Tidak dapat menentukan bank!",
            type = "error"
        })
    end

    local canStart, remaining = lib.callback.await("deanix_robfleecabank:CanStartRobbery", false, bankId)
    if not canStart then
        local minutes = math.floor(remaining / 60)
        local seconds = remaining % 60
        return lib.notify({
            description = ("Bank ini baru saja dirampok! Tunggu %d menit %d detik."):format(minutes, seconds),
            type = "inform"
        })
    end

    local policeCount = lib.callback.await("deanix_robfleecabank:GetPoliceCount", false)
    if policeCount < Config.MinPolisi then
        return lib.notify({
            description = ("Tidak cukup polisi di kota! (%d/%d)"):format(policeCount, Config.MinPolisi),
            type = "error"
        })
    end

    if exports.ox_inventory:Search('count', Config.Items.PhoneHack) < 1 then
        return lib.notify({
            description = "Kamu butuh perangkat hack (PhoneHack)!",
            type = "error"
        })
    end

    inUse = true
    NotifyPolice("Seseorang mencoba meretas komputer di Fleeca Bank!")

    local successProgress = lib.progressBar({
        duration = Config.Timers.HackComputer,
        label = "Mengakses komputer...",
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true
        },
        anim = {
            dict = "anim@heists@prison_heistig1_p1_guard_checks_bus",
            clip = "loop"
        }
    })

    if not successProgress then
        inUse = false
        return lib.notify({
            description = "Hack dibatalkan!",
            type = "error"
        })
    end

    Wait(300)
    ClearPedTasksImmediately(PlayerPedId())

    exports['ps-ui']:VarHack(function(success)
        TriggerServerEvent("deanix_robfleecabank:RemoveItem", Config.Items.PhoneHack)
        
        if success then
            TriggerServerEvent("deanix_robfleecabank:SetRobberyTime", bankId)
            local code = tostring(math.random(100000, 999999))
            bankProgress[bankId] = {
                hasCode = true,
                code = code
            }
            OpenLayout1(code)
        else
            lib.notify({
                description = "Hack gagal, perangkat rusak!",
                type = "error"
            })
        end

        inUse = false
    end, 4, 3) -- (varCount, attempts)
end)

RegisterNetEvent("deanix_robfleecabank:StartSecureSystem", function()
    if inUse then return end

    -- Cek laptop
    if exports.ox_inventory:Search('count', Config.Items.Laptop) < 1 then
        return lib.notify({
            description = "Kamu butuh Laptop untuk mengakses sistem!",
            type = "error"
        })
    end

    -- Cek kode dari komputer
    local bankId = GetClosestBank()
    if not bankId or not bankProgress[bankId] or not bankProgress[bankId].hasCode then
        return lib.notify({
            description = "Kamu belum punya kode dari komputer!",
            type = "error"
        })
    end

    inUse = true
    NotifyPolice("Seseorang mencoba membobol sistem aman di Fleeca Bank!")

    local ped = PlayerPedId()
    local animDict = "anim@heists@ornate_bank@hack"
    local laptopModel = `hei_prop_hst_laptop`
    local bagModel = `hei_p_m_bag_var22_arm_s`

    -- Load asset
    RequestAnimDict(animDict)
    RequestModel(laptopModel)
    RequestModel(bagModel)
    while not HasAnimDictLoaded(animDict)
       or not HasModelLoaded(laptopModel)
       or not HasModelLoaded(bagModel) do Wait(10) end

    -- Setup posisi
    local pos = GetEntityCoords(ped)
    local fixedPos = vector3(pos.x, pos.y, pos.z + 0.50)
    local heading = GetEntityHeading(ped)
    local rot = vector3(0.0, 0.0, heading)

    SetEntityCoords(ped, fixedPos)
    SetEntityHeading(ped, heading)
    FreezeEntityPosition(ped, true)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)

    -- Buat object
    local bag = CreateObject(bagModel, fixedPos, true, true, false)
    local laptop = CreateObject(laptopModel, fixedPos, true, true, false)

    -- Scene awal
    local scene = NetworkCreateSynchronisedScene(fixedPos, rot, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene, animDict, "hack_enter_bag", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(laptop, scene, animDict, "hack_enter_laptop", 1.0, -1.0, 1148846080)
    NetworkStartSynchronisedScene(scene)
    Wait(GetAnimDuration(animDict, "hack_enter") * 1000)

    -- Scene loop
    local scene2 = NetworkCreateSynchronisedScene(fixedPos, rot, 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene2, animDict, "hack_loop", 1.0, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, "hack_loop_bag", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(laptop, scene2, animDict, "hack_loop_laptop", 1.0, -1.0, 1148846080)
    NetworkStartSynchronisedScene(scene2)

    local hackResult = nil
    CreateThread(function()
        exports['ps-ui']:VarHack(function(success)
            hackResult = success
        end, 5, 3)
    end)

    -- Progressbar ox_lib
    local successProgress = lib.progressBar({
        duration = Config.Timers.HackSecureSystem,
        label = "Mengakses sistem keamanan...",
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true
        }
    })

    -- Kalau dibatalkan
    if not successProgress then
        lib.notify({
            description = "Akses sistem dibatalkan!",
            type = "error"
        })
        ClearPedTasksImmediately(ped)
        FreezeEntityPosition(ped, false)
        DeleteEntity(bag)
        DeleteEntity(laptop)
        inUse = false
        return
    end

    -- Setelah progress selesai
    ClearPedTasksImmediately(ped)
    FreezeEntityPosition(ped, false)
    DeleteEntity(bag)
    DeleteEntity(laptop)

    -- Tunggu minigame selesai
    while hackResult == nil do Wait(100) end

    TriggerServerEvent("deanix_robfleecabank:RemoveItem", Config.Items.Laptop)

    if hackResult then
        OpenCodeInput()
    else
        lib.notify({
            description = "Gagal mengakses sistem!",
            type = "error"
        })
    end

    inUse = false
end)

RegisterNetEvent("deanix_robfleecabank:StartHackVaultDoor", function()
    if inUse then return end

    if exports.ox_inventory:Search('count', Config.Items.inDoor) < 1 then
        return lib.notify({
            description = "Kamu butuh security card untuk membuka pintu!",
            type = "error"
        })
    end
    
    inUse = true
    NotifyPolice("Seseorang mencoba membuka pintu brankas dalam di Fleeca Bank!")
    local ped = PlayerPedId()
    local bankId = GetClosestBank()
    if not bankId then
        lib.notify({
            description = "Tidak berada di dekat bank yang valid!",
            type = "error"
        })
        inUse = false
        return
    end

    local animDict = "anim@heists@ornate_bank@hack"
    local laptopModel = `hei_prop_hst_laptop`
    local bagModel = `hei_p_m_bag_var22_arm_s`

    RequestAnimDict(animDict)
    RequestModel(laptopModel)
    RequestModel(bagModel)
    while not HasAnimDictLoaded(animDict)
       or not HasModelLoaded(laptopModel)
       or not HasModelLoaded(bagModel) do Wait(10) end

    local pos = GetEntityCoords(ped)
    local fixedZ = pos.z - -0.50
    local fixedPos = vector3(pos.x, pos.y, fixedZ)
    local heading = GetEntityHeading(ped)
    local rot = vector3(0.0, 0.0, heading)

    SetEntityCoords(ped, fixedPos)
    SetEntityHeading(ped, heading)
    FreezeEntityPosition(ped, true)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)

    local bag = CreateObject(bagModel, fixedPos, true, true, false)
    local laptop = CreateObject(laptopModel, fixedPos, true, true, false)
    local scene = NetworkCreateSynchronisedScene(fixedPos, rot, 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene, animDict, "hack_enter", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene, animDict, "hack_enter_bag", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(laptop, scene, animDict, "hack_enter_laptop", 1.0, -1.0, 1148846080)
    NetworkStartSynchronisedScene(scene)
    Wait(GetAnimDuration(animDict, "hack_enter") * 1000)

    local scene2 = NetworkCreateSynchronisedScene(fixedPos, rot, 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene2, animDict, "hack_loop", 1.0, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, "hack_loop_bag", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(laptop, scene2, animDict, "hack_loop_laptop", 1.0, -1.0, 1148846080)
    NetworkStartSynchronisedScene(scene2)

    local hackResult = nil
    CreateThread(function()
        exports['ps-ui']:VarHack(function(success)
            hackResult = success
        end, 5, 3)
    end)

    -- Progress bar pakai ox_lib
    if lib.progressBar({
        duration = Config.Timers.inDoor,
        label = "Membuka kunci pintu brankas...",
        useWhileDead = false,
        canCancel = true,
        disable = { move = true, car = true, combat = true }
    }) then
        ClearPedTasksImmediately(ped)
        FreezeEntityPosition(ped, false)
        DeleteEntity(bag)
        DeleteEntity(laptop)
        while hackResult == nil do Wait(100) end
        TriggerServerEvent("deanix_robfleecabank:RemoveItem", Config.Items.inDoor)
        if hackResult then
            if not bankProgress[bankId] then bankProgress[bankId] = {} end
            bankProgress[bankId].vaultDoorOpen = true
            lib.notify({
                description = "Berhasil membuka pintu!",
                type = "success"
            })
            local doorId = Config.Banks[bankId].doorId
            if doorId then
                TriggerServerEvent("deanix_robfleecabank:server:AuthorizeHacker", doorId)
                Wait(500)
                TriggerServerEvent("ox_doorlock:setState", doorId, false, true)
            else
                print("❌ Door ID tidak ditemukan di config untuk bank:", bankId)
            end
        else
            lib.notify({
                description = "Gagal membuka sistem pintu!",
                type = "error"
            })
        end
    else
        lib.notify({
            description = "Dibatalkan!",
            type = "error"
        })
        ClearPedTasksImmediately(ped)
        FreezeEntityPosition(ped, false)
        DeleteEntity(bag)
        DeleteEntity(laptop)
    end

    inUse = false
end)

RegisterNetEvent("deanix_robfleecabank:ResetBankProgress", function(bankId)
    bankProgress[bankId] = nil
end)

RegisterNetEvent("deanix_robfleecabank:client:OpenVaultDoor", function(bankId)
    local coords = Config.Banks[bankId].secureSystem
    local door = GetClosestObjectOfType(coords, 5.0, GetHashKey("v_ilev_gb_vauldr"), false, false, false)
    if door and door ~= 0 then
        SetEntityHeading(door, 0.0)
        FreezeEntityPosition(door, true)
    end
end)


function GetClosestBank()
    local coords = GetEntityCoords(PlayerPedId())
    local closestBank, closestDist = nil, 2.5

    for bank, data in pairs(Config.Banks) do
        local pointsToCheck = {
            data.hackComputer,
            data.secureSystem,
            data.inDoor,
            data.moneyTable 
        }
        for _, point in pairs(pointsToCheck) do
            if point then
                local dist = #(coords - point)
                if dist < closestDist then
                    closestDist = dist
                    closestBank = bank
                end
            end
        end
    end
    return closestBank
end

function OpenLayout1(code)
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "showLayout1", code = code, queueTime = Config.Timers.QueueUI })
end

function OpenCodeInput()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "showCodeInput" })
end

function NotifyPolice(message)
    local coords = GetEntityCoords(PlayerPedId())

    -- kirim dispatch pakai wasabi_mdt
    exports['wasabi_mdt']:SendPremadeDispatch('bank_robbery', {
        location = 'FleecaBank ',
        coords = { x = coords.x, y = coords.y, z = coords.z },
        description = message or 'Terjadi Prapokan FleecaBank!'
    })
end

-- function NotifyPolice(message)
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

RegisterNUICallback("submitCode", function(data, cb)
    local inputCode = data.code
    local coords = GetEntityCoords(PlayerPedId())
    for bank, state in pairs(bankProgress) do
        if #(coords - Config.Banks[bank].secureSystem) < 2.5 then
            if inputCode == state.code then
                lib.notify({
                    description = "Kode benar, pintu terbuka!",
                    type = "success"
                })
                TriggerServerEvent("deanix_robfleecabank:server:OpenVaultDoor", bank)
            else
                lib.notify({
                    description = "Kode salah!",
                    type = "error"
                })
            end
            break
        end
    end
    SetNuiFocus(false, false)
    inUse = false
    cb("ok")
end)


RegisterNUICallback("takeReward", function(_, cb)
    SetNuiFocus(false, false)
    TriggerServerEvent("deanix_robfleecabank:server:GiveReward")
    cb({})
end)

RegisterNUICallback("closeUI", function(_, cb)
    SetNuiFocus(false, false)
    inUse = false
    cb("ok")
end)