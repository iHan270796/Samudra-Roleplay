fx_version 'cerulean'
game 'gta5'

description 'Deanix Moneywash By I Han'
author 'Deanix Roleplay'

shared_script {
    '@ox_lib/init.lua',
    'config.lua'
}

client_script 'client.lua'
server_script 'server.lua'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

ui_page 'html/index.html'
