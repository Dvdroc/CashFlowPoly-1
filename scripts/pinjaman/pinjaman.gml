function pinjaman(){
	var total = 0;
	
	    for (var i = 0; i < array_length(global.pinjamanan); i++)
	    {
	        var nama = global.pinjamanan[i].name;
	        var poin = global.pinjamanan[i].kebahagiaan;
	        if (ds_map_exists(global.inventory, nama))
	        {
	            var jumlah = global.inventory[? nama];

	            if (jumlah > 0)
	            {
	                total += jumlah * poin;
	            }
	        }
	    }
		return total
}