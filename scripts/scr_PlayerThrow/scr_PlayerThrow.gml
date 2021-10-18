function scr_PlayerThrow() {
	with (global.iLifted)
	{
		lifted = false;
		persistent = false;
		thrown = true;
		z = 13;
		throwPeakHeight = z + 20;
		throwDistance = entityThrowDistance;
		throwDistanceTravelled = 0;
		throwStartPercent = (13/throwPeakHeight) * 0.5;
		throwPercent = throwStartPercent;
		direction = other.direction; //Inherit player direction
		xstart = x; //xstart and ystart will maintain starting position when we will throw an object
		ystart = y;
	}

	scr_PlayerActOutAnimation(spr_playerThrow);
	global.iLifted = noone;



}
