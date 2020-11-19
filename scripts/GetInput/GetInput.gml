// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetInput(){
	
	///TODO - If input is from a new device create a 'controller profile' that handles inputs and allows for 
	///               rebinding of controls.

	left_pressed = keyboard_check_pressed(vk_left);
	right_pressed = keyboard_check_pressed(vk_right);
	up_pressed = keyboard_check_pressed(vk_up);
	down_pressed = keyboard_check_pressed(vk_down);
	
	left_held = keyboard_check(vk_left);
	right_held = keyboard_check(vk_right);
	up_held = keyboard_check(vk_up);
	down_held = keyboard_check(vk_down);
	
	left_released = keyboard_check_released(vk_left);
	right_released = keyboard_check_released(vk_right);
	up_released = keyboard_check_released(vk_up);
	down_released = keyboard_check_released(vk_down);
}