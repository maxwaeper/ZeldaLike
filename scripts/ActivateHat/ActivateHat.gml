function ActivateHat()
{
	var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == obj_hat);
	
	switch (global.questStatus[? "TheHatQuest"])
	{
		case 0: //not started 
		{
			//P akready brought in the hat
			if (_hasHat)
			{
				scr_NewTextBox("Hey man! That's my hat! Give it here.",2);
				scr_NewTextBox("Sick.",2);
				
				global.questStatus[? "TheHatQuest"] = 2;
				
				with (obj_questNPC) sprite_index = spr_NPCWithHat;
				with (obj_hat) instance_destroy();
				global.iLifted = noone;
				//Change player sprite back to normal
			}
			
			else
			{
				scr_NewTextBox("Hello there! Bring me my hat pendeho.",2);
				scr_NewTextBox("Now!!!",2,["4:Yeah, alright, playa.","5:Man fuck you!"]);
			}
		}break;
		
		case 1:
		{
			if (_hasHat)
			{
				scr_NewTextBox("Majestic! That's the hat dude.",2);
				scr_NewTextBox("Sick.",2);
				
				global.questStatus[? "TheHatQuest"] = 2;
				
				with (obj_questNPC) sprite_index = spr_NPCWithHat;
				with (obj_hat) instance_destroy();
				global.iLifted = noone;
				//Change player sprite back to normal
			}
			
			else
			{
				scr_NewTextBox("I've told you where it is. Go!",2);
				scr_NewTextBox("And bring some bombs there, will ya",2);
			}
		}break;
		
		case 2:
		{
			scr_NewTextBox("Now we talking, good jobe ninja!",2);
		}break;
	}
}