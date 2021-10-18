/// @description Progress transition 

with (obj_player) 
{
	if (state != PlayerStateDead) state = scr_PlayerStateTransition;
}
if (leading == OUT)
{
	percent = min(1,percent + TRANSITION_SPEED);
	
	if (percent >=1 )//screen fully covered
	{
		room_goto(target);
		leading = IN;
	}
}

else
{
	percent = max(0,percent - TRANSITION_SPEED);
	
	if (percent <= 0) //Screen revealed
	{
		instance_destroy();	
		
		with (obj_player) state = scr_PlayerStateFree;
	}
}