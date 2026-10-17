function scr_stop_cutscene_audio(){
	
// Stop intro cutscene music
if (variable_global_exists("intro_music_instance"))
{
    if (global.intro_music_instance != -1)
    {
        audio_stop_sound(global.intro_music_instance);
        global.intro_music_instance = -1;
    }
}

// Stop the strong wind
if (variable_global_exists("wind_sound_instance"))
{
    if (global.wind_sound_instance != -1)
    {
        audio_stop_sound(global.wind_sound_instance);
        global.wind_sound_instance = -1;
    }
}

// Stop menu music if it is playing
if (variable_global_exists("menu_music_instance"))
{
    if (global.menu_music_instance != -1)
    {
        audio_stop_sound(global.menu_music_instance);
        global.menu_music_instance = -1;
    }
}

}