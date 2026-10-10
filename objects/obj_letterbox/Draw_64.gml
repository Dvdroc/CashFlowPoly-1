var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _m = 5000;

draw_set_alpha(1);
draw_set_color(c_black);

draw_rectangle(-_m, -_m, -1, _h + _m, false);        // kiri
draw_rectangle(_w, -_m, _w + _m, _h + _m, false);    // kanan
draw_rectangle(-_m, -_m, _w + _m, -1, false);        // atas
draw_rectangle(-_m, _h, _w + _m, _h + _m, false);    // bawah

draw_set_color(c_white);