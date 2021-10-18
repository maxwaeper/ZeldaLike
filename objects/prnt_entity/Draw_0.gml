if (entityShadow) draw_sprite(spr_shadow,0,x,y);

if (flash != 0)
{
	// this function is quite expensive
	shader_set(flashShader);
	shader_set_uniform_f(uFlash, flash);
}
draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y-z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha);
	
	// If we have a normal shader it will equal -1 
if (shader_current() != -1) shader_reset();