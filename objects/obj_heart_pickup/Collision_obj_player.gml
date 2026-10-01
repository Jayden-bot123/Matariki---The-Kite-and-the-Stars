// obj_heart_pickup Collision with obj_player

if other.hp < other.max_hp
{
    other.hp++;
    instance_destroy();
}