
/// @description Damage player and knock them away from bird

if (active && !other.invincible)
{
    // Remember the direction the bird is travelling
    var bird_dir = bird_direction;

    // Damage the player
    with (other)
    {
        take_damage(-1);

        // Knock the player away from the bird's direction
        knockback_hsp = bird_dir * 3;

        // Small upward bounce
        vsp = -4;
    }
}
