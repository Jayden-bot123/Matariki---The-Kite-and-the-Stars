/// CUTSCENE SKIP BUTTON

// Update GUI dimensions
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

// Keep button at the top-right
skip_x = gui_width - 25;

// Mouse position in GUI coordinates
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Check if mouse is over SKIP
skip_hover =
    mx >= skip_x - 80 &&
    mx <= skip_x &&
    my >= skip_y - 20 &&
    my <= skip_y + 20;

// Click SKIP
if (skip_hover && mouse_check_button_pressed(mb_left))
{
    room_goto(rm_level1);
}