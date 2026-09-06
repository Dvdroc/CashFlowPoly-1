function scr_save_player(){
    var p = global.current_player;
    var data = global.player_data[p];

    data.uang = global.Uang;
    data.tabungan = global.tabungan;
    data.misi_T = global.misi_T;

    ds_map_copy(data.inventory, global.inventory);


    ds_map_copy(data.record, global.record);

	
    data.baked_goods = array_create(array_length(global.baked_goods));

	for (var i = 0; i < array_length(global.baked_goods); i++) {
	    data.baked_goods[i] =  {
	        name  : global.baked_goods[i].name,
	        count : global.baked_goods[i].count
	    };
	}
	if(global.mode == "mahir"){
		data.asuransi = array_create(array_length(global.asuransi));
	
		for (var i = 0; i < array_length(global.asuransi); i++) {
		    data.asuransi[i] = global.asuransi[i];
		}
	}
	if(!obj_game_manager.tampilkan_misi){
		//Clone inventory
		var inv_copy = {};

		var keys = ds_map_keys_to_array(data.inventory);

		for (var i = 0; i < array_length(keys); i++)
		{
		    var k = keys[i];
		    inv_copy[$ k] = data.inventory[? k];
		}
	
		//Clone record:
		var rec_copy = {};

		var keys2 = ds_map_keys_to_array(data.record);

		for (var i = 0; i < array_length(keys2); i++)
		{
		    var k = keys2[i];
		    rec_copy[$ k] = data.record[? k];
		}
		var baked_copy = [];

		for (var i = 0; i < array_length(data.baked_goods); i++)
		{
		    array_push(baked_copy, data.baked_goods[i]);
		}
		var asur_copy = [];

		for (var i = 0; i < array_length(data.asuransi); i++)
		{
		    array_push(asur_copy, data.asuransi[i]);
		}
		var snapshot = {
		    "uang": data.uang,
		    "tabungan": data.tabungan,

		    "inventory": inv_copy,
		    "record": rec_copy,

		    "baked_goods": baked_copy,
		    "asuransi": asur_copy,

		    "misi_T": data.misi_T
		};
	
		var nama = global.player
		var index_name = nama[p]
		var turn_data = {
		    "turn": global.day,
		    "current_player": index_name,

		    "player_state": snapshot
		};

		array_push(global.match_logs, turn_data);
	}
}