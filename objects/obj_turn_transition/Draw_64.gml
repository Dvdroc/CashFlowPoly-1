if (global.tampilan == 0) {
// Background
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_alpha(1);

// Panel
draw_set_color(c_white);
draw_rectangle(
    0,
    room_height / 2 - 120,
    room_width,
    room_height / 2 + 120,
    false
);

// Nama pemain
draw_set_font(fnt_turn);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);

draw_text(
    room_width / 2,
    room_height / 2,
    string(next_name)
);

// Sprite
draw_set_alpha(image_alpha);

draw_sprite_ext(
    sprite_index,
    image_index,
    x,
    y,
    image_xscale * 0.5,
    image_yscale * 0.5,
    0,
    c_white,
    image_alpha
);

// =======================
// RESET DRAW STATE
// =======================
draw_set_font(-1);          // kembali ke font default
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);
}