// GUI SETTINGS
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

// BACK BUTTON
back_x = 25;
back_y = 25;
back_text = "< BACK";
back_font = f_buttons;
back_hover = false;

// LEVEL BUTTON SETTINGS
level_font = f_buttons;

level_cols = 3;
level_rows = 3;

level_button_w = 130;
level_button_h = 55;
level_gap_x = 25;
level_gap_y = 20;

// Centre the 3 x 3 grid
level_grid_w = level_cols * level_button_w
    + (level_cols - 1) * level_gap_x;

level_grid_h = level_rows * level_button_h
    + (level_rows - 1) * level_gap_y;

level_start_x = (gui_width - level_grid_w) / 2
    + level_button_w / 2;

level_start_y = 190 + level_button_h / 2;

// SELECTION
selected_level = 1;
hover_level = -1;

// ROOM DESTINATIONS
level_rooms[0] = rm_level1;
level_rooms[1] = rm_level2;
level_rooms[2] = rm_level3;
level_rooms[3] = rm_level4;
level_rooms[4] = rm_level5;
level_rooms[5] = rm_level6;
level_rooms[6] = rm_level7;
level_rooms[7] = rm_level8;
level_rooms[8] = rm_level9;

// Prevent multiple selections during transition
menu_committed = false;

// AUDIO TRACKING
previous_hover_level = -1;
previous_back_hover = false;
previous_selected_level = selected_level;

// MENU MUSIC — reuse the same instance
if (!variable_global_exists("menu_music_instance") ||
    global.menu_music_instance == -1 ||
    !audio_is_playing(global.menu_music_instance))
{
    global.menu_music_instance =
        audio_play_sound(snd_menu, 1, true);
}
