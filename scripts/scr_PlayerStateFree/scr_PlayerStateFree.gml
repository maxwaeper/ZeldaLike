function scr_PlayerStateFree() {
	//Movement
	hSpeed = lengthdir_x(inputMagnitude*speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude*speedWalk, inputDirection);

	scr_PlayerCollision();

	// Update sprite index
	var _oldSprite = sprite_index;

	if (inputMagnitude != 0) // our sprite is based on input of player, if we base it on move speed then use h and vspeed and if we get into the wall the sprite will be idle instead of running
	{
		direction = inputDirection; // We assign it to direction so if we stop moving we won't turn to regular idle animation if inpD(0 0 0 0)
		// built-in direction also wraps around an angle if its bigger than 360 or less than 0
		sprite_index = spriteRun; 
	}

	else sprite_index = spriteIdle;

	if ( _oldSprite != sprite_index) localFrame = 0;

	//Update image index 
	scr_AnimateSprite();

	//Attack main logic
	if (keyAttack)
	{
		state = scr_PlayerStateAttack;
		stateAttack = scr_AttackSlash;
	}

	// Activate key logic
	if (keyActivate) 
	{
		//1st Check for an entity to activate
		//2nd If no Entity, or something but without script 
			//2a If we carry stuff then throw
			//2b Otherwise do a roll
		//3rd Else, there is entity with script then we activate it
		//4th If this entity is NPC we will make it face towards us
	
		var _activateX = x + lengthdir_x(10,direction);
		var _activateY = y + lengthdir_y(10,direction);
		var _activateSize = 4;
		var _activateList = ds_list_create();
	
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			prnt_entity,
			false,
			true,
			_activateList,
			true);
	
		// if the first instance we find is either our lifted or it has no script: try next one
		while (_entitiesFound > 0)
		{
			// by doing incrementing after the variabel in checks we first compare variable and the do the increment or decrement
			// but if we do --var then we substract and check afterwards
			var _check = _activateList[|--_entitiesFound];	
			if (_check != global.iLifted && _check.entityActivateScript != 1)
			{
				activate = _check;
				break;
			}
		}
	
		ds_list_destroy(_activateList);
	
	
	
		if (activate == noone) // -1 means no script is in this entitiy 
		// If the first statement of || turns our true (or false) then GML won't check the second statement for proof
		{
			//2a step
			if (global.iLifted != noone)
			{
				scr_PlayerThrow();
			}
			//2b step
			else
			{
			state = scr_PlayerStateRoll;
			moveDistanceRemaining = distanceRoll;
			}
		}
	
		else
		{
			//A3rd step
			scr_ExecuteArray(activate.entityActivateScript, activate.entityActivateArguments);
		
			//4th step
			if (activate.entityNPC) 
			{
				with (activate) 
				{
					direction = point_direction(x,y,other.x,other.y);	
				
					image_index = CARDINAL_DIR;
				}
			}
		}
	
	}

	if (keyItem) && (!keyActivate) && (global.playerHasAnyItems) && (global.playerEquipped != ITEM.NONE)
	{
		switch (global.playerEquipped)
		{
			case ITEM.BOMB: UseItemBomb(); break;	
			case ITEM.BOW: UseItemBow(); break;
			case ITEM.HOOK: UseItemHook(); break;
			default: break;
		}
	}
	
	// Cycle through items
	if (global.playerHasAnyItems)
	{
		var _cycleDirection = keyItemSelect;
		
		if (_cycleDirection != 0)
		{
			// do will always run at least once
			do 
			{
				global.playerEquipped += _cycleDirection;
				
				if (global.playerEquipped < 1) global.playerEquipped = ITEM.TYPE_COUNT - 1;
				
				if (global.playerEquipped >= ITEM.TYPE_COUNT) global.playerEquipped = 1;
				
			}
			until (global.playerItemUnlocked[global.playerEquipped]);
		}
	}

}
