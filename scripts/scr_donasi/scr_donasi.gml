function scr_donasi(juara, pemain_list, donasi)
{
    scr_save_player();

    for (var i = 0; i < array_length(pemain_list); i++)
    {
        var player = global.player_data[i];
		
		 if (donasi[i] > 0 && player.uang >= donasi[i])
		 {
			player.uang -= donasi[i];
            var index = juara[i] - 1;
			 // VALIDASI INDEX
	        if (index < 0 || index >= array_length(global.peduli_donasi)) {
	            show_debug_message("Index error di juara[" + string(i) + "] = " + string(juara[i]));
	            continue;
	        }
            var nama_donasi = global.peduli_donasi[index].name;

            var record = player.record;

            if (ds_map_exists(record, nama_donasi))
                record[? nama_donasi] += 1
				record[? "total donasi"] += donasi[i]
		 }
    }
    scr_load_player();
}