state = scr_PlayerStateFree; //without () you just refer to the script and dont actually call it
stateAttack = scr_AttackSlash;
hitByPlayerAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Collision")); // first we get layer on which is our tilemap and then the id of a tilemap itself

image_speed = 0; //stops the animation 

// Speed section
hSpeed = 0; //Horizontal speed
vSpeed = 0; //Vertical speed
speedWalk = 2.0;
speedRoll = 3.0; 
speedBonk = 2.0;
speedHook = 3.0;

//Distance Section
distanceRoll = 96;
distanceBonk = 30;
distanceBonkHeight = 12;
distanceHook = 88;

z = 0;
invulnerable = 120;
flash = 0;
flashShader = 0;

animationEndScript = -1;

// Sprite section
spriteRoll = spr_playerRoll;
spriteRun = spr_playerRun;
spriteIdle = spr_player; 
localFrame = 0;

// Hook section
hook = 0;
hookX = 0;
hookY = 0;
hookSize = sprite_get_width(spr_hookChain);

if (global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}