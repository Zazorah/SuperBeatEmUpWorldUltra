//TODO - Might wanna update this to just a hard programmed map because it'll very likely be faster than using this method.

function SetAnimationHitbox(){
	
	///@function Sets the active and passive hitboxes for the current sprite.
	
	var name = sprite_get_name(sprite_index);
	
	///Active
	var active_name = "ahb_" + string_copy(name, 3, string_length(name) - 3);
	
	if(asset_get_index(active_name) != -1)
	{
		active_hitbox = asset_get_index(active_name);
	}
	
	//Passive
	var passive_name = "phb_" + string_copy(name, 3, string_length(name) - 3);
	
	if(asset_get_index(passive_name) != -1)
	{
		passive_hitbox = asset_get_index(passive_name);
	}
	
}