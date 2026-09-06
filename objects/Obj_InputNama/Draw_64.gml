// ====== Panel utama ======
draw_set_color(make_color_rgb(235,235,245));
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
draw_set_color(c_black);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);

draw_set_halign(fa_center);
draw_text(panel_x + panel_w/2, panel_y + 20, "Input Nama Pemain");
draw_set_halign(fa_left);

// ====== Field nama pemain ======
for (var i = 0; i < array_length(field_rect); i++){
	var r = field_rect[i];

	var warna_field = (active_field == i) ? make_color_rgb(255,255,200) : make_color_rgb(255,255,255);

	draw_set_color(warna_field);
	draw_rectangle(r.x1, r.y1, r.x2, r.y2, false);
	draw_set_color(c_black);
	draw_rectangle(r.x1, r.y1, r.x2, r.y2, true);

	var label = "P" + string(i+1) + ": ";
	var teks_tampil = label + nama_pemain[i];

	// cursor kedip kalau field ini sedang fokus
	if (active_field == i && (current_time div 500) mod 2 == 0){
		teks_tampil += "|";
	}

	draw_set_valign(fa_middle);
	draw_text(r.x1 + 10, (r.y1+r.y2)/2, teks_tampil);
	draw_set_valign(fa_top);
}

// ====== Field nama kelompok ======
var warna_kelompok = (active_field == 4) ? make_color_rgb(255,255,200) : make_color_rgb(255,255,255);

draw_set_color(warna_kelompok);
draw_rectangle(field_kelompok_rect.x1, field_kelompok_rect.y1, field_kelompok_rect.x2, field_kelompok_rect.y2, false);
draw_set_color(c_black);
draw_rectangle(field_kelompok_rect.x1, field_kelompok_rect.y1, field_kelompok_rect.x2, field_kelompok_rect.y2, true);

var teks_kelompok = "Kelompok: " + nama_kelompok;
if (active_field == 4 && (current_time div 500) mod 2 == 0){
	teks_kelompok += "|";
}

draw_set_valign(fa_middle);
draw_text(field_kelompok_rect.x1 + 10, (field_kelompok_rect.y1+field_kelompok_rect.y2)/2, teks_kelompok);
draw_set_valign(fa_top);

// ====== Tombol Mulai ======
var warna_mulai = make_color_rgb(160,220,160);
if (btn_mulai_hover) warna_mulai = merge_color(warna_mulai, c_white, 0.4);

draw_set_color(warna_mulai);
draw_rectangle(btn_mulai.x1, btn_mulai.y1, btn_mulai.x2, btn_mulai.y2, false);
draw_set_color(c_black);
draw_rectangle(btn_mulai.x1, btn_mulai.y1, btn_mulai.x2, btn_mulai.y2, true);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text((btn_mulai.x1+btn_mulai.x2)/2, (btn_mulai.y1+btn_mulai.y2)/2, "Mulai");
draw_set_halign(fa_left);
draw_set_valign(fa_top);