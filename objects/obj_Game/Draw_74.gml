if(!surface_exists(global.ui_surface))
{
	global.ui_surface = surface_create(global.camera.view_width, global.camera.view_height);
}
///Draw Clear on UI Surface
surface_set_target(global.ui_surface);

draw_clear_alpha(c_dkgray, 0);

surface_reset_target();