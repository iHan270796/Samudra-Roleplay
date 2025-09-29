fx_version 'cerulean'
game 'gta5'

ui_page 'html/index.html'


files {
    'html/index.html',
    'html/opening.mp3',
    'html/close.mp3'
    -- 'html/click.mp3'
}


shared_script {
    "@ox_lib/init.lua"
}

client_scripts {
    'config.lua', 
    'client.lua'
    
}

server_scripts {
    'server.lua', 
}


exports {
    'AddInteraction',
    'RemoveInteraction'
}