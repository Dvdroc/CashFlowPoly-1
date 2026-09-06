if (global.nama_selesai) exit;
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// ====== Klik untuk fokus ke salah satu field ======
if (mouse_check_button_pressed(mb_left)){
	active_field = -1; // reset dulu, nanti diisi ulang kalau memang kena field

	for (var i = 0; i < array_length(field_rect); i++){
		var r = field_rect[i];
		if (point_in_rectangle(mx, my, r.x1, r.y1, r.x2, r.y2)){
			active_field = i;
			keyboard_string = nama_pemain[i]; // isi keyboard_string dgn teks yg sudah ada, biar bisa lanjut diedit
		}
	}

	if (point_in_rectangle(mx, my, field_kelompok_rect.x1, field_kelompok_rect.y1, field_kelompok_rect.x2, field_kelompok_rect.y2)){
		active_field = 4;
		keyboard_string = nama_kelompok;
	}
}

// ====== Kalau ada field yang fokus, tarik terus isinya dari keyboard_string ======
if (active_field != -1){
	// batasi panjang nama biar gak kepanjangan (opsional, misal maks 20 karakter)
	if (string_length(keyboard_string) > 20){
		keyboard_string = string_copy(keyboard_string, 1, 20);
	}

	if (active_field >= 0 && active_field <= 3){
		nama_pemain[active_field] = keyboard_string;
	} else if (active_field == 4){
		nama_kelompok = keyboard_string;
	}

	// Tekan Enter -> pindah fokus ke field berikutnya (biar cepat isi semua)
	if (keyboard_check_pressed(vk_enter)){
		active_field += 1;
		if (active_field > 4) active_field = -1; // sudah field terakhir, keluar fokus

		if (active_field != -1){
			keyboard_string = (active_field <= 3) ? nama_pemain[active_field] : nama_kelompok;
		} else {
			keyboard_string = "";
		}
	}

	// Tekan Escape -> keluar fokus tanpa pindah
	if (keyboard_check_pressed(vk_escape)){
		active_field = -1;
		keyboard_string = "";
	}
}

// ====== Tombol Mulai ======
btn_mulai_hover = point_in_rectangle(mx, my, btn_mulai.x1, btn_mulai.y1, btn_mulai.x2, btn_mulai.y2);

if (btn_mulai_hover && mouse_check_button_pressed(mb_left)){
	for (var i = 0; i < array_length(nama_pemain); i++){
		if (string_trim(nama_pemain[i]) == ""){
			nama_pemain[i] = "Pemain " + string(i+1);
		}
	}
	if (string_trim(nama_kelompok) == ""){
		nama_kelompok = "Kelompok Tanpa Nama";
	}

	global.player = nama_pemain;
	global.nama_kelompok = nama_kelompok;

	show_debug_message("Nama disimpan: " + string(global.player) + " | Kelompok: " + global.nama_kelompok);

	// Sembunyikan diri sendiri, munculkan Obj_pilih_mode
	visible = false;
	global.nama_selesai = true;

	with (Obj_pilih_mode){
		visible = true;
	}
}