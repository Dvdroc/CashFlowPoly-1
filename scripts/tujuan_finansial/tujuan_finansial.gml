function tujuan_finansial(){
	var total = 0;
	
	var aktif = false;
	if(global.mode == "pemula"){
		aktif = true
	}else if(global.mode == "mahir"){
		if (ds_map_exists(global.inventory, "Pinjaman")){
		    if (global.inventory[? "Pinjaman"] == 0)
		    {
		        aktif = true;
		    }
		}
	}
	for (var i = 0; i < array_length(global.Finansial); i++){
		var nama = global.Finansial[i].name;
		var poin = global.Finansial[i].kebahagiaan;
		if (ds_map_exists(global.record, nama)){
			var jumlah = global.record[? nama];
			if(aktif){
	            if (jumlah > 0){
	                total += jumlah * poin;
	            }
	        }
	    }
	}
	return total
}