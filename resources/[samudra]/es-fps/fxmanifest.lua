fx_version "adamant"

description "ES-FPS - Advanced FPS Settings Menu"
author "Raider#0101"
version '1.0.0'
repository 'https://discord.com/invite/EkwWvFS'

game "gta5"

client_script { 
    "main/client.lua"
}

server_script {
    "main/server.lua"
} 

shared_script "main/shared.lua"

ui_page "index.html"

files {
    'index.html',
    'vue.js',
    'assets/**/*.*',
    'assets/css/*.css',
    'assets/css/*.scss',
    'assets/img/*.*',
    'assets/font/*.otf'
}

escrow_ignore { 
    'main/shared.lua',
    'main/client.lua',
    'main/server.lua'
}

lua54 'yes'