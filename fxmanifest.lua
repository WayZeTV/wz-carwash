fx_version 'adamant'
game 'gta5'
author 'WayZe#0001'

client_scripts {
    -- Dépendances RageUI
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
	'es_extended'
}

shared_scripts {
    'config.lua'
}