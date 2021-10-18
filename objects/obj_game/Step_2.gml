/// @description Pause the Game
if (keyboard_check_pressed(vk_escape) && !instance_exists(obj_transition) && obj_UI.visible != false)
{
	global.gamePaused = !global.gamePaused; //inverts boolean variable
	
	if (global.gamePaused)
	{
		with (all) //selects every single active object
		{
			gamePausedImageSpeed = image_speed; //every instance remembers its image speed
			image_speed = 0;
		}
	}
	
	else
	{
		with (all)
		{
			image_speed = gamePausedImageSpeed;	
		}
	}
}