/// obj_star_portal — COLLISION WITH obj_player

// Only trigger the sequence once
if (!show_description)
{
    // Start the description sequence
    show_description = true;
    phase = 1;

    star_anim_y = display_get_gui_height() + 50;
    text_alpha = 0;
    skip_alpha = 0;
    description_timer = 180;

    // Play portal entry sound once
    audio_play_sound(snd_portal_enter, 1, false);

    // Freeze the player
    with (other)
    {
        hsp = 0;
        vsp = 0;
        frozen = true;
    }
}