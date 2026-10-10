function _scr_pinjaman(recipe_index){
	var item = global.pinjamanan[recipe_index];
	var nama = item.name;

	if (!ds_map_exists(global.inventory, "Pinjaman")) return false;

	if (nama == "Pinjaman"){
		global.inventory[? "Pinjaman"] += 1;
		return true;
	}
	else if (nama == "Bayar Pinjaman"){
		// tidak boleh bayar kalau tidak punya pinjaman, atau uang kurang
		if (global.inventory[? "Pinjaman"] <= 0) return false;
		if (global.Uang < -item.harga) return false;   // harga = -10

		global.inventory[? "Pinjaman"] -= 1;
		return true;
	}

	return false;   // sebelumnya tidak ada return di jalur ini
}