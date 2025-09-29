fx_version 'cerulean'
game 'gta5'

author 'Deanix Roleplay'
description 'Items Sell System By I han'
version '1.0.0'

shared_script {
    'config.lua',
    '@ox_lib/init.lua'
}

client_script 'client.lua'
server_script 'server.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/*.png',  -- kalau pakai icon item misalnya
    'html/*.woff', -- font (jika ada)
}

lua54 'yes'
