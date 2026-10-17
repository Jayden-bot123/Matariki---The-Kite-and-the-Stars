// HEART PICKUP — COLLISION WITH PLAYER

// Don't collect while paused or dying
if (global.paused || other.dying)
{
    exit;
}

// Only collect if the player needs health
if (other.hp < other.max_hp)
{
    other.hp++;

    // Play the other collectible sound
    audio_play_sound(snd_other_collect, 1, false);

    // Remove the heart
    instance_destroy();
}