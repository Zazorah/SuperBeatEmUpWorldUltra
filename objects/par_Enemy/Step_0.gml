if(global.freeze_frames == 0)
{
	//Normal State
	if(state = EnemyStates.Normal)
	{
		//Slow to a Stop
		if(hspd > 0)
		{
			hspd = max(hspd - 1, 0);
		}
			
		if(hspd < 0)
		{
			hspd = min(hspd + 1, 0);
		}
	}

	else if(state == EnemyStates.Stunned)
	{
		//Slow to a Stop
		if(hspd > 0)
		{
			hspd = max(hspd - 1, 0);
		}
			
		if(hspd < 0)
		{
			hspd = min(hspd + 1, 0);
		}
	}

	//Apply Speeds
	if(global.freeze_frames == 0)
	{
		x += hspd * global.time_dilation;
		z += zspd * global.time_dilation;
	
		y = z + yoffset;
	}

	//Set Draw Depth
	depth = -z;

	//Decrease I-Frames
	if(i_frames > 0) i_frames--;
}