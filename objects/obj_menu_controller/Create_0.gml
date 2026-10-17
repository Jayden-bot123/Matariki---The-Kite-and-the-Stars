// Title fade
title_alpha = 0;
title_fade_speed = 0.025;
title_delay = room_speed * 1.5;

// Button delay
button_delay = -1;

// GUI dimensions
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

// Menu position and animation
menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25;

menu_font = f_buttons;
menu_itemheight = font_get_size(f_buttons);

// Menu state
menu_committed = -1;
menu_control = true;
menu_cursor = 3;

// Menu options
// Index 3 is at the top; index 0 is at the bottom.
menu[3] = "New Game";
menu[2] = "Levels";
menu[1] = "Instructions";
menu[0] = "Quit";

menu_items = array_length_1d(menu);

// Mouse hover state
menu_hover = -1;
menu_hover_previous = -1;

// MENU MUSIC
// Reuse the existing music instance if it is already playing.
if (!variable_global_exists("menu_music_instance") ||
    global.menu_music_instance == -1 ||
    !audio_is_playing(global.menu_music_instance))
{
    global.menu_music_instance =
        audio_play_sound(snd_menu, 1, true);
}
