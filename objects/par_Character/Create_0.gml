// This will probably be done elsewhere
global.player1 = self;

//Variables ----------------

//Movement
hspd = 0; vspd = 0; zspd = 0;
yoffset = 0;
z = y; z_depth = 4;
dir_facing = 1; dir_facing_set = 1;
ground_height = 0;

//Controls
controller_profile = global.control_profiles[| 0];

//Stats
hp = 14; hp_max = 14;

//Hitboxes
active_hitbox = noone;
passive_hitbox = phb_Nicholas_Idle;

//Animation
xscale = 1; yscale = 1;

idle_sprite = spr_Nicholas_Idle;
walk_sprite = spr_Nicholas_Walk;
jump_sprite = spr_Nicholas_Jump;
land_sprite = spr_Nicholas_Land;
combo_1_sprite = spr_Nicholas_Combo1;
combo_2_sprite = spr_Nicholas_Combo2;
combo_3_sprite = spr_Nicholas_Combo3;
hit_sprite = spr_Nicholas_Hit;
sprint_sprite = spr_Nicholas_Sprint;
sprint_attack_sprite = spr_Nicholas_Sprint_Attack;
jump_attack_sprite = spr_Nicholas_Jump_Attack;

SetSprite(idle_sprite);

last_sprite = sprite_index;
hold_last_frame = false; //If true, holds on last frame when animation is done playing.

//State Machine
enum PlayerStates {
	Normal,							// Walking around swingin and hittin stuff
	Sprinting,						// Sprinting. It's like walking but cooler!
	Sprinting_Attack,		// Attacking out of a sprinting state
	Jumping,						// Jumping or falling off an elevated platform
	Jumping_Attack,			// Attacking out of a jumping state
	Attacking,						// Doing an attack animation
	Landing,						// Short recovery period after landing from a jump or fall
	Stunned,						// Stunned from an attack and unable to do inputs
	Floored,							// Knocked to the floor, stunned momentarily, but then able to get up
	Dead								// :(
}

state = PlayerStates.Normal;

//Attacks
attack_connected = true; //Wether or not the current attack connected with an enemy. Used to continue 3-Hit combo.

//Functions ----------------
function GetHit(attacker, flung)
{
	///@function Get hit by enemy and take damage and maybe fall potentially.
	
	if(attacker == noone) ///Probably only using this for Debug purposes. attacker should be an object reference.
	{
		hspd = -dir_facing_set * 8;
		hp -= 1;
	}
	
	else
	{
		hp -= attacker.attack_damage;
		hspd = sign(attacker.x - x) * 2;
	}
	
	state = PlayerStates.Stunned;
	alarm[0] = 15;
	sprite_index = hit_sprite;
}