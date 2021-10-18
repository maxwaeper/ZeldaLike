#macro FRAME_RATE 60 //no semi-colon after macros
#macro TILE_SIZE 16
#macro CARDINAL_DIR round(direction/90)
#macro ROOM_START rm_title
#macro RESOLUTION_W 640
#macro RESOLUTION_H 320
#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1

	enum ENEMYSTATE
	{
		IDLE,
		WANDER,
		CHASE,
		ATTACK,
		HURT,
		DIE,
		WAIT 
	}
	
	enum ITEM
	{
		NONE,
		BOMB,
		BOW,
		HOOK,
		TYPE_COUNT // cheap way to count enum count
	}

	enum HOOKSTATUS
	{
		EXTENDING,
		PULLTOPLAYER,
		PULLTOENTITY,
		MISSED
	}