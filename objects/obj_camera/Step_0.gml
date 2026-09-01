// Fullscreen toggle
if keyboard_check_pressed(vk_f8) {
    window_set_fullscreen(!window_get_fullscreen());
}

// Exit if no player
if !instance_exists(obj_player) exit;

// Get camera size
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

// Get camera target
var _camX = obj_player.x - _camWidth/2;
var _camY = obj_player.y - _camHeight/2;

// Constrain to room borders
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

// Smooth camera follow
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;

// Apply camera position
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);