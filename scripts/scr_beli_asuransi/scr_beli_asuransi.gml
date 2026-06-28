function scr_beli_asuransi(asuransi){
	var asuran = global.asuransi[asuransi];
	
	
	if (!asuran.kondisi) {
		
		
		if (global.Uang >= asuran.harga) {
			
			
			global.Uang -= asuran.harga;
			
			
			asuran.kondisi = true;
			
			global.asuransi[asuransi] = asuran;
			
			show_debug_message("Asuransi berhasil dibeli");
			
		} else {
			show_debug_message("Uang tidak cukup");
		}
		
	} else {
		show_debug_message("Asuransi sudah dimiliki");
	}
}