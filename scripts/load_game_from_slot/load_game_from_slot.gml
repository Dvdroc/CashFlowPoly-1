function load_game_from_slot(_slot) {
    var _data = get_slot_info(_slot);
    if (is_undefined(_data)) {
        show_message_popup("Slot kosong!");
        return;
    }

    // --- Kembalikan data global ---
    global.day             = _data.day;
    global.tanggal          = _data.tanggal;
    global.activity_points = _data.activity_points;
    global.tampilan        = _data.tampilan;
    global.current_player  = _data.current_player;
	global.mode			   = _data.mode;
	
	// --- Terapkan progress story ---
	if (variable_struct_exists(_data, "story_remaining")) {
	    var _remaining = _data.story_remaining;
	    var _all_keys = variable_struct_get_names(global.story); // asumsi global.story sudah di-generate ulang dari JSON sebelum baris ini

	    for (var i = 0; i < array_length(_all_keys); i++) {
	        var _key = _all_keys[i];
	        var _still_exists = false;

	        for (var j = 0; j < array_length(_remaining); j++) {
	            if (_remaining[j] == _key) {
	                _still_exists = true;
	                break;
	            }
	        }

	        // Kalau key ini TIDAK ada di daftar remaining, berarti sudah pernah dipicu -> hapus
	        if (!_still_exists) {
	            variable_struct_remove(global.story, _key);
	        }
	    }
	}
	
    var nama = ["Alisa", "Rechard", "Reno", "Siti"];

    for (var p = 0; p < array_length(_data.players); p++) {
        var entry     = _data.players[p];
        var snapshot  = entry.player_state;
        var target    = global.player_data[p]; // <-- sesuaikan cara akses data tiap pemain

        target.uang     = snapshot.uang;
        target.tabungan = snapshot.tabungan;
        target.misi_T   = snapshot.misi_T;

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

    if (room_exists(asset_get_index(_data.room_name))) {
        room_goto(asset_get_index(_data.room_name));
    }
	scr_load_player()
	global.uiblocking = false;
    show_message_popup("Game dimuat!");
    room_restart()
}