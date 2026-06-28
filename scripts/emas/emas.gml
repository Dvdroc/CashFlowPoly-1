function emas(){
	var total = 0;
	
	    for (var i = 0; i < array_length(global.pinjamanan); i++)
	    {
	        var nama = global.pinjamanan[i].name;

	        if (ds_map_exists(global.inventory, nama))
	        {
	            var jumlah = global.inventory[? nama];

	            if (jumlah == 1){
	                total = 3;
	            }else if (jumlah == 2){
	                total = 5;
				}else if (jumlah == 3){
	                total = 8;
				}else if (jumlah >= 4){
	                total = 12;
				}
	        }
	    }
		return total
}