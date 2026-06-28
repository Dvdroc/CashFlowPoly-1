draw_set_color(c_black);
draw_set_alpha(.5);

draw_rectangle(0,0, room_width, room_height, 0);

draw_set_color(c_white);
draw_rectangle(0,(room_height/2)-100, room_width, (room_height/2)+100, 0);
draw_set_alpha(1);

draw_self();