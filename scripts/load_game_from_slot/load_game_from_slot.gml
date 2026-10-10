function load_game_from_slot(_slot) {
    var _data = get_slot_info(_slot);
    if (is_undefined(_data)) {
        show_message_popup("Slot kosong!");
        return;
    }
	if (variable_struct_exists(_data, "match_logs")) {
        global.match_logs = _data.match_logs;
    } else {
        global.match_logs = []; // fallback buat save file lama yang belum ada match_logs
    }


    // --- Kembalikan data global ---
    global.day             = _data.day;
    global.tanggal         = _data.tanggal;
    global.activity_points = _data.activity_points;
    global.tampilan        = _data.tampilan;
    global.current_player  = _data.current_player;
	global.mode			   = _data.mode;
	global.rekap		   = _data.rekap;
	global.endgame         = _data.endgame;
	global.nama_kelompok   = _data.nama_kelompok;
	// --- Terapkan progress story ---
	if (variable_struct_exists(_data, "story_remaining")) {
	    var _fresh = scr_baca_story();
	    var _story_baru = {};
	    var _remaining = _data.story_remaining;

	    for (var i = 0; i < array_length(_remaining); i++) {
	        var _k = _remaining[i];
	        if (variable_struct_exists(_fresh, _k)) {
	            _story_baru[$ _k] = _fresh[$ _k];
	        }
	    }
	    global.story = _story_baru;
	}
	
    var nama = global.player;

    for (var p = 0; p < array_length(_data.players); p++) {
        var entry     = _data.players[p];
        var snapshot  = entry.player_state;
        var target    = global.player_data[p]; // <-- sesuaikan cara akses data tiap pemain

        target.uang     = snapshot.uang;
        target.tabungan = snapshot.tabungan;
        target.misi_T   = snapshot.misi_T;
		
		global.player[p] = entry.nama;
        // Rebuild inventory (struct -> ds_map)
        ds_map_clear(target.inventory);
        var inv_keys = variable_struct_get_names(snapshot.inventory);
        for (var i = 0; i < array_length(inv_keys); i++) {
            var k = inv_keys[i];
            target.inventory[? k] = snapshot.inventory[$ k];
        }

        // Rebuild record (struct -> ds_map)
        ds_map_clear(target.record);
        var rec_keys = variable_struct_get_names(snapshot.record);
        for (var i = 0; i < array_length(rec_keys); i++) {
            var k = rec_keys[i];
            target.record[? k] = snapshot.record[$ k];
        }

        // Rebuild array baked_goods & asuransi
        target.baked_goods = snapshot.baked_goods;
        target.asuransi     = snapshot.asuransi;
    }

	// --- Risiko pink aktif ---
	if (variable_struct_exists(_data, "resiko_aktif")) {
	    global.resiko_aktif = _data.resiko_aktif;
	} else {
	    global.resiko_aktif = [];
	}

	// --- Harga emas ---
	if (variable_struct_exists(_data, "harga_emas")) {
	    global.harga_emas = _data.harga_emas;
	}   // save lama: biarkan nilai sekarang

	// --- Pemain sebelum investasi ---
	if (variable_struct_exists(_data, "player_sebelumnya")) {
	    global.player_sebelumnya = _data.player_sebelumnya;
	} else if (!variable_global_exists("player_sebelumnya")) {
	    global.player_sebelumnya = 0;
	}

    if (room_exists(asset_get_index(_data.room_name))) {
        room_goto(asset_get_index(_data.room_name));
    }
	scr_load_player()
	global.uiblocking = false;
    show_message_popup("Game dimuat!");
    room_restart()
}
function scr_baca_story() {
    var file = file_text_open_read("Story.json");
    var json_text = "";
    while (!file_text_eof(file)) {
        json_text += file_text_readln(file);
    }
    file_text_close(file);

    var _story = json_parse(json_text);
    var keys = variable_struct_get_names(_story);

    for (var i = 0; i < array_length(keys); i++) {
        var story_id = keys[i];
        var dialog_array = _story[$ story_id];

        for (var j = 0; j < array_length(dialog_array); j++) {
            if (dialog_array[j][0] == "Alisa")        dialog_array[j][0] = global.player[0];
            else if (dialog_array[j][0] == "Rechard") dialog_array[j][0] = global.player[1];
            else if (dialog_array[j][0] == "Reno")    dialog_array[j][0] = global.player[2];
            else if (dialog_array[j][0] == "Siti")    dialog_array[j][0] = global.player[3];

            dialog_array[j][1] = asset_get_index(dialog_array[j][1]);
            dialog_array[j][4] = asset_get_index(dialog_array[j][4]);
        }
        _story[$ story_id] = dialog_array;
    }
    return _story;
}