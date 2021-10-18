// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RoomToAreaName(_room)
{
	switch (_room)
	{
		case rm_village: return "The Village"; break;
		case rm_coast: return "The River"; break;
		case rm_cave: return "The Cave"; break;
		case rm_shop: return "The Shop"; break;
		default: return "Unknown"; break;
	}
}