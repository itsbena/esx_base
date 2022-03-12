fx_version 'adamant'

game 'gta5'

client_scripts {
	'NativeUI.lua',
	'Config.lua',
	'Client/*.lua'
}

server_scripts {
	'Config.lua',
	'@oxmysql/lib/MySQL.lua',
	'Server/*.lua'
}
