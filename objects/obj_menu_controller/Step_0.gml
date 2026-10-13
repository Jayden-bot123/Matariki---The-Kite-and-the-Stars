/// TITLE FADE

if title_delay > 0
{
    title_delay--;
}
else
{
    title_alpha += title_fade_speed;

    if title_alpha >= 1
    {
        title_alpha = 1;
    }
}

// Button delay and ease in


// Wait until the title has completely faded in
if title_alpha >= 1 && button_delay == -1
{
    button_delay = room_speed * 1.5;
}

// Count down the button delay
if button_delay > 0
{
    button_delay--;
}

// Once the delay is finished, let the buttons slide in
if button_delay == 0
{
    menu_x += (menu_x_target - menu_x) / menu_speed;
}

// KEYBOARD CONTROLS

// Only allow controls once the buttons have appeared
if (menu_control && button_delay == 0)
{
    if (keyboard_check_pressed(vk_up))
    {
        menu_cursor++;

        if (menu_cursor >= menu_items)
        {
            menu_cursor = 0;
        }
    }

    if (keyboard_check_pressed(vk_down))
    {
        menu_cursor--;

        if (menu_cursor < 0)
        {
            menu_cursor = menu_items - 1;
        }
    }

    if (keyboard_check_pressed(vk_enter))
    {
        menu_x_target = gui_width + 200;
        menu_committed = menu_cursor;
        menu_control = false;
    }
}

if (menu_x > gui_width + 150 && menu_committed != -1)
{
    switch (menu_committed)
    {
        case 2: default:
            // Reset the opening cutscene for a new game
            global.intro_phase = 0;

            scr_slide_transition(TRANS_MODE.NEXT);
            break;

        case 1:
            scr_slide_transition(TRANS_MODE.GOTO, rm_instructions);
            break;

        case 0:
            game_end();
            break;
    }
}
