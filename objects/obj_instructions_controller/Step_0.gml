// MOUSE POSITION
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// BACK BUTTON HOVER
back_hover =
    mx >= back_x - 10 &&
    mx <= back_x + 80 &&
    my >= back_y - 20 &&
    my <= back_y + 20;

// HOVER SOUND — play only when entering the button
if (back_hover && !previous_back_hover)
{
    audio_play_sound(snd_button_hover, 1, false);
}

previous_back_hover = back_hover;

// CLICK BACK
if (back_hover &&
    mouse_check_button_pressed(mb_left))
{
    audio_play_sound(snd_button_click, 1, false);

    scr_slide_transition(TRANS_MODE.GOTO, rm_main_menu);
}
