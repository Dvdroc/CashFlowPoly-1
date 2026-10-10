function scr_merah(kartu){
	var biaya = global.Resiko[kartu].biaya;
	for (var i = 0; i < array_length(global.player_data); i++){
		var _aktif = (i == global.current_player);
		var _asur  = _aktif ? global.asuransi[0] : global.player_data[i].asuransi[0];
		var _uang = _aktif ? global.Uang : global.player_data[i].uang;
		if (_asur.kondisi && _uang > 0){
			if (show_question(global.player[i] + ": gunakan kartu asuransi?")){
				_asur.kondisi = false;
				continue;
			}
		}

		if (_aktif) global.Uang = max(0, global.Uang - biaya);
		else global.player_data[i].uang = max(0, global.player_data[i].uang - biaya);
	}
}