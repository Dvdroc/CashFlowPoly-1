function scr_merah(kartu){
	var warna = global.Resiko[kartu];
    var biaya = warna.biaya;
	if (global.asuransi[0].kondisi){
        var pilih = show_question("Gunakan kartu asuransi?");
        if (pilih == 1){
            /// asuransi dipakai
            global.asuransi[0].kondisi = false;
            return
        }
        else{
			for (var i = 0; i < array_length(global.player_data); i++){
			    if (global.player_data[i].uang > 0)
			    {
			        global.player_data[i].uang -= biaya;
			    }
			}
            return
        }
    }
	return
}