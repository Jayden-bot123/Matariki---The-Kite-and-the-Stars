function take_damage(_knockback_dir = 0)
{
    if !invincible
    {
        hp -= 1;

        // Start invincibility
        invincible = true;
        inv_timer = inv_duration;

        // Knock player away from whatever hit them
        if _knockback_dir != 0
        {
            knockback_hsp = _knockback_dir * 2.5;
            knockback_timer = 15;
        }

        // Small upward knockback
        vsp = -3;
    }
}