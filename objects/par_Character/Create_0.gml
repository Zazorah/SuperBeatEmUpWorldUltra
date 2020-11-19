//Variables ----------------

//Movement
hspd = 0; vspd = 0; zspd = 0;
y_offset = 0;
z = y;
dir_facing = 1; dir_facing_set = 1;

//Controls
controller_profile = noone;

//Animation
xscale = 1; yscale = 1;

idle_sprite = spr_Nicholas_Idle;
walk_sprite = spr_Nicholas_Walk;
jump_sprite = spr_Nicholas_Idle;

last_sprite = sprite_index;

//State Machine
enum PlayerStates {
	Normal,		//Walking around swingin and hittin stuff
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