// Don't move or animate while paused
if (variable_global_exists("paused") && global.paused)
{
    exit;
}

if (active)
{
    // PATROL MOVEMENT
    x += bird_direction * bird_speed;

    // BIRD ANIMATION: 4 frames (0–3)
    bird_anim_timer++;

    if (bird_anim_timer >= 5)
    {
        bird_anim_timer = 0;
        image_index++;

        if (image_index > 3)
        {
            image_index = 0;
        }
    }

    // PATROL BOUNDARIES
    var left_limit = start_x - patrol_distance / 2;
    var right_limit = start_x + patrol_distance / 2;
	
	if (x <= left_limit)
	{
	    x = left_limit;
	    bird_direction = 1;
	    image_xscale = -1; // Face right
	}
	else if (x >= right_limit)
	{
	    x = right_limit;
	    bird_direction = -1;
	    image_xscale = 1; // Face left
	}
}
