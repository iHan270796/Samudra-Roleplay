lib.callback.register('ox_inventory:displayItemInfo', function(item)
    if item.name ~= 'stickynote' then return end

    local info = item.info or {}
    local pesananText = info.items or '-'
    local orders = {}
    for line in string.gmatch(pesananText, '[^|]+') do
        table.insert(orders, line)
    end

    local jumlahItem = info.jumlahItem or #orders
    local jenisItem = info.jenisItem or '-'
    local total = info.total or 0
    local buyer = info.buyer or 'Tidak diketahui'
    local queue = info.queue or '-'

    return {
        { label = '🧾 Nota Pesanan', value = nil },
        { label = 'Nama', value = buyer },
        { label = 'Antrian', value = queue },
        { label = 'Jumlah Jenis Item', value = jenisItem },
        { label = 'Jumlah Item', value = jumlahItem },
        { label = 'Total', value = '$' .. total },
        { label = 'Pesanan', value = table.concat(orders, '\n') }
    }
end)


CreateThread(function()
    exports.ox_inventory:displayMetadata({
        buyer = 'Nama',
        queue = 'Antrian',
        jumlahItem = 'Jumlah Item',
        jenisItem = 'Jenis Item',
        total = 'Total',
        items = 'Pesanan'
    })
end)