
local QBCore = exports['qb-core']:GetCoreObject()
local orderCounter = 0
local PegawaiOrders = {}

RegisterServerEvent("deanix_burgershot:bayarItem", function(items)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local totalCost = 0

    for _, v in pairs(items) do
        local found = false
        for _, makanan in pairs(Config.Makanan) do
            for _, bahan in pairs(makanan.bahan) do
                if bahan.item == v.name then
                    totalCost = totalCost + (bahan.harga * v.qty)
                    found = true
                    break
                end
            end
            if found then break end
        end
    end
    local societyAccount = "bahamas"
    local balance = exports['Renewed-Banking']:getAccountMoney(societyAccount)

    if balance >= totalCost then
        local removed = exports['Renewed-Banking']:removeAccountMoney(societyAccount, totalCost)
        if removed then
            for _, v in pairs(items) do
                Player.Functions.AddItem(v.name, v.qty)
            end
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Payment successful (account money)!',
                type = 'success',
                icon = 'fa-solid fa-dollar-sign'
            })
            local charinfo = Player.PlayerData.charinfo
            local playerName = (charinfo.firstname or "") .. " " .. (charinfo.lastname or "")
            exports['Renewed-Banking']:handleTransaction(
                societyAccount,
                "Purchase of Materials",
                totalCost,
                "Food ingredients from the kitchen",
                playerName,
                "Bahamas",
                "withdraw"
            )
            local history = {}
            for _, v in pairs(items) do
                table.insert(history, {
                    name = playerName,
                    itemName = v.name,
                    qty = v.qty
                })
            end
            TriggerClientEvent("deanix_burgershot:queueFinished", src, history, playerName)
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = "Failed to take money from the boss's account!",
                type = 'error',
                icon = 'fa-solid fa-triangle-exclamation'
            })

        end
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Boss's balance is not enough!",
            type = 'error',
            icon = 'fa-solid fa-circle-xmark'
        })
    end
end)

QBCore.Functions.CreateCallback("deanix_burgershot:getMenu", function(source, cb)
    local menuList = {}

    for name, data in pairs(Config.Makanan) do
        table.insert(menuList, {
            item = name,
            label = data.label,
            image = data.image,
            bahan = data.bahan,
            harga = data.hargaJual or 0,
            type = "makanan"
        })
    end

    for name, data in pairs(Config.Paket) do
        table.insert(menuList, {
            item = name,
            label = data.label,
            image = data.image,
            isi = data.isi,
            harga = data.hargaJual or 0,
            type = "paket"
        })
    end

    cb(menuList)
end)

RegisterNetEvent("deanix_burgershot:confirmOrder", function(items)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    orderCounter = (orderCounter or 0) + 1

    local totalCost = 0
    local itemListText = ""
    local totalQty = 0
    local detailIsiItem = {}

    for _, item in pairs(items) do
        local hargaPerItem = 0
        local label = item.label or item.name

        if Config.Paket[item.name] then
            local paket = Config.Paket[item.name]
            hargaPerItem = paket.hargaJual or 0
            label = paket.label or label

            totalCost = totalCost + (hargaPerItem * (item.qty or 1))
            itemListText = itemListText .. ("• %sx %s ($%d)|"):format(item.qty, label, hargaPerItem * item.qty)

            for _, isi in ipairs(paket.isi) do
                local nama = isi.item
                local jumlah = (isi.qty or 1) * (item.qty or 1)
                totalQty = totalQty + jumlah

                local labelItem = Config.Makanan[nama] and Config.Makanan[nama].label or nama
                if detailIsiItem[labelItem] then
                    detailIsiItem[labelItem] = detailIsiItem[labelItem] + jumlah
                else
                    detailIsiItem[labelItem] = jumlah
                end
            end
        elseif Config.Makanan[item.name] then
            local makanan = Config.Makanan[item.name]
            hargaPerItem = makanan.hargaJual or 0
            label = makanan.label or label

            local subTotal = hargaPerItem * (item.qty or 1)
            totalCost = totalCost + subTotal
            totalQty = totalQty + (item.qty or 1)

            itemListText = itemListText .. ("• %sx %s ($%d)|"):format(item.qty, label, subTotal)

            if detailIsiItem[label] then
                detailIsiItem[label] = detailIsiItem[label] + item.qty
            else
                detailIsiItem[label] = item.qty
            end
        end
    end

    itemListText = itemListText:sub(1, -2)

    local jenisItemStr = ""
    for label, qty in pairs(detailIsiItem) do
        jenisItemStr = jenisItemStr .. string.format("%s x%d, ", label, qty)
    end
    jenisItemStr = jenisItemStr:sub(1, -3)

    local charinfo = Player.PlayerData.charinfo
    local playerName = (charinfo.firstname or "Unknown") .. " " .. (charinfo.lastname or "")

    local info = {
        buyer = playerName,
        queue = orderCounter,
        total = totalCost,
        date = os.date("%d/%m/%Y %H:%M"),
        items = itemListText,
        jumlahItem = totalQty,
        jenisItem = jenisItemStr,
        quality = nil,
        showItemData = true
    }

    PegawaiOrders[orderCounter] = info
    TriggerClientEvent("deanix_burgershot:pegawaiNewOrder", -1, orderCounter, info)

    local success = exports.ox_inventory:AddItem(src, "stickynote", 1, info)

    if success then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Order note given!",
            type = 'success',
            icon = 'fa-solid fa-clipboard-check'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Failed to provide note!",
            type = 'error',
            icon = 'fa-solid fa-triangle-exclamation'
        })
    end

    local customerHistory = {}
    for _, v in pairs(items) do
        table.insert(customerHistory, {
            name = playerName,
            itemName = v.name,
            qty = v.qty
        })
    end
    TriggerClientEvent("deanix_burgershot:customerHistory", src, customerHistory, playerName)
end)

QBCore.Functions.CreateCallback("deanix_burgershot:getPegawaiOrders", function(_, cb)
    local list = {}
    for id, data in pairs(PegawaiOrders) do
        table.insert(list, {
            id = id,
            label = string.format("#%d - %s ($%d)", id or 0, data.buyer or "Unknown", tonumber(data.total) or 0),
            metadata = data
        })
    end
    cb(list)
end)

RegisterNetEvent("deanix_burgershot:takePegawaiOrder", function(id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local orderInfo = PegawaiOrders[id]
    if not orderInfo then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Pesanan tidak ditemukan!",
            type = 'error',
            icon = 'fa-solid fa-circle-xmark'
        })
        return
    end

    PegawaiOrders[id] = nil
    TriggerClientEvent("deanix_burgershot:updatePegawaiOrders", -1, PegawaiOrders)

    local success = exports.ox_inventory:AddItem(src, "stickynote", 1, orderInfo)

    if success then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Nota pesanan berhasil diambil!",
            type = 'success',
            icon = 'fa-solid fa-circle-check'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Gagal memberikan salinan nota!",
            type = 'error',
            icon = 'fa-solid fa-circle-xmark'
        })
    end
end)