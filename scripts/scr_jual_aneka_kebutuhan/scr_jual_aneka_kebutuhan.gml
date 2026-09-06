function scr_jual_aneka_kebutuhan(player,nama,harga){
	if(global.player_data[player].record[? nama] >= 1){
		global.player_data[player].record[? nama] -= 1;
		global.player_data[player].uang += floor(harga/2);
		return true;
	}
	return false;
}