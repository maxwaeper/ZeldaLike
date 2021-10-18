function scr_AnimateSprite() {
	// Update sprite
	var _cardinalDirection = CARDINAL_DIR; // converting 0-360 to 0-3 number

	var _totalFrames = sprite_get_number(sprite_index) / 4;  //how many frames in animation sprite

	image_index = localFrame + (_cardinalDirection * _totalFrames);

	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE; //increment localFrame instead of build-in variable

	// If animation would loop on next game step 
	if (localFrame >= _totalFrames)
	{
		animationEnd = true;	
		localFrame -= _totalFrames;
	}

	else animationEnd = false; 



}
