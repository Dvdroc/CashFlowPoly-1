function aneka_kebutuhan(){
	var total = 0;

    for (var i = 0; i < array_length(global.kebutuhan); i++)
    {
        var nama = global.kebutuhan[i].name;
        var poin = global.kebutuhan[i].kebahagiaan;

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