// NUMBER OF WIND STREAKS

streak_amount = 75;

// Wind streak data
streak_x = [];
streak_y = [];
streak_speed = [];
streak_length = [];
streak_alpha = [];
streak_thickness = [];


// CREATE WIND STREAKS

for (var i = 0; i < streak_amount; i++)
{
    streak_x[i] = random(room_width);
    streak_y[i] = random(room_height);

    streak_speed[i] = random_range(8, 15);
    streak_length[i] = random_range(20, 55);
    streak_alpha[i] = random_range(0.35, 0.75);

    streak_thickness[i] = choose(2, 2, 2, 2, 1);
}