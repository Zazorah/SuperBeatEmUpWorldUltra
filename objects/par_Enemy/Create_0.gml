//States
enum EnemyStates {
	
	Normal, //Jus' walkin around lining themselves up for attacks I guess
	Stunned, //Stunned from a punch
	Attack, //Attacking a player 
	Dead // U _ U
}
state = EnemyStates.Normal;

//Hitboxes
active_hitbox = noone;
passive_hitbox = noone;
i_frames = 0;

//Stats
hp = 5;
strength = 1;
defense = 0;

//Draw
xscale = 1;
yscale = 1;

//Position
z = y; z_depth = 20;
yoffset = 0;
hspd = 0; vspd = 0; zspd = 0;

//Function ----
function GetHit(attacker, damage, effect)
{
	i_frames = 2;
	
	//Set HSPD
	hspd = attacker.hspd + (sign(attacker.hspd) * 2);
	
	//Take Damage
	hp -= damage;
	
	//Apply Effect
	switch(effect)
	{
		case AttackEffects.Normal:
			
			state = EnemyStates.Stunned;
			alarm[0] = 30;
			
			break;
	}
}