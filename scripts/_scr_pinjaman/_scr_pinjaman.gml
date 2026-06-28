function _scr_pinjaman(recipe_index){
	var item = global.pinjamanan[recipe_index];
	var nama = item.name;
	if(nama != "Bayar Pinjaman"){
		if ds_map_exists(global.inventory, nama){
		    global.inventory[? nama] += 1;
		}
	}else if(nama == "Bayar Pinjaman"){
		if ds_map_exists(global.inventory, nama){
		    global.inventory[? nama] -= 1;
		}
	}
	return true
	
}