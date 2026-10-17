// MOUSE POSITION
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// BACK BUTTON HOVER
back_hover =
    mx >= back_x - 10 &&
    mx <= back_x + 100 &&
    my >= back_y - 20 &&
    my <= back_y + 20;

// LEVEL BUTTON HOVER
hover_level = -1;

for (var i = 0; i < 9; i++)
{
    var col = i mod level_cols;
    var row = i div level_cols;

    var bx = level_start_x
        + col * (level_button_w + level_gap_x);

    var by = level_start_y
        + row * (level_button_h + level_gap_y);

    if (mx >= bx - level_button_w / 2 &&
        mx <= bx + level_button_w / 2 &&
        my >= by - level_button_h / 2 &&
        my <= by + level_button_h / 2)
    {
        hover_level = i + 1;
        selected_level = i + 1;
    }
}

// MOUSE HOVER SOUNDS
if (!menu_committed)
{
    if (hover_level != -1 &&
        hover_level != previous_hover_level)
    {
        audio_play_sound(snd_button_hover, 1, false);
    }

    if (back_hover && !previous_back_hover)
    {
        audio_play_sound(snd_button_hover, 1, false);
    }
}

previous_hover_level = hover_level;
previous_back_hover = back_hover;

// Remember selection before keyboard input
var selection_before_keys = selected_level;

// BACK BUTTON CLICK
if (!menu_committed)
{
    if (back_hover &&
        mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(snd_button_click, 1, false);

        menu_committed = true;
        scr_slide_transition(TRANS_MODE.GOTO, rm_main_menu);
    }

    // CLICK A LEVEL
    else if (hover_level != -1 &&
        mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(snd_button_click, 1, false);

        menu_committed = true;

        scr_slide_transition(
            TRANS_MODE.GOTO,
            level_rooms[hover_level - 1]
        );
    }

    // KEYBOARD NAVIGATION
    if (keyboard_check_pressed(vk_left))
    {
        selected_level--;

        if (selected_level < 1)
        {
            selected_level = 9;
        }
    }

    if (keyboard_check_pressed(vk_right))
    {
        selected_level++;

        if (selected_level > 9)
        {
            selected_level = 1;
        }
    }

    if (keyboard_check_pressed(vk_up))
    {
        selected_level -= level_cols;

        if (selected_level < 1)
        {
            selected_level += 9;
        }
    }

    if (keyboard_check_pressed(vk_down))
    {
        selected_level += level_cols;

        if (selected_level > 9)
        {
            selected_level -= 9;
        }
    }

    // KEYBOARD HOVER SOUND
    if (selected_level != selection_before_keys)
    {
        audio_play_sound(snd_button_hover, 1, false);
    }

    // KEYBOARD BACK
    if (keyboard_check_pressed(vk_escape))
    {
        audio_play_sound(snd_button_click, 1, false);

        menu_committed = true;
        scr_slide_transition(TRANS_MODE.GOTO, rm_main_menu);
    }

    // CONFIRM SELECTION
    if (keyboard_check_pressed(vk_enter) ||
        keyboard_check_pressed(vk_space))
    {
        if (!menu_committed)
        {
            audio_play_sound(snd_button_click, 1, false);

            menu_committed = true;

            scr_slide_transition(
                TRANS_MODE.GOTO,
                level_rooms[selected_level - 1]
            );
        }
    }
}
