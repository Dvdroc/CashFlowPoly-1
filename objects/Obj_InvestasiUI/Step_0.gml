if(visible){
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);

	if mouse_check_button_pressed(mb_left)
	{
	    // tombol +
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
	    if point_in_rectangle(mx,my,ui_x+40,ui_y+150,ui_x+160,ui_y+200)
	    {
	        if(global.Uang >= global.harga_emas)
	        {
	            global.Uang -= global.harga_emas;
	            global.inventory[? "Emas"] += 1;
				scr_next_player()
				if(global.current_player == 3){
					global.tampilan = 0;
					global.activity_points = 0
				}
				room_restart()
	        }
	    }

	    // JUAL
	    if point_in_rectangle(mx,my,ui_x+200,ui_y+150,ui_x+320,ui_y+200)
	    {
	        if(global.inventory[? "Emas"] > 0)
	        {
	            global.inventory[? "Emas"] -= 1;
	            global.Uang += global.harga_emas;
				scr_next_player()
				if(global.current_player == 3){
					global.tampilan = 0;
					global.activity_points = 0
				}
				room_restart()
	        }
	    }
	}
}