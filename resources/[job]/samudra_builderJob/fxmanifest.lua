fx_version "cerulean"
game "gta5"
author "Ihan96"
lua54 "yes"
version "4.0.26"

shared_script {
   "Config.lua",
   "@ox_lib/init.lua"
}

server_scripts {
    "server/functions.lua",
    "server/server.lua",
}

client_scripts {
    "client/functions.lua",
    "client/target.lua",
    "client/client.lua",
}

ui_page "web/driver.html"
files {
    "web/**/*.**",
    "web/*.**",

}

escrow_ignore {
    "Config.lua",
    "client/target.lua",
    "client/functions.lua",
    "server/functions.lua",
}

dependency '/assetpacks'