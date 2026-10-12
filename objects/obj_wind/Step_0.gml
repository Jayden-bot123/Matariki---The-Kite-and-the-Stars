// COUNT DOWN WIND TIMER

global.wind_timer--;


// WARNING BEFORE WIND CHANGES

if global.wind_timer <= wind_warning_time
{
    global.wind_warning = true;
}
else
{
    global.wind_warning = false;
}


// CHANGE WIND DIRECTION

if global.wind_timer <= 0
{
    global.wind_direction *= -1;

    global.wind_timer = wind_duration;

    global.wind_warning = false;
}


// APPLY WIND FORCE

global.wind_force = global.wind_direction * wind_strength;