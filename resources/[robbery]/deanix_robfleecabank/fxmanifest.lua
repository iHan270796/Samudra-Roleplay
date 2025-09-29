fx_version 'cerulean'
game 'gta5'

description 'deanix_robfleecabank by pusliae'
author 'deanix'
version '1.0.0'

-- Shared
shared_script {
    '@ox_lib/init.lua',
    'config.lua'
}

-- Client & Server
client_scripts {
    'client/client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

-- UI
ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/style.css',
    'html/script.js'
}
