fx_version 'cerulean'
lua54 'yes'
game 'gta5'
name 'wasd-atmrobbery'
author 'WASD'
version '1.2.0'
description 'Fivem Atm Robbery Script'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
	'shared/init.lua',
}

files {
	'locales/*.json',
	'modules/**/client.lua',
	'modules/bridge/**/client.lua',
}

client_scripts {
	'escrow/**/client.lua',
	'client.lua',
}

server_scripts {
	'escrow/**/server.lua',
	'server.lua'
}

dependencies { 'ox_lib' }

escrow_ignore {
	'config.lua',
	'shared/init.lua',
	'modules/**/*.lua',
}

dependency '/assetpacks'