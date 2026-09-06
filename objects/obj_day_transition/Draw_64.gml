if(global.tanggal <= 25 || global.endgame = true){
	// Background hitam transparan
	draw_set_alpha(alpha * 0.6);
	draw_set_color(c_black);

	draw_rectangle(
	    0,
	    0,
	    room_width,
	    room_height,
	    false
	);

	// Reset alpha
	draw_set_alpha(alpha);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	// ===== HARI KE =====
	draw_set_font(fnt_turn);
	draw_set_color(c_white);

	draw_text_transformed(
	    room_width / 2,
	    title_y + title_offset,
	    "HARI KE-" + string(global.tanggal),
	    scale,
	    scale,
	    0
	);

	// ===== NAMA HARI =====
	draw_set_font(fnt_turn); // atau fnt_turn kalau cuma punya satu font

	draw_text_transformed(
	    room_width / 2,
	    day_y + day_offset,
	    string_upper(global.day),
	    scale * 0.8,
	    scale * 0.8,
	    0
	);

	// Reset draw state
	draw_set_font(-1);          // kembali ke font default
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_set_alpha(1);
}