function scr_AttackSlash() {
	//Attack has just started 
	if (sprite_index != spr_attackPlayer)
	{ 
		//Set up correct animation
		sprite_index = spr_attackPlayer;
		localFrame = 0;
		image_index = 0;
	
		//Clear hit list
		if (!ds_exists(hitByPlayerAttack, ds_type_list))
		{
			hitByPlayerAttack = ds_list_create();	
		}
	
		ds_list_clear(hitByPlayerAttack);
	
	
	}

	scr_CalculateAttack(spr_playerAttackHitBox);

	//Update Sprite
	scr_AnimateSprite();

	if (animationEnd)
	{
		state = scr_PlayerStateFree;
		animationEnd = false;
	}


}
