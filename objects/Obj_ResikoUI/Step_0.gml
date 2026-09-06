if(visible){
	if(global.uiblocking) exit;
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	if(mode_ui == 0){
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

			y = box_y + 30;

			for (var i=0;i<array_length(global.Resiko);i++)
			{
				var kartu = global.Resiko[i];

				if kartu.warna == warna
				{
					if mouse_check_button_pressed(mb_left)
					{
						if point_in_rectangle(mx,my,box_x+5,y,box_x+box_w-5,y+card_h)
						{
							if(kartu.warna == "hijau"){
								if (scr_hijau(i)){
									global.Uang -= kartu.biaya;
									global.record[? "kartu hijau"] += 1
								}
							}else if(kartu.warna == "merah"){
								scr_merah(i);
								global.record[? "kartu merah"] += 1
							}else if(kartu.warna == "pink"){
								global.record[? "kartu pink"] += 1
								scr_pink(i);
							}else if(kartu.warna == "kuning"){
								global.record[? "kartu kuning"] += 1
								scr_kuning(i);
							}
							if(kartu.warna != "kuning"){
								global.tampilan = 0;
								if(global.activity_points <= 0){
									if (global.current_player < 3) global.activity_points = 2;
									scr_next_player();
								}else{
									scr_save_player();
								}
								room_restart()
							}
							show_debug_message("Kartu dipilih: " + kartu.name);

							if variable_struct_exists(kartu,"biaya")
							{
								show_debug_message("Biaya: " + string(kartu.biaya));
							}
						}
					}

					y += card_h;
				}
			}

			x_offset += box_w + 25;
		}
	}

	if (mode_ui == 0){
		// ====== PANEL UTAMA: 1 tombol "Player Kekurangan Uang" ======
		btn_kurang_uang_hover = point_in_rectangle(mx, my, btn_kurang_uang_rect.x1, btn_kurang_uang_rect.y1, btn_kurang_uang_rect.x2, btn_kurang_uang_rect.y2);

		if (btn_kurang_uang_hover && mouse_check_button_pressed(mb_left)){
			show_debug_message("Tombol 'Player Kekurangan Uang' diklik");
			mode_ui = 2;
		}
	}
	else if (mode_ui == 1){
		// ====== SUB-PANEL JUAL EMAS ======
		emas_hover = -1;

		if (point_in_rectangle(mx, my, emas_harga_btn_minus.x1, emas_harga_btn_minus.y1, emas_harga_btn_minus.x2, emas_harga_btn_minus.y2)){
			emas_hover = 0;
			if (mouse_check_button_pressed(mb_left)){
				if (emas_harga_dummy > emas_harga_min) emas_harga_dummy -= 1;
			}
		}
		else if (point_in_rectangle(mx, my, emas_harga_btn_plus.x1, emas_harga_btn_plus.y1, emas_harga_btn_plus.x2, emas_harga_btn_plus.y2)){
			emas_hover = 1;
			if (mouse_check_button_pressed(mb_left)){
				if (emas_harga_dummy < emas_harga_max) emas_harga_dummy += 1;
			}
		}
		else if (point_in_rectangle(mx, my, emas_btn_minus.x1, emas_btn_minus.y1, emas_btn_minus.x2, emas_btn_minus.y2)){
			emas_hover = 2;
			if (mouse_check_button_pressed(mb_left)){
				if (emas_jumlah_jual > 1) emas_jumlah_jual -= 1;
			}
		}
		else if (point_in_rectangle(mx, my, emas_btn_plus.x1, emas_btn_plus.y1, emas_btn_plus.x2, emas_btn_plus.y2)){
			emas_hover = 3;
			if (mouse_check_button_pressed(mb_left)){
				emas_jumlah_jual += 1;
			}
		}
		else if (point_in_rectangle(mx, my, emas_btn_jual.x1, emas_btn_jual.y1, emas_btn_jual.x2, emas_btn_jual.y2)){
			emas_hover = 4;
			if (mouse_check_button_pressed(mb_left)){
				if(src_jual_emas(player_terpilih,emas_harga_dummy,emas_jumlah_jual)){
					show_debug_message("Jual emas ditekan, harga=" + string(emas_harga_dummy) + " jumlah=" + string(emas_jumlah_jual));
					mode_ui = return_mode_ui; // balik ke mode sebelumnya (0 atau 3)
				}
			}
		}
		else if (point_in_rectangle(mx, my, emas_btn_batal.x1, emas_btn_batal.y1, emas_btn_batal.x2, emas_btn_batal.y2)){
			emas_hover = 5;
			if (mouse_check_button_pressed(mb_left)){
				mode_ui = return_mode_ui;
			}
		}
	}
	else if (mode_ui == 2){
		// ====== DAFTAR PLAYER KEKURANGAN UANG ======
		player_list_hover = -1;

		for (var i = 0; i < array_length(player_list_rect); i++){
			var r = player_list_rect[i];

			if (point_in_rectangle(mx, my, r.x1, r.y1, r.x2, r.y2)){
				player_list_hover = i;

				if (mouse_check_button_pressed(mb_left)){
					player_terpilih = i;
					show_debug_message("Player dipilih: " + player_kurang_list[i]);
					mode_ui = 3;
				}
			}
		}
	}
	else if (mode_ui == 3){
		// ====== MENU AKSI UNTUK PLAYER TERPILIH ======
		player_action_hover = -1;

		for (var i = 0; i < array_length(player_action_rect); i++){
			var r = player_action_rect[i];

			if (point_in_rectangle(mx, my, r.x1, r.y1, r.x2, r.y2)){
				player_action_hover = i;

				if (mouse_check_button_pressed(mb_left)){
					show_debug_message("Aksi player " + player_kurang_list[player_terpilih] + ": " + player_action_list[i]);

					if (i == 0){ // "Jual Kebutuhan"
						return_mode_ui = 3;
						mode_ui        = 4;
					}
					else if (i == 1){ // "Jual Emas"
						return_mode_ui   = 3;
						mode_ui          = 1;
						emas_jumlah_jual = 1;
					}
					else if (i == 2){ // "Pinjam Syariah"
						return_mode_ui = 3;
						mode_ui        = 5;
					}
				}
			}
		}

		// --- Tombol "Pilih Player Lain" ---
		if (point_in_rectangle(mx, my, player_action_nav_gantiplayer.x1, player_action_nav_gantiplayer.y1, player_action_nav_gantiplayer.x2, player_action_nav_gantiplayer.y2)){
			player_action_hover = 3;
			if (mouse_check_button_pressed(mb_left)){
				player_terpilih = -1;
				mode_ui = 2;
			}
		}

		// --- Tombol "Tutup" ---
		if (point_in_rectangle(mx, my, player_action_nav_tutup.x1, player_action_nav_tutup.y1, player_action_nav_tutup.x2, player_action_nav_tutup.y2)){
			player_action_hover = 4;
			if (mouse_check_button_pressed(mb_left)){
				show_debug_message("Menu ditutup");
				mode_ui = 0; // tutup semua panel
			}
		}
	}
	else if (mode_ui == 4){
		// ====== JUAL ANEKA KEBUTUHAN (dengan scroll) ======
		kebutuhan_hover = -1;

		// --- Hitung dulu total tinggi konten & jumlah item yg dimiliki ---
		var total_dimiliki = 0;
		for (var ki = 0; ki < array_length(global.kebutuhan); ki++){
			var nama_cek = global.kebutuhan[ki].name;
			if (ds_map_exists(global.record, nama_cek) && global.record[? nama_cek] > 0){
				total_dimiliki++;
			}
		}

		var total_content_h = total_dimiliki * (kebutuhan_row_h + kebutuhan_row_gap);
		var area_h = kebutuhan_content_y2 - kebutuhan_content_y1;

		kebutuhan_scroll_max = max(0, total_content_h - area_h);

		// --- Scroll pakai mouse wheel, hanya kalau mouse di dalam panel ---
		if (point_in_rectangle(mx, my, kebutuhan_panel_x, kebutuhan_panel_y, kebutuhan_panel_x + kebutuhan_panel_w, kebutuhan_panel_y + kebutuhan_panel_h)){
			if (mouse_wheel_up())   kebutuhan_scroll -= kebutuhan_scroll_speed;
			if (mouse_wheel_down()) kebutuhan_scroll += kebutuhan_scroll_speed;
		}

		kebutuhan_scroll = clamp(kebutuhan_scroll, 0, kebutuhan_scroll_max);

		// --- Loop item, cek klik hanya kalau row terlihat penuh di dalam area ---
		var row_y = kebutuhan_content_y1 - kebutuhan_scroll;
		var row_index = 0;

		for (var ki = 0; ki < array_length(global.kebutuhan); ki++){
			var item  = global.kebutuhan[ki];
			var nama  = item.name;

			if (!ds_map_exists(global.player_data[player_terpilih].record, nama)) continue;
			var jumlah = global.player_data[player_terpilih].record[? nama]
			if (jumlah <= 0) continue;

			var row_y1 = row_y;
			var row_y2 = row_y + kebutuhan_row_h;

			// hanya proses klik kalau row sepenuhnya berada di dalam area konten (tidak kepotong)
			var row_terlihat = (row_y1 >= kebutuhan_content_y1) && (row_y2 <= kebutuhan_content_y2);

			if (row_terlihat){
				if (point_in_rectangle(mx, my, kebutuhan_content_x1, row_y1, kebutuhan_content_x2, row_y2)){
					kebutuhan_hover = row_index;

					if (mouse_check_button_pressed(mb_left)){
						if(scr_jual_aneka_kebutuhan(player_terpilih,nama,item.harga)){
							show_debug_message("Jual kebutuhan diklik: " + nama + " (harga " + string(item.harga) + ")");
						}
					}
				}
			}

			row_y += kebutuhan_row_h + kebutuhan_row_gap;
			row_index++;
		}

		// Tombol Tutup
		if (point_in_rectangle(mx, my, kebutuhan_btn_tutup.x1, kebutuhan_btn_tutup.y1, kebutuhan_btn_tutup.x2, kebutuhan_btn_tutup.y2)){
			kebutuhan_hover = 999;
			if (mouse_check_button_pressed(mb_left)){
				kebutuhan_scroll = 0; // reset scroll biar rapi pas dibuka lagi nanti
				mode_ui = return_mode_ui;
			}
		}
	}
	else if (mode_ui == 5){
		// ====== NOTIFIKASI PINJAM SYARIAH ======
		pinjam_hover = -1;

		if (point_in_rectangle(mx, my, pinjam_btn_konfirmasi.x1, pinjam_btn_konfirmasi.y1, pinjam_btn_konfirmasi.x2, pinjam_btn_konfirmasi.y2)){
			pinjam_hover = 0;
			if (mouse_check_button_pressed(mb_left)){
				if(scr_pinjaman_darurat(player_terpilih)){
					show_debug_message("Pinjam Syariah dikonfirmasi");
					mode_ui = return_mode_ui;
				}
			}
		}
		else if (point_in_rectangle(mx, my, pinjam_btn_batal.x1, pinjam_btn_batal.y1, pinjam_btn_batal.x2, pinjam_btn_batal.y2)){
			pinjam_hover = 1;
			if (mouse_check_button_pressed(mb_left)){
				show_debug_message("Pinjam Syariah dibatalkan");
				mode_ui = return_mode_ui;
			}
		}
	}
}