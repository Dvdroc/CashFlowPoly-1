if(global.tanggal > 25 || global.endgame = true) exit;

// =======================================================
// B. LOGIKA UMUM (Navigasi dan Penutupan)
// =======================================================
if (dialogue_active) {
    
    
	   
    // 1. KETIKAN & SKIP
    if (current_char < string_length(dialogue_text)) {
        // Efek ketikan
        var prev_char = current_char;
		current_char += char_speed;
		draw_text_display = string_copy(dialogue_text, 1, current_char);

		// PLAY SOUND ONLY WHEN A NEW CHARACTER APPEARS
		if (current_char > prev_char) {
		    if (!audio_is_playing(SFX_RetroMultiplev5)) {
		        audio_play_sound(SFX_RetroMultiplev5, 1, false);
		    }
		}

        // Tekan F untuk langsung tampil semua teks (SKIP)
        if (keyboard_check_pressed(ord("F"))|| mouse_check_button_pressed(mb_left)) {
            current_char = string_length(dialogue_text);
            draw_text_display = dialogue_text;
        }
    }
    
    // 2. TEKS SELESAI
    else {
        var _action_taken = false;

        if (!_action_taken && keyboard_check_pressed(ord("F"))|| mouse_check_button_pressed(mb_left)) {
            
            // Aktifkan kembali gerakan pemain dan tutup
			if(global.tampilan != 0){
	            global.dialog_open = false;
	            with(obj_dialogue){
					instance_destroy()
				}
			}
        }


    exit;
    }
} 
else {
    // Dialog tidak aktif, hapus saja (Hanya berjalan jika dibuat dengan dialogue_active=false)
    global.dialog_open = false;
    instance_destroy();
}
// Toggle inventory dengan ESC

