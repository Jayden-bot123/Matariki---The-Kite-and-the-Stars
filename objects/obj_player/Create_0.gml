//Custom functions for player
function setOnGround(_val = true)
{
	if _val == true
	{
		on_ground = true;
		coyote_hang_timer = coyote_hang_frames;
		
	} else {
		on_ground = false;
		coyote_hang_timer = 0;
	}
}
//Control Setup
controlsStepup();

//horizontal speed of the player
hsp = 0;
//vertical speed of the player
vsp = 0;
//gravity
grv = 0.3;
//walk speed. The speed we want the player to move
walksp = 3;
//flips the player sprite when moving left and right
face = 1;
//terminal velocity makes sure that the player has a cap speed when falling
term_vel = 4;

on_ground = true;

jump_max = 1;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames = 7.5;


//Coyote Time
//Hang time
coyote_hang_frames = 2;
coyote_hang_timer = 0;
//Jump buffer time
coyote_jump_frames = 5;
coyote_jump_timer = 0;