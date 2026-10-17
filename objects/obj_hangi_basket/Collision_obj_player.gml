// HANGI BASKET — COLLISION WITH PLAYER

// Don't collect while paused or dying
if (global.paused || other.dying)
{
    exit;
}

// Update collection totals
global.hangi_total++;
global.hangi_level++;

// Play the hangi basket collection sound
audio_play_sound(snd_hangibasket_collect, 1, false);

// Remove the basket
instance_destroy();