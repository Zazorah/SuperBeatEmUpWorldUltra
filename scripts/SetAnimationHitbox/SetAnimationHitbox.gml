//TODO - Might wanna update this to just a hard programmed map because it'll very likely be faster than using this method.

function SetAnimationHitbox(name){
	
	///@function Sets the active and passive hitboxes for the current sprite.
	
	///Active
	var active_name = "ahb_" + string_copy(name, 5, string_length(name));
	
	if(asset_get_index(active_name) != -1)
	{
		active_hitbox = asset_get_index(active_name);
	}
	else
	{
		active_hitbox = noone;
	}
	
	//Passive
	var passive_name = "phb_" + string_copy(name, 5, string_length(name));
	
	if(asset_get_index(passive_name) != -1)
	{
		passive_hitbox = asset_get_index(passive_name);
	}
	//Passive Hitbox doesn't get reset to none as not many are needed and we don't really need to change it often.
}