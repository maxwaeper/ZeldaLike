draw_sprite(spr_shadow,0,x,y);


//Hookshot before player
if (state == PlayerStateHook) && (image_index != 3) DrawHookChain();

if (invulnerable != 0) && ((invulnerable mod 8 < 2) == 0) && (flash == 0)
{
	// skip draw	
}

else
{
draw_sprite_ext(sprite_index,
				image_index,
				x,
				y-z,
				image_xscale,
				image_yscale,
				image_angle,
				image_blend,
				image_alpha);
				// This function is like draw self but you can manipulate arguments
}

//Hookshot after player
if (state == PlayerStateHook) && (image_index == 3) DrawHookChain();

//functions declared in objects are local for those objects only
function DrawHookChain()
{
	var _originX = floor(x);
	var _originY = floor(y)-7; //because our player base point is lower 
	
	var _chains = hook div hookSize;
	var _hookDirX = sign(hookX);
	var _hookDirY = sign(hookY);
	
	for (var i = 0; i < _chains; i++)
	{
		draw_sprite
		(
			spr_hookChain, 
			0,
			_originX + hookX - (i*hookSize*_hookDirX),
			_originY + hookY - (i*hookSize*_hookDirY)
		);
	}
	
	draw_sprite(spr_hookBlade, image_index,_originX+hookX, _originY+hookY);
	
}