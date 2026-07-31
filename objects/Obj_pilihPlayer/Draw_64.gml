var gui_w = display_get_gui_width();

draw_set_halign(fa_center);


draw_set_color(c_white);

draw_text(gui_w/2,80,"PILIH JUMLAH PEMAIN");


var start_x = (gui_w-box_w)/2;

for(var i=0;i<array_length(pilihan);i++)
{
    y = start_y + i*(box_h+spacing);

    if(i==hover)
        draw_set_color(make_color_rgb(40,180,40));
    else
        draw_set_color(make_color_rgb(20,120,20));

    draw_roundrect(start_x,y,start_x+box_w,y+box_h,false);

    draw_set_color(c_white);

    draw_text(
        start_x+box_w/2,
        y+13,
        pilihan[i]
    );
}