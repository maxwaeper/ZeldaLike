event_inherited();

if (!global.gamePaused)
{
	bombTick--;
	if (bombTick == 0)
	{
		flash = 0.75;
		bombStage++;
		bombTick = bombTickRate[bombStage];
	}
	
	if (bombTick < 0)
	{
		y -= z;
		
		if (lifted)
		{
			with (obj_player) global.iLifted = noone;
		}
		instance_destroy();
	}
	
}