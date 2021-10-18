if (titleVisible > 0)
{
	draw_sprite(spr_title,0,0,-RESOLUTION_H+titleVisible*RESOLUTION_H);
	
	// abs always makes number positive 
	// Flashy text
	//draw_set_alpha(titleVisible*abs(sin(get_timer()*0.000001*pi)));
	//draw_sprite(spr_extrTitle)
}
// Draw Save slots
if (saveSlotsVisible > 0)
{
	draw_set_alpha(saveSlotsVisible);
	for (var _slot = 0; _slot <= 2; _slot++)
	{
		//Draw boxes
		var _y = 16+_slot*48;
		var _x = 160;
		var _img = 2;
		
		if (saveSlotSelected == _slot) _img = 3;
		
		scr_NineSliceBoxStretched(spr_textBox,_x,_y,312,_y+48,_img);
		
		//Draw the save data (if exists)
		draw_set_font(fnt_text);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_color(c_white);
		
		if(slotData[_slot] == -1)
		{
			draw_text(_x+8,_y+8,"New Game");
		}
		else
		{
			draw_text(_x+8,_y+8,RoomToAreaName(slotData[_slot][? "room"]));
			
			var _playerHealth = slotData[_slot][? "playerHealth"];
			var _playerHealthMax = slotData[_slot][? "playerHealthMax"];
			var _playerHealthFrac = frac(_playerHealth);
			_playerHealth -= _playerHealthFrac;
			
			for (var i=1; i<=_playerHealthMax; i++)
			{
				var _imageIndex = (i > _playerHealth);
				
				if (i == _playerHealth+1)
				{
					_imageIndex += (_playerHealthFrac > 0);
					_imageIndex += (_playerHealthFrac > 0.25);
					_imageIndex += (_playerHealthFrac > 0.5);
				}
				
				draw_sprite(spr_health,_imageIndex,_x+48+((i-1)*16),_y+24);
			}
			
			//Draw money
			draw_sprite(spr_coinUI,0,_x+8,_y+28);
			draw_text(_x+20,_y+24,slotData[_slot][? "playerMoney"]);
		}	
		
	}
	
	draw_set_alpha(1.0);
}  