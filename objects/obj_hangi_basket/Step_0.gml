// Only animate if portal description is not showing
var portal = instance_find(obj_star_portal, 0);
if instance_exists(obj_star_portal) && portal.show_description {
    // do nothing — freeze the float
} else {
    float_offset += float_speed;
    y = start_y + sin(float_offset) * float_height;
}