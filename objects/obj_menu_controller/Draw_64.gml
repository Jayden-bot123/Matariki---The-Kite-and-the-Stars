
// DRAW TITLE
draw_set_font(f_menu_title);
draw_set_color(c_white);
draw_set_alpha(title_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    display_get_gui_width() / 2,
    150,
    "Matariki: \nThe Kite and the Stars"
);

// Reset title drawing settings
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// DRAW MENU OPTIONS
draw_set_font(menu_font);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++)
{
    var offset = 2;
    var txt = menu[i];

    if (menu_cursor == i)
    {
        txt = "> " + txt;
        var col = c_white;
    }
    else
    {
        var col = c_gray;
    }

    var xx = menu_x;
    var yy = menu_y - (menu_itemheight * (i * 1.5));

    // Black outline
    draw_set_color(c_black);
    draw_text(xx - offset, yy, txt);
    draw_text(xx + offset, yy, txt);
    draw_text(xx, yy + offset, txt);
    draw_text(xx, yy - offset, txt);

    // Main text
    draw_set_color(col);
    draw_text(xx, yy, txt);
}

// RESET DRAWING SETTINGS
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
