/// Opening cutscene controller

if (!variable_global_exists("intro_phase"))
{
    global.intro_phase = 0;
}

scene = global.intro_phase;
scene_timer = 0;
scene_duration = 180;

fade_alpha = 1;
fade_direction = -1;

kite_start_x = 0;
kite_start_y = 0;

kite_end_x = 400;
kite_end_y = 70;

alarm[0] = 1;