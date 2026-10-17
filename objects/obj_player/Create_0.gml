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
jump_hold_frames = 8.5;

frozen = false;


//Coyote Time
//Hang time
coyote_hang_frames = 2;
coyote_hang_timer = 0;
//Jump buffer time
coyote_jump_frames = 5;
coyote_jump_timer = 0;

// Hearts and damage
hp = 3;
max_hp = 3;
// Knockback variables
knockback_hsp = 0;
knockback_timer = 0;

// Invincibility
invincible = false;
inv_timer = 0;
inv_duration = 90;
flash_timer = 0;

hascontrol = true;

// GAME OVER / DEATH

dying = false;
death_on_ground = false;

gameover_alpha = 0;
gameover_button_alpha = 0;

gameover_button_delay = 60; // 1 second before buttons appear

gameover_cursor = 0;

// 0 = Restart
// 1 = Main Menu
// 2 = Quit

gameover_control = false;

gameover_selected = false;

death_frame = 0;

// PAUSE SYSTEM

global.paused = false;

pause_alpha = 0;
pause_button_alpha = 0;
pause_button_delay = 20;

pause_cursor = 0;

// 0 = Resume
// 1 = Restart
// 2 = Main Menu

pause_selected = false;

// SLIPPERY GROUND

slip_jump_active = false;
slip_jump_moving = false;

// AUDIO
walk_sound_instance = -1;

// WALKING SOUND TIMER
walk_sound_timer = 0;
walk_sound_interval = 12; // 0.2 seconds at 60 FPS

pause_previous_cursor = -1;
gameover_previous_cursor = -1;

// Game-over sound tracking
gameover_sound_played = false;