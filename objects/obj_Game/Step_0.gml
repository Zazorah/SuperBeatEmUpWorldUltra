///Freeze Frames
if(global.freeze_frames > 0) global.freeze_frames--;

//Create New Controller Profiles on New Inputs
if(keyboard_check_pressed(vk_anykey) and !keyboard_profile_created)
{
	createProfile(ControllerTypes.Keyboard, noone);
	keyboard_profile_created = true;
}
