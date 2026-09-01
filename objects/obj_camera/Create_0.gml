finalCamX = 0;
finalCamY = 0;
camTrailSpd = 0.25;

// Set camera to player position immediately at start
if instance_exists(obj_player) {
    var _camWidth = camera_get_view_width(view_camera[0]);
    var _camHeight = camera_get_view_height(view_camera[0]);
    finalCamX = obj_player.x - _camWidth/2;
    finalCamY = obj_player.y - _camHeight/2;
    finalCamX = clamp(finalCamX, 0, room_width - _camWidth);
    finalCamY = clamp(finalCamY, 0, room_height - _camHeight);
    camera_set_view_pos(view_camera[0], finalCamX, finalCamY);
}