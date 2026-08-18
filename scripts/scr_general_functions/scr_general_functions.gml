function controlsStepup()
{
	buffer_time = 3;
	jump_key_buffered = 0;
	jump_key_buffer_timer = 0;
}

function getControls()
{
	// Directions inputs
	key_left = keyboard_check(vk_left) + keyboard_check(ord("A"));
		key_left = clamp(key_left, 0, 1);
	key_right = keyboard_check(vk_right) + keyboard_check(ord("D"));
		key_right = clamp(key_right, 0, 1);
	
	// Action inputs
	key_jump_pressed = keyboard_check_pressed(vk_space) + keyboard_check_pressed(vk_up) + keyboard_check_pressed(ord("W"));
		key_jump_pressed = clamp(key_jump_pressed, 0, 1);
		
	key_jump = keyboard_check(vk_space) + keyboard_check(vk_up) + keyboard_check(ord("W"));
		key_jump = clamp(key_jump, 0, 1);
		
	//Jump key buffering
	if key_jump_pressed 
	{
		jump_key_buffer_timer = buffer_time;
	}
	if jump_key_buffer_timer > 0
	{
		jump_key_buffered = 1; 
		jump_key_buffer_timer--;
	}
	else
	{
		jump_key_buffered  = 0;
	}


}