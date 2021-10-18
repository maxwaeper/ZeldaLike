function scr_PlayerStateAct() {
	 //Update sprite of current animation
	scr_AnimateSprite();

	if (animationEnd)
	{
		state = scr_PlayerStateFree;
		animationEnd = false;
	
		if (animationEndScript != -1)
		{
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}


}
