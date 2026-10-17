
/// ENDING CUTSCENE CONTROLLER — STEP

// Stop typing sound if we leave the hangi scene
if (room != rm_end_hangi && typing_sound_instance != -1)
{
    audio_stop_sound(typing_sound_instance);
    typing_sound_instance = -1;
}

// Check which ending scene we're in
var in_ending_scene =
    room == rm_mountain_ending ||
    room == rm_end_get_kite ||
    room == rm_end_hangi ||
    room == rm_end_flying_kites;

// SKIP BUTTON — ALL FOUR SCENES
if (in_ending_scene)
{
    var can_skip =
        (room != rm_end_flying_kites || !ending_title_visible);

    if (can_skip)
    {
        var skip_mx = device_mouse_x_to_gui(0);
        var skip_my = device_mouse_y_to_gui(0);

        skip_hover =
            skip_mx >= skip_button_x - skip_button_w / 2 &&
            skip_mx <= skip_button_x + skip_button_w / 2 &&
            skip_my >= skip_button_y - skip_button_h / 2 &&
            skip_my <= skip_button_y + skip_button_h / 2;

        if (skip_hover && mouse_check_button_pressed(mb_left))
        {
            audio_play_sound(snd_button_click, 1, false);

            global.skip_ending = true;

            // From scenes 1–3, jump to the final scene
            if (room != rm_end_flying_kites)
            {
                room_goto(rm_end_flying_kites);
            }
        }
    }
    else
    {
        skip_hover = false;
    }
}

// COMPLETE THE SKIP IN THE FINAL SCENE
if (room == rm_end_flying_kites && global.skip_ending)
{
    var skip_cam = instance_find(obj_ending_camera, 0);

    if (skip_cam != noone)
    {
        skip_cam.cam_y = 0;
        skip_cam.pan_started = true;
        skip_cam.pan_finished = true;

        camera_set_view_pos(skip_cam.cam, skip_cam.cam_x, 0);

        var skip_movement =
            -(room_height - camera_get_view_height(skip_cam.cam));

        layer_y(skip_cam.far_layer,
            skip_cam.far_start_y + skip_movement * 0.10);

        layer_y(skip_cam.mid_layer,
            skip_cam.mid_start_y + skip_movement * 0.30);

        layer_y(skip_cam.close_layer,
            skip_cam.close_start_y + skip_movement * 0.60);

        ending_title_visible = true;
        ending_buttons_visible = true;
        ending_title_timer = ending_title_delay;
        ending_buttons_timer = 0;

        global.skip_ending = false;
    }
}

// SCENE 1: MOUNTAIN
if (room == rm_mountain_ending)
{
    scene_timer++;

    if (scene_timer >= scene_duration)
    {
        room_goto(rm_end_get_kite);
    }

    cutscene_fade_alpha = max(
        0,
        cutscene_fade_alpha - cutscene_fade_speed
    );
}

// SCENE 2: GET THE KITE
else if (room == rm_end_get_kite)
{
    scene_timer++;

    if (scene_timer >= scene_duration)
    {
        room_goto(rm_end_hangi);
    }
}

// SCENE 3: HANGI GATHERING
else if (room == rm_end_hangi)
{
    var hangi_obj = instance_find(obj_hangi_gathering, 0);

    // Wait until the animation finishes
    if (!hangi_message_started &&
        hangi_obj != noone &&
        hangi_obj.image_index >= hangi_obj.image_number - 1)
    {
        hangi_obj.image_index = hangi_obj.image_number - 1;
        hangi_obj.image_speed = 0;

        hangi_message_started = true;
    }

    // TYPE THE HANGI MESSAGE
    if (hangi_message_started && !typing_finished)
    {
        typing_timer++;

        if (typing_timer >= typing_speed)
        {
            typing_timer = 0;
            typing_index++;

            if (typing_index <= string_length(hangi_message))
            {
                var typed_char = string_char_at(
                    hangi_message,
                    typing_index
                );

				if (typed_char != " " && typed_char != "\n")
				{
				    // Only play a new typing sound if the previous one finished
				    if (typing_sound_instance == -1
				        || !audio_is_playing(typing_sound_instance))
				    {
				        typing_sound_instance =
				            audio_play_sound(snd_typing, 1, false);
				    }
				}
            }

            // Message completely typed
            if (typing_index >= string_length(hangi_message))
            {
                typing_index = string_length(hangi_message);
                typing_finished = true;
                hangi_message_timer = hangi_message_duration;

                // Stop the final typing sound
                if (typing_sound_instance != -1)
                {
                    audio_stop_sound(typing_sound_instance);
                    typing_sound_instance = -1;
                }
            }
        }
    }
    else if (typing_finished)
    {

        hangi_message_timer--;

        if (hangi_message_timer <= 0)
        {
            room_goto(rm_end_flying_kites);
        }
    }
}

// SCENE 4: FLYING KITES AND CAMERA PAN
else if (room == rm_end_flying_kites)
{
    var ending_cam = instance_find(obj_ending_camera, 0);

    // AUTOMATIC TITLE TIMING
    if (ending_cam != noone && ending_cam.pan_started)
    {
        if (!ending_title_visible)
        {
            ending_title_timer++;

            if (ending_title_timer >= ending_title_delay)
            {
                ending_title_visible = true;
                ending_buttons_visible = true;
                ending_buttons_timer = room_speed;
            }
        }
        else if (ending_buttons_timer > 0)
        {
            ending_buttons_timer--;
        }
    }

    // BUTTON MOUSE CONTROLS
    if (ending_buttons_visible && ending_buttons_timer <= 0)
    {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);

        var quit_y = ending_menu_y + ending_button_spacing;

        // Mouse hit areas around the two button labels
        var over_menu =
            mx >= ending_menu_x - 120 &&
            mx <= ending_menu_x + 120 &&
            my >= ending_menu_y - 20 &&
            my <= ending_menu_y + 20;

        var over_quit =
            mx >= ending_menu_x - 120 &&
            mx <= ending_menu_x + 120 &&
            my >= quit_y - 20 &&
            my <= quit_y + 20;

        var mouse_over_button = over_menu || over_quit;

        // Select the button under the mouse
        if (over_menu)
        {
            if (!ending_mouse_was_over_button || ending_selected != 0)
            {
                audio_play_sound(snd_button_hover, 1, false);
            }

            ending_selected = 0;
        }
        else if (over_quit)
        {
            if (!ending_mouse_was_over_button || ending_selected != 1)
            {
                audio_play_sound(snd_button_hover, 1, false);
            }

            ending_selected = 1;
        }

        ending_mouse_was_over_button = mouse_over_button;

        // Click a button
        if (mouse_check_button_pressed(mb_left))
        {
            if (over_menu)
            {
                audio_play_sound(snd_button_click, 1, false);

                // Stop outro music before returning to menu
                if (variable_global_exists("outro_music_instance"))
                {
                    if (global.outro_music_instance != -1)
                    {
                        audio_stop_sound(global.outro_music_instance);
                        global.outro_music_instance = -1;
                    }
                }

                room_goto(rm_main_menu);
            }
            else if (over_quit)
            {
                audio_play_sound(snd_button_click, 1, false);

                // Stop outro music before quitting
                if (variable_global_exists("outro_music_instance"))
                {
                    if (global.outro_music_instance != -1)
                    {
                        audio_stop_sound(global.outro_music_instance);
                        global.outro_music_instance = -1;
                    }
                }

                game_end();
            }
        }

        // KEYBOARD NAVIGATION — UP/DOWN
        if (keyboard_check_pressed(vk_up))
        {
            ending_selected++;

            if (ending_selected >= 2)
            {
                ending_selected = 0;
            }

            audio_play_sound(snd_button_hover, 1, false);
        }

        if (keyboard_check_pressed(vk_down))
        {
            ending_selected--;

            if (ending_selected < 0)
            {
                ending_selected = 1;
            }

            audio_play_sound(snd_button_hover, 1, false);
        }

        // KEYBOARD CONFIRM — ENTER/SPACE
        if (keyboard_check_pressed(vk_enter) ||
            keyboard_check_pressed(vk_space))
        {
            audio_play_sound(snd_button_click, 1, false);

            switch (ending_selected)
            {
                case 0:
                    if (variable_global_exists("outro_music_instance"))
                    {
                        if (global.outro_music_instance != -1)
                        {
                            audio_stop_sound(global.outro_music_instance);
                            global.outro_music_instance = -1;
                        }
                    }

                    room_goto(rm_main_menu);
                    break;

                case 1:
                    if (variable_global_exists("outro_music_instance"))
                    {
                        if (global.outro_music_instance != -1)
                        {
                            audio_stop_sound(global.outro_music_instance);
                            global.outro_music_instance = -1;
                        }
                    }

                    game_end();
                    break;
            }
        }
    }
    else
    {
        ending_mouse_was_over_button = false;
    }
}
