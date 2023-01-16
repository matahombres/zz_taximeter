fx_version 'bodacious'
game 'gta5'

author 'matahombress'
description 'Taximeter'
version '1.0.0'
ui_page 'client/ui/index.html'-- NUI

shared_scripts {
	'config.lua',

	'shared/utils.lua',
	'shared/locales/*.lua'
}

client_scripts {
	"client/client.lua",
	"client/controlerBtn.lua",
	"client/vehicleInteraction.lua"
}

server_script {
	"server/taxi.lua",
	"server/server.lua"
}
files({
    'client/ui/*',
    'client/ui/**/*',
})