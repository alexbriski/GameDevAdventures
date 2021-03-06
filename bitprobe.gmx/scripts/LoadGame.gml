//
// Carrega todas as variáveis necessárias no ini especificado
//

show_debug_message("Loading game ("+string(argument0)+")...");

if (!file_exists(argument0))
    SaveGame(argument0);

ini_open(argument0);

global.rooms[? "RoomAtual"] = Decrypt(ini_read_string("Rooms", "RoomAtual", rmLevel1_1), 2);
show_debug_message("room load");
show_debug_message(global.rooms[? "RoomAtual"]);

global.rooms[? "MundoAtual"] = Decrypt(ini_read_string("Rooms", "MundoAtual", rmMapa01), 5);

if (Decrypt(ini_read_string("PlayerStats", "PlayerRed", 0), 7) == 0)
    global.playerStats[? "PlayerRed"] = false;
else
    global.playerStats[? "PlayerRed"] = true;

if (Decrypt(ini_read_string("PlayerStats", "PlayerGreen", 0), 3) == 0)
    global.playerStats[? "PlayerGreen"] = false;
else
    global.playerStats[? "PlayerGreen"] = true;

if (Decrypt(ini_read_string("PlayerStats", "PlayerBlue", 0), 8) == 0)
    global.playerStats[? "PlayerBlue"] = false;
else
    global.playerStats[? "PlayerBlue"] = true;

if (Decrypt(ini_read_string("PlayerStats", "PlayerWhite", 0), 6) == 0)
    global.playerStats[? "PlayerWhite"] = false;
else
    global.playerStats[? "PlayerWhite"] = true;

if (Decrypt(ini_read_string("Config", "enableSFX", 0), 19) == 0)
    global.enableSFX = false;
else
    global.enableSFX = true;
    
if (Decrypt(ini_read_string("Config", "enableMusic", 0), 20) == 0)
    global.enableMusic = false;
else
    global.enableMusic = true;

    
    
    /////tocar ou nao musica e efeitos para testes
    global.enableMusic = true;
    global.enableSFX = true;
    /////tocar ou nao musica e efeitos para testes
    
    
    
if (instance_exists(objPlayer))
{
    objPlayer.cor = Decrypt(ini_read_string("PlayerStats", "CorAtual", Cor.White), 11);
    TrocaSpritePlayer();
}

///cor para testes
//global.playerStats[? "PlayerBlue"] = true;
//global.playerStats[? "PlayerGreen"] = true;
//global.playerStats[? "PlayerRed"] = true;
//global.playerStats[? "PlayerWhite"] = false;


ini_close();
