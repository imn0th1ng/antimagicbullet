fx_version 'adamant'

author 'PAC STORE'
description 'This product mainly blocks no prop files..'

lua54 'yes'
game 'gta5'

shared_scripts { 'config.lua' }
client_scripts { 'client/main.lua' }
server_scripts { 'server/main.lua' }

escrow_ignore { 'config.lua', 'server/main.lua', 'client/main.lua' }