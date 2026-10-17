function take_damage(_knockback_dir = 0)
{
    // Don't take damage while already dying
    if dying
    {
        return;
    }

    // Only take damage when not invincible
    if !invincible
    {
        hp -= 1;
		
		// PLAY DAMAGE SOUND
		audio_play_sound(snd_player_damage, 1, false);

        // PLAYER HAS DIED

        if hp <= 0
        {
            hp = 0;


			if face == 1
			{
			    
			    death_frame = 0;
			}
			else
			{
			    
			    death_frame = 1;
			}

            dying = true;
            death_on_ground = false;

            hascontrol = false;
            frozen = false;

            invincible = false;
            inv_timer = 0;
            flash_timer = 0;
            image_alpha = 1;

            // Original knockback
            if _knockback_dir != 0
            {
                knockback_hsp = _knockback_dir * 2;
                knockback_timer = 15;
            }

            // Knock player upwards
            vsp = -3;
        }

        // PLAYER SURVIVED THE HIT

        else
        {
            invincible = true;
            inv_timer = inv_duration;
            flash_timer = 0;

            // Original knockback
            if _knockback_dir != 0
            {
                knockback_hsp = _knockback_dir * 2.5;
                knockback_timer = 15;
            }

            // Knock player upwards
            vsp = -3;
        }
    }
}