fx_version 'cerulean'
game 'gta5'
lua54 "yes"

author 'shy // Slashy'
description 'A drugs selling system, originally made for Springbank Roleplay'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'notify.lua'
}

server_script 'server/main.lua'