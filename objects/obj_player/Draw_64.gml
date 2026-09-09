// Draw GUI event — hearts HUD (top left)
for (var i = 0; i < max_hp; i++)
{
    if i < hp
    {
        draw_sprite(spr_heart_full, 0, 10 + (i * 20), 10);
    }
}

// Draw hangi counter (top right)

var hud_x = display_get_gui_width() - 96;
var hud_y = 10;

// Draw hangi basket icon
draw_sprite(spr_hangi_basket_display, 0, hud_x, hud_y);

// Draw hangi number
draw_set_font(f_hangi);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var hangi_text = "x " + string(global.hangi_total);

var text_x = hud_x + 30;
var text_y = hud_y + 16;

// Black outline
draw_set_color(c_black);

for (var ox = -1; ox <= 1; ox++)
{
    for (var oy = -1; oy <= 1; oy++)
    {
        if (ox != 0 || oy != 0)
        {
            draw_text(text_x + ox, text_y + oy, hangi_text);
        }
    }
}

// White text
draw_set_color(c_white);
draw_text(text_x, text_y, hangi_text);

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);