// Start at the right end of the patrol area
x = start_x + patrol_distance / 2;

// Keep the bird at its placed Y position
y = start_y;

// Begin moving left
bird_direction = -1;
active = true;

// Reset animation
image_index = 0;
bird_anim_timer = 0;

// Show the bird
visible = true;
