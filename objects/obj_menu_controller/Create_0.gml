/// MENU TITLE

title_alpha = 0;
title_fade_speed = 0.025;

// Wait 2.5 seconds before fading in
title_delay = room_speed * 2.5;

// Wait until the title has finished fading,
// then wait another 1.5 seconds before buttons appear.
button_delay = -1;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25; //lower is faster
menu_font = f_buttons;
menu_itemheight = font_get_size(f_buttons);
menu_committed = -1;
menu_control = true;

menu[2] = "New Game";
menu[1] = "Instructions";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 2;