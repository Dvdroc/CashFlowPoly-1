function set_kebutuhan(){
	
	var count_P = 0;
	var count_T = 0;
	var count_S = 0;

	for (var i = 0; i < array_length(global.kebutuhan); i++)
	{
	    var nama = global.kebutuhan[i].name;
	    var poin = global.kebutuhan[i].kebahagiaan;
	    var type = global.kebutuhan[i].type;

	    if (ds_map_exists(global.record, nama))
	    {
	        var jumlah = global.record[? nama];

	        if (jumlah > 0){
	            // hitung tipe
	            if (type == "P") count_P += jumlah;
	            if (type == "T") count_T += jumlah;
	            if (type == "S") count_S += jumlah;
	        }
	    }
	}


	// cek set sama
	var set_sama = 0;

	set_sama += floor(count_P / 3);
	set_sama += floor(count_T / 3);
	set_sama += floor(count_S / 3);


	// cek set berbeda
	var set_beda = min(count_P, count_T, count_S);


	// hitung poin bonus
	var bonus = 0;

	if (set_sama > 0) bonus += 2 * set_sama;
	if (set_beda > 0) bonus += 4 * set_beda;

	return bonus;
}