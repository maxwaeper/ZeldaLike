
function PlayerStateDead()
{
	hSpeed = 0;
	vSpeed = 0;
	
	//Just arrived in this state
	if (sprite_index != spr_playerDie && sprite_index != spr_playerDead)
	{
		//update the sprite
		sprite_index = spr_playerDie;
		image_index = 0;
		image_speed = 0.7;
	}
	
	//Animation ending this frame? 
	if (image_index + image_speed > image_number)
	{
		if (sprite_index == spr_playerDie)
		{
			image_speed = max(0, image_speed-0.05);
			
			if (image_speed < 0.07)
			{
				image_index = 0;
				sprite_index = spr_playerDead;
				image_speed = 1.0;
			}
			
		}
		
		else 
		{
			image_speed = 0;
			global.targetX = -1;
			global.targetY = -1;
			scr_RoomTransition(TRANS_TYPE.SLIDE, rm_village);
		}
		
	}
}