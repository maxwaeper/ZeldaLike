function PlayerStateHook()
{
	hSpeed = 0;
	vSpeed = 0;
	
	//If just arrived in this state
	if (sprite_index != spr_playerHook)
	{
		hook = 0;
		hookX = 0;
		hookY = 0;
		hookStatus = HOOKSTATUS.EXTENDING;
		hookedEntity = noone;
		
		//Update the sprite
		sprite_index = spr_playerHook;
		image_index  = CARDINAL_DIR;
		image_speed = 0;
	}
	
	//Extend and retract hook
	var _speedHookTemp = speedHook;
	if (hookStatus != HOOKSTATUS.EXTENDING) _speedHookTemp *= -1;
	
	hook += _speedHookTemp;
	
	switch (image_index)
	{
		case 0: hookX = hook; break;
		case 1: hookY = -hook; break;
		case 2: hookX = -hook; break;
		case 3: hookY = hook; break;
	}
	
	//Hookshot state machine
	switch (hookStatus)
	{
		case HOOKSTATUS.EXTENDING:
		{
			//Finish extending	
			if (hook >= distanceHook) hookStatus = HOOKSTATUS.MISSED;
			
			//Check for a hit
			var _hookHit = collision_circle(x+hookX,y+hookY,4,prnt_entity,false,true);
			
			if (_hookHit != noone) && (global.iLifted != _hookHit) // So if we fire upwards it won't collide we the thhing we carry
			{
				//Act depending on what we hit
				switch (_hookHit.entityHookable)
				{
					default: //Not hookable entity
					{
						//Potentially hurt an enemy
						if (object_is_ancestor(_hookHit.object_index,prnt_enemy))
						{
							HurtEnemy(_hookHit,1,id,5);
							hookStatus = HOOKSTATUS.MISSED;
						}
						
						else
						{
							if (_hookHit.entityHitScript != -1)
							{
								with (_hookHit) script_execute(entityHitScript);
								hookStatus = HOOKSTATUS.MISSED;
							}
						}
					}break;
					
					case 1:
					{
						hookStatus = HOOKSTATUS.PULLTOPLAYER;
						hookedEntity = _hookHit;
					}break;
					
					case 2:
					{
						hookStatus = HOOKSTATUS.PULLTOENTITY;
						hookedEntity = _hookHit;
					}break;
					
				}
			}
		}break;
		
		//Pull the entity towards the hooked player
		case HOOKSTATUS.PULLTOPLAYER:
		{
			with (hookedEntity)
			{
				x = other.x + other.hookX;
				y = other.y + other.hookY;
			}	
		}break;
		
		// Pull the player to entity
		case HOOKSTATUS.PULLTOENTITY:
		{
			switch (image_index)
			{
				case 0:	x += speedHook; break;
				case 1: y -= speedHook; break;
				case 2: x -= speedHook; break;
				case 3: y += speedHook; break;
			}
		}break;
	}
	
	// Finish retract and end state
	if (hook <= 0)
	{
		hookedEntity = noone;
		state = scr_PlayerStateFree;
	}
}