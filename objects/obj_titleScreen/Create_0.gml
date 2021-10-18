titleVisible = 0.0;
keyPressed = false;
saveSlotsVisible = 0.0;
saveSlotSelected = 0;
loadingStarted = false;

for (var _slot = 0; _slot <= 2; _slot++)
{
	var _fileName = "save" + string(_slot) + ".sav";
	
	if (file_exists(_fileName))
	{
		slotData[_slot] = LoadJSONFromFile(_fileName);	
	}
	else slotData[_slot] = -1;
}