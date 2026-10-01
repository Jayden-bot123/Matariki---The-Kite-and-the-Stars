if variable_global_exists("paused") && global.paused
{
    exit;
}
if active {
    // Apply gravity
    vsp += grv;
    y += vsp;
    
// FISH ANIMATION

image_speed = 0;

var rise_amount = start_y - y;

// RISING

if vsp < -2
{
    if rise_amount < 3
    {
        // Frame 2: head coming out
        image_index = 1;
    }
    else
    {
        // Frame 3: travelling vertically upward
        image_index = 2;
    }
}

// NEAR APEX - START TURNING

else if vsp >= -2 && vsp < 0
{
    // Frame 4: beginning to turn
    image_index = 3;
}


// JUST STARTING TO FALL


else if vsp >= 0 && vsp < 2
{
    // Frame 5: finishing the turn
    image_index = 4;
}

// FALLING

else
{
    // Almost back in the water
    if y >= start_y - 4
    {
        // Frame 8: tail disappearing
        image_index = 7;
    }
    else
    {
        // Frame 6: falling vertically
        image_index = 5;
    }
}
    
    // Reset when back to start
    if y >= start_y {
        y = start_y;
        vsp = 0;
        active = false;
        image_index = 0;
        alarm[0] = irandom_range(120, 360);
    }
}