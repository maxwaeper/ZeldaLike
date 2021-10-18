function scr_EnemyTileCollision() {
	//Horizontal tiles check 
	var _collision = false;
	if (tilemap_get_at_pixel(collisionMap, x+hSpeed, y))
	{
		x -= x mod TILE_SIZE; //how many times argument can fit into x (or whatever is there) and return leftover
	
		if (sign(hSpeed) == 1) x+= TILE_SIZE - 1;
	
		hSpeed = 0;
	
		_collision = true;
	}

	x += hSpeed;

	if (tilemap_get_at_pixel(collisionMap, x, y+vSpeed))
	{
		y -= y mod TILE_SIZE; //how many times argument can fit into x (or whatever is there) and return leftover
	
		if (sign(hSpeed) == 1) y+= TILE_SIZE - 1;
	
		vSpeed = 0;
	
		_collision = true;
	}

	y += vSpeed

	return _collision;


}
