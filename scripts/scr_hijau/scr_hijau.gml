function scr_hijau(kartu){
    var warna = global.Resiko[kartu];
    var biaya = warna.biaya;
	
    if (global.asuransi[0].kondisi){
        var pilih = show_question("Gunakan kartu asuransi?");
        if (pilih == 1){
            /// asuransi dipakai
            global.asuransi[0].kondisi = false;
            return false;
        }
        else{
            return true;
        }
    }
    return true;
}