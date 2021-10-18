function SaveGame()
{
	//Create save map
	var _map = ds_map_create();
	
	_map[? "room"] = room;
	_map[? "playerHealth"] = global.playerHealth;
	_map[? "playerHealthMax"] = global.playerHealthMax;
	_map[? "playerMoney"] = global.playerMoney;
	_map[? "playerItemUnlocked"] = global.playerItemUnlocked;
	_map[? "playerAmmo"] = global.playerAmmo;
	_map[? "playerEquipped"] = global.playerEquipped;
	_map[? "playerHasAnyItems"] = global.playerHasAnyItems;
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	
	// We can't just reference global.questStatus ds_map
	// Cause it'll just return the pointer to the data where
	// ds_map is saved. We have to make a copy of global.questStatus
	// Into new ds_map and then add it to the main _map ds_map
	// We delete _map in the end so if we put original questStatus
	// It'll get deleted as well
	
	var _questMap = ds_map_create();
	//(id, source) to, from
	ds_map_copy(_questMap,global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap);
	
	// Save everything in a string
	var _string = json_encode(_map);
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	show_debug_message(_string);
	
	//Nuke the data
	ds_map_destroy(_map);
	show_debug_message("Saved!");
}

function SaveStringToFile(_filename, _string)
{
	//buffer is a raw peace of memory and it can create
	// a more generel type of memory file for cross platform
	var _buffer = buffer_create(string_byte_length(_string)+2, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}