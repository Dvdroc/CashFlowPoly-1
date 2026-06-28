function _scr_finansial(recipe_index){
	var item = global.Finansial[recipe_index];
	var nama = item.name;
	
	if(global.tabungan >= item.harga){
		if ds_map_exists(global.record, nama){
		    global.record[? nama] += 1;
		}
		return true
	}else return false
}