event_inherited();

state = ENEMYSTATE.WANDER;

//Enemy Sprites 
sprMove = spr_bat;
sprIdle = spr_bat;
sprAttack = spr_slimeAttack;
sprDie = 0;
sprHurt = spr_slimeHurt;

//Scripts 
enemyScript[ENEMYSTATE.WANDER] = BatWander;
enemyScript[ENEMYSTATE.CHASE] = BatChase;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;