function scr_next_player(){
	// simpan player sekarang
	scr_save_player();
	
	global.current_player++;

		if (global.current_player > 3)
		{
		    global.current_player = 0;
		}

	// load player berikutnya
	save_game_to_slot(0);
	scr_load_player();

}