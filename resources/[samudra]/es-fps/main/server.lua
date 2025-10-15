-- Oyuncu ayarlarını saklamak için tablo
local playerSettings = {}

-- Oyuncu ayarlarını kaydet
RegisterServerEvent('fps:saveSettings')
AddEventHandler('fps:saveSettings', function(settings)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    
    if identifier then
        playerSettings[identifier] = settings
        
        -- Burada veritabanına kaydetme işlemi yapılabilir
        -- MySQL örneği:
        -- MySQL.Async.execute('UPDATE users SET fps_settings = @settings WHERE identifier = @identifier', {
        --     ['@settings'] = json.encode(settings),
        --     ['@identifier'] = identifier
        -- })
        
        -- print('^2[FPS Settings]^7 Oyuncu ' .. GetPlayerName(src) .. ' ayarlarını kaydetti.')
    end
end)

-- Oyuncu ayarlarını yükle
RegisterServerEvent('fps:requestSettings')
AddEventHandler('fps:requestSettings', function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    
    if identifier then
        local settings = playerSettings[identifier]
        
        -- Burada veritabanından yükleme işlemi yapılabilir
        -- MySQL örneği:
        -- MySQL.Async.fetchAll('SELECT fps_settings FROM users WHERE identifier = @identifier', {
        --     ['@identifier'] = identifier
        -- }, function(result)
        --     if result[1] and result[1].fps_settings then
        --         settings = json.decode(result[1].fps_settings)
        --     end
        --     TriggerClientEvent('fps:loadSettings', src, settings)
        -- end)
        
        TriggerClientEvent('fps:loadSettings', src, settings)
    end
end)

-- Oyuncu ayrıldığında ayarları temizle (bellekten)
AddEventHandler('playerDropped', function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    
    if identifier and playerSettings[identifier] then
        playerSettings[identifier] = nil
        -- print('^3[FPS Settings]^7 Oyuncu ' .. GetPlayerName(src) .. ' ayarları bellekten temizlendi.')
    end
end)
