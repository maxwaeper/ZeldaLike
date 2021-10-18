/// @desc ScreenShake(magnitude,frames)
/// @arg Magnitude sets the strength of the shake (distance range)
/// @arg Frames sets the length of the shake in frames (60 = 1 second)
function scr_ScreenShake(argument0, argument1) {

	with (global.inst_camera)
	{
		if (argument0 > shakeRemain) // Check if the new shake we are going to add is greater than the one currently could be going, so we won't add smaller one instead
		{
			shakeMagnitude = argument0;
			shakeRemain = shakeMagnitude;
			shakeLength = argument1;
		}
	}


}
