/// DRAW INSTRUCTIONS

// TITLE

draw_set_font(f_menu_title);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    gui_width / 2,
    90,
    "HOW TO PLAY"
);


// CONTROLS

draw_set_font(f_instructions);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    gui_width / 2,
    150,
    "INSTRUCTIONS"
);

draw_set_font(f_hangi);

draw_text(
    gui_width / 2,
    185,
    "A / Left Arrow - Move Left"
);

draw_text(
    gui_width / 2,
    205,
    "D / Right Arrow - Move Right"
);

draw_text(
    gui_width / 2,
    225,
    "W / Up Arrow / SPACE - Jump"
);

draw_text(
    gui_width / 2,
    245,
    "Aviod the enemies. Jump on rats to kill them"
);
draw_text(
    gui_width / 2,
    265,
    "Collect hangi baskets"
);
draw_text(
    gui_width / 2,
    285,
    "Jump into star portal to move to next level"
);

// ABOUT THE GAME

draw_set_font(f_instructions);
draw_set_color(c_white);

draw_text(
    gui_width / 2,
    325,
    "ABOUT THE GAME"
);

draw_set_font(f_hangi);

draw_text(
    gui_width / 2,
    350,
    "Matariki: The Kite and the Stars is a"
);

draw_text(
    gui_width / 2,
    370,
    "platform game inspired by Matariki."
);

draw_text(
    gui_width / 2,
    390,
    "Explore the world, collect hangi,"
);

draw_text(
    gui_width / 2,
    410,
    "avoid enemies and hazards, and"
);

draw_text(
    gui_width / 2,
    430,
    "complete each level."
);

// BACK BUTTON

draw_set_font(back_font);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if back_hover
{
    draw_set_color(c_white);
}
else
{
    draw_set_color(c_gray);
}

draw_text(
    back_x,
    back_y,
    back_text
);

// RESET DRAW SETTINGS

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);