//States
enum EnemyStates {
	
	Normal, //Jus' walkin around lining themselves up for attacks I guess
	Hit, //Stunned from a punch
	Attack, //Attacking a player 
	Dead // U _ U
}

//Hitboxes
active_hitbox = noone;
passive_hitbox = noone;

//Stats
hp = 5;
strength = 1;