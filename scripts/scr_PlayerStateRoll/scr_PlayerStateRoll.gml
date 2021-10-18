function scr_PlayerStateRoll() {
	//Movement of roll
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);

	moveDistanceRemaining  = max(0,moveDistanceRemaining-speedRoll);

	var _collided = scr_PlayerCollision();

	//Update sprite animation 
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;

	image_index = (CARDINAL_DIR*_totalFrames) + min(((1-(moveDistanceRemaining/distanceRoll))*_totalFrames), _totalFrames-1); //that way animation will be spread along distance of a roll not vice versa, min so that we won't loop a bit on next animation

	//Change State 
	if (moveDistanceRemaining <= 0) state = scr_PlayerStateFree;

	if (_collided)
	{
		state = scr_PlayerStateBonk;
	
		moveDistanceRemaining = distanceBonk;
	
		scr_ScreenShake(8,30);
	}


}
