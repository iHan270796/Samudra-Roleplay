fx_version 'adamant'
game 'gta5'

shared_scripts {
    '@ox_lib/init.lua',
    'c_pemerintah.lua',
}

client_scripts {
	'client/*.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

lua54 'yes'
