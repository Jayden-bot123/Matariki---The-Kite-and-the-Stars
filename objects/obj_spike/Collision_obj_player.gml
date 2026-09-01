with other {
    if !invincible {
        var knockback_dir = sign(other.x - x);
        take_damage(-face);
    }
}