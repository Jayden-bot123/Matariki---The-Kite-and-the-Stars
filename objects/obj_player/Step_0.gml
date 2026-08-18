//Player movement
getControls();
	

//Calculate Movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_ground)) && (jump_key_buffered)
{
	//Reset the buffer
	jump_key_buffered = false;
	jump_key_buffer_timer = 0;	
	vsp = -4.5;

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
	vsp = 0;
}
y = y + vsp;

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

// Set collision mask to idle sprite so hitbox stays consistent
mask_index = spr_player_idle;