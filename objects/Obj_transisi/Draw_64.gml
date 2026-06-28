/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(alpha_value);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false); // false = tidak di-outline
draw_set_alpha(1); // reset alpha
draw_set_color(c_white); // reset color ke default