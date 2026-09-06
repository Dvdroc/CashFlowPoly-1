function scr_pinjaman_darurat(player){
	if ds_map_exists(global.player_data[player].inventory,"Pinjaman"){
		global.player_data[player].inventory[? "Pinjaman"] += 1
		global.player_data[player].uang += 10;
		return true;
	}
	return false;
}