/// @descriprion RoomTransition(type,targetroom)
/// @arg Type
/// @arg TargetRoom
function scr_RoomTransition() {

	if (!instance_exists(obj_transition))
	{
		with (instance_create_depth(0,0,-9999,obj_transition))
		{
			type = argument[0];
			target = argument[1];
		}
	}

	else 
	{
		show_debug_message("Stop doing multiple transitions u ass");
	}




}
