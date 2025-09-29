fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'TshentroTech'
description 'Multi-Framework Scoreboard System'
version '2.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/framework.lua',
    'server/discord.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/assets/*'
}

-- No dependencies required - works with any framework

-- Escrow ignore
escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'