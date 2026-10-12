draw_set_color(c_white);

for (var i = 0; i < streak_amount; i++)
{
    draw_set_alpha(streak_alpha[i]);

    var x1 = streak_x[i];
    var y1 = streak_y[i];

    var x2 =
        x1 -
        streak_length[i] * global.wind_direction;


    if streak_thickness[i] == 2
    {
        draw_line(
            x1,
            y1,
            x2,
            y1
        );

        draw_line(
            x1,
            y1 + 1,
            x2,
            y1 + 1
        );
    }
    else
    {
        draw_line(
            x1,
            y1,
            x2,
            y1
        );
    }
}

draw_set_alpha(1);