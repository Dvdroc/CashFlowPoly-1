function scr_load_player(){
    var p = global.current_player;
    var data = global.player_data[p];

    global.Uang = data.uang;
    global.tabungan = data.tabungan;
    global.misi_T = data.misi_T;

    // === INVENTORY ===
	ds_map_copy(global.inventory, data.inventory)

    // === RECORD ===
	    ds_map_copy(global.record, data.record)

	global.baked_goods = array_create(array_length(data.baked_goods));

	for (var i = 0; i < array_length(data.baked_goods); i++)
	{
	    global.baked_goods[i] = {
	        name  : data.baked_goods[i].name,
	        count : data.baked_goods[i].count
	    };
	}
	if(global.mode == "mahir"){
		for (var i = 0; i < array_length(data.asuransi); i++) {
		    global.asuransi[i] = data.asuransi[i];
		}
	}
}