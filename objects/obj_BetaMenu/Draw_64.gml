surface_set_target(global.ui_surface);

draw_set_font(fnt_Debug);
draw_set_color(c_white);

//Draw Options Menu
for(var i = 0; i < array_length(contents); i++)
{
	var element = contents[i];
	var str = element[1];
	
	if(i == option_index) str = "> " + str;
	draw_text(24, 28 * i + 20, str);
}

surface_reset_target();