/// @description Entity Loop
// We use end step so we can use actual step in child object

if (!global.gamePaused) 
{
	depth = -bbox_bottom;
	
	if (lifted) && (instance_exists(obj_player))
	{
		if (obj_player.sprite_index != spr_playerLift)
		{
			x = obj_player.x;
			y = obj_player.y;
			z = 23;
			depth = obj_player.depth-1;
		}
	}
	
	if (!lifted)
	{
		// Be thrown
		if (thrown)	
		{
			//Increase until reaches throw distance
			throwDistanceTravelled = min(throwDistanceTravelled+3, throwDistance);	
			
			x = xstart + lengthdir_x(throwDistanceTravelled,direction);
			y = ystart + lengthdir_y(throwDistanceTravelled,direction);
			
			if (tilemap_get_at_pixel(collisionMap,x,y) > 0)
			{
				thrown = false;
				grav = 0.1;
			}
			
			// Shows percentage of completing the throwing ark
			throwPercent = throwStartPercent + lerp(0,1-throwStartPercent,throwDistanceTravelled/throwDistance);
			
			z = throwPeakHeight * sin(throwPercent * pi); 
			
			if (throwDistance == throwDistanceTravelled)
			{
				thrown = false;
				if (entityThrowBreak) instance_destroy();
			}
		}
		
		else 
		{
			// Fall back to Earth if not thrown and above z = 0
			if (z > 0)
			{
				z = max(z-grav,0);
				grav += 0.1;
				
				if (z==0) && (entityThrowBreak) instance_destroy();
			}
			else grav = 0.1;
		}
	}
}

flash = max(flash-0.04,0);