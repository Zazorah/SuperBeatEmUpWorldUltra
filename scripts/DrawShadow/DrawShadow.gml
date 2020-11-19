// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawShadow(){
	
	var shadow_width = (sprite_width + 8) * (y/z);
	var shadow_height = 12 * (y/z);
	var shadow_xoffset = -2; var shadow_yoffset = -2;
	var x1 = x - shadow_width/2 + shadow_xoffset; var x2 = x + shadow_width/2 + shadow_xoffset;
	var y1 = y - shadow_height/2 + shadow_yoffset - yoffset; var y2 = y + shadow_height/2 + shadow_yoffset - yoffset; 
	draw_set_alpha(0.5);
	draw_ellipse_color(x1, y1, x2, y2, c_dkgray, c_dkgray, false);
	draw_set_alpha(1);

}