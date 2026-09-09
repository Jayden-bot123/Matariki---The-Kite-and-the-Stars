/// MENU CAMERA

// Get the current camera
cam = view_camera[0];

// Camera position
cam_x = 0;

// Start at the bottom of the room
cam_y = room_height - camera_get_view_height(cam);

// Camera speed
camera_speed = 0.75;

// Set starting position
camera_set_view_pos(
    cam,
    cam_x,
    cam_y
);

//Parallax


far_layer = layer_get_id("bg_stars_far");
mid_layer = layer_get_id("bg_stars_mid");
close_layer = layer_get_id("bg_stars_close");

far_start_y = layer_get_y(far_layer);
mid_start_y = layer_get_y(mid_layer);
close_start_y = layer_get_y(close_layer);