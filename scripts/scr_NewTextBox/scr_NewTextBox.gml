function scr_NewTextBox()
{
	var _object;

	if (instance_exists(obj_text)) _object = obj_textQueue;

	else _object = obj_text;

	with (instance_create_layer(0,0,"Instances",_object)) //We can combine create instance in with and do something with new instance immediately
	{
		message = argument[0];
	
		//This way we reach out of the script and can get the id of whatever object has called it, will be useful later on in the dialouge system
		if (instance_exists(other)) originInstance = other.id;
	
		else originInstance = noone;
	
	
		if (argument_count > 1) backgroundSprite = argument[1];
	
		else backgroundSprite = 1;
	
		if (argument_count > 2)
		{
			responses = argument[2];
			//destroy markers for responses in array
			for (var i = 0; i <array_length_1d(responses); i++)
			{
				var _markerPosition = string_pos(":",responses[i]);
				responseScripts[i] = real(string_copy(responses[i],1,_markerPosition-1)); //We get the number before the string
			
				responses[i] = string_delete(responses[i],1,_markerPosition);
			}
		
		}
	
		else
		{
			responses = [-1];
			responseScripts = [-1];
		}	
	}


	with (obj_player)
	{
		if (state != scr_PlayerStateLocked)
		{
			lastState = state; 
			state = scr_PlayerStateLocked;
		}
	}



}
