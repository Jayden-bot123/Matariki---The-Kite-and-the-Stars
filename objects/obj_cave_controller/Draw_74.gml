
if (!instance_exists(obj_player)) exit;

var _cam_x = camera_get_view_x(view_camera[0]);
var _cam_y = camera_get_view_y(view_camera[0]);

var _cam_width = camera_get_view_width(view_camera[0]);
var _cam_height = camera_get_view_height(view_camera[0]);

var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// Convert the player's world position to GUI coordinates
var _light_x = (obj_player.x - _cam_x)
    * (_gui_width / _cam_width);

var _light_y = _gui_height
    - ((obj_player.y - 8 - _cam_y)
    * (_gui_height / _cam_height));

// Draw the cave darkness and torch light
shader_set(sh_cave_light);

var _light_pos = shader_get_uniform(sh_cave_light, "u_light_pos");
var _radius = shader_get_uniform(sh_cave_light, "u_radius");
var _softness = shader_get_uniform(sh_cave_light, "u_softness");

shader_set_uniform_f(_light_pos, _light_x, _light_y);
shader_set_uniform_f(_radius, light_radius);
shader_set_uniform_f(_softness, 18);

draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(0, 0, _gui_width, _gui_height, false);

shader_reset();
draw_set_color(c_white);
draw_set_alpha(1);