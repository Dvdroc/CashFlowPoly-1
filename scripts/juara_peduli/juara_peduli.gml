function juara_peduli(){
	var total = 0;

    for (var i = 0; i < array_length(global.peduli_donasi); i++)
    {
        var nama = global.peduli_donasi[i].name;
        var poin = global.peduli_donasi[i].kebahagiaan;

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