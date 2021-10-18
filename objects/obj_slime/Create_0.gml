event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites 
sprMove = spr_slimeMove;
sprIdle = spr_slime;
sprAttack = spr_slimeAttack;
sprDie = spr_slimeDeath;
sprHurt = spr_slimeHurt;

//Scripts 
enemyScript[ENEMYSTATE.WANDER] = scr_SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = scr_SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;