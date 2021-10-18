function LoadGame(_slot)
{
	global.gameSaveSlot = _slot;
	var _file = "save" + string(global.gameSaveSlot) + ".sav";
	if (file_exists(_file))
	{
		//Load the game data
		var _map = LoadJSONFromFile(_file);
		
		//global variables
		global.playerHealth = _map[? "playerHealth"];
		global.playerHealthMax = _map[? "playerHealthMax"];
		global.playerMoney = _map[? "playerMoney"];
		global.playerEquipped = _map[? "playerEquipped"];
		global.playerHasAnyItems = _map[? "playerHasAnyItems"];
		global.targetX = _map[? "targetX"];
		global.targetY = _map[? "targetY"];
		
		//Arrays will come back from json_decode as lists
		//So we have to do lists into arrays
		for (var i = 0; i < ITEM.TYPE_COUNT; i++)
		{
			// We get entry i from the list in the ds_map
			global.playerItemUnlocked[i] = _map[? "playerItemUnlocked"][|i];	
			global.playerAmmo[i] = _map[? "playerAmmo"][|i];
		}
		
		//Get the quest data
		ds_map_copy(global.questStatus, _map[? "questStatus"]);
		
		//Get the room
		scr_RoomTransition(TRANS_TYPE.SLIDE,_map[? "room"]);
		ds_map_destroy(_map);
			
		return true;	
	}
	
	else
	{
		show_debug_message("no save here");
		return false;
	}
	
}

function LoadJSONFromFile (_filename)
{
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;
}