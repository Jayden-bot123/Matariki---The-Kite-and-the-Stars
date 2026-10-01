if global.paused
{
    exit;
}

// Gravity
vsp += 0.5;

if vsp > 10 {
    vsp = 10;
}

// CHECK FOR WALL / SPIKE

var wall_ahead = place_meeting(x + hsp, y, obj_ground)
              || place_meeting(x + hsp, y, obj_spike);


// CHECK FOR LEDGE

var ledge_ahead = !place_meeting(
    x + (sprite_width * sign(hsp)),
    y + 1,
    obj_ground
);


// TURN AROUND

if wall_ahead || ledge_ahead {
    hsp = -hsp;
}

// HORIZONTAL COLLISION WITH GROUND


if place_meeting(x + hsp, y, obj_ground) {

    while !place_meeting(
        x + sign(hsp),
        y,
        obj_ground
    ) {
        x += sign(hsp);
    }

    hsp = -sign(hsp);
}

x += hsp;

// VERTICAL COLLISION

if place_meeting(x, y + vsp, obj_ground) {

    while !place_meeting(
        x,
        y + sign(vsp),
        obj_ground
    ) {
        y += sign(vsp);
    }

    vsp = 0;
}

y += vsp;

// RAT ANIMATION

if hsp > 0 {
    image_index = 0; // Facing right
}

if hsp < 0 {
    image_index = 1; // Facing left
}

image_speed = 0;