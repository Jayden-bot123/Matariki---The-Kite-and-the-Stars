if global.paused
{
    exit;
}

// Bob and rotate animation when portal is active
if !show_description {
    image_yscale = 1 + sin(current_time * 0.003) * 0.08;
    image_xscale = 1 + sin(current_time * 0.003) * 0.08;
    image_angle += 0.5;
}

// Description sequence
if show_description {
    
    // Phase 1 — star image slides up from bottom
    if phase == 1 {
        star_anim_y -= 4;
        if star_anim_y <= display_get_gui_height()/2 - 120 {
            star_anim_y = display_get_gui_height()/2 - 120;
            phase = 2;
        }
    }
    
    // Phase 2 — text fades in
    if phase == 2 {
        text_alpha += 0.02;
        if text_alpha >= 1 {
            text_alpha = 1;
            phase = 3;
        }
    }
    
    // Phase 3 — countdown then skip button fades in
    if phase == 3 {
        description_timer--;
        if description_timer <= 0 {
            skip_alpha += 0.03;
            if skip_alpha > 1 { skip_alpha = 1; }
        }
    }
    
    // Skip when enter pressed and button is visible
	if skip_alpha > 0 && keyboard_check_pressed(vk_enter) {
	    with obj_player {
	        frozen = false;
	    }
	    scr_slide_transition(TRANS_MODE.NEXT);
	}
}