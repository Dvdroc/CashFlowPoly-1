function scr_merah(kartu){
	var warna = global.Resiko[kartu];
    var biaya = warna.biaya;
	for (var i = 0; i < array_length(global.player_data); i++){
	    if (global.player_data[i].uang > 0)
	    {
	        global.player_data[i].uang -= biaya;
	    }
	}
	return
}