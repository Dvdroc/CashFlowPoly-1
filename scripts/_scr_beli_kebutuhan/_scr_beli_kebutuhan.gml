function _scr_beli_kebutuhan(recipe_index){
	var item = global.kebutuhan[recipe_index];
	var nama = item.name;
	
	if(global.Uang >= item.harga){
		if ds_map_exists(global.record, nama){
		    global.record[? nama] += 1;
		}
		return true
	}else return false
}