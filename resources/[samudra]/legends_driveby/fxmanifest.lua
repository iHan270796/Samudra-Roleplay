fx_version 'cerulean'
game 'gta5'

author 'Legends Scripts'
description 'Advanced driveby system for fivem'
version '1.3.0'

lua54 'yes'

shared_script '@ox_lib/init.lua'

shared_scripts {
  'config/*.lua',
}

client_scripts {
  'client/*.lua',
}

server_scripts {
  'server/*.lua'
}

escrow_ignore {
  'config/*.lua',
  'client/editable.lua'
}
dependency '/assetpacks'