/// Opening cutscene sequence

scene_timer += 1;

// Scene 0: opening fade-in timing
if (scene == 0)
{
    fade_alpha -= 0.025;

    if (fade_alpha <= 0)
    {
        fade_alpha = 0;
        scene = 1;
        scene_timer = 0;
        global.intro_phase = 1;
    }
}

// Scene 1: friends playing with the kite
else if (scene == 1)
{
    if (scene_timer >= scene_duration)
    {
        global.intro_phase = 2;
        room_goto(rm_kite_snap);
    }
}

// Scene 3: return to friends; kite flies away
else if (scene == 3)
{
    var kite = instance_find(obj_kite, 0);

    if (kite != noone)
    {
        var progress = min(scene_timer / scene_duration, 1);

        kite.x = lerp(kite_start_x, kite_end_x, progress);
        kite.y = lerp(kite_start_y, kite_end_y, progress);
    }

    if (scene_timer >= scene_duration)
    {
        global.intro_phase = 4;
        room_goto(rm_intro_eyes);
    }
}