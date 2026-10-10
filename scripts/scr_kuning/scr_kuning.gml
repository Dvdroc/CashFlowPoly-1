function scr_kuning(kartu){
	var card = global.Resiko[kartu]
	var name = card.name
	
	if(name == "Investasi emas"){
		global.player_sebelumnya = global.current_player;
		global.tampilan = 2
		scr_save_player()
		global.current_player = 0;
		scr_load_player()
	}
	else if(name == "Menang undian") global.Uang += card.biaya
	else if(name == "Ulang tahun"){
	global.Uang += array_length(global.player_data);   // terima 4 koin
	for (var i = 0; i < array_length(global.player_data); i++){
		if (i == global.current_player){
			global.Uang -= 1;                          // penarik juga bayar 1, lewat global.Uang
		}else if (global.player_data[i].uang > 0){
			global.player_data[i].uang -= 1;
		}
	}
}
	if(name != "Investasi emas"){
		global.tampilan = 0
		if(global.activity_points <= 0){
			if (global.current_player < 3) global.activity_points = 2;
			scr_next_player();
		}else{
			scr_save_player();
		}
	}
	room_restart();
}