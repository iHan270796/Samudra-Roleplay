fx_version 'adamant'
game 'gta5'

shared_scripts {
    '@ox_lib/init.lua',
    '@qbx_core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'c_starterpack.lua',
    'c_badside.lua',
    'c_peds.lua',
    'c_boombox.lua',
    'c_bossgang.lua',
    'c_duduk.lua',
}

client_scripts {
	'client/*.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

ui_page 'html/index.html'

files { 
    'html/imgs/**.png',
    'html/imgs/**.jpg',
    'html/index.html', 
    'html/config.js',
    'html/script.js',
    'html/styles.css'
}

escrow_ignore {
    '**.lua',
}

client_exports {
    'usetiketped'  -- biar ox_inventory bisa baca export ini saat startup
}

lua54 'yes'
