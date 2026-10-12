// Gently bob up and down
y = start_y + sin((current_time / 1000) * bob_speed + bob_offset)
    * bob_height;