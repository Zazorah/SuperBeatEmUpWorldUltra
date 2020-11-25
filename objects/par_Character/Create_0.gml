// This will probably be done elsewhere
global.player1 = self;

//Variables ----------------

//Movement
hspd = 0; vspd = 0; zspd = 0;
yoffset = 0;
z = y;
dir_facing = 1; dir_facing_set = 1;
ground_height = 0;

//Controls
controller_profile = global.control_profiles[| 0];

//Stats
hp = 14; hp_max = 14;

//Animation
xscale = 1; yscale = 1;

idle_sprite = spr_Nicholas_Idle;
walk_sprite = spr_Nicholas_Walk;
jump_sprite = spr_Nicholas_Jump;
land_sprite = spr_Nicholas_Land;
hit_sprite = spr_Nicholas_Hit;
sprint_sprite = spr_Nicholas_Sprint;
sprint_attack_sprite = spr_Nicholas_Sprint_Attack;
jump_attack_sprite = spr_Nicholas_Jump_Attack;

last_sprite = sprite_index;
hold_last_frame = false; //If true, holds on last frame when animation is done playing.

//State Machine
enum PlayerStates {
	Normal,							//Walking around swingin and hittin stuff
	Sprinting,						//Sprinting. It's like walking but cooler!
	Sprinting_Attack,		//Attacking out of a sprinting state
	Jumping,						//Jumping or falling off an elevated platform
	Jumping_Attack,			//Attacking out of a jumping state
	Landing,						//Short recovery period after landing from a jump or fall
	Stunned,						//Stunned from an attack and unable to do inputs
	Floored,							//Knocked to the floor, stunned momentarily, but then able to get up
	Dead								//Dead :(
}

state = PlayerStates.Normal;

//Hitboxes
active_hitbox = noone;
passive_hitbox = noone;

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