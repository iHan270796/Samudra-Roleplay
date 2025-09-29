fx_version 'cerulean'
game 'gta5'

author 'Deanix Roleplay'
description 'Crafting By I han'
version '1.0.0'

shared_script {
    '@ox_lib/init.lua',
    '@qb-core/shared/locale.lua',
    'shared/config.lua'
}

client_scripts {
    'client/main.lua',
    'client/ui.lua',
    'client/target.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'shared/config.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js',
    'html/images/*.png',
}

lua54 'yes'
