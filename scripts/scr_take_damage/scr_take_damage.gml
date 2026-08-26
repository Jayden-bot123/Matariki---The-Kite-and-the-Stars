function take_damage()
{
    if !invincible
    {
        hp -= 1;
        invincible = true;
        inv_timer = inv_duration;
    }
}