function scr_PlayerStateBonk() {
	//Movement of roll
	hSpeed = lengthdir_x(speedBonk, direction-180);
	vSpeed = lengthdir_y(speedBonk, direction-180);

	moveDistanceRemaining = max(0,moveDistanceRemaining-speedBonk);

	var _collided = scr_PlayerCollision();

	//Update sprite animation 
	sprite_index = spr_playerHurt;

	//Change Height 
	z = sin(((moveDistanceRemaining/distanceBonk)*pi))*distanceBonkHeight;

	//Change State 
	if (moveDistanceRemaining <= 0) state = scr_PlayerStateFree;


}
