for (var i = 0; i < streak_amount; i++)
{
    streak_x[i] += streak_speed[i] * global.wind_direction;


    // WIND MOVING RIGHT

    if global.wind_direction == 1
    {
        if streak_x[i] > room_width + 60
        {
            streak_x[i] = -60;
            streak_y[i] = random(room_height);

            streak_speed[i] = random_range(8, 15);
            streak_length[i] = random_range(20, 55);
            streak_alpha[i] = random_range(0.35, 0.75);
            streak_thickness[i] = choose(2, 2, 2, 2, 1);
        }
    }


    // WIND MOVING LEFT

    else
    {
        if streak_x[i] < -60
        {
            streak_x[i] = room_width + 60;
            streak_y[i] = random(room_height);

            streak_speed[i] = random_range(8, 15);
            streak_length[i] = random_range(20, 55);
            streak_alpha[i] = random_range(0.35, 0.75);
            streak_thickness[i] = choose(2, 2, 2, 2, 1);
        }
    }
}