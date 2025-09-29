fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Deanix Roleplay'
version '1.0.0'

shared_script {
	'@qb-core/shared/locale.lua',
	'@ox_lib/init.lua',
	'locales/en.lua',
	'config.lua',
}

client_scripts {
	'client/client.lua'
}

server_script {
	'server/server.lua'
}