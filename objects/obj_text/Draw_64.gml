/// @description Draw Textbox
scr_NineSliceBoxStretched(spr_textBox,x1,y1,x2,y2,backgroundSprite);
draw_set_font(fnt_text); //Call these 4 functions each time you draw a text
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black); 

var _print = string_copy(message,1,textProgress); //Even though you start from the start of the string you still provide 1 as a start not a 0

if (responses[0] != -1) && (textProgress >= string_length(message))//That result will be if we won't have anything in the array
// second condition is to check if we displayed all previous text before going to show response options
{
	for (var i = 0; i < array_length_1d(responses);i++)
	{
		_print += "\n"; // Thats for a new line
		if (i == responseSelected) _print += "> ";
		
		_print += responses[i];
		
	}
}


draw_text((x1+x2)/2, y1+8, _print);

draw_set_color(c_white);
draw_text((x1+x2)/2,y1+7,_print);
