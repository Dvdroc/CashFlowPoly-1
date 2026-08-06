if(visible){
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);

	if mouse_check_button_pressed(mb_left)
	{
	    // tombol +
	    if point_in_rectangle(mx,my,ui_x + 190, ui_y + 140, ui_x + 220, ui_y + 170)
	    {
	        quantity += 1;
	    }

	    // tombol -
	    if point_in_rectangle(mx,my,ui_x + 150, ui_y + 140, ui_x + 180, ui_y + 170)
	    {
	        if(quantity > 0) quantity -= 1;
	    }
		
		 if point_in_rectangle(mx,my,ui_x+210,ui_y+70,ui_x+250,ui_y+110)
	    {
	        if(global.harga_emas < max_harga)
	        global.harga_emas += 1;
	    }

	    // tombol -
	    if point_in_rectangle(mx,my,ui_x+150,ui_y+70,ui_x+190,ui_y+110)
	    {
	        if(global.harga_emas > min_harga)
	        global.harga_emas -= 1;
	    }

	    // BELI
	    if point_in_rectangle(mx,my,ui_x + 40, ui_y + 180, ui_x + 160, ui_y + 230)
	    {
	        if(global.Uang >= global.harga_emas)
	        {
	            global.Uang -= (global.harga_emas * quantity);
	            global.inventory[? "Emas"] += quantity;
				if(global.current_player == array_length(global.player) - 1){
					scr_save_player()
					if(global.day != "sabtu"){
						if(global.activity_points <= 0){
							global.activity_points = 2;
							scr_next_player()
						}else{
							global.current_player = global.player_sebelumnya;
							global.tampilan = 0;
							scr_load_player()
						}
					}else{
						global.tampilan = 0;
						global.activity_points = 0
						global.current_player = 0
						scr_load_player()
					}
				}else scr_next_player()
				room_restart()
	        }
	    }

	    // JUAL
	    if point_in_rectangle(mx,my,ui_x + 200, ui_y + 180, ui_x + 320, ui_y + 230)
	    {
	        if(global.inventory[? "Emas"] > 0)
	        {
	            global.inventory[? "Emas"] -= quantity;
	            global.Uang += (global.harga_emas * quantity);
				if(global.current_player == array_length(global.player) - 1){
					scr_save_player()
					if(global.day != "sabtu"){
						if(global.activity_points <= 0){
							global.activity_points = 2;
							scr_next_player()
						}else{
							global.current_player = global.player_sebelumnya;
							global.tampilan = 0;
							scr_load_player()
						}
					}else{
						global.tampilan = 0;
						global.activity_points = 0
						global.current_player = 0
						scr_load_player()
					}
				}else scr_next_player()
				room_restart()
	        }
	    }
	}
}