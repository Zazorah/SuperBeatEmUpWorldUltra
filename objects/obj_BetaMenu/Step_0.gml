//Move Cursor
if(keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_left))
{
	option_index--;
	if(option_index < 0) option_index = array_length(contents) - 1;
}
else if(keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_right))
{
	option_index++;
	if(option_index > array_length(contents) - 1) option_index = 0;
}

//Choose Element
if(keyboard_check_pressed(vk_space))
{
	var el = contents[option_index];
	switch(el[0])
	{
		//Load Room
		case OptionType.loadRoom:
			
			room_goto(el[2]);
			
			break;
			
		//Close Game
		case OptionType.closeGame:
		
			game_end();
			
			break;
	}
}