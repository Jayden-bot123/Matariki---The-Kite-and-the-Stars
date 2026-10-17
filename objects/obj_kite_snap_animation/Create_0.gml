image_index = 0;
image_speed = 1;
ending = false;

// Play wind as Scene 2 begins
global.wind_sound_instance =
    audio_play_sound(snd_strong_wind, 1, false);