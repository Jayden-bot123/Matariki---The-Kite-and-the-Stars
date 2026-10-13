if (!ending && image_index >= image_number - 1)
{
    image_index = image_number - 1;
    image_speed = 0;
    ending = true;

    alarm[0] = room_speed;
}