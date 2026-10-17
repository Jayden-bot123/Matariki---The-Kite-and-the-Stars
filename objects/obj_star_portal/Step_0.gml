/// obj_star_portal — STEP

// Stop the sequence while paused
if (global.paused)
{
    exit;
}

// Animate the portal while the description is hidden
if (!show_description)
{
    image_yscale = 1 + sin(current_time * 0.003) * 0.08;
    image_xscale = 1 + sin(current_time * 0.003) * 0.08;
    image_angle += 0.5;

    exit;
}

// PHASE 1 — STAR SLIDES UP
if (phase == 1)
{
    star_anim_y -= 4;

    if (star_anim_y <= display_get_gui_height() / 2 - 120)
    {
        star_anim_y = display_get_gui_height() / 2 - 120;
        phase = 2;
    }
}

// PHASE 2 — DESCRIPTION FADES IN
if (phase == 2)
{
    text_alpha += 0.02;

    if (text_alpha >= 1)
    {
        text_alpha = 1;
        phase = 3;
    }
}

// PHASE 3 — WAIT, THEN SHOW SKIP PROMPT
if (phase == 3)
{
    if (description_timer > 0)
    {
        description_timer--;
    }
    else
    {
        skip_alpha += 0.03;

        if (skip_alpha > 1)
        {
            skip_alpha = 1;
        }
    }

    // Continue only after the prompt appears
    if (skip_alpha > 0 && keyboard_check_pressed(vk_enter))
    {
        with (obj_player)
        {
            frozen = false;
        }

        scr_slide_transition(TRANS_MODE.NEXT);
    }
}