if (!keyPressed)
{
	titleVisible = min(1,titleVisible+0.01);
}

else
{
	titleVisible = max(0, titleVisible - 0.01);
	saveSlotsVisible = min(1,saveSlotsVisible+0.01)
}

if (keyboard_check_pressed(vk_up)||keyboard_check_pressed(ord("W")))
{
	saveSlotSelected -= 1;
	if (saveSlotSelected < 0) saveSlotSelected = 2;
}

if (keyboard_check_pressed(vk_down)||keyboard_check_pressed(ord("S")))
{
	saveSlotSelected += 1;
	if (saveSlotSelected > 2) saveSlotSelected = 0;
}

if (keyboard_check_pressed(vk_enter)||keyboard_check_pressed(vk_space)) && (keyPressed) && (!loadingStarted)
{
	global.gameSaveSlot = saveSlotSelected;
	if (!LoadGame(global.gameSaveSlot))
	{
		scr_RoomTransition(TRANS_TYPE.SLIDE,rm_village);	
	}
	loadingStarted = true;
}

if (keyboard_check_pressed(vk_anykey)) keyPressed = true;