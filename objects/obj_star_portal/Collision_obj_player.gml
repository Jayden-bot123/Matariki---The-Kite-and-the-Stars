// Only trigger once
if !show_description {
    show_description = true;
    phase = 1;
    star_anim_y = display_get_gui_height() + 50;
    text_alpha = 0;
    skip_alpha = 0;
    description_timer = 180;
    
    // Freeze player
    with other {
        hsp = 0;
        vsp = 0;
        frozen = true;
    }
}