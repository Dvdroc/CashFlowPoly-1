function _scr_beli_bahan(recipe_index){
	var item = global.bahan_baku[recipe_index];
	var nama = item.name;
	
	if(global.Uang >= item.harga){
		if ds_map_exists(global.inventory, nama){
		    global.inventory[? nama] += 1;
		}
		return true
	}else return false
	
}