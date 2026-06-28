function _scr_jual_makanan(recipe_index){
	var _recipe = global.recipes[recipe_index];
    var _can_craft = true;
    var _required = _recipe.required;

    // 1. Cek ketersediaan bahan
    for (var i = 0; i < array_length(_required); i++) {
	    var r = _required[i];
	    var nama = r.bahan;
	    var butuh = r.jumlah;

	    if (!ds_map_exists(global.inventory, nama) || global.inventory[? nama] < butuh) {
	        _can_craft = false;
	        break;
	    }
	}


    // 2. Jika bahan cukup
    if (_can_craft) {
		// Kurangi bahan
		for (var j = 0; j < array_length(_required); j++) {
	    var r2 = _required[j];
	    var nama2 = r2.bahan;
	    var butuh2 = r2.jumlah;

	    global.inventory[? nama2] -= butuh2;
	}


        // Tambahkan hasil ke baked_goods
        var _found = false;
        for (var k = 0; k < array_length(global.baked_goods); k++) {
            if (global.baked_goods[k].name == _recipe.name) {
                global.baked_goods[k].count += _recipe.count;
                _found = true;
                break;
            }
        }

        if (!_found) {
            array_push(global.baked_goods, {name: _recipe.name, count: _recipe.count});
        }

        return true;
    }
    else {
       

        return false;
    }
}