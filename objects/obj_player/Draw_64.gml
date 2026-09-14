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