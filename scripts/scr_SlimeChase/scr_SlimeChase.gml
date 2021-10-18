function scr_SlimeChase()
{
	sprite_index = spr_slimeMove;

	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
	
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		dir = point_direction(x,y,xTo,yTo);
	
		if (_distanceToGo > enemySpeed)
		{
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		}
	
		else 
		{
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
	
		//Collide and Move
		scr_EnemyTileCollision();
	}
	
	//Check if we are close enough to attack
	if (instance_exists(target) && point_distance(x,y,target.x,target.y) <= enemyAttackRadius)
	{
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		
		//Target 8px past the player
		xTo += lengthdir_x(8,dir);
		yTo += lengthdir_y(8,dir);
	}
}
