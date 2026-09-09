/// INSTRUCTIONS CONTROLLER


// BACK BUTTON


var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Check if mouse is over BACK
back_hover =
    mx >= back_x - 10 &&
    mx <= back_x + 80 &&
    my >= back_y - 20 &&
    my <= back_y + 20;

// Click BACK
if back_hover && mouse_check_button_pressed(mb_left)
{
    scr_slide_transition(TRANS_MODE.GOTO, rm_main_menu);
}