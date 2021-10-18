/// @desc Initialise and Globals
randomize(); // randomises random function every cycle 

global.gameSaveSlot = 0;

global.gamePaused = false; 
global.textSpeed = 0.75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;

global.playerHealthMax = 3.0;
global.playerHealth = global.playerHealthMax;
global.playerMoney = 100;
//Items
global.playerHasAnyItems = false;
global.playerEquipped = ITEM.BOMB;
global.playerAmmo = array_create(ITEM.TYPE_COUNT, -1); //-1 won't show any number on screen
global.playerItemUnlocked = array_create(ITEM.TYPE_COUNT, false);
global.playerAmmo[ITEM.BOMB] = 0;
global.playerAmmo[ITEM.BOW] = 0;

//Test 
//global.playerHasAnyItems = true;
//global.playerItemUnlocked[ITEM.BOMB] = true;
//global.playerAmmo[ITEM.BOMB] = 5;
//global.playerItemUnlocked[ITEM.BOW] = true;
//global.playerAmmo[ITEM.BOW] = 15;
//global.playerItemUnlocked[ITEM.HOOK] = true;

global.questStatus = ds_map_create();
global.questStatus[? "TheHatQuest"] = 0;

global.iLifted = noone;
global.inst_camera = instance_create_layer(0,0,layer,obj_camera); // Doesn't really mean where we create it just as long as it exists
global.iUI = instance_create_layer(0,0,layer,obj_UI);

surface_resize(application_surface,RESOLUTION_W,RESOLUTION_H);

room_goto(ROOM_START); 