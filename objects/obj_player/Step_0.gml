// If frozen stop all movement
if frozen {
    hsp = 0;
    vsp = 0;
    exit;
}


// Get controls
getControls();


// Apply knockback if active
if knockback_timer > 0 {
    knockback_timer--;
    hsp = knockback_hsp;
} else {
    // Normal horizontal movement
    var move = key_right - key_left;
    hsp = move * walksp;
}

// Gravity
if coyote_hang_timer > 0 {
    coyote_hang_timer--;
} else {
    vsp += grv;
    setOnGround(false);
}


// Reset jump variables on ground
if on_ground {
    jump_count = 0;
    coyote_jump_timer = coyote_jump_frames;
} else {
    coyote_jump_timer--;

    if jump_count == 0 && coyote_jump_timer <= 0 {
        jump_count = 1;
    }
}


// Initiate jump
if jump_key_buffered && jump_count < jump_max {
    jump_key_buffered = false;
    jump_key_buffer_timer = 0;
    jump_count++;
    jump_hold_timer = jump_hold_frames;
    setOnGround(false);
    coyote_jump_timer = 0;
}


// Cut off jump on button release
if !key_jump {
    jump_hold_timer = 0;
}


// Jump hold
if jump_hold_timer > 0 {
    vsp = -3.5;
    jump_hold_timer--;
}



// HORIZONTAL COLLISION

if place_meeting(x + hsp, y, obj_ground) ||
   (invincible && place_meeting(x + hsp, y, obj_water))
{
    while !place_meeting(x + sign(hsp), y, obj_ground) &&
          !(invincible && place_meeting(x + sign(hsp), y, obj_water))
    {
        x += sign(hsp);
    }

    hsp = 0;
}

x += hsp;


// CAP FALL SPEED


if vsp > term_vel {
    vsp = term_vel;
}


// VERTICAL COLLISION


if place_meeting(x, y + vsp, obj_ground) ||
   (invincible && place_meeting(x, y + vsp, obj_water))
{
    while !place_meeting(x, y + sign(vsp), obj_ground) &&
          !(invincible && place_meeting(x, y + sign(vsp), obj_water))
    {
        y += sign(vsp);
    }

    if vsp < 0 {
        jump_hold_timer = 0;
    }

    vsp = 0;
}

y += vsp;


// SET ON GROUND


if vsp >= 0 &&
   (
       place_meeting(x, y + 1, obj_ground) ||
       (invincible && place_meeting(x, y + 1, obj_water))
   )
{
    setOnGround(true);
}



// SPRITE CONTROL


if hsp != 0 {
    sprite_index = spr_player_run;
    image_speed = 1.2;
}
else {
    sprite_index = spr_player_idle;
    image_speed = 1;
}


// Check if player is in the air
if !place_meeting(x, y + 1, obj_ground) &&
   !(invincible && place_meeting(x, y + 1, obj_water))
{
    sprite_index = spr_player_jump;
    image_speed = 0;

    if vsp < 0 {
        image_index = 0;
    }
    else {
        image_index = 1;
    }
}



// FACE DIRECTION


if knockback_timer <= 0 {
    if hsp > 0 {
        face = 1;
    }

    if hsp < 0 {
        face = -1;
    }
}


// WATER DAMAGE

if !invincible
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
        // Check how much of the player's feet are supported
        // by the lily pad.

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

        // Count how many parts of the player's feet
        // are actually supported by the lily pad.
        var pad_support = 0;

        if pad_left != noone {
            pad_support++;
        }

        if pad_middle != noone {
            pad_support++;
        }

        if pad_right != noone {
            pad_support++;
        }

        // Only stay safe if ALL three points are supported.
        if pad_support < 3
        {
            take_damage(-face);
        }
    }
}
// INVINCIBILITY


if invincible {

    inv_timer--;
    flash_timer++;

    if flash_timer mod 6 < 3 {
        image_alpha = 0.3;
    }
    else {
        image_alpha = 1;
    }

    if inv_timer <= 0 {
        invincible = false;
        image_alpha = 1;
        flash_timer = 0;
    }
}



// RESTART IF NO HP


if hp <= 0 {
    room_restart();
}


// LOCK COLLISION MASK


mask_index = spr_player_idle;




