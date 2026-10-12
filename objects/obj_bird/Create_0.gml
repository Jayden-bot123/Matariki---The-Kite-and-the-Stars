// PATROL DISTANCE DEFAULT
if (!variable_instance_exists(id, "patrol_distance"))
{
    patrol_distance = 480;
}

// FLIGHT SETTINGS
bird_speed = 4;
active = false;
bird_direction = -1;
image_xscale = 1;

// PATROL SETTINGS
start_x = x;
start_y = y;

// patrol_distance is set through Variable Definitions
// in the object editor, with a default of 480.

// RANDOM FIRST APPEARANCE
alarm[0] = irandom_range(60, 200);

// ANIMATION
image_speed = 0;
image_index = 0;
bird_anim_timer = 0;

// Hide until the first flight begins
visible = false;
