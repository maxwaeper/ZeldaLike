/// @description Update camera

//Update camera destination
if (instance_exists(follow)) //Check if instance we are about to follow actually exists
{
	xTo = follow.x;
	yTo = follow.y;
}

//Update camera position
x += (xTo - x) / 15; //We do this to smoothly move camera to its destination 
y += (yTo - y) / 15;

//Keep camera center inside room bounds
x = clamp(x, viewHalfWidth, room_width-viewHalfWidth); //This function gets two numbers and holds value between them
y = clamp(y, viewHalfHeight, room_height-viewHalfHeight);

//Do the screenshake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength)*shakeMagnitude));

camera_set_view_pos(cam, x-viewHalfWidth, y - viewHalfHeight); //Now we position actual camera to the place of this object