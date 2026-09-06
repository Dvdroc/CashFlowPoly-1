function emas(){
	var total = 0;
	
	if (ds_map_exists(global.inventory, "Emas"))
	{
	    var jumlah = global.inventory[? "Emas"];

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
	
	return total
}