//Settings
var horizontal_spd_cap = 2;
var sprinting_spd_cap = 4;
var vertical_spd_cap = 1;
var jump_height = 6;

//Normal Movement
if(state == PlayerStates.Normal)
{
	//Move Left
	if(controller_profile.left_held)
	{
		sprite_index = walk_sprite;
		
		hspd = max(-horizontal_spd_cap, hspd - 1);
		
		if(dir_facing_set == 1)
		{
			xscale = 0.8;
			yscale = 1.2;
		}
		
		dir_facing_set = -1;
	}
	
	//Move Right
	else if(controller_profile.right_held)
	{
		sprite_index = walk_sprite;
		
		hspd = min(horizontal_spd_cap, hspd + 1);
		
		if(dir_facing_set == -1)
		{
			xscale = 0.8;
			yscale = 1.2;
		}
		
		dir_facing_set = 1;
	}
	
	//Walk Up
	if(controller_profile.up_held)
	{
		sprite_index = walk_sprite;
		
		zspd  = max(-vertical_spd_cap, zspd - 1);
	}
	
	//Walk Down
	else if(controller_profile.down_held)
	{
		sprite_index = walk_sprite;
		
		zspd = min(vertical_spd_cap, zspd + 1);
	}
	
	//No Vertical Pressed
	if(!controller_profile.up_held and !controller_profile.down_held)
	{
		//Decrease ZSPD
		if(zspd != 0)
		{
			if(zspd > 0)
			{
				zspd = max(zspd - 1, 0);
			}
			
			if(zspd < 0)
			{
				zspd = min(zspd + 1, 0);
			}
		}
	}
	
	//No Horizontal Pressed
	if(!controller_profile.right_held and !controller_profile.left_held)
	{
		//Decrease HSPD
		if(hspd != 0)
		{
			if(hspd > 0)
			{
				hspd = max(hspd - 2, 0);
			}
			
			if(hspd < 0)
			{
				hspd = min(hspd + 2, 0);
			}
		}
	}
	
	//Idle Animation Set
	if(hspd == 0 and zspd == 0)
	{
		sprite_index = idle_sprite;
	}
	
	//Jump
	if(controller_profile.jump_pressed)
	{
		yspd = -jump_height;
		state = PlayerStates.Jumping;
	}
	
	//Enter Sprinting State
	if(controller_profile.double_pressed_right)
	{
		state = PlayerStates.Sprinting;
		dir_facing_set = 1;
	}
	
	else if(controller_profile.double_pressed_left)
	{
		state = PlayerStates.Sprinting;
		dir_facing_set = -1;
	}
}

//Sprinting
if(state == PlayerStates.Sprinting)
{
	//Set Speed
	hspd = dir_facing_set * sprinting_spd_cap;
	
	//Set Animation
	sprite_index = sprint_sprite;
	
	//Walk Up
	if(controller_profile.up_held)
	{
		zspd  = max(-vertical_spd_cap, zspd - 1);
	}
	
	//Walk Down
	else if(controller_profile.down_held)
	{
		zspd = min(vertical_spd_cap, zspd + 1);
	}
	
	//No Vertical Pressed
	if(!controller_profile.up_held and !controller_profile.down_held)
	{
		//Decrease ZSPD
		if(zspd != 0)
		{
			if(zspd > 0)
			{
				zspd = max(zspd - 1, 0);
			}
			
			if(zspd < 0)
			{
				zspd = min(zspd + 1, 0);
			}
		}
	}
	
	//Jump
	if(controller_profile.jump_pressed)
	{
		yspd = -jump_height;
		state = PlayerStates.Jumping;
	}
	
	//Exit State
	if((controller_profile.left_released and dir_facing_set == -1) or (controller_profile.right_released and dir_facing_set == 1))
	{
		state = PlayerStates.Normal;
	}
}

//Jumping
else if(state == PlayerStates.Jumping)
{
	//Movement
	yoffset += yspd;
	yspd+= 0.3;
	
	//Animation
	sprite_index = jump_sprite;
	
	if(yspd < 0) { image_index = 0; }
	if(yspd > 0) { image_index = 1; }
	
	//Fall Back Down
	if(yoffset >= ground_height)
	{
		//Land
		if(yoffset >= 0)
		{
			yoffset = 0;
			yspd = 0;
			yscale = 0.8; xscale = 1.2;
			alarm[0] = 12;
			
			state = PlayerStates.Landing;
		}
	}
}

//Landing
else if(state == PlayerStates.Landing)
{
	//Play Animation
	sprite_index = land_sprite;
	
	//Freeze in Place
	hspd = 0; zspd = 0;
}

//Stunned
else if(state == PlayerStates.Stunned)
{
	if(global.freeze_frames == 0)
	{
		//Decrease ZSPD
		if(zspd != 0)
		{
			if(zspd > 0)
			{
				zspd = max(zspd - 1, 0);
			}
			
			if(zspd < 0)
			{
				zspd = min(zspd + 1, 0);
			}
		}
	
		//Decrease HSPD
		if(hspd != 0)
		{
			if(hspd > 0)
			{
				hspd = max(hspd - 2, 0);
			}
			
			if(hspd < 0)
			{
				hspd = min(hspd + 2, 0);
			}
		}
	}
}

//Lerp Facing
dir_facing = dir_facing_set;

//Lerp Scales
xscale = lerp(xscale, 1, 0.2);
yscale = lerp(yscale, 1, 0.2);

//Collision

//Apply Speeds
if(global.freeze_frames == 0)
{
	x += hspd * global.time_dilation;
	z += zspd * global.time_dilation;
	
	y = z + yoffset;
}