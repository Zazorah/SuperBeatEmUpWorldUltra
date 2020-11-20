///Draw Self
surface_set_target(global.ui_surface);

draw_sprite(sprite_index, image_index, 0, 0);

//Draw Player 1 Healthbar
if(global.player1 != noone)
{
	var starting_x = 106; var starting_y = 1; var sep = 8;

	for(var xx = 0; xx < floor(global.player1.hp/2); xx++)
	{
		var frame = (xx*2) > global.player1.hp ? 1 : 0;
		show_debug_message("HP: " + string(global.player1.hp) + " XX: " + string(xx*2));
		draw_sprite(spr_UI_P1HealthChunk, frame, starting_x + (xx*sep), starting_y);
	}
}

surface_reset_target();