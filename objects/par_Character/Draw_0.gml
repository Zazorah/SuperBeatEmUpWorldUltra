//Set Animation Speed
image_speed = 1 * global.time_dilation;

//Draw Shadow
DrawShadow();

//Draw Hitboxes
if(global.debug)
{
	if(active_hitbox != noone)
	{
		show_debug_message("Hitbox Hitbox Hitbox");
		draw_sprite_ext(active_hitbox, image_index, x, y, xscale * image_xscale * dir_facing, yscale * image_yscale, image_angle, image_blend, 0.5);
	}
	
	if(passive_hitbox != noone)
	{
		draw_sprite_ext(passive_hitbox, image_index, x, y, xscale * image_xscale * dir_facing, yscale * image_yscale, image_angle, image_blend, 0.5);
	}
}

//Draw Self
draw_sprite_ext(sprite_index, image_index, x, y, xscale * image_xscale * dir_facing, yscale * image_yscale, image_angle, image_blend, image_alpha);