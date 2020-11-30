
function SetSprite(spr){

	/// Used for changing the sprite of an object so that hitboxes can be reset as little as possible.
	
	if(sprite_index != spr)
	{
		image_index = 0;
		sprite_index = spr;
		
		SetAnimationHitbox(sprite_get_name(spr));
	}
}