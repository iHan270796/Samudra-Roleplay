fx_version 'cerulean'
game 'gta5'

description 'Deanix - Mining & Lumberjack By I Han'
author 'Deanix Roleplay'
version '1.0.0'

shared_script {
   '@qb-core/shared/locale.lua',
   '@ox_lib/init.lua',
}

client_scripts {
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
    'client.lua',
}

server_scripts {
    'server.lua',
}

shared_scripts {
    'config.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
}

ui_page 'html/index.html'