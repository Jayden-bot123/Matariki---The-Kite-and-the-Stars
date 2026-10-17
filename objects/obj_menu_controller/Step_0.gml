// TITLE FADE
if (title_delay > 0)
{
    title_delay--;
}
else
{
    title_alpha += title_fade_speed;

    if (title_alpha >= 1)
    {
        title_alpha = 1;
    }
}

// Wait until the title has faded in
if (title_alpha >= 1 && button_delay == -1)
{
    button_delay = room_speed * 1.5;
}

// Count down the button delay
if (button_delay > 0)
{
    button_delay--;
}

// Slide buttons into position
if (button_delay == 0)
{
    menu_x += (menu_x_target - menu_x) / menu_speed;
}

// MOUSE HOVER AND CLICK
menu_hover = -1;

if (menu_control &&
    button_delay == 0 &&
    menu_x <= menu_x_target + 5)
{
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    for (var i = 0; i < menu_items; i++)
    {
        var yy = menu_y - (menu_itemheight * (i * 1.5));

        // Approximate clickable area around each menu option
        if (mx >= menu_x - 220 &&
            mx <= menu_x + 10 &&
            my >= yy - menu_itemheight &&
            my <= yy + 8)
        {
            menu_hover = i;
            menu_cursor = i;
        }
    }

    // HOVER SOUND — play only when entering a new option
    if (menu_hover != -1 &&
        menu_hover != menu_hover_previous)
    {
        audio_play_sound(snd_button_hover, 1, false);
    }

    // MOUSE CLICK
    if (menu_hover != -1 &&
        mouse_check_button_pressed(mb_left))
    {
        audio_play_sound(snd_button_click, 1, false);

        menu_x_target = gui_width + 200;
        menu_committed = menu_cursor;
        menu_control = false;
    }
}

// Remember the previous mouse hover
menu_hover_previous = menu_hover;

// KEYBOARD CONTROLS
if (menu_control && button_delay == 0)
{
    if (keyboard_check_pressed(vk_up))
    {
        menu_cursor++;

        if (menu_cursor >= menu_items)
        {
            menu_cursor = 0;
        }

        audio_play_sound(snd_button_hover, 1, false);
    }

    if (keyboard_check_pressed(vk_down))
    {
        menu_cursor--;

        if (menu_cursor < 0)
        {
            menu_cursor = menu_items - 1;
        }

        audio_play_sound(snd_button_hover, 1, false);
    }

    // KEYBOARD CONFIRM
    if (keyboard_check_pressed(vk_enter) ||
        keyboard_check_pressed(vk_space))
    {
        audio_play_sound(snd_button_click, 1, false);

        menu_x_target = gui_width + 200;
        menu_committed = menu_cursor;
        menu_control = false;
    }
}

// PERFORM SELECTED ACTION AFTER MENU SLIDES OUT
if (menu_x > gui_width + 150 &&
    menu_committed != -1)
{
    switch (menu_committed)
    {
        case 3:
            // NEW GAME — stop menu music
            if (variable_global_exists("menu_music_instance"))
            {
                if (global.menu_music_instance != -1 &&
                    audio_is_playing(global.menu_music_instance))
                {
                    audio_stop_sound(global.menu_music_instance);
                }

                global.menu_music_instance = -1;
            }

            global.intro_phase = 0;
            scr_slide_transition(TRANS_MODE.NEXT);
            break;

        case 2:
            // LEVEL SELECT — keep menu music playing
            scr_slide_transition(TRANS_MODE.GOTO, rm_levels);
            break;

        case 1:
            // INSTRUCTIONS — keep menu music playing
            scr_slide_transition(TRANS_MODE.GOTO, rm_instructions);
            break;

        case 0:
            // QUIT
            if (variable_global_exists("menu_music_instance"))
            {
                if (global.menu_music_instance != -1 &&
                    audio_is_playing(global.menu_music_instance))
                {
                    audio_stop_sound(global.menu_music_instance);
                }

                global.menu_music_instance = -1;
            }

            game_end();
            break;
    }
}
