switch(state)
{
    //---------------------------------------
    // Masuk
    //---------------------------------------
    case 0:

        x = lerp(x, target_x, 0.15);
        image_alpha = lerp(image_alpha, 1, 0.15);

        image_xscale = lerp(image_xscale, 1.08, 0.15);
        image_yscale = image_xscale;

        if (abs(x - target_x) < 2)
        {
            x = target_x;

            timer = room_speed;
            state = 1;
        }

    break;

    //---------------------------------------
    // Diam sebentar
    //---------------------------------------
    case 1:

        image_xscale = lerp(image_xscale,1,0.15);
        image_yscale = image_xscale;

        timer--;

        if(timer <= 0)
            state = 2;

    break;

    //---------------------------------------
    // Keluar
    //---------------------------------------
    case 2:

        x = lerp(x,-300,0.15);
        image_alpha = lerp(image_alpha,0,0.15);

        if(image_alpha < 0.02)
        {
            instance_destroy();
        }

    break;
}