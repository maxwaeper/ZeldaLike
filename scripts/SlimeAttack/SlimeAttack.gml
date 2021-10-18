// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeAttack()
{
	//How fast to move
	var _speed = enemySpeed;
	
	//Don't move while still getting ready to jump
	
	//Freeze animation while in mid-air and also after landing finishes
	// if (floor(image_index) == 3 || floor(image_index) == 5) image_speed = 0;
	
	//How far we have to jump 
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	
	//Begin landing end of the animation when we're nearly done
	//if (_distanceToGo < 4 && image_index < 5) image_speed = 1.0;
	
	//Move
	if (_distanceToGo > _speed)
	{
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_speed,dir);
		vSpeed = lengthdir_y(_speed,dir);
		
		// if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Commit to movement and stop moving if we hit the wall
		if (scr_EnemyTileCollision() == true)
		{
			xTo = x;
			yTo = y;
		}
	}
	
	else
	{
		x = xTo;
		y = yTo;
		if (floor(image_index) == 5)
		{
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}