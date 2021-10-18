flash = max(0, flash-0.05);
fric = 0.05;
if (z == 0) fric = 0.10;

//Magnetise coins
if (instance_exists(obj_player))
{
	var _px = obj_player.x;
	var _py = obj_player.y;
	var _distance = point_distance(x,y,_px,_py);
	//Magnet radius
	if (_distance < 16)
	{
		spd += 0.25;
		direction = point_direction(x,y,_px,_py);
		spd = min(spd,3);
		fric = 0;
		//Collect radius
		if (_distance < 5)
		{
			if (collectScriptArg != -1)
			{
				script_execute(collectScript, collectScriptArg);
			}
			
			else
			{
				if (collectScript != -1) script_execute(collectScript);	
			}
			instance_destroy();
		}
	}
}

if (!global.gamePaused)
{
	//Bouncing 
	if (bounceCount !=0)
	{
		bounce += (pi*bounceSpeed);	
		
		if(bounce > pi)
		{
			bounce -= pi;
			bounceHeight *= 0.6;
			bounceCount--;
		}
		
		
		z = sin(bounce)*bounceHeight;
	}
	else z = 0;
}
x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);
spd = max(spd-fric,0);
depth = -bbox_bottom;