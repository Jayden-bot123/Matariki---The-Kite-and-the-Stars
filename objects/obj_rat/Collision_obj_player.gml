// -------------------------------------------------
// PLAYER JUMPS ON RAT
// -------------------------------------------------

if !other.invincible
&& other.vsp > 0
&& other.bbox_bottom <= bbox_top + 4
{
    // Kill the rat
    instance_destroy();

    // Bounce player
    with (other)
    {
        vsp = -5;
    }
}
else
{
    // -------------------------------------------------
    // RAT HITS PLAYER
    // -------------------------------------------------

    if !other.invincible
    {
        var knockback_dir = sign(other.x - x);

        with (other)
        {
            take_damage(knockback_dir);
        }
    }
}