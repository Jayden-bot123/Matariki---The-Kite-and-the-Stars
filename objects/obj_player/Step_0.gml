// PAUSE SYSTEM

if !dying
{
    // Press ESC to pause / unpause
    if keyboard_check_pressed(vk_escape)
    {
        global.paused = !global.paused;

        if global.paused
        {
            // Reset pause screen
            pause_alpha = 0;
            pause_button_alpha = 0;
            pause_button_delay = 20;
            pause_cursor = 0;
            pause_selected = false;

            // Stop player movement
            hsp = 0;
            vsp = 0;
        }
    }
}


// PAUSED

if global.paused
{
    // Keep player completely still
    hsp = 0;
    vsp = 0;

    // Fade in pause screen
    if pause_alpha < 0.85
    {
        pause_alpha += 0.02;
    }

    // Wait before showing buttons
    if pause_alpha >= 0.85
    {
        if pause_button_delay > 0
        {
            pause_button_delay--;
        }
        else
        {
            pause_button_alpha += 0.03;

            if pause_button_alpha >= 1
            {
                pause_button_alpha = 1;
            }
        }
    }

    // PAUSE MENU CONTROLS

    if pause_button_alpha >= 1
    {
        if keyboard_check_pressed(vk_up)
        {
            pause_cursor--;

            if pause_cursor < 0
            {
                pause_cursor = 2;
            }
        }

        if keyboard_check_pressed(vk_down)
        {
            pause_cursor++;

            if pause_cursor > 2
            {
                pause_cursor = 0;
            }
        }

        if keyboard_check_pressed(vk_enter)
        {
            pause_selected = true;

            switch (pause_cursor)
            {
                // RESUME
                case 0:
                {
                    global.paused = false;
                    break;
                }

                // RESTART
                case 1:
                {
                    scr_slide_transition(TRANS_MODE.RESTART);
                    break;
                }

                // MAIN MENU
                case 2:
                {
                    scr_slide_transition(TRANS_MODE.GOTO, rm_main_menu);
                    break;
                }
            }
        }
    }

    exit;
}


// GAME OVER DEATH SEQUENCE

if dying
{
    // Player has already landed or fallen out of the level
    if death_on_ground && !gameover_selected
    {
        hsp = 0;
        vsp = 0;

        // Show death sprite
        sprite_index = spr_player_death;
        image_speed = 0;
        image_index = death_frame;

        // Fade in black overlay
        if gameover_alpha < 0.85
        {
            gameover_alpha += 0.02;
        }

        // Wait before showing buttons
        if gameover_alpha >= 0.85
        {
            if gameover_button_delay > 0
            {
                gameover_button_delay--;
            }
            else
            {
                gameover_button_alpha += 0.03;

                if gameover_button_alpha >= 1
                {
                    gameover_button_alpha = 1;
                    gameover_control = true;
                }
            }
        }

        // GAME OVER keyboard controls

        if gameover_control
        {
            if keyboard_check_pressed(vk_up)
            {
                gameover_cursor--;

                if gameover_cursor < 0
                {
                    gameover_cursor = 2;
                }
            }

            if keyboard_check_pressed(vk_down)
            {
                gameover_cursor++;

                if gameover_cursor > 2
                {
                    gameover_cursor = 0;
                }
            }

            if keyboard_check_pressed(vk_enter)
            {
                gameover_selected = true;

                switch (gameover_cursor)
                {
                    case 0:
                    {
                        scr_slide_transition(TRANS_MODE.RESTART);
                        break;
                    }

                    case 1:
                    {
                        scr_slide_transition(TRANS_MODE.GOTO, rm_main_menu);
                        break;
                    }

                    case 2:
                    {
                        game_end();
                        break;
                    }
                }
            }
        }

        // Don't run normal player movement
        exit;
    }
}


// IF FROZEN STOP ALL MOVEMENT

if frozen
{
    hsp = 0;
    vsp = 0;
    exit;
}


// GET CONTROLS

if hascontrol
{
    getControls();
}
else
{
    key_right = 0;
    key_left = 0;
    key_jump = 0;
}


// APPLY KNOCKBACK

if knockback_timer > 0
{
    knockback_timer--;
    hsp = knockback_hsp;
}
else
{
    var move = key_right - key_left;
	
	// WIND EFFECT

	if room == rm_level5
	{
	    if !on_ground
	    {
	        hsp += global.wind_force * 0.1;
	    }
	}

    // Check ONLY for slippery ground
    var on_slippery = place_meeting(
        x,
        y + 1,
        obj_ground_slippery
    );

    if on_ground && on_slippery
    {
        // OILED / VERY SLIPPERY GROUND

        var slippery_acceleration = 0.25;
        var slippery_friction = 0.98;

        // Accelerate towards the direction being pressed
        if move != 0
        {
            hsp += move * slippery_acceleration;

            // Keep slippery running speed reasonable
            hsp = clamp(hsp, -walksp, walksp);
        }
        else
        {
            // Slowly lose momentum when no direction is pressed
            hsp *= slippery_friction;

            // Stop tiny leftover movement
            if abs(hsp) < 0.07
            {
                hsp = 0;
            }
        }
    }
    else
    {
        // This handles ALL normal ground and ALL airborne movement.

        hsp = move * walksp;
		// WIND EFFECT

		if room == rm_level5
		{
		    if !on_ground
		    {
		        hsp += global.wind_force * 0.18;
		    }
		}
    }
}


// REMEMBER IF PLAYER WAS AIRBORNE

var was_airborne = !on_ground;


// GRAVITY

if coyote_hang_timer > 0
{
    coyote_hang_timer--;
}
else
{
    vsp += grv;
    setOnGround(false);
}


// FALL OUT OF LEVEL WHILE ALIVE

if !dying && y > room_height + 32
{
    hp = 0;

    dying = true;
    death_on_ground = true;

    hascontrol = false;
    frozen = false;

    invincible = false;
    inv_timer = 0;
    flash_timer = 0;
    image_alpha = 1;

    hsp = 0;
    vsp = 0;

    if face == 1
    {
        death_frame = 0;
    }
    else
    {
        death_frame = 1;
    }

    sprite_index = spr_player_death;
    image_speed = 0;
    image_index = death_frame;
}


// RESET JUMP VARIABLES ON GROUND

if on_ground
{
    jump_count = 0;
    coyote_jump_timer = coyote_jump_frames;
}
else
{
    coyote_jump_timer--;

    if jump_count == 0 && coyote_jump_timer <= 0
    {
        jump_count = 1;
    }
}


// INITIATE JUMP

if jump_key_buffered && jump_count < jump_max
{
    jump_key_buffered = false;
    jump_key_buffer_timer = 0;
    jump_count++;
    jump_hold_timer = jump_hold_frames;

    // Remember whether the player was moving when they jumped.
    // This also works if they jump from normal ground
    // and land on slippery ground later.

    slip_jump_active = true;

    if abs(hsp) > 0.1
    {
        slip_jump_moving = true;
    }
    else
    {
        slip_jump_moving = false;
    }

    setOnGround(false);
    coyote_jump_timer = 0;
}


// CUT OFF JUMP ON BUTTON RELEASE

if !key_jump
{
    jump_hold_timer = 0;
}


// JUMP HOLD

if jump_hold_timer > 0
{
    vsp = -3.5;
    jump_hold_timer--;
}


// HORIZONTAL COLLISION

if place_meeting(x + hsp, y, obj_ground) ||
   ((invincible || dying) && place_meeting(x + hsp, y, obj_water))
{
    while !place_meeting(x + sign(hsp), y, obj_ground) &&
          !((invincible || dying) &&
            place_meeting(x + sign(hsp), y, obj_water))
    {
        x += sign(hsp);
    }

    hsp = 0;
}

x += hsp;


// CAP FALL SPEED

if vsp > term_vel
{
    vsp = term_vel;
}


// VERTICAL COLLISION

var ground_collision = place_meeting(
    x,
    y + vsp,
    obj_ground
);

var water_collision =
    (invincible || dying) &&
    place_meeting(
        x,
        y + vsp,
        obj_water
    );


// ONE-WAY PLATFORM COLLISION

var oneway_landed = false;

if vsp > 0
{
    // Player's feet before moving
    var previous_bottom = bbox_bottom;

    // Player's feet after moving
    var next_bottom = bbox_bottom + vsp;

    var platform_list = ds_list_create();

    var platform_count = collision_rectangle_list(
        bbox_left,
        bbox_top,
        bbox_right,
        next_bottom + 1,
        obj_platform,
        false,
        true,
        platform_list,
        false
    );

    var landing_platform = noone;
    var landing_top = 1000000;

    for (var i = 0; i < platform_count; i++)
    {
        var platform = platform_list[| i];

        // Only land if the player's feet cross the platform top

        if previous_bottom <= platform.bbox_top &&
           next_bottom >= platform.bbox_top
        {
            // Make sure the player is horizontally over the platform

            if bbox_right > platform.bbox_left &&
               bbox_left < platform.bbox_right
            {
                if platform.bbox_top < landing_top
                {
                    landing_top = platform.bbox_top;
                    landing_platform = platform;
                }
            }
        }
    }

    ds_list_destroy(platform_list);

    // Land on the platform

    if landing_platform != noone
    {
        y += landing_platform.bbox_top - bbox_bottom;

        vsp = 0;
        oneway_landed = true;
    }
}


// NORMAL GROUND / WATER COLLISION

if !oneway_landed &&
   (ground_collision || water_collision)
{
    while !place_meeting(
        x,
        y + sign(vsp),
        obj_ground
    )
    &&
    !((invincible || dying) &&
      place_meeting(
          x,
          y + sign(vsp),
          obj_water
      ))
    {
        y += sign(vsp);
    }

    if vsp < 0
    {
        jump_hold_timer = 0;
    }

    vsp = 0;
}


// MOVE VERTICALLY IF WE DIDN'T LAND ON A ONE-WAY PLATFORM

if !oneway_landed
{
    y += vsp;
}


// CHECK IF PLAYER IS STANDING ON A ONE-WAY PLATFORM

var standing_on_oneway = false;

var standing_platform_list = ds_list_create();

var standing_platform_count = collision_rectangle_list(
    bbox_left,
    bbox_bottom,
    bbox_right,
    bbox_bottom + 1,
    obj_platform,
    false,
    true,
    standing_platform_list,
    false
);

for (var j = 0; j < standing_platform_count; j++)
{
    var standing_platform = standing_platform_list[| j];

    if abs(standing_platform.bbox_top - bbox_bottom) <= 1
    {
        standing_on_oneway = true;
        break;
    }
}

ds_list_destroy(standing_platform_list);


// SET ON GROUND

if standing_on_oneway ||
   (
       vsp >= 0 &&
       (
           place_meeting(x, y + 1, obj_ground) ||
           ((invincible || dying) && place_meeting(x, y + 1, obj_water))
       )
   )
{
    setOnGround(true);

    if dying && !death_on_ground
    {
        death_on_ground = true;

        hsp = 0;
        vsp = 0;

        sprite_index = spr_player_death;
        image_speed = 0;
        image_index = death_frame;
    }
}


// FALL OUT OF LEVEL WHILE DYING

if dying && !death_on_ground && y > room_height + 32
{
    death_on_ground = true;

    hsp = 0;
    vsp = 0;

    sprite_index = spr_player_death;
    image_speed = 0;
    image_index = death_frame;
}


// SLIPPERY LANDING

if was_airborne &&
   standing_on_oneway == false &&
   place_meeting(x, y + 1, obj_ground_slippery)
{
    // If the player was already moving, give them a stronger slide
    if abs(hsp) > 0.1
    {
        hsp = sign(hsp) * 1.5;
    }
    else
    {
        // If they walked/fell off with little momentum,
        // slide in the direction they are facing
        hsp = face * 0.9;
    }

    slip_jump_active = false;
    slip_jump_moving = false;
}


// SPRITE CONTROL

if !dying
{
    if hsp != 0
    {
        sprite_index = spr_player_run;
        image_speed = 1.2;
    }
    else
    {
        sprite_index = spr_player_idle;
        image_speed = 1;
    }

    // Check if player is in the air

    if !standing_on_oneway &&
       !place_meeting(x, y + 1, obj_ground) &&
       !(invincible && place_meeting(x, y + 1, obj_water))
    {
        sprite_index = spr_player_jump;
        image_speed = 0;

        if vsp < 0
        {
            image_index = 0;
        }
        else
        {
            image_index = 1;
        }
    }
}
else if death_on_ground
{
    // Keep death sprite active

    sprite_index = spr_player_death;
    image_speed = 0;
    image_index = death_frame;
}


// FACE DIRECTION

if knockback_timer <= 0 && !dying
{
    if key_right
    {
        face = 1;
    }

    if key_left
    {
        face = -1;
    }
}


// WATER DAMAGE

if !invincible && !dying
{
    // Check for water at the player's feet

    var water_touch = collision_rectangle(
        bbox_left,
        bbox_bottom - 1,
        bbox_right,
        bbox_bottom + 1,
        obj_water,
        false,
        true
    );

    if water_touch != noone
    {
        // Check how much of the player's feet
        // are supported by the lily pad

        var pad_left = collision_point(
            bbox_left + 1,
            bbox_bottom + 1,
            obj_lilypad,
            false,
            true
        );

        var pad_middle = collision_point(
            x,
            bbox_bottom + 1,
            obj_lilypad,
            false,
            true
        );

        var pad_right = collision_point(
            bbox_right - 1,
            bbox_bottom + 1,
            obj_lilypad,
            false,
            true
        );

        // Count lily pad support

        var pad_support = 0;

        if pad_left != noone
        {
            pad_support++;
        }

        if pad_middle != noone
        {
            pad_support++;
        }

        if pad_right != noone
        {
            pad_support++;
        }

        // Only stay safe if ALL three points are supported

        if pad_support < 3
        {
            take_damage(-face);
        }
    }
}


// INVINCIBILITY

if invincible
{
    inv_timer--;
    flash_timer++;

    if flash_timer mod 6 < 3
    {
        image_alpha = 0.3;
    }
    else
    {
        image_alpha = 1;
    }

    if inv_timer <= 0
    {
        invincible = false;
        image_alpha = 1;
        flash_timer = 0;
    }
}


// LOCK COLLISION MASK

mask_index = spr_player_idle;