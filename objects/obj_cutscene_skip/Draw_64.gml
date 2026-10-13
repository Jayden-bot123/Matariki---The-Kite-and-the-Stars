/// DRAW CUTSCENE SKIP BUTTON

draw_set_font(skip_font);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);

// Button colour
if (skip_hover)
{
    draw_set_color(c_white);
}
else
{
    draw_set_color(c_gray);
}

// Draw black outline
draw_set_color(c_black);

draw_text(skip_x - 1, skip_y, skip_text);
draw_text(skip_x + 1, skip_y, skip_text);
draw_text(skip_x, skip_y - 1, skip_text);
draw_text(skip_x, skip_y + 1, skip_text);

// Draw main text
if (skip_hover)
{
    draw_set_color(c_white);
}
else
{
    draw_set_color(c_gray);
}

draw_text(skip_x, skip_y, skip_text);

// Reset drawing settings
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
