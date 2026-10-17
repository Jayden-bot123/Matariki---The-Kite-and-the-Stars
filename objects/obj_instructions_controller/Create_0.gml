// GUI SETTINGS
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

// BACK BUTTON
back_x = 25;
back_y = 25;

back_text = "< BACK";
back_font = f_buttons;

// Button state
back_hover = false;
previous_back_hover = false;

// MENU MUSIC — reuse the same instance
if (!variable_global_exists("menu_music_instance") ||
    global.menu_music_instance == -1 ||
    !audio_is_playing(global.menu_music_instance))
{
    global.menu_music_instance =
        audio_play_sound(snd_menu, 1, true);
}
