
/// ENDING CUTSCENE CONTROLLER — CREATE

// Scene timing
scene_duration = room_speed * 4;
scene_timer = 0;

// Hangi message
var total = 0;

if (variable_global_exists("hangi_total"))
{
    total = global.hangi_total;
}

hangi_message = "You have contributed\n"
    + string(total)
    + " hangi baskets!";

typing_index = 0;
typing_speed = 5;
typing_timer = 0;
typing_finished = false;

hangi_message_started = false;
hangi_message_timer = 0;
hangi_message_duration = room_speed * 2;

// Opening fade-in
cutscene_fade_alpha = 1;
cutscene_fade_speed = 0.025;

// Ending title and buttons
ending_title = "HAERE RA";
ending_title_visible = false;
ending_buttons_visible = false;

ending_button_font = f_buttons;
ending_buttons_timer = 0;

ending_menu_x = display_get_gui_width() / 2;
ending_menu_y = display_get_gui_height() * 0.65;
ending_button_spacing = 40;
ending_selected = 0;

// Timer for showing the ending title
ending_title_timer = 0;
ending_title_delay = room_speed * 3.5;

// Skip button
skip_button_x = display_get_gui_width() - 65;
skip_button_y = 25;
skip_button_w = 100;
skip_button_h = 35;
skip_hover = false;

// Global flag used to jump directly to the ending
if (!variable_global_exists("skip_ending"))
{
    global.skip_ending = false;
}

// OUTRO CUTSCENE MUSIC — PLAY ONLY ONCE
if (!variable_global_exists("outro_music_instance"))
{
    global.outro_music_instance = -1;
}

if (global.outro_music_instance == -1 ||
    !audio_is_playing(global.outro_music_instance))
{
    global.outro_music_instance =
        audio_play_sound(snd_outro_cutscene, 1, false);
}

typing_sound_instance = -1;
typing_sound_played = false;

// Mouse hover sound tracking for ending buttons
ending_previous_selected = ending_selected;
ending_mouse_was_over_button = false;