/// MENU CAMERA

// Move upward
cam_y -= camera_speed;

// Don't let the camera go above the room
if cam_y < 0
{
    cam_y = 0;
}

// Apply camera position
camera_set_view_pos(
    cam,
    cam_x,
    cam_y
);


// STAR PARALLAX


var movement = cam_y - (room_height - camera_get_view_height(cam));

layer_y(
    far_layer,
    far_start_y + movement * 0.10
);

layer_y(
    mid_layer,
    mid_start_y + movement * 0.30
);

layer_y(
    close_layer,
    close_start_y + movement * 0.60
);