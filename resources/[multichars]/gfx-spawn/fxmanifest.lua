fx_version 'adamant'
games { 'gta5' }
lua54 'yes'

client_scripts {
    'client/cl_*.lua',
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	'server/server.lua',
}

shared_scripts {
	"@ox_lib/init.lua",
	'shared/sh_*.lua',
}

ui_page "html/index.html"

files {
	'html/assets/*',
	'html/index.html'
}

escrow_ignore {
	'shared/*.lua',
	'client/cl_open.lua'
}
dependency '/assetpacks'