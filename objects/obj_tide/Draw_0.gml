draw_set_color(make_color_rgb(30, 120, 170));

draw_rectangle(
    0,
    tide_y,
    room_width,
    room_height,
    false
);

draw_set_color(c_white);

draw_set_alpha(0.5);

draw_set_color(c_white);
draw_set_alpha(0.5);

for (var xx = 0; xx < room_width; xx += 16)
{
    var wave_y = tide_y + sin((xx + current_time * 0.1) * 0.05) * 2;

    draw_line(
        xx,
        wave_y,
        xx + 16,
        tide_y + sin((xx + 16 + current_time * 0.1) * 0.05) * 2
    );
}

draw_set_alpha(1);

draw_set_alpha(1);

if emergency_mode
{
    draw_set_alpha(0.8);

    for (var xx = 0; xx < room_width; xx += 12)
    {
        draw_line(
            xx,
            tide_y,
            xx + 6,
            tide_y - 5
        );
    }

    draw_set_alpha(1);
}