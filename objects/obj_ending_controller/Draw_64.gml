
/// ENDING CUTSCENE CONTROLLER — DRAW GUI

// HANGI BASKET MESSAGE
if (room == rm_end_hangi)
{
    draw_set_font(f_total_hangi);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var visible_text = string_copy(
        hangi_message,
        1,
        typing_index
    );

    var text_x = display_get_gui_width() / 3;
    var text_y = display_get_gui_height() / 2;
    var text_width = display_get_gui_width() * 0.6;

    // Black outline
    draw_set_color(c_black);

    for (var ox = -1; ox <= 1; ox++)
    {
        for (var oy = -1; oy <= 1; oy++)
        {
            if (ox != 0 || oy != 0)
            {
                draw_text_ext(
                    text_x + ox,
                    text_y + oy,
                    visible_text,
                    -1,
                    text_width
                );
            }
        }
    }

    // White text
    draw_set_color(c_white);

    draw_text_ext(
        text_x,
        text_y,
        visible_text,
        -1,
        text_width
    );
}

// OPENING FADE-IN
if (room == rm_mountain_ending && cutscene_fade_alpha > 0)
{
    draw_set_alpha(cutscene_fade_alpha);
    draw_set_color(c_black);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );
}

// SKIP BUTTON — SCENES 1–3 AND BEFORE TITLE IN SCENE 4
if (room == rm_mountain_ending ||
    room == rm_end_get_kite ||
    room == rm_end_hangi ||
    (room == rm_end_flying_kites && !ending_title_visible))
{
    draw_set_alpha(1);
    draw_set_font(f_buttons);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var skip_text = "SKIP >>";

    // Black outline
    draw_set_color(c_black);
    draw_text(skip_button_x - 2, skip_button_y, skip_text);
    draw_text(skip_button_x + 2, skip_button_y, skip_text);
    draw_text(skip_button_x, skip_button_y - 2, skip_text);
    draw_text(skip_button_x, skip_button_y + 2, skip_text);

    // Hover colour
    if (skip_hover)
    {
        draw_set_color(c_white);
    }
    else
    {
        draw_set_color(c_gray);
    }

    draw_text(skip_button_x, skip_button_y, skip_text);
}

// FINAL TITLE AND BUTTONS
if (room == rm_end_flying_kites)
{
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // HAERE RA TITLE
    if (ending_title_visible)
    {
        draw_set_font(f_ending);

        var title_x = display_get_gui_width() / 2;
        var title_y = display_get_gui_height() * 0.40;

        // Black outline
        draw_set_color(c_black);

        for (var ox = -1; ox <= 1; ox++)
        {
            for (var oy = -1; oy <= 1; oy++)
            {
                if (ox != 0 || oy != 0)
                {
                    draw_text(
                        title_x + ox,
                        title_y + oy,
                        ending_title
                    );
                }
            }
        }

        // White title
        draw_set_color(c_white);
        draw_text(title_x, title_y, ending_title);
    }

    // MAIN MENU AND QUIT BUTTONS
    if (ending_buttons_visible && ending_buttons_timer <= 0)
    {
        draw_set_font(ending_button_font);

        // MAIN MENU
        var menu_text = "MAIN MENU";

        if (ending_selected == 0)
        {
            menu_text = "> " + menu_text;
        }

        var menu_col = (ending_selected == 0) ? c_white : c_gray;

        // Black outline
        draw_set_color(c_black);
        draw_text(ending_menu_x - 2, ending_menu_y, menu_text);
        draw_text(ending_menu_x + 2, ending_menu_y, menu_text);
        draw_text(ending_menu_x, ending_menu_y - 2, menu_text);
        draw_text(ending_menu_x, ending_menu_y + 2, menu_text);

        // Button text
        draw_set_color(menu_col);
        draw_text(ending_menu_x, ending_menu_y, menu_text);

        // QUIT
        var quit_text = "QUIT";

        if (ending_selected == 1)
        {
            quit_text = "> " + quit_text;
        }

        var quit_y = ending_menu_y + ending_button_spacing;
        var quit_col = (ending_selected == 1) ? c_white : c_gray;

        // Black outline
        draw_set_color(c_black);
        draw_text(ending_menu_x - 2, quit_y, quit_text);
        draw_text(ending_menu_x + 2, quit_y, quit_text);
        draw_text(ending_menu_x, quit_y - 2, quit_text);
        draw_text(ending_menu_x, quit_y + 2, quit_text);

        // Button text
        draw_set_color(quit_col);
        draw_text(ending_menu_x, quit_y, quit_text);
    }
}

// RESET DRAWING SETTINGS
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
