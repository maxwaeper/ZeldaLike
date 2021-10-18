function scr_PlayerCollision() {
	var _collision = false;
	var _entityCollisionList = ds_list_create();

	//Horizontal tiles check 
	if (tilemap_get_at_pixel(collisionMap, x+hSpeed, y))
	{
		x -= x mod TILE_SIZE; //how many times argument can fit into x (or whatever is there) and return leftover
	
		if (sign(hSpeed) == 1) x+= TILE_SIZE - 1;
	
		hSpeed = 0;
	
		_collision = true;
	}

	//Check for collision with Horizontal Entities
	var _entityCollisionCount = instance_position_list(x+hSpeed,y,prnt_entity,_entityCollisionList,false);
	var _snapX; //This instance is for where we will be put if there is a collision

	while (_entityCollisionCount > 0)
	{
		var _entityCollisionCheck = _entityCollisionList[| 0];
	
		if (_entityCollisionCheck.entityCollision == true)
		{
			// Move to the entity as close as we can
			if (sign(hSpeed) == -1) _snapX = _entityCollisionCheck.bbox_right+1;
			else _snapX = _entityCollisionCheck.bbox_left-1;
			x = _snapX;
			hSpeed = 0;
			_collision = true;
			_entityCollisionCount = 0;
		}
	
		ds_list_delete(_entityCollisionList,0);
		_entityCollisionCount--;
	}

	// Commitment to Horizontal movement
	x += hSpeed;

	//Clear list between axis
	ds_list_clear(_entityCollisionList);

	// Vertical tiles check 
	if (tilemap_get_at_pixel(collisionMap, x, y+vSpeed))
	{
		y -= y mod TILE_SIZE; //how many times argument can fit into x (or whatever is there) and return leftover
	
		if (sign(vSpeed) == 1) y+= TILE_SIZE - 1;
	
		vSpeed = 0;
	
		_collision = true;
	}

	//Check for collision with Vertical Entities
	var _entityCollisionCount = instance_position_list(x,y+vSpeed,prnt_entity,_entityCollisionList,false);
	var _snapY;

	while (_entityCollisionCount > 0)
	{
		var _entityCollisionCheck = _entityCollisionList[| 0];
	
		if (_entityCollisionCheck.entityCollision == true)
		{
			// Move to the entity as close as we can
			if (sign(vSpeed) == -1) _snapY = _entityCollisionCheck.bbox_bottom+1;
			else _snapY = _entityCollisionCheck.bbox_top-1;
			y = _snapY;
			vSpeed = 0;
			_collision = true;
			_entityCollisionCount = 0;
		}
	
		ds_list_delete(_entityCollisionList,0);
		_entityCollisionCount--;
	}

	//Commitment to Vertical movement
	y += vSpeed;

	//If we won't destroy the list it'll always stick in our memory
	ds_list_destroy(_entityCollisionList);

	return _collision; 


}
