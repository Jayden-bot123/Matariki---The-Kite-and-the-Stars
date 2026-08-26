// If frozen stop all movement
if frozen { 
    hsp = 0;
    vsp = 0;
    exit; // skip rest of step event
}

//Player movement
getControls();
	

//Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;

//Gravity
if coyote_hang_timer > 0
{
	//Count the timer down
	coyote_hang_timer--;
}
else
{
	//Apply gravity to the player
	vsp += grv;
	//We're no longer on the ground
	setOnGround(false);
}


//reset/prreparing jumping variables
if on_ground
{
	jump_count = 0;
	coyote_jump_timer = coyote_jump_frames;
}
else
{
	//If the player is in the air, make sure they can't do an extra jump
	coyote_jump_timer--;
	
	if jump_count ==0 && coyote_jump_timer <= 0 {jump_count = 1; };
}

//Initiate the Jump
if (jump_key_buffered) && jump_count < jump_max
{
	//Reset the buffer
	jump_key_buffered = false;
	jump_key_buffer_timer = 0;	
	
	//Increase the number of performed jumps
	jump_count++;
	
	//set the jump hold timer
	jump_hold_timer = jump_hold_frames;
	//Tell ourself we are no longer on the ground
	setOnGround(false);
	coyote_jump_timer = 0;

}
//Cut off the jump by releasing the jump button
if !key_jump
{
	jump_hold_timer = 0;
}

//Jump based on the timer/holding the button
if jump_hold_timer > 0
{
	//Constantly set the vsp to be jumping speed
	vsp = -3.5
	//Count down the timer
	jump_hold_timer--;
}


//Horizontal Collision
if (place_meeting(x+hsp,y,obj_ground))
{
	while (!place_meeting(x+sign(hsp),y,obj_ground))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
//cap falling speed
if vsp > term_vel {vsp = term_vel; };

//Collision
if (place_meeting(x,y+vsp,obj_ground))
{
	while (!place_meeting(x,y+sign(vsp),obj_ground))
	{
		y = y + sign(vsp);
	}
	
	if vsp < 0
	{
		jump_hold_timer = 0;
	}
	vsp = 0;
}
y = y + vsp;

//Set if I'm on the ground 
if vsp >= 0 && (place_meeting(x,y+1,obj_ground)) 
{
	setOnGround(true);
}



// Set sprite based on state
if hsp != 0 
{
    sprite_index = spr_player_run;
    image_speed = 1.2;
}
if hsp == 0 
{
    sprite_index = spr_player_idle;
    image_speed = 1;
}

// In the air
if !place_meeting(x, y+1, obj_ground)
{
    sprite_index = spr_player_jump;
}

// Override with jump if in air
if !place_meeting(x, y+1, obj_ground) 
{
	sprite_index = spr_player_jump;
	image_speed = 0;
	if vsp < 0 
	{
		image_index = 0; // jumping up frame
	} 
	else
	{
		image_index = 1; // falling down frame
	}
}
// Face direction
if hsp > 0 { face = 1; }
if hsp < 0 { face = -1; }

// Invincibility frames after taking damage
if invincible
{
    inv_timer--;
    flash_timer++;
    
    // Flash between visible and transparent
    if flash_timer mod 6 < 3
    {
        image_alpha = 0.3;
    }
    else
    {
        image_alpha = 1;
    }
    
    // End invincibility
    if inv_timer <= 0
    {
        invincible = false;
        image_alpha = 1;
        flash_timer = 0;
    }
}

// Restart level if no lives left
if hp <= 0
{
    room_restart();
}

// TEMP — press T to test taking damage, remove later
if keyboard_check_pressed(ord("T"))
{
    take_damage();
}

// Set collision mask to idle sprite so hitbox stays consistent
mask_index = spr_player_idle;