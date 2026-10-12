// Don't collect stars while paused or dying
if (global.paused || other.dying)
{
    exit;
}

// Collect the star
global.mini_stars_collected += 1;

// Play your collection sound here if desired

// Remove this star
instance_destroy();