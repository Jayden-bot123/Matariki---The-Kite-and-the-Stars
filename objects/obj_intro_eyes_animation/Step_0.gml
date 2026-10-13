// Play the eyes animation once
if (!ending && image_index >= image_number - 1)
{
    image_index = image_number - 1;
    image_speed = 0;
    ending = true;

    // Hold the final frame before fading out
    alarm[0] = room_speed * 1.5;
}

// Fade to black
if (fade_out)
{
    fade_alpha += 0.025;

    if (fade_alpha >= 1)
    {
        fade_alpha = 1;
        room_goto(rm_level1);
    }
}