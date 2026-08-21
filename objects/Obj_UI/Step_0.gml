if(visible){
	if(global.uiblocking) exit;
	var pilih_aktivitas = aktivitas_selected;
	if (pilih_aktivitas == 0){
	    menu_list = global.recipes;
		input_tabungan1 = false;
	}

	if (pilih_aktivitas == 1){
	    menu_list = global.bahan_baku;
		input_tabungan1 = false;
	}
	if(pilih_aktivitas == 2){
		menu_list = global.kerjalepas;
		input_tabungan1 = false;
	}
	if (pilih_aktivitas == 3){
	    menu_list = global.kebutuhan;
		input_tabungan1 = false;
	}
	if (pilih_aktivitas == 4){
	    menu_list = global.Finansial;
		input_tabungan1 = true;
	}
	if(global.mode == "mahir"){
		if (pilih_aktivitas == 5){
		    menu_list = global.pinjamanan;
			input_tabungan1 = false;
		}
		if (pilih_aktivitas == 6){
			menu_list = global.asuransi;
			input_tabungan1 = false;
		}
	}
	if (aktivitas_selected2 == 0){
	    menu_list2 = global.recipes;
		input_tabungan = false;
	}
	if (aktivitas_selected2 == 1){
	    menu_list2 = global.bahan_baku;
		input_tabungan = false;
	}
	if(aktivitas_selected2 == 2){
		menu_list2 = global.kerjalepas;
		input_tabungan = false;
	}
	if (aktivitas_selected2 == 3){
	    menu_list2 = global.kebutuhan;
		input_tabungan = false;
	}
	if (aktivitas_selected2 == 4){
	    menu_list2 = global.Finansial;
		input_tabungan = true;
	}
	if(global.mode == "mahir"){
		if (aktivitas_selected2 == 5){
		    menu_list2 = global.pinjamanan;
			input_tabungan = false;
		}
		if (aktivitas_selected2 == 6){
			menu_list2 = global.asuransi;
			input_tabungan = false;
		}
	}

if(go == true ){

	    // ===== SLOT ATAS =====
	    if (pilih_aktivitas == 0 && menu_selected >= 0){
	        if (_scr_jual_makanan(menu_selected)){
	            global.Uang += global.recipes[menu_selected].harga;
				if(global.mode == "mahir"){
					global.tampilan = 1;
				}
	        }
	    }

	    if (pilih_aktivitas == 1 && menu_selected >= 0){
	        if (_scr_beli_bahan(menu_selected)){
	            global.Uang -= global.bahan_baku[menu_selected].harga;
	        }
	    }

	    if(pilih_aktivitas == 2 && menu_selected >= 0){
	        global.Uang += 1;
			global.record[? "Kerja lepas"] += 1
	    }

	    if (pilih_aktivitas == 3 && menu_selected >= 0){
	        if (_scr_beli_kebutuhan(menu_selected)){
	            global.Uang -= global.kebutuhan[menu_selected].harga;
	        }
	    }

	    if (pilih_aktivitas == 4 && menu_selected >= 0){
	        if(!(aktivitas_selected == 4 && aktivitas_selected2 == 4)){
	            if (_scr_finansial(menu_selected)){
	                global.tabungan -= global.Finansial[menu_selected].harga;
	            }
	        }
	    }
		if(global.mode == "mahir"){
		    if (pilih_aktivitas == 5 && menu_selected >= 0){
		        if (_scr_pinjaman(menu_selected)){
		            global.Uang += global.pinjamanan[menu_selected].harga;
		        }
		    }
			 if (pilih_aktivitas == 6 && menu_selected >= 0){
		        scr_beli_asuransi(menu_selected)
		    }
		}
		global.activity_points -= 1;
		if(((pilih_aktivitas == 0 && menu_selected >= 0)) && global.mode == "mahir"){
			scr_save_player();
		}else if(global.activity_points <= 0){
			if (global.current_player < 3) global.activity_points = 2
			scr_next_player()
		}else scr_save_player()
		show_debug_message(string(global.activity_points))
		room_restart();
	
	
	
	}
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	var _padding = 20;
	var _portrait_x = box_width - _padding - 200; 
	var _portrait_y = box_y  + 30+ _padding; 

	if mouse_check_button_pressed(mb_left)
	{
    

	    // dropdown pemain
	    //if point_in_rectangle(mx,my,200,yslot_1,350,yslot_1heinght)
	    //{
	    //    dropdown_open = 0;
		//	menu_selected = -1;
	    //}

	    // dropdown aktivitas
	    if point_in_rectangle(mx,my,400,yslot_1,550,yslot_1heinght)
	    {
	        dropdown_open = 1;
			menu_selected = -1;
	    }

	    // dropdown menu
		if(aktivitas_selected2 == 4 && aktivitas_selected ==4){
			if(dropdown_open != 2){
			    if point_in_rectangle(mx,my,600,yslot_2,750,yslot_2heinght)
			    {
			        dropdown_open = 4;
			    }
			}
		}else{
			if point_in_rectangle(mx,my,600,yslot_1,750,yslot_1heinght)
		    {
		        dropdown_open = 2;
		    }
			if(dropdown_open != 2){
			    if point_in_rectangle(mx,my,600,yslot_2,750,yslot_2heinght)
			    {
			        dropdown_open = 4;
			    }
			}
		}
		if(dropdown_open != 1){
			if point_in_rectangle(mx,my,400,yslot_2,550,yslot_2heinght)
		    {
		        dropdown_open = 3;
				menu_selected2 = -1;
		    }
		}

	    // dropdown menu
	
		if point_in_rectangle(mx,my,_portrait_x,_portrait_y,1360,700){
			if(menu_selected != -1 || pilih_aktivitas == 4) go = true;
		
		}
	
	}

	//if dropdown_open == 0
	//{
	//    for (var i=0;i<array_length(pemain_list);i++)
	//    {
	//        y = yslot_1heinght + i*30;

	//        if mouse_check_button_pressed(mb_left)
	//        {
	//            if point_in_rectangle(mx,my,200,y,yslot_1,y+30)
	//            {
	//                pemain_selected = i;
	//				last_input = dropdown_open;
	//                dropdown_open = -1;
	//            }
	//        }
	//    }
	//}
	if dropdown_open == 1
	{
	    for (var i = 0; i < visible_items; i++)
	    {
	        var index = i + menu_scroll;
	        if index >= array_length(aktivitas_list) break;

	        y = yslot_1heinght + i * 30;

	        if mouse_check_button_pressed(mb_left)
	        {
	            if point_in_rectangle(mx,my,400,y,yslot_2,y+30)
	            {
	                aktivitas_selected = index;
	                last_input = dropdown_open;
	                dropdown_open = -1;
	            }
	        }
	    }
	}
	if dropdown_open == 2
	{
	    for (var i = 0; i < visible_items; i++){
		    var index = i + menu_scroll;
		    if index >= array_length(menu_list) break;
		
			if (pilih_aktivitas == 4){
				if global.tabungan < menu_list[index].harga{
		            continue;
		        }
			}else if(aktivitas_selected == 0){
				var resep = global.recipes[index];
				var required = resep.required;

				var cukup = true;

				for (var j = 0; j < array_length(required); j++)
				{
				    var r = required[j];
				    var nama = r.bahan;
				    var butuh = r.jumlah;

				    if (!ds_map_exists(global.inventory, nama) || global.inventory[? nama] < butuh)
				    {
				        cukup = false;
				        break;
				    }
				}

				if (!cukup)
				{
				    continue;
				}
			}else if (aktivitas_selected != 2 && aktivitas_selected != 5){
				if ( aktivitas_selected == 6 &&  (global.Uang < menu_list[index].harga || global.asuransi[0].kondisi)){
		            continue;
		        }else if (global.Uang < menu_list[index].harga)
		        {
		            continue;
		        }
			}

		    y = yslot_1heinght + i * 30;
		
		    if mouse_check_button_pressed(mb_left)
		    {
		        if point_in_rectangle(mx,my,600,y,750,y+30)
		        {
		            menu_selected = index;
					last_input = dropdown_open;
		            dropdown_open = -1;
		        }
		    }
		}
	}
	var wheel = mouse_wheel_up() - mouse_wheel_down();

	if dropdown_open == 2 || dropdown_open == 1{
	    menu_scroll -= wheel;
	    if(dropdown_open == 1){
			menu_scroll = clamp(
	        menu_scroll,
	        0,
	        max(0, array_length(aktivitas_list) - visible_items)
	    );
		}else{
		    menu_scroll = clamp(
		        menu_scroll,
		        0,
		        max(0, array_length(menu_list) - visible_items)
		    );
		}
	}
	if(input_tabungan1 && !disable && last_input == 1){
		if mouse_check_button_pressed(mb_left){
		    /// klik textbox
		    if point_in_rectangle(mx,my,input_x1,input_y1,input_x2,input_y2)
		    {
		        input_active = true;
		    }
		    else
		    {
		        input_active = false;
		    }

		    /// tombol OK
		    if point_in_rectangle(mx,my,ok_x1,ok_y1,ok_x2,ok_y2)
		    {
				if input_text != ""{
			        var jumlah = real(input_text);

			        if jumlah > max_value
			        {
			            jumlah = max_value;
			        }
					
					show_debug_message("Input: " + string(jumlah));
					global.tabungan += real(jumlah);
					global.Uang -= real(jumlah);
			        input_text = "";
			        input_active = false;
					input_tabungan1 = false;
					disable = true;
				}
		    }

		    /// tombol cancel
		    if point_in_rectangle(mx,my,cancel_x1,cancel_y1,cancel_x2,cancel_y2)
		    {
		        input_text = "";
		        input_active = false;
		    }
		}
		if input_active{
			if (input_delay <= 0){
			    var key = keyboard_lastchar;

				if keyboard_check_pressed(vk_backspace)
				{
				    if string_length(input_text) > 0
				    {
				        input_text = string_delete(input_text, string_length(input_text), 1);
						input_delay = input_delay_max;
				    }
				}

				if key >= "0" && key <= "9"
				{
				    var new_val = real(input_text + key);

				    if new_val <= max_value
				    {
				        input_text += key;
						input_delay = input_delay_max;
				    }
				}
			}
		}
	}
	if ( input_delay > 0){	
		input_delay--;
	}
}
