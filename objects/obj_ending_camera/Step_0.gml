
/// ENDING CAMERA

// Wait before panning
if (!pan_started)
{
    wait_timer -= 1;

    if (wait_timer <= 0)
    {
        pan_started = true;
    }
}

// Continuous upward movement
if (pan_started && !pan_finished)
{
    cam_y -= camera_speed;

    // Stop when the camera reaches the top
    if (cam_y <= 0)
    {
        cam_y = 0;
        pan_finished = true;
    }
}

// Apply camera position
camera_set_view_pos(cam, cam_x, cam_y);

// STAR PARALLAX
var movement = cam_y - (room_height - camera_get_view_height(cam));

layer_y(far_layer, far_start_y + movement * 0.10);
layer_y(mid_layer, mid_start_y + movement * 0.30);
layer_y(close_layer, close_start_y + movement * 0.60);
