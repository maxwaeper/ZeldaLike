/// @description Draw UI

// Draw ui
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFraction = frac(_playerHealth); //returns .x value from number

_playerHealth -= _playerHealthFraction;

for (var i = 1; i <= _playerHealthMax; i++)
{
	var _imageIndex = (i > _playerHealth);	//returns true or false (1 or 0)
	
	if (i == _playerHealth+1)
	{
		_imageIndex += (_playerHealthFraction > 0);
		_imageIndex += (_playerHealthFraction > 0.25);
		_imageIndex += (_playerHealthFraction > 0.5);
	}
	
	draw_sprite(spr_health,_imageIndex,8+((i-1)*20),8);
}

// Coins
var _xx,_yy;

// Coin Icon
_xx = 40;
_yy = 50;
draw_sprite(spr_coinUI,0,_xx,_yy);

// Coin Text
// Better to create a function to draw text on screen
// That's gonna have all this code underneath 
draw_set_color(c_black);
draw_set_font(fnt_text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

_xx += sprite_get_width(spr_coinUI);
_yy = 35;

var _str = string(global.playerMoney);
// Creating black outline
draw_text(_xx+1,_yy,_str);
draw_text(_xx-1,_yy,_str);
draw_text(_xx,_yy+1,_str);
draw_text(_xx,_yy-1,_str);

draw_set_color(c_white);
draw_text(_xx,_yy,_str);

//Draw Item box
_xx = 8;
_yy = 40;

draw_sprite(spr_boxUI,0,_xx,_yy);

if (global.playerHasAnyItems)
{
	draw_sprite(spr_itemUI, global.playerEquipped,_xx,_yy);
	
	if (global.playerAmmo[global.playerEquipped] != -1)
	{
		draw_set_font(fnt_ammo);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_set_color(c_white);
		draw_text
		(
			_xx + sprite_get_width(spr_boxUI)+1,
			_yy + sprite_get_height(spr_boxUI)+1,
			string(global.playerAmmo[global.playerEquipped])
		);
	}
}

//Pause Screen
if (global.gamePaused)
{
	draw_set_color(c_black);
	draw_set_alpha(0.75);
	draw_rectangle(0,0,RESOLUTION_W,RESOLUTION_H,false);
	draw_set_alpha(1.0);
	draw_set_color(c_white);
	draw_set_font(fnt_text);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(RESOLUTION_W*0.5,RESOLUTION_H*0.5,"Game Paused");
	for (var i = 0; i < array_length(pauseOption); i++)
	{
		var _print = "";
		if (i == pauseOptionSelected)
		{
			_print += "> " + pauseOption[i] + " <";
		}
		else
		{
			_print += pauseOption[i];
			draw_set_alpha(0.7);
		}
		draw_text(RESOLUTION_W*0.5, RESOLUTION_H*0.5+18+(i*12),_print);
		draw_set_alpha(1.0);
	}	
}