
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

        // Stop intro cutscene music
        if (variable_global_exists("intro_music_instance"))
        {
            if (global.intro_music_instance != -1)
            {
                audio_stop_sound(global.intro_music_instance);
                global.intro_music_instance = -1;
            }
        }

        // Stop the kite-snap wind sound
        if (variable_global_exists("wind_sound_instance"))
        {
            if (global.wind_sound_instance != -1)
            {
                audio_stop_sound(global.wind_sound_instance);
                global.wind_sound_instance = -1;
            }
        }

        // Stop menu music
        if (variable_global_exists("menu_music_instance"))
        {
            if (global.menu_music_instance != -1)
            {
                audio_stop_sound(global.menu_music_instance);
                global.menu_music_instance = -1;
            }
        }

        // Start gameplay music only if it isn't already playing
        if (!variable_global_exists("background_music_instance"))
        {
            global.background_music_instance = -1;
        }

        if (global.background_music_instance == -1
            || !audio_is_playing(global.background_music_instance))
        {
            global.background_music_instance =
                audio_play_sound(snd_background, 1, true);
        }

        // Enter Level 1
        room_goto(rm_level1);
    }
}
