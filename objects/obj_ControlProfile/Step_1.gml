///Reset Double Pressed
double_pressed_down = false;
double_pressed_left = false;
double_pressed_right = false;
double_pressed_up = false;

//Set Input Values
if(type != noone)
{
	if(type == ControllerTypes.Keyboard)
	{
		left_pressed = keyboard_check_pressed(left_button);
		right_pressed = keyboard_check_pressed(right_button);
		up_pressed = keyboard_check_pressed(up_button);
		down_pressed = keyboard_check_pressed(down_button);
		jump_pressed = keyboard_check_pressed(jump_button);
	
		left_held = keyboard_check(left_button);
		right_held = keyboard_check(right_button);
		up_held = keyboard_check(up_button);
		down_held = keyboard_check(down_button);
	
		left_released = keyboard_check_released(left_button);
		right_released = keyboard_check_released(right_button);
		up_released = keyboard_check_released(up_button);
		down_released = keyboard_check_released(down_button);
	}
	
	else if(type == ControllerTypes.XInputController or type == ControllerTypes.DSController)
	{
		//Gamepad input
	}
}

//Set Double Pressed
if(left_pressed)
{
	if(double_pressed == left_button)
	{
		double_pressed_left = true;
	}
	
	double_pressed = left_button;
	alarm[1] = 10;
}
else if(right_pressed)
{
	if(double_pressed == right_button)
	{
		double_pressed_right = true;
	}
	
	double_pressed = right_button;
	alarm[1] = 10;
}
else if(up_pressed)
{
	if(double_pressed == up_button)
	{
		double_pressed_up = true;
	}
	
	double_pressed = up_button;
	alarm[1] = 10;
}
else if(down_pressed)
{
	if(double_pressed == down_button)
	{
		double_pressed_down = true;
	}
	
	double_pressed = down_button;
	alarm[1] = 10;
}