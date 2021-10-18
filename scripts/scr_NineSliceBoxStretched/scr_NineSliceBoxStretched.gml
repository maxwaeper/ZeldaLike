/// @desc NineSliceBox(sprite,x1,y1,x2,y2);
/// @arg sprite
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2
/// @arg index 
function scr_NineSliceBoxStretched(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _size = sprite_get_width(argument0)/3;
	var _x1 = argument1;
	var _y1 = argument2;
	var _x2 = argument3;
	var _y2 = argument4;
	var _width = _x2 - _x1;
	var _height = _y2 - _y1;
	var _columns = _width div _size;
	var _rows = _height div _size;
	var _index = argument5;

	//MIDDLE 
	draw_sprite_part_ext(argument0,_index,_size,_size,1,1,_x1+_size,_y1+_size,_width-(_size*2),_height-(_size*2),c_white,draw_get_alpha());

	//CORNERS
	//Top Left
	draw_sprite_part(argument0,_index,0,0,_size,_size,_x1,_y1);
	//Top Right
	draw_sprite_part(argument0,_index,_size*2,0,_size,_size,_x1+_width-_size,_y1);
	//Bottom Left
	draw_sprite_part(argument0,_index,0,_size*2,_size,_size,_x1,_y1+_height-_size);
	//Bottom Right 
	draw_sprite_part(argument0,_index,_size*2,_size*2,_size,_size,_x1+_width-_size,_y1+_height-_size);

	//EDGES
	//Left Edge
	draw_sprite_part_ext(argument0,_index,0,_size,_size,1,_x1,_y1+_size,1,_height-(_size*2),c_white,draw_get_alpha());
	//Right Edge
	draw_sprite_part_ext(argument0,_index,_size*2,_size,_size,1,_x1+_width-_size,_y1+_size,1,_height-(_size*2),c_white,draw_get_alpha());
	//Top Edge
	draw_sprite_part_ext(argument0,_index,_size,0,1,_size,_x1+_size,_y1,_width-(_size*2),1,c_white,draw_get_alpha());
	//Bottom Edge
	draw_sprite_part_ext(argument0,_index,_size, _size*2,1,_size,_x1+_size,_y1+_height-_size,_width-(_size*2),1,c_white,draw_get_alpha());





}
