//Set Animation Speed
image_speed = 1 * global.time_dilation;

//Draw Shadow
//TODO - Should probably just be a script.
var shadow_width = 36 * (y/z);
var shadow_height = 12 * (y/z);
var shadow_xoffset = -2; var shadow_yoffset = -2;
var x1 = x - shadow_width/2 + shadow_xoffset; var x2 = x + shadow_width/2 + shadow_xoffset;
var y1 = y - shadow_height/2 + shadow_yoffset; var y2 = y + shadow_height/2 + shadow_yoffset; 
draw_set_alpha(0.5);
draw_ellipse_color(x1, y1, x2, y2, c_dkgray, c_dkgray, false);
draw_set_alpha(1);

//Draw Hitboxes
if(global.debug)
{
	if(active_hitbox != noone)
	{
		draw_sprite_ext(active_hitbox, image_index, x, y, xscale * image_xscale * dir_facing, yscale * image_yscale, image_angle, image_blend, 0.5);
	}
	
	if(passive_hitbox != noone)
	{
		draw_sprite_ext(passive_hitbox, image_index, x, y, xscale * image_xscale * dir_facing, yscale * image_yscale, image_angle, image_blend, 0.5);
	}
}

//Draw Self
draw_sprite_ext(sprite_index, image_index, x, y, xscale * image_xscale * dir_facing, yscale * image_yscale, image_angle, image_blend, image_alpha);