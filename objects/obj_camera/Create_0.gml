/// @description Set up camera
cam = view_camera[0]; // Get camera id 
follow = obj_player; //Set instance which camera will follow
viewHalfWidth = camera_get_view_width(cam) * 0.5;
viewHalfHeight = camera_get_view_height(cam) * 0.5;
xTo = xstart; //Point where we are headed
yTo = ystart;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;