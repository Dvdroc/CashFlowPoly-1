var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var start_x = 100;
var start_y = 200;

var box_w = 270;
var card_h = 28;

var x_offset = 0;

var warna_list = ["hijau","merah","pink","kuning"];

for (var w = 0; w < array_length(warna_list); w++)
{
	var warna = warna_list[w];

	var box_x = start_x + x_offset;
	var box_y = start_y;

	var color_box = c_gray;

	switch(warna)
	{
		case "hijau": color_box = make_color_rgb(60,170,80); break;
		case "merah": color_box = make_color_rgb(200,60,60); break;
		case "pink":  color_box = make_color_rgb(255,120,180); break;
		case "kuning":color_box = make_color_rgb(240,210,60); break;
	}

	// hitung jumlah kartu
	var jumlah = 0;
	for (var i=0;i<array_length(global.Resiko);i++)
	{
		if global.Resiko[i].warna == warna
		{
			jumlah++;
		}
	}

	var box_h = 40 + jumlah * card_h;

	draw_set_color(color_box);
	draw_rectangle(box_x,box_y,box_x+box_w,box_y+box_h,false);

	draw_set_color(c_black);
	draw_text(box_x+10,box_y+6,string_upper(warna));

	y = box_y + 30;

	for (var i=0;i<array_length(global.Resiko);i++)
	{
		var kartu = global.Resiko[i];

		if kartu.warna == warna
		{
			var color_card = color_box;

			// highlight hover
			if point_in_rectangle(mx,my,box_x+5,y,box_x+box_w-5,y+card_h)
			{
				color_card = merge_color(color_box,c_white,0.35);
			}

			draw_set_color(color_card);
			draw_rectangle(box_x+5,y,box_x+box_w-5,y+card_h,false);

			draw_set_color(c_black);
			draw_text(box_x+12,y+6,kartu.name);

			if variable_struct_exists(kartu,"biaya")
			{
				draw_text(box_x+200,y+6,string(kartu.biaya));
			}

			y += card_h;
		}
	}

	x_offset += box_w + 25;
}
if (mode_ui == 0){
	// ====== PANEL UTAMA: 1 tombol "Player Kekurangan Uang" ======
	var warna_btn = make_color_rgb(255, 140, 60);
	if (btn_kurang_uang_hover) warna_btn = merge_color(warna_btn, c_white, 0.4);

	draw_set_color(warna_btn);
	draw_rectangle(btn_kurang_uang_rect.x1, btn_kurang_uang_rect.y1, btn_kurang_uang_rect.x2, btn_kurang_uang_rect.y2, false);

	draw_set_color(c_black);
	draw_rectangle(btn_kurang_uang_rect.x1, btn_kurang_uang_rect.y1, btn_kurang_uang_rect.x2, btn_kurang_uang_rect.y2, true);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text((btn_kurang_uang_rect.x1 + btn_kurang_uang_rect.x2) / 2, (btn_kurang_uang_rect.y1 + btn_kurang_uang_rect.y2) / 2, "Player Kekurangan Uang");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
else if (mode_ui == 1){
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	// ====== SUB-PANEL JUAL EMAS ======
	draw_set_color(make_color_rgb(255,245,220));
	draw_rectangle(emas_panel_x, emas_panel_y, emas_panel_x + emas_panel_w, emas_panel_y + emas_panel_h, false);
	draw_set_color(c_black);
	draw_rectangle(emas_panel_x, emas_panel_y, emas_panel_x + emas_panel_w, emas_panel_y + emas_panel_h, true);

	draw_set_halign(fa_center);
	draw_text(emas_panel_x + emas_panel_w/2, emas_panel_y + 15, "Jual Emas");
	draw_text(emas_panel_x + emas_panel_w/2, emas_panel_y + 55, "Harga Emas per kartu:");
	draw_set_halign(fa_left);

	// Harga minus
	var warna_hminus = make_color_rgb(255,180,180);
	if (emas_harga_dummy <= emas_harga_min) warna_hminus = make_color_rgb(200,200,200);
	else if (emas_hover == 0) warna_hminus = merge_color(warna_hminus, c_white, 0.4);
	draw_set_color(warna_hminus);
	draw_rectangle(emas_harga_btn_minus.x1, emas_harga_btn_minus.y1, emas_harga_btn_minus.x2, emas_harga_btn_minus.y2, false);
	draw_set_color(c_black);
	draw_rectangle(emas_harga_btn_minus.x1, emas_harga_btn_minus.y1, emas_harga_btn_minus.x2, emas_harga_btn_minus.y2, true);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text((emas_harga_btn_minus.x1+emas_harga_btn_minus.x2)/2, (emas_harga_btn_minus.y1+emas_harga_btn_minus.y2)/2, "-");

	draw_text(emas_panel_x + emas_panel_w/2, (emas_harga_btn_minus.y1+emas_harga_btn_minus.y2)/2, string(emas_harga_dummy) + " koin");

	// Harga plus
	var warna_hplus = make_color_rgb(180,255,180);
	if (emas_harga_dummy >= emas_harga_max) warna_hplus = make_color_rgb(200,200,200);
	else if (emas_hover == 1) warna_hplus = merge_color(warna_hplus, c_white, 0.4);
	draw_set_color(warna_hplus);
	draw_rectangle(emas_harga_btn_plus.x1, emas_harga_btn_plus.y1, emas_harga_btn_plus.x2, emas_harga_btn_plus.y2, false);
	draw_set_color(c_black);
	draw_rectangle(emas_harga_btn_plus.x1, emas_harga_btn_plus.y1, emas_harga_btn_plus.x2, emas_harga_btn_plus.y2, true);
	draw_text((emas_harga_btn_plus.x1+emas_harga_btn_plus.x2)/2, (emas_harga_btn_plus.y1+emas_harga_btn_plus.y2)/2, "+");

	// Label jumlah
	draw_set_halign(fa_center);
	draw_text(emas_panel_x + emas_panel_w/2, emas_panel_y + 135, "Jumlah dijual:");
	draw_set_halign(fa_left);

	// Jumlah minus
	var warna_minus = make_color_rgb(255,180,180);
	if (emas_hover == 2) warna_minus = merge_color(warna_minus, c_white, 0.4);
	draw_set_color(warna_minus);
	draw_rectangle(emas_btn_minus.x1, emas_btn_minus.y1, emas_btn_minus.x2, emas_btn_minus.y2, false);
	draw_set_color(c_black);
	draw_rectangle(emas_btn_minus.x1, emas_btn_minus.y1, emas_btn_minus.x2, emas_btn_minus.y2, true);
	draw_set_halign(fa_center);
	draw_text((emas_btn_minus.x1+emas_btn_minus.x2)/2, (emas_btn_minus.y1+emas_btn_minus.y2)/2, "-");

	draw_text(emas_panel_x + emas_panel_w/2, (emas_btn_minus.y1+emas_btn_minus.y2)/2, string(emas_jumlah_jual));

	// Jumlah plus
	var warna_plus = make_color_rgb(180,255,180);
	if (emas_hover == 3) warna_plus = merge_color(warna_plus, c_white, 0.4);
	draw_set_color(warna_plus);
	draw_rectangle(emas_btn_plus.x1, emas_btn_plus.y1, emas_btn_plus.x2, emas_btn_plus.y2, false);
	draw_set_color(c_black);
	draw_rectangle(emas_btn_plus.x1, emas_btn_plus.y1, emas_btn_plus.x2, emas_btn_plus.y2, true);
	draw_text((emas_btn_plus.x1+emas_btn_plus.x2)/2, (emas_btn_plus.y1+emas_btn_plus.y2)/2, "+");

	// Jual
	var warna_jual = make_color_rgb(180,220,255);
	if (emas_hover == 4) warna_jual = merge_color(warna_jual, c_white, 0.4);
	draw_set_color(warna_jual);
	draw_rectangle(emas_btn_jual.x1, emas_btn_jual.y1, emas_btn_jual.x2, emas_btn_jual.y2, false);
	draw_set_color(c_black);
	draw_rectangle(emas_btn_jual.x1, emas_btn_jual.y1, emas_btn_jual.x2, emas_btn_jual.y2, true);
	draw_text((emas_btn_jual.x1+emas_btn_jual.x2)/2, (emas_btn_jual.y1+emas_btn_jual.y2)/2, "Jual");

	// Batal
	var warna_batal = make_color_rgb(230,230,230);
	if (emas_hover == 5) warna_batal = merge_color(warna_batal, c_white, 0.4);
	draw_set_color(warna_batal);
	draw_rectangle(emas_btn_batal.x1, emas_btn_batal.y1, emas_btn_batal.x2, emas_btn_batal.y2, false);
	draw_set_color(c_black);
	draw_rectangle(emas_btn_batal.x1, emas_btn_batal.y1, emas_btn_batal.x2, emas_btn_batal.y2, true);
	draw_text((emas_btn_batal.x1+emas_btn_batal.x2)/2, (emas_btn_batal.y1+emas_btn_batal.y2)/2, "Batal");

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
else if (mode_ui == 2){
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	// ====== DAFTAR PLAYER KEKURANGAN UANG ======
	draw_set_color(make_color_rgb(220,235,255));
	draw_rectangle(player_list_panel_x, player_list_panel_y, player_list_panel_x + player_list_panel_w, player_list_panel_y + player_list_panel_h, false);
	draw_set_color(c_black);
	draw_rectangle(player_list_panel_x, player_list_panel_y, player_list_panel_x + player_list_panel_w, player_list_panel_y + player_list_panel_h, true);

	draw_set_halign(fa_center);
	draw_text(player_list_panel_x + player_list_panel_w/2, player_list_panel_y + 15, "Pilih Player Kekurangan Uang");
	draw_set_halign(fa_left);

	for (var i = 0; i < array_length(player_list_rect); i++){
		var r = player_list_rect[i];
		var nama = player_kurang_list[i];

		var warna_row = make_color_rgb(255,200,200);
		if (player_list_hover == i) warna_row = merge_color(warna_row, c_white, 0.4);

		draw_set_color(warna_row);
		draw_rectangle(r.x1, r.y1, r.x2, r.y2, false);
		draw_set_color(c_black);
		draw_rectangle(r.x1, r.y1, r.x2, r.y2, true);

		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text((r.x1+r.x2)/2, (r.y1+r.y2)/2, nama);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
}
else if (mode_ui == 3){
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	// ====== MENU AKSI UNTUK PLAYER TERPILIH ======
	draw_set_color(make_color_rgb(220,255,220));
	draw_rectangle(player_action_panel_x, player_action_panel_y, player_action_panel_x + player_action_panel_w, player_action_panel_y + player_action_panel_h, false);
	draw_set_color(c_black);
	draw_rectangle(player_action_panel_x, player_action_panel_y, player_action_panel_x + player_action_panel_w, player_action_panel_y + player_action_panel_h, true);

	draw_set_halign(fa_center);
	var nama_player = (player_terpilih >= 0) ? player_kurang_list[player_terpilih] : "-";
	draw_text(player_action_panel_x + player_action_panel_w/2, player_action_panel_y + 15, "Aksi untuk: " + nama_player);
	draw_set_halign(fa_left);

	for (var i = 0; i < array_length(player_action_rect); i++){
		var r = player_action_rect[i];

		var warna_row = make_color_rgb(180, 220, 255);
		if (player_action_hover == i) warna_row = merge_color(warna_row, c_white, 0.4);

		draw_set_color(warna_row);
		draw_rectangle(r.x1, r.y1, r.x2, r.y2, false);
		draw_set_color(c_black);
		draw_rectangle(r.x1, r.y1, r.x2, r.y2, true);

		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text((r.x1+r.x2)/2, (r.y1+r.y2)/2, player_action_list[i]);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}

	// Tombol "Pilih Player Lain"
	var warna_ganti = make_color_rgb(255,230,150);
	if (player_action_hover == 3) warna_ganti = merge_color(warna_ganti, c_white, 0.4);
	draw_set_color(warna_ganti);
	draw_rectangle(player_action_nav_gantiplayer.x1, player_action_nav_gantiplayer.y1, player_action_nav_gantiplayer.x2, player_action_nav_gantiplayer.y2, false);
	draw_set_color(c_black);
	draw_rectangle(player_action_nav_gantiplayer.x1, player_action_nav_gantiplayer.y1, player_action_nav_gantiplayer.x2, player_action_nav_gantiplayer.y2, true);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text((player_action_nav_gantiplayer.x1+player_action_nav_gantiplayer.x2)/2, (player_action_nav_gantiplayer.y1+player_action_nav_gantiplayer.y2)/2, "Pilih Player Lain");

	// Tombol "Tutup"
	var warna_tutup = make_color_rgb(255,180,180);
	if (player_action_hover == 4) warna_tutup = merge_color(warna_tutup, c_white, 0.4);
	draw_set_color(warna_tutup);
	draw_rectangle(player_action_nav_tutup.x1, player_action_nav_tutup.y1, player_action_nav_tutup.x2, player_action_nav_tutup.y2, false);
	draw_set_color(c_black);
	draw_rectangle(player_action_nav_tutup.x1, player_action_nav_tutup.y1, player_action_nav_tutup.x2, player_action_nav_tutup.y2, true);
	draw_text((player_action_nav_tutup.x1+player_action_nav_tutup.x2)/2, (player_action_nav_tutup.y1+player_action_nav_tutup.y2)/2, "Tutup");

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
else if (mode_ui == 4){
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);

	// ====== PANEL JUAL ANEKA KEBUTUHAN ======
	draw_set_color(make_color_rgb(255,235,200));
	draw_rectangle(kebutuhan_panel_x, kebutuhan_panel_y, kebutuhan_panel_x + kebutuhan_panel_w, kebutuhan_panel_y + kebutuhan_panel_h, false);
	draw_set_color(c_black);
	draw_rectangle(kebutuhan_panel_x, kebutuhan_panel_y, kebutuhan_panel_x + kebutuhan_panel_w, kebutuhan_panel_y + kebutuhan_panel_h, true);

	draw_set_halign(fa_center);
	draw_text(kebutuhan_panel_x + kebutuhan_panel_w/2, kebutuhan_panel_y + 15, "Jual Aneka Kebutuhan");
	draw_set_halign(fa_left);

	// --- Clip area konten biar row yg discroll gak nembus keluar panel ---
	gpu_set_scissor(kebutuhan_content_x1, kebutuhan_content_y1, kebutuhan_content_x2 - kebutuhan_content_x1, kebutuhan_content_y2 - kebutuhan_content_y1);

	var row_y = kebutuhan_content_y1 - kebutuhan_scroll;
	var row_index = 0;
	var ada_item = false;

	for (var ki = 0; ki < array_length(global.kebutuhan); ki++){
		var item  = global.kebutuhan[ki];
		var nama  = item.name;

		if (!ds_map_exists(global.player_data[player_terpilih].record, nama)) continue;
		var jumlah = global.player_data[player_terpilih].record[? nama]
		if (jumlah <= 0) continue;

		ada_item = true;

		var row_y1 = row_y;
		var row_y2 = row_y + kebutuhan_row_h;

		// skip gambar kalau row benar2 di luar area (optimisasi, opsional)
		if (row_y2 >= kebutuhan_content_y1 && row_y1 <= kebutuhan_content_y2){
			var warna_row = make_color_rgb(255,255,255);
			if (kebutuhan_hover == row_index) warna_row = merge_color(warna_row, make_color_rgb(200,220,255), 0.5);

			draw_set_color(warna_row);
			draw_rectangle(kebutuhan_content_x1, row_y1, kebutuhan_content_x2, row_y2, false);
			draw_set_color(c_black);
			draw_rectangle(kebutuhan_content_x1, row_y1, kebutuhan_content_x2, row_y2, true);

			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			draw_text(kebutuhan_content_x1 + 10, (row_y1+row_y2)/2, nama + " (punya " + string(jumlah) + ")");

			draw_set_halign(fa_right);
			draw_text(kebutuhan_content_x2 - 10, (row_y1+row_y2)/2, "Hargan Jual: " + string(floor(item.harga/2)));

			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
		}

		row_y += kebutuhan_row_h + kebutuhan_row_gap;
		row_index++;
	}

	gpu_set_scissor(0, 0, display_get_gui_width(), display_get_gui_height()); // reset scissor ke full layar

	if (!ada_item){
		draw_set_halign(fa_center);
		draw_text(kebutuhan_panel_x + kebutuhan_panel_w/2, kebutuhan_content_y1 + 30, "Tidak ada Kartu Kebutuhan yang dimiliki.");
		draw_set_halign(fa_left);
	}

	// --- Scrollbar indikator sederhana di sisi kanan area konten ---
	if (kebutuhan_scroll_max > 0){
		var sb_x1 = kebutuhan_content_x2 + 4;
		var sb_x2 = sb_x1 + 6;
		var sb_track_y1 = kebutuhan_content_y1;
		var sb_track_y2 = kebutuhan_content_y2;
		var sb_track_h  = sb_track_y2 - sb_track_y1;

		var area_h = kebutuhan_content_y2 - kebutuhan_content_y1;
		var total_content_h = area_h + kebutuhan_scroll_max;

		var thumb_h = max(15, sb_track_h * (area_h / total_content_h));
		var thumb_y1 = sb_track_y1 + (sb_track_h - thumb_h) * (kebutuhan_scroll / kebutuhan_scroll_max);

		draw_set_color(make_color_rgb(220,220,220));
		draw_rectangle(sb_x1, sb_track_y1, sb_x2, sb_track_y2, false);

		draw_set_color(make_color_rgb(120,120,120));
		draw_rectangle(sb_x1, thumb_y1, sb_x2, thumb_y1 + thumb_h, false);
	}

	// Tombol Tutup
	var warna_tutup2 = make_color_rgb(255,180,180);
	if (kebutuhan_hover == 999) warna_tutup2 = merge_color(warna_tutup2, c_white, 0.4);
	draw_set_color(warna_tutup2);
	draw_rectangle(kebutuhan_btn_tutup.x1, kebutuhan_btn_tutup.y1, kebutuhan_btn_tutup.x2, kebutuhan_btn_tutup.y2, false);
	draw_set_color(c_black);
	draw_rectangle(kebutuhan_btn_tutup.x1, kebutuhan_btn_tutup.y1, kebutuhan_btn_tutup.x2, kebutuhan_btn_tutup.y2, true);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text((kebutuhan_btn_tutup.x1+kebutuhan_btn_tutup.x2)/2, (kebutuhan_btn_tutup.y1+kebutuhan_btn_tutup.y2)/2, "Tutup");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
else if (mode_ui == 5){
	draw_set_alpha(0.6);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);

	// ====== PANEL NOTIFIKASI PINJAM SYARIAH ======
	draw_set_color(make_color_rgb(220,235,255));
	draw_rectangle(pinjam_panel_x, pinjam_panel_y, pinjam_panel_x + pinjam_panel_w, pinjam_panel_y + pinjam_panel_h, false);
	draw_set_color(c_black);
	draw_rectangle(pinjam_panel_x, pinjam_panel_y, pinjam_panel_x + pinjam_panel_w, pinjam_panel_y + pinjam_panel_h, true);

	draw_set_halign(fa_center);
	draw_text(pinjam_panel_x + pinjam_panel_w/2, pinjam_panel_y + 20, "Pinjam Syariah");

	draw_text(pinjam_panel_x + pinjam_panel_w/2, pinjam_panel_y + 60, "Ambil pinjaman 10 koin?");
	draw_text(pinjam_panel_x + pinjam_panel_w/2, pinjam_panel_y + 85, "(Tanpa riba/bunga, wajib dilunasi");
	draw_text(pinjam_panel_x + pinjam_panel_w/2, pinjam_panel_y + 105, "di akhir permainan)");
	draw_set_halign(fa_left);

	// Tombol Konfirmasi
	var warna_konfirmasi = make_color_rgb(160,220,160);
	if (pinjam_hover == 0) warna_konfirmasi = merge_color(warna_konfirmasi, c_white, 0.4);
	draw_set_color(warna_konfirmasi);
	draw_rectangle(pinjam_btn_konfirmasi.x1, pinjam_btn_konfirmasi.y1, pinjam_btn_konfirmasi.x2, pinjam_btn_konfirmasi.y2, false);
	draw_set_color(c_black);
	draw_rectangle(pinjam_btn_konfirmasi.x1, pinjam_btn_konfirmasi.y1, pinjam_btn_konfirmasi.x2, pinjam_btn_konfirmasi.y2, true);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text((pinjam_btn_konfirmasi.x1+pinjam_btn_konfirmasi.x2)/2, (pinjam_btn_konfirmasi.y1+pinjam_btn_konfirmasi.y2)/2, "Ya, Pinjam");

	// Tombol Batal
	var warna_batal2 = make_color_rgb(255,180,180);
	if (pinjam_hover == 1) warna_batal2 = merge_color(warna_batal2, c_white, 0.4);
	draw_set_color(warna_batal2);
	draw_rectangle(pinjam_btn_batal.x1, pinjam_btn_batal.y1, pinjam_btn_batal.x2, pinjam_btn_batal.y2, false);
	draw_set_color(c_black);
	draw_rectangle(pinjam_btn_batal.x1, pinjam_btn_batal.y1, pinjam_btn_batal.x2, pinjam_btn_batal.y2, true);
	draw_text((pinjam_btn_batal.x1+pinjam_btn_batal.x2)/2, (pinjam_btn_batal.y1+pinjam_btn_batal.y2)/2, "Batal");

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
if (global.testing)
{
	start_x = 150;
	start_y = 50;
	var jarak_x = 300; // jarak antar player ke samping
	draw_set_color(c_dkgray);
	draw_rectangle(0,0, room_width, room_height,false)
	draw_set_color(c_white)
	for (var i = 0; i < array_length(global.player_data); i++)
	{
	    var data = global.player_data[i];
    
	    x = start_x + i * jarak_x;
	    y = start_y;

	    // === HEADER PLAYER ===
	    var status = (i == global.current_player) ? " (AKTIF)" : "";
		var nama_tampil = (i < array_length(global.player)) ? global.player[i] : ("Player " + string(i+1));
		draw_text(x, y, "=== " + string_upper(nama_tampil) + status + " ===");

	    // === INFO UTAMA ===
	    draw_text(x, y + 20, "Uang: " + string(data.uang));
	    draw_text(x, y + 40, "Tabungan: " + string(data.tabungan));
	    draw_text(x, y + 60, "Misi: " + string(data.misi_T));

	    // === INVENTORY ===
	    draw_text(x, y + 80, "Inventory:");

	    var keys_inv = ds_map_keys_to_array(data.inventory);

	    for (var k = 0; k < array_length(keys_inv); k++)
	    {
	        var key = keys_inv[k];
	        var val = data.inventory[? key];

	        draw_text(x, y + 100 + k * 15, key + ": " + string(val));
	    }

	    // === RECORD ===
	    var offset_record = 100 + array_length(keys_inv) * 15 + 20;
	    draw_text(x, y + offset_record, "Record:");

	    var keys_rec = ds_map_keys_to_array(data.record);

	    for (var j = 0; j < array_length(keys_rec); j++)
	    {
	        var key = keys_rec[j];
	        var val = data.record[? key];

	        draw_text(x, y + offset_record + 20 + j * 15, key + ": " + string(val));
	    }

	    // === BAKED GOODS ===
	    var offset_baked = offset_record + 20 + array_length(keys_rec) * 15 + 20;
	    draw_text(x, y + offset_baked, "Baked:");

	    for (var b = 0; b < array_length(data.baked_goods); b++)
	    {
	        draw_text(x, y + offset_baked + 20 + b * 15, string(data.baked_goods[b]));
	    }

	    // === ASURANSI ===
	    if (array_length(data.asuransi) > 0)
	    {
	        var offset_asuransi = offset_baked + 20 + array_length(data.baked_goods) * 15 + 20;
	        draw_text(x, y + offset_asuransi, "Asuransi:");

	        for (var a = 0; a < array_length(data.asuransi); a++)
	        {
	            draw_text(x, y + offset_asuransi + 20 + a * 15, string(data.asuransi[a].kondisi));
	        }
	    }
	}
}