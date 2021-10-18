/// @desc PlayerActOutAnimation(Sprite, EndScript)
/// @arg Sprite
/// @argEndScript
function scr_PlayerActOutAnimation() {

	// Carry out an animation and optionally carry out a script when the animation ends

	state = scr_PlayerStateAct;
	sprite_index = argument[0];

	if (argument_count > 1) animationEndScript = argument[1];
	localFrame = 0;
	image_index = 0;
	scr_AnimateSprite();


}
