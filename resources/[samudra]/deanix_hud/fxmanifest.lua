fx_version "adamant"
game "gta5"

author "Deanix Roleplay"
version "1.1"

lua54 "yes"

client_scripts {
    "lua/configuration/cl_bridge.lua",
    "lua/source/client/*.lua"
}

shared_scripts {
    "@ox_lib/init.lua",
    "lua/configuration/sh_config.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "lua/configuration/sv_bridge.lua",
    "lua/source/server/*.lua"
}

ui_page "build/index.html"

files {
    "build/**"
}

dependencies {
    "/assetpacks",
    "ox_lib"
}