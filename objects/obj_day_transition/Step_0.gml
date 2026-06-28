switch(state)
{
    // Fade In
    case 0:

        alpha = lerp(alpha, 1, 0.12);

        title_offset = lerp(title_offset, 0, 0.12);
        day_offset = lerp(day_offset, 0, 0.12);

        scale = lerp(scale, 1, 0.12);

        if(alpha > 0.98)
        {
            alpha = 1;
            state = 1;
        }

    break;

    // Diam
    case 1:

        timer--;

        if(timer <= 0)
        {
            state = 2;
        }

    break;

    // Fade Out
    case 2:

        alpha = lerp(alpha, 0, 0.12);

        scale = lerp(scale, 0.9, 0.12);

        if(alpha < 0.02)
        {
            instance_destroy();
        }

    break;
}