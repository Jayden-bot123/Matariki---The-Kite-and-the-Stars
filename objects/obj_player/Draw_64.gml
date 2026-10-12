// Draw GUI event — hearts HUD (top left)

if !dying
{
    for (var i = 0; i < max_hp; i++)
    {
        if i < hp
        {
            draw_sprite(
                spr_heart_full,
                0,
                10 + (i * 20),
                10
            );
        }
    }
}

// Draw hangi counter (top right)
if !dying
{
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
}


if (room == rm_level8 || room == rm_level9)
{
    draw_set_font(f_hangi);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);

    var star_text = "Stars: "
        + string(global.mini_stars_collected) + " out of 5";

    var star_x = display_get_gui_width() - 10;
    var star_y = 40; // Adjust this to sit just below the hangi counter

    // Dark outline
    draw_set_color(c_black);
    for (var ox = -1; ox <= 1; ox++)
    {
        for (var oy = -1; oy <= 1; oy++)
        {
            if (ox != 0 || oy != 0)
            {
                draw_text(star_x + ox, star_y + oy, star_text);
            }
        }
    }

    // Main text
    draw_set_color(c_white);
    draw_text(star_x, star_y, star_text);

    // Reset drawing settings
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// WIND INDICATOR

if !dying && room == rm_level5
{
    var wind_x = display_get_gui_width() / 2;
    var wind_y = 10;

    // Background
    draw_set_color(c_black);
    draw_set_alpha(0.5);

    draw_rectangle(
        wind_x - 55,
        wind_y,
        wind_x + 55,
        wind_y + 25,
        false
    );

    // Reset alpha after background
    draw_set_alpha(1);

    draw_set_font(f_buttons);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    if global.wind_warning
    {
        // Flash the warning text
        if (floor(current_time / 150) mod 2 == 0)
        {
            draw_set_color(c_yellow);

            draw_text(
                wind_x,
                wind_y + 12,
                "WIND CHANGING!"
            );
        }
    }
    else
    {
        draw_set_color(c_white);

        if global.wind_direction == 1
        {
            draw_text(
                wind_x,
                wind_y + 12,
                "WIND  >>"
            );
        }
        else
        {
            draw_text(
                wind_x,
                wind_y + 12,
                "<<  WIND"
            );
        }
    }

    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// GAME OVER SCREEN


if dying
{
    // Dark translucent overlay
    draw_set_alpha(gameover_alpha);
    draw_set_color(c_black);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    // GAME OVER TITLE
    draw_set_alpha(gameover_alpha);
    draw_set_color(c_white);
    draw_set_font(f_menu_title);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        display_get_gui_width() / 2,
        75,
        "GAME OVER"
    );


    // BUTTONS
    if gameover_button_alpha > 0
    {
        draw_set_alpha(gameover_button_alpha);
        draw_set_font(f_buttons);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);

        var button_x = display_get_gui_width() / 2;

        var restart_y = 145;
        var menu_y = 180;
        var quit_y = 215;

        // Restart
        if gameover_cursor == 0
        {
            draw_set_color(c_white);
            draw_text(button_x, restart_y, "> RESTART");
        }
        else
        {
            draw_set_color(c_gray);
            draw_text(button_x, restart_y, "RESTART");
        }

        // Main Menu
        if gameover_cursor == 1
        {
            draw_set_color(c_white);
            draw_text(button_x, menu_y, "> MAIN MENU");
        }
        else
        {
            draw_set_color(c_gray);
            draw_text(button_x, menu_y, "MAIN MENU");
        }

        // Quit
        if gameover_cursor == 2
        {
            draw_set_color(c_white);
            draw_text(button_x, quit_y, "> QUIT");
        }
        else
        {
            draw_set_color(c_gray);
            draw_text(button_x, quit_y, "QUIT");
        }
    }

    // Reset drawing settings
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// PAUSE SCREEN

if global.paused
{

    // DARK TRANSLUCENT OVERLAY

    draw_set_alpha(pause_alpha);
    draw_set_color(c_black);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    // PAUSE TITLE

    draw_set_alpha(pause_alpha);
    draw_set_color(c_white);
    draw_set_font(f_menu_title);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        display_get_gui_width() / 2,
        75,
        "PAUSED"
    );

    // BUTTONS

    if pause_button_alpha > 0
    {
        draw_set_alpha(pause_button_alpha);
        draw_set_font(f_buttons);

        var button_x = display_get_gui_width() / 2;

        var resume_y = 145;
        var restart_y = 180;
        var menu_y = 215;


        // RESUME

        if pause_cursor == 0
        {
            draw_set_color(c_white);
            draw_text(button_x, resume_y, "> RESUME");
        }
        else
        {
            draw_set_color(c_gray);
            draw_text(button_x, resume_y, "RESUME");
        }


        // RESTART

        if pause_cursor == 1
        {
            draw_set_color(c_white);
            draw_text(button_x, restart_y, "> RESTART");
        }
        else
        {
            draw_set_color(c_gray);
            draw_text(button_x, restart_y, "RESTART");
        }


        // MAIN MENU

        if pause_cursor == 2
        {
            draw_set_color(c_white);
            draw_text(button_x, menu_y, "> MAIN MENU");
        }
        else
        {
            draw_set_color(c_gray);
            draw_text(button_x, menu_y, "MAIN MENU");
        }
    }


    // Reset drawing settings

    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// TIMER HUD — LEVEL 4 ONLY

if !dying && room == rm_level4
{
    var time_left = max(0, obj_tide.timer_frames / room_speed);

    var seconds = ceil(time_left);

    var minutes = floor(seconds / 60);
    var secs = seconds mod 60;

    var time_text = string(minutes) + ":";

    if secs < 10
    {
        time_text += "0";
    }

    time_text += string(secs);


    // Timer position
    var timer_x = 32;
    var timer_y = 45;


    // Font and alignment
    draw_set_font(f_buttons);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);


    // Black outline
    draw_set_color(c_black);

    for (var ox = -1; ox <= 1; ox++)
    {
        for (var oy = -1; oy <= 1; oy++)
        {
            if (ox != 0 || oy != 0)
            {
                draw_text(
                    timer_x + ox,
                    timer_y + oy,
                    "TIME"
                );

                draw_text(
                    timer_x + ox,
                    timer_y + 20 + oy,
                    time_text
                );
            }
        }
    }


    // White text
    draw_set_color(c_white);

    draw_text(
        timer_x,
        timer_y,
        "TIME"
    );

    draw_text(
        timer_x,
        timer_y + 20,
        time_text
    );


    // Reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}