// TORCH BARRIER
if (barrier_type == "torch")
{
    if (global.has_torch)
    {
        instance_destroy();
    }
}

// STAR BARRIER
if (barrier_type == "stars")
{
    if (global.mini_stars_collected >= 5)
    {
        instance_destroy();
    }
}