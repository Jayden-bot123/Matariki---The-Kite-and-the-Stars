if show_description {
    
    // Dark overlay
    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(),
                   display_get_gui_height(), false);
    draw_set_alpha(1);
    
    // Star image sliding up
    draw_sprite(spr_star_description, 0,
                display_get_gui_width()/2, star_anim_y);
    
    // Text fading in
    draw_set_alpha(text_alpha);
    draw_set_color(c_white);
    draw_set_font(f_description);
    
    switch star_number {
        case 1:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Tupuānuku", 2, 2, 0);
            draw_text_ext(
                20,
                display_get_gui_height()/2 + 30,
                "Tupuānuku watches over all food that grows " +
                "beneath the earth - the kūmara, the roots, " +
                "and the seeds that wait for spring.",
                -1, display_get_gui_width()-40);
        break;
        case 2:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Waitī", 2, 2, 0);
            draw_text_ext(
                20,
                display_get_gui_height()/2 + 30,
                "Waitī is the guardian of all freshwater - " +
                "the rivers, the lakes, and the creatures " +
                "that live within them.",
                -1, display_get_gui_width()-40);
        break;
        case 3:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Waipuna-ā-Rangi", 2, 2, 0);
            draw_text_ext(
                20,
                display_get_gui_height()/2 + 30,
                "Waipuna-ā-Rangi is the water that pools in " +
                "the sky. Its rain nourishes the land and " +
                "fills the rivers that feed us all.",
                -1, display_get_gui_width()-40);
        break;
        case 4:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Waitā", 2, 2, 0);
            draw_text_ext(
                20,
                display_get_gui_height()/2 + 30,
                "Waitā commands the ocean and all saltwater " +
                "creatures. The tides, the fish, and the " +
                "deep currents are within its care.",
                -1, display_get_gui_width()-40);
        break;
        case 5:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Ururangi", 2, 2, 0);
            draw_text_ext(
                20,
                display_get_gui_height()/2 + 30,
                "Ururangi is the star of the winds. Its breath " +
                "has carried sailors across oceans and kites " +
                "across the sky.",
                -1, display_get_gui_width()-40);
        break;
        case 6:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Tupuārangi", 2, 2, 0);
            draw_text_ext(
                20,
                display_get_gui_height()/2 + 30,
                "Tupuārangi provides all food that comes from " +
                "the sky - birds, berries, and the fruit that " +
                "grows high in the branches of trees.",
                -1, display_get_gui_width()-40);
        break;
        case 7:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Pōhutukawa", 2, 2, 0);
            draw_text_ext(
                20,
                display_get_gui_height()/2 + 30,
                "Pōhutukawa connects us to those who have " +
                "passed. It is through this star that we " +
                "remember and honour those who have left us.",
                -1, display_get_gui_width()-40);
        break;
        case 8:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Matariki", 2, 2, 0);
            draw_text_ext(
                20,
                display_get_gui_height()/2 + 30,
                "Matariki is the heart of the cluster - the " +
                "star of wellbeing, reflection, and the " +
                "gathering of people. When it rises, we come together.",
                -1, display_get_gui_width()-40);
        break;
        case 9:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Hiwa-i-te-Rangi", 2, 2, 0);
            draw_text_ext(
                20,
                display_get_gui_height()/2 + 30,
                "Hiwa-i-te-Rangi is the wishing star - the " +
                "star of aspirations, new beginnings, and " +
                "everything we hope to become in the year ahead.",
                -1, display_get_gui_width()-40);
        break;
    }
    
    // Skip button fades in after 3 seconds
    draw_set_alpha(skip_alpha);
    draw_set_color(c_yellow);
    draw_set_font(f_description);
    draw_text(
        display_get_gui_width()/2 - 60,
        display_get_gui_height() - 30,
        "[ ENTER ] Continue");
    
    // Reset alpha
    draw_set_alpha(1);
}