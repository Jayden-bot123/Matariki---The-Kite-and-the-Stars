// Only damage if fish is active and in the air
if active {
    if !other.invincible {
        var knockback_dir = sign(other.x - x);
        with other {
            take_damage(knockback_dir);
            vsp = -4; // small upward bounce when hit by fish
        }
    }
}