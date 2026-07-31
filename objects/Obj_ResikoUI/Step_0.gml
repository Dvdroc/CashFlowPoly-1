if(visible){
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);

	var start_x = 100;
	var start_y = 200;

	var box_w = 270;
	var card_h = 28;

	var x_offset = 0;

	var warna_list = ["hijau","merah","pink","kuning"];

	for (var w = 0; w < array_length(warna_list); w++)
	{
		var warna = warna_list[w];

		var box_x = start_x + x_offset;
		var box_y = start_y;

		y = box_y + 30;

		for (var i=0;i<array_length(global.Resiko);i++)
		{
			var kartu = global.Resiko[i];

			if kartu.warna == warna
			{
				if mouse_check_button_pressed(mb_left)
				{
					if point_in_rectangle(mx,my,box_x+5,y,box_x+box_w-5,y+card_h)
					{
						if(kartu.warna == "hijau"){
							if (scr_hijau(i)){
								global.Uang -= kartu.biaya;
								global.record[? "kartu hijau"] += 1
							}
						}else if(kartu.warna == "merah"){
							scr_merah(i);
							global.record[? "kartu merah"] += 1
						}else if(kartu.warna == "pink"){
							global.record[? "kartu pink"] += 1
							scr_pink(i);
						}else if(kartu.warna == "kuning"){
							global.record[? "kartu kuning"] += 1
							scr_kuning(i);
						}
						if(kartu.warna != "kuning"){
							global.tampilan = 0;
							if(global.activity_points <= 0){
								if (global.current_player < 3) global.activity_points = 2;
								scr_next_player();
							}else{
								scr_save_player();
							}
							room_restart()
						}
						show_debug_message("Kartu dipilih: " + kartu.name);

						if variable_struct_exists(kartu,"biaya")
						{
							show_debug_message("Biaya: " + string(kartu.biaya));
						}
					}
				}

				y += card_h;
			}
		}

		x_offset += box_w + 25;
	}
}