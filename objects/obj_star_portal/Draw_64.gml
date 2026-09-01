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
    
    // Set horizontal alignment to center for titles and descriptions
    draw_set_halign(fa_center);
    
    switch star_number {
        case 1:
            draw_text_transformed(
                display_get_gui_width()/2 + 8,
                display_get_gui_height()/2,
                "Tupuānuku", 2, 2, 0);
            draw_text_ext(
                display_get_gui_width()/2,
                display_get_gui_height()/2 + 50,
                "Tupuānuku watches over all food that grows\n " +
                "beneath the earth - the kūmara, the roots,\n " +
                "and the seeds that wait for spring.",
                -1, display_get_gui_width()-40);
        break;
        case 2:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Waitī", 2, 2, 0);
            draw_text_ext(
                display_get_gui_width()/2,
                display_get_gui_height()/2 + 50,
                "Waitī is the guardian of all freshwater -\n " +
                "the rivers, the lakes, and the creatures \n" +
                "that live within them.",
                -1, display_get_gui_width()-40);
        break;
        case 3:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Waipuna-ā-Rangi", 2, 2, 0);
            draw_text_ext(
                display_get_gui_width()/2,
                display_get_gui_height()/2 + 50,
                "Waipuna-ā-Rangi is the water that pools in \n" +
                "the sky. Its rain nourishes the land and \n" +
                "fills the rivers that feed us all.",
                -1, display_get_gui_width()-40);
        break;
        case 4:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Waitā", 2, 2, 0);
            draw_text_ext(
                display_get_gui_width()/2,
                display_get_gui_height()/2 + 50,
                "Waitā commands the ocean and all saltwater \n" +
                "creatures. The tides, the fish, and the \n" +
                "deep currents are within its care.",
                -1, display_get_gui_width()-40);
        break;
        case 5:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Ururangi", 2, 2, 0);
            draw_text_ext(
                display_get_gui_width()/2,
                display_get_gui_height()/2 + 50,
                "Ururangi is the star of the winds. Its breath \n" +
                "has carried sailors across oceans and kites \n" +
                "across the sky.",
                -1, display_get_gui_width()-40);
        break;
        case 6:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Tupuārangi", 2, 2, 0);
            draw_text_ext(
                display_get_gui_width()/2,
                display_get_gui_height()/2 + 50,
                "Tupuārangi provides all food that comes from \n" +
                "the sky - birds, berries, and the fruit that \n" +
                "grows high in the branches of trees.",
                -1, display_get_gui_width()-40);
        break;
        case 7:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Pōhutukawa", 2, 2, 0);
            draw_text_ext(
                display_get_gui_width()/2,
                display_get_gui_height()/2 + 50,
                "Pōhutukawa connects us to those who have \n" +
                "passed. It is through this star that we \n" +
                "remember and honour those who have left us.",
                -1, display_get_gui_width()-40);
        break;
        case 8:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Matariki", 2, 2, 0);
            draw_text_ext(
                display_get_gui_width()/2,
                display_get_gui_height()/2 + 50,
                "Matariki is the heart of the cluster - the \n" +
                "star of wellbeing, reflection, and the \n" +
                "gathering of people. When it rises, we come together.",
                -1, display_get_gui_width()-40);
        break;
        case 9:
            draw_text_transformed(
                display_get_gui_width()/2,
                display_get_gui_height()/2,
                "Hiwa-i-te-Rangi", 2, 2, 0);
            draw_text_ext(
                display_get_gui_width()/2,
                display_get_gui_height()/2 + 50,
                "Hiwa-i-te-Rangi is the wishing star - the \n" +
                "star of aspirations, new beginnings, and \n" +
                "everything we hope to become in the year ahead.",
                -1, display_get_gui_width()-40);
        break;
    }
    
    // Skip button fades in after 3 seconds
    draw_set_alpha(skip_alpha);
    draw_set_color(c_yellow);
    draw_set_font(f_description);
    draw_text(
        display_get_gui_width()/2,
        display_get_gui_height() - 30,
        "[ ENTER ] Continue");
    
    // Reset draw properties
    draw_set_alpha(1);
    draw_set_halign(fa_left);
}