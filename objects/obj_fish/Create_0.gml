// Jump settings
jump_speed = -6;
grv = 0.3;             // gravity pulling it back down
vsp = 0;
hsp = 0;
start_y = y;            // remember starting position
active = false;         // starts hidden in water

// Random first jump delay so fish dont all jump at once
alarm[0] = irandom_range(60, 200);

// Animation
image_speed = 0;
image_index = 0;