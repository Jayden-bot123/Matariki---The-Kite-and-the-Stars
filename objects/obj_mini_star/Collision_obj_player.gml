// MINI STAR — COLLISION WITH PLAYER

// Don't collect stars while paused or dying
if (global.paused || other.dying)
{
    exit;
}

// Update the star counter
global.mini_stars_collected += 1;

// Play the other collectible sound
audio_play_sound(snd_other_collect, 1, false);

// Remove the star
instance_destroy();