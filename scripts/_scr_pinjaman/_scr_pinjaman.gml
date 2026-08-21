function _scr_pinjaman(recipe_index){
	var item = global.pinjamanan[recipe_index];
	var nama = item.name;
	
	if(nama == "Pinjaman"){
		if ds_map_exists(global.inventory, "Pinjaman"){
		    global.inventory[? "Pinjaman"] += 1;
			return true
		}
	}else if(nama == "Bayar Pinjaman"){
		if ds_map_exists(global.inventory, "Pinjaman"){
		    global.inventory[? "Pinjaman"] -= 1;
			return true
		}
	}
	
	
}