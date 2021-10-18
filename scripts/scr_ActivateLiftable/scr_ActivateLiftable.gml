/// @arg id
function scr_ActivateLiftable(argument0) {

	if (global.iLifted == noone)
	{
		scr_PlayerActOutAnimation(spr_playerLift);
		
		//Better implement changing sprite animation
		//in a function
		//spriteIdle = spr_playerCarrying;
		//spriteRun = spr_playerRunCarrying;
	
		global.iLifted = argument0;
		with (global.iLifted)
		{
			lifted = true;
			persistent = true;
		}
	}


}
