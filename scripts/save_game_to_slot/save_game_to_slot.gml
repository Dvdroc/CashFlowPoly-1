function save_game_to_slot(_slot) {
    var _path = working_directory + "save/" + "slot" + string(_slot) + ".sav";

    var nama = global.player;
    var all_players = [];

    for (var p = 0; p < array_length(nama); p++) {
        var data = global.player_data[p]; // <-- sesuaikan cara akses data tiap pemain

        // Clone inventory (ds_map -> struct, biar bisa di-JSON-kan)
        var inv_copy = {};
        var keys = ds_map_keys_to_array(data.inventory);
        for (var i = 0; i < array_length(keys); i++) {
            var k = keys[i];
            inv_copy[$ k] = data.inventory[? k];
        }

        // Clone record (ds_map -> struct)
        var rec_copy = {};
        var keys2 = ds_map_keys_to_array(data.record);
        for (var i = 0; i < array_length(keys2); i++) {
            var k = keys2[i];
            rec_copy[$ k] = data.record[? k];
        }

        // Clone baked_goods array
        var baked_copy = [];
        for (var i = 0; i < array_length(data.baked_goods); i++) {
            array_push(baked_copy, data.baked_goods[i]);
        }

        // Clone asuransi array
        var asur_copy = [];
        for (var i = 0; i < array_length(data.asuransi); i++) {
            array_push(asur_copy, data.asuransi[i]);
        }

        var snapshot = {
            "uang"        : data.uang,
            "tabungan"    : data.tabungan,
            "inventory"   : inv_copy,
            "record"      : rec_copy,
            "baked_goods" : baked_copy,
            "asuransi"    : asur_copy,
            "misi_T"      : data.misi_T
        };

        var player_entry = {
            "nama"         : nama[p],
            "player_state" : snapshot
        };

        array_push(all_players, player_entry);
    }

    // --- Data global (bukan per-pemain) ---
    var save_struct = {
        "slot_name"       : "Slot " + string(_slot),
        "save_date"       : date_datetime_string(date_current_datetime()),
        "room_name"       : room_get_name(room),
        "day"             : global.day,
        "tanggal"         : global.tanggal,
        "activity_points" : global.activity_points,
        "tampilan"        : global.tampilan,
        "current_player"  : global.current_player,
		"mode"			  : global.mode,
		"story_remaining" : variable_struct_get_names(global.story),
        "players"         : all_players
    };

    var _json = json_stringify(save_struct, true);
    var _file = file_text_open_write(_path);
    file_text_write_string(_file, _json);
    file_text_close(_file);
	if(_slot != 0) show_message_popup("Game disimpan di Slot " + string(_slot));
}