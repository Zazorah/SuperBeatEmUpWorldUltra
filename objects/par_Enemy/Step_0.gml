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

else if(state == EnemyStates.Launched)
{
	//Movement
	yoffset += yspd;
	yspd+= 0.6;
	
	//Fall Back Down
	if(yoffset >= ground_height)
	{
		//Land
		if(yoffset >= 0)
		{
			yoffset = 0;
			yspd = 0;
			yscale = 0.8; xscale = 1.2;
			alarm[0] = 12;
			
			state = EnemyStates.Floored;
		}
	}
}

else if(state == EnemyStates.Floored)
{
	//Stop
	hspd = 0;
}

//Apply Speeds
if(global.freeze_frames == 0)
{
	x += hspd * global.time_dilation;
	z += zspd * global.time_dilation;
	
	y = z + yoffset;
}

//Lerp Scales
xscale = lerp(xscale, 1, 0.2);
yscale = lerp(yscale, 1, 0.2);

//Set Draw Depth
depth = -z;

//Decrease I-Frames
if(i_frames > 0) i_frames--;