if room != rm_level4
{
    instance_destroy();
    exit;
}

if global.paused
{
    exit;
}

if !instance_exists(obj_player)
{
    exit;
}

if obj_player.dying
{
    exit;
}

if instance_exists(obj_star_portal)
{
    if obj_star_portal.show_description
    {
        exit;
    }
}

// TIMER

if timer_frames > 0
{
    timer_frames--;
}

var time_left = timer_frames / room_speed;

var tide_speed;

if time_left > 45
{
    tide_speed = 0.18;
}
else if time_left > 15
{
    tide_speed = 0.30;
}
else if time_left > 0
{
    tide_speed = 0.45;
}
else
{
    emergency_mode = true;
    tide_speed = 3;
}

tide_y -= tide_speed;


// TIDE HITS PLAYER

var player = instance_find(obj_player, 0);

if player != noone
{
    if !player.dying
    {
        if player.bbox_bottom >= tide_y
        {
            player.hp = 1;
            player.invincible = false;

            with (player)
            {
                take_damage(0);
            }
        }
    }
}