global.hangi_total = 0;    // total collected across all levels
global.hangi_level = 0;    // collected in current level

// GAMEPLAY BACKGROUND MUSIC

if (!variable_global_exists("background_music_instance") ||
    global.background_music_instance == -1 ||
    !audio_is_playing(global.background_music_instance))
{
    global.background_music_instance =
        audio_play_sound(snd_background, 1, true);
}