enum ControllerTypes {
	Keyboard,
	XInputController,
	DSController
}

//Starting Room
room_goto(rm_DebugMenu);

//Debug Flag
global.debug = false;

//Setup Global Reference to Self
global.game_controller = self;

//Controller Profiles
global.control_profiles = ds_list_create();
keyboard_profile_created = false; created_controller = ds_list_create();

function profileExists(type, index)
{
	///Returns wether or not a controller profile exists already.
	
	for(var i = 0; i < ds_list_size(global.control_profiles); i++)
	{
		var profile = global.control_profiles[| i];
		
		if(profile.type == type and profile.index == index)
		{
			return true;
		}
	}
	
	return false;
}

function createProfile(type, index)
{
	///Creates a new controller profile and adds it to the list.
	
	var profile = instance_create_depth(0, 0, 0, obj_ControlProfile);
	
	profile.type = type;
	profile.index = index;
	
	show_debug_message("New controller profile created!");
	
	ds_list_add(global.control_profiles, profile);
}

//Setup Camera
global.camera = instance_create_depth(0, 0, depth, obj_Camera);

//Freeze Frames
global.freeze_frames = 0;

//Time Dilation
global.time_dilation = 1;

//UI Surface
global.ui_surface = surface_create(global.camera.view_width, global.camera.view_height);
global.ui_surface_alpha = 1;

//Players
global.player1 = noone;
global.player2 = noone;