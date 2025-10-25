fx_version 'cerulean'
game 'gta5'

author 'Ihan'
description 'Tailor Stack Job (menu, spawn vehicle, client trees, stack UI left-middle)'

shared_script '@ox_lib/init.lua'
shared_script 'config.lua'

client_script {
  'client/*.lua'
}
server_script 'server/*.lua'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/style.css',
  'html/script.js'
}
