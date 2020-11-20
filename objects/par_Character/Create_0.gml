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
controller_profile = noone;

//Stats
hp = 14; hp_max = 14;

//Animation
xscale = 1; yscale = 1;

idle_sprite = spr_Nicholas_Idle;
walk_sprite = spr_Nicholas_Walk;
jump_sprite = spr_Nicholas_Jump;
land_sprite = spr_Nicholas_Idle;
hit_sprite = spr_Nicholas_Hit;

last_sprite = sprite_index;

//State Machine
enum PlayerStates {
	Normal,		//Walking around swingin and hittin stuff
	Jumping,	//Jumping or falling off an elevated platform
	Landing,	//Short recovery period after landing from a jump or fall
	Stunned,	//Stunned from an attack and unable to do inputs
	Floored,		//Knocked to the floor, stunned momentarily, but then able to get up
	Dead			//Dead :(
}

state = PlayerStates.Normal;

//Hitboxes
active_hitbox = noone;
passive_hitbox = noone;

//Functions ----------------
function ApplyMovement()
{
	///@function Applies movment values to update the object's position.
	
	
}

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