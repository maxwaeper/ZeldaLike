/// @desc NineSliceBox(sprite,x1,y1,x2,y2);
/// @arg sprite
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
function scr_NineSliceBox(argument0, argument1, argument2, argument3, argument4) {

	var _size = sprite_get_width(argument0)/3;
	var _x1 = argument1;
	var _y1 = argument2;
	var _x2 = argument3;
	var _y2 = argument4;
	var _width = _x2 - _x1;
	var _height = _y2 - _y1;
	var _columns = _width div _size;
	var _rows = _height div _size;

	//Draw CORNERS
	//Top Left
	draw_sprite_part(argument0,0,0,0,_size,_size,_x1,_y1); //Subimage is a frame of a sprite

	//Top Right
	draw_sprite_part(argument0,0,_size*2,0,_size,_size,_x1+(_columns*_size),_y1);

	//Bottom Left
	draw_sprite_part(argument0,0,0,_size*2,_size,_size,_x1,_y1+(_rows*_size));

	//Bottom Right
	draw_sprite_part(argument0,0,_size*2,_size*2,_size,_size,_x1+(_columns*_size),_y1+(_rows*_size))

	//Draw EDGES
	for	(var i = 1; i < (_rows); i++)
	{
		//Left Edge
		draw_sprite_part(argument0,0,0,_size,_size,_size,_x1, _y1+(i*_size));
	
		//Right Edge
		draw_sprite_part(argument0,0,_size*2,_size,_size,_size,_x1+(_columns*_size),_y1+(i*_size));
	}

	for	(var i = 1; i < (_columns); i++)
	{
		//Top Edge
		draw_sprite_part(argument0,0,_size,0,_size,_size,_x1+(i*_size), _y1);
	
		//Bottom Edge
		draw_sprite_part(argument0,0,_size,_size*2,_size,_size,_x1+(i*_size),_y1+(_rows*_size));
	}

	//Draw the MIDDLE
	for (var i = 1; i < (_columns); i++)
	{
		for (var j = 1; j < (_rows); j++)
		{
			draw_sprite_part(argument0,0,_size,_size,_size,_size,_x1+(i*_size),_y1+(j*_size));
		}
	}




}
