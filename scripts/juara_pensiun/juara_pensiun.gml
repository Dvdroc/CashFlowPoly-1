function juara_pensiun(){
	var total = 0;
    for (var i = 0; i < array_length(global.dana_pensiun); i++)
    {
        var nama = global.dana_pensiun[i].name;
        var poin = global.dana_pensiun[i].kebahagiaan;
		
        if (ds_map_exists(global.record, nama))
        {
            var jumlah = global.record[? nama];

            if (jumlah > 0)
            {
                total += jumlah * poin;
            }
        }
    }
	return total
}