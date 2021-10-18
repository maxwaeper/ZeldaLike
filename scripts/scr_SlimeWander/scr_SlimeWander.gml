function scr_SlimeWander() 
{
	// At destination or give up
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed)
	{
		hSpeed = 0;
		vSpeed = 0;
		sprite_index = spr_slime;
		// End move animation
	
		// Set new destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
	
	
	}
	else // Move towards new destination
	{
		timePassed++;
		sprite_index = sprMove;
		var _distanceLeft = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceLeft < enemySpeed) _speedThisFrame = _distanceLeft;
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_speedThisFrame,dir);
		vSpeed = lengthdir_y(_speedThisFrame,dir);
		//if (hSpeed != 0) image_xscale = sign(hSpeed);
	}

	// Collide and move
	scr_EnemyTileCollision();

	// Check for aggro
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(obj_player) && point_distance(x,y,obj_player.x,obj_player.y) <= enemyAggroRadius)
		{
			state = ENEMYSTATE.CHASE;
			target = obj_player;
		}
	}	
}
