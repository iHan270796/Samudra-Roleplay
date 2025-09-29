fx_version 'cerulean'
game 'gta5'

author 'Deanix Roleplay'
description 'Deanix-Fishingjob By I Han'
version '1.0.0'

shared_script {
    '@ox_lib/init.lua',
    '@qb-core/shared/locale.lua'
}

client_scripts {
    -- '@PolyZone/client.lua',
    -- '@PolyZone/BoxZone.lua',
    -- '@PolyZone/CircleZone.lua',
    'client/fishing_zones.lua',
    'client/main.lua',
    'client/nui.lua'
}

server_scripts {
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

client_exports {
    'useRod'
}

lua54 'yes'