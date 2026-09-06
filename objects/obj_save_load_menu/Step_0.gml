mouse_gui_x = device_mouse_x_to_gui(0);
mouse_gui_y = device_mouse_y_to_gui(0);
var _mouse_pressed = mouse_check_button_pressed(mb_left);

btn_hover = point_in_rectangle(mouse_gui_x, mouse_gui_y, btn_x, btn_y, btn_x + btn_size, btn_y + btn_size);

// --- Kalau panel BELUM terbuka: cuma cek klik tombol titik tiga ---
if (!panel_open) {
    if (btn_hover && _mouse_pressed) {
        panel_open = true;
		global.uiblocking = true;
    }
    exit; // gak perlu proses logic panel di bawah
}

// --- Kalau panel TERBUKA, jalankan logic seperti biasa ---

if (message_timer > 0) message_timer--;

if (_mouse_pressed && point_in_rectangle(mouse_gui_x, mouse_gui_y, close_x, close_y, close_x + close_btn_size, close_y + close_btn_size)) {
    panel_open = false;
	global.uiblocking = false;
    show_confirm = false;
    exit;
}

if (!show_confirm) {

    var _tab_save_x1 = panel_x;
	var _tab_save_x2 = panel_x + tab_w;
	var _tab_load_x1 = panel_x + tab_w;
	var _tab_load_x2 = panel_x + tab_w * 2;
	var _tab_end_x1  = panel_x + tab_w * 2;
	var _tab_end_x2  = panel_x + panel_w;
	var _tab_y1 = panel_y;
	var _tab_y2 = panel_y + tab_h;

	if (_mouse_pressed) {
	    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _tab_save_x1, _tab_y1, _tab_save_x2, _tab_y2)) {
	        menu_mode = "save";
	    } else if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _tab_load_x1, _tab_y1, _tab_load_x2, _tab_y2)) {
	        menu_mode = "load";
	    } else if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _tab_end_x1, _tab_y1, _tab_end_x2, _tab_y2)) {
	        menu_mode = "end";
	    }
	}

    if (menu_mode != "end") {
	    var _slot_start = (menu_mode == "load") ? 0 : 1;

	    for (var _i = _slot_start; _i <= save_slot_count; _i++) {
	        var _sx1 = panel_x + 20;
	        var _sx2 = panel_x + panel_w - 20;
	        var _sy1 = slot_top + (_i - _slot_start) * (slot_h + slot_gap);
	        var _sy2 = _sy1 + slot_h;

	        var _hover = point_in_rectangle(mouse_gui_x, mouse_gui_y, _sx1, _sy1, _sx2, _sy2);

	        if (_hover && _mouse_pressed) {
	            if (_i == 0) {
	                if (save_slot_exists(0) && save_slot_matches_mode(0)) {
	                    show_confirm = true;
	                    confirm_slot = 0;
	                } else if (save_slot_exists(0)) {
	                    show_message_popup("Auto-save ini bukan mode " + global.mode_permainan + "!");
	                } else {
	                    show_message_popup("Belum ada auto-save!");
	                }
	            } else if (menu_mode == "save") {
	                if (save_slot_exists(_i)) {
	                    show_confirm = true;
	                    confirm_slot = _i;
	                } else {
	                    save_game_to_slot(_i);
	                }
	            } else {
	                if (save_slot_exists(_i) && save_slot_matches_mode(_i)) {
	                    show_confirm = true;
	                    confirm_slot = _i;
	                } else if (save_slot_exists(_i)) {
	                    show_message_popup("Save ini bukan mode " + global.mode + "!");
	                } else {
	                    show_message_popup("Slot kosong!");
	                }
	            }
	        }
	    }
	} else {
	    // ====== TAB AKHIRI GAME: satu tombol besar ======
	    var _end_x1 = panel_x + 20;
	    var _end_x2 = panel_x + panel_w - 20;
	    var _end_y1 = slot_top;
	    var _end_y2 = _end_y1 + slot_h;

	    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _end_x1, _end_y1, _end_x2, _end_y2) && _mouse_pressed) {
	        show_confirm = true;
	        confirm_slot = -99; // sentinel, tidak dipakai save/load, cuma penanda internal
	    }
	}

} else {
    var _box_w = 300;
    var _box_h = 140;
    var _box_x = panel_x + (panel_w - _box_w) / 2;
    var _box_y = panel_y + (panel_h - _box_h) / 2;

    var _yes_x1 = _box_x + 30;
    var _yes_x2 = _box_x + 130;
    var _no_x1  = _box_x + 170;
    var _no_x2  = _box_x + 270;
    var _btn_y1 = _box_y + 90;
    var _btn_y2 = _box_y + 125;

    if (_mouse_pressed) {
	    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _yes_x1, _btn_y1, _yes_x2, _btn_y2)) {
	        if (menu_mode == "save") {
	            save_game_to_slot(confirm_slot);
	        } else if (menu_mode == "load") {
	            load_game_from_slot(confirm_slot);
	        } else if (menu_mode == "end") {
	            global.endgame = true;
	            panel_open = false;
	            global.uiblocking = false;
				room_restart()
	        }
	        show_confirm = false;
	    } else if (point_in_rectangle(mouse_gui_x, mouse_gui_y, _no_x1, _btn_y1, _no_x2, _btn_y2)) {
	        show_confirm = false;
	    }
	}
}

if (keyboard_check_pressed(vk_escape)) {
    if (show_confirm) {
        show_confirm = false;
    } else {
        panel_open = false;
		global.uiblocking = false;
    }
	
}