function scr_slide_transition()
{
    var transition_mode = argument[0];
    var transition_target = -1;

    if (argument_count > 1)
    {
        transition_target = argument[1];
    }

    // Only start a transition if one isn't already underway
    var transition_started = false;

    with (obj_transition)
    {
        if (mode == TRANS_MODE.OFF)
        {
            mode = transition_mode;

            if (argument_count > 1)
            {
                target = transition_target;
            }

            transition_started = true;
        }
    }

    // Play the sound only once when a transition begins
    if (transition_started)
    {
        audio_play_sound(snd_transition, 1, false);
    }
}