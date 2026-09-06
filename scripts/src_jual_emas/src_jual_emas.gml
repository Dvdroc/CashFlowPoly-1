function src_jual_emas(player,harga,jumlah){
	if(global.player_data[player].inventory[? "Emas"] >= jumlah){
		global.player_data[player].inventory[? "Emas"] -= jumlah;
		global.player_data[player].uang += (harga * jumlah);
		return true;
	}
	return false;
}