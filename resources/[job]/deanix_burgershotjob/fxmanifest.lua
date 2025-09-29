-- fxmanifest.lua
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Deanix Roleplay'
description 'Burgershot Job System By I Han'
version '1.0.0'

shared_script '@qb-core/shared/locale.lua'
shared_script 'config.lua'

shared_script {
    '@ox_lib/init.lua',
    '@qb-core/shared/locale.lua',
    'config.lua'
}

client_scripts {
    'client/client.lua',
    'client/target.lua',
    'client/ui.lua',
    'client/itemdisplay.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}
