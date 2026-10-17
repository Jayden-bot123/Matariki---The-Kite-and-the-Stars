
/// LEVEL CONTROLLER — DRAW GUI

// TITLE
draw_set_font(f_menu_title);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    gui_width / 2,
    90,
    "SELECT LEVEL"
);

// LEVEL BUTTONS
draw_set_font(level_font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < 9; i++)
{
    var col = i mod level_cols;
    var row = i div level_cols;

    var bx = level_start_x
        + col * (level_button_w + level_gap_x);

    var by = level_start_y
        + row * (level_button_h + level_gap_y);

    var button_text = "LEVEL " + string(i + 1);

    // Selected or hovered button
    if (selected_level == i + 1 || hover_level == i + 1)
    {
        draw_set_color(c_white);
    }
    else
    {
        draw_set_color(c_gray);
    }

    // Button text outline
    draw_set_color(c_black);
    draw_text(bx - 2, by, button_text);
    draw_text(bx + 2, by, button_text);
    draw_text(bx, by - 2, button_text);
    draw_text(bx, by + 2, button_text);

    // Main text
    if (selected_level == i + 1 || hover_level == i + 1)
    {
        draw_set_color(c_white);
    }
    else
    {
        draw_set_color(c_gray);
    }

    draw_text(bx, by, button_text);
}

// BACK BUTTON
draw_set_font(f_buttons);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if (back_hover)
{
    draw_set_color(c_white);
}
else
{
    draw_set_color(c_gray);
}

draw_text(
    back_x,
    back_y,
    back_text
);

// RESET DRAW SETTINGS
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
