x1 = RESOLUTION_W/2;
y1 = RESOLUTION_H-70; //These crdinates are applied to the screen and not to the room
x2 = RESOLUTION_W/2; //Same x1 and x2 because we will animate text box
y2 = RESOLUTION_H; 

x1Target = 0;
x2Target = RESOLUTION_W;

lerpProgress = 0; //Linear interpolation progress
textProgress = 0;

responseSelected = 0; //which response we have highlighted 