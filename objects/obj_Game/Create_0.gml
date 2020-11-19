//Starting Room
room_goto(rm_Test_001);

//Debug Flag
global.debug = true;

//Setup Global Reference to Self
global.game_controller = self;

//Controller Profiles
global.controller_profiles = ds_list_create();

//Setup Camera
global.camera = instance_create_depth(0, 0, depth, obj_Camera);

//Freeze Frames
global.freeze_frames = 0;

//Time Dilation
global.time_dilation = 1;