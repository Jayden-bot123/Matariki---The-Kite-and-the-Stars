// Draw GUI event — hearts HUD (top left)
for (var i = 0; i < max_hp; i++)
{
    if i < hp
    {
        draw_sprite(spr_heart_full, 0, 10 + (i * 14), 10);
    }
}

// Draw hangi counter (top right)
// Position calculation — sits in top right corner
var hud_x = display_get_gui_width() - 48;
var hud_y = 10;

// Draw hangi basket icon
draw_sprite(spr_hangi_basket_display, 0, hud_x, hud_y);

// Draw x symbol
draw_set_font(f_hangi);

var hangi_text = "x " + string(global.hangi_total);
var text_x = hud_x + 14;
var text_y = hud_y;

// Draw black outline
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

// Draw white text on top
draw_set_color(c_white);
draw_text(text_x, text_y, hangi_text);
