	/// @description Menggambar Sprite Kotak Dialog, Teks, Nama, dan Portret
	
	if (dialogue_active){
		
	    // === PERHITUNGAN TINGGI DINAMIS ===
	    if (dynamic_height) {
	        // Jika ini adalah List Scroll (list_data ada), kita harus mengukur tinggi berdasarkan max_items_visible
	        if (array_length(list_data) > 0) {
	            // Tinggi dihitung berdasarkan jumlah item yang terlihat
	            box_height = max_items_visible * item_height + vertical_padding; 
	        } else {
	            // Jika ini mode Typewriter/Input Jumlah, hitung tinggi teks normal
	            var _text_height = string_height_ext(draw_text_display, -1, box_width - 32);
	            box_height = _text_height + vertical_padding;
	        }
	    }
	
	    // --- KODE LAMA ANDA: Gambar Latar Belakang (1) & Portret/Nama (2, 3) ---
	    var _xscale = box_width / sprite_get_width(spr_dialogue_box);
	    var _yscale = box_height / sprite_get_height(spr_dialogue_box);
		
		 if (portrait_sprite != noone && sprite_exists(portrait_sprite)) {
			if(global.tampilan != 0){
				var _padding = 20; 
		        var _portrait_x = box_x + 150 + _padding; 
		        var _portrait_y = box_y  - 50 + _padding; 
				var target_height = 700; // tinggi karakter yang diinginkan di layar
			    var spr_h = sprite_get_height(portrait_sprite);

			    var scale = target_height / spr_h;
		        draw_sprite_ext(portrait_sprite, 0, _portrait_x, _portrait_y, scale, scale, 0, c_white, 1);
			}
	    }
		if (portrait_left != noone)
		{
		    var _padding = 20; 
		    var _portrait_x = box_x + 150 + _padding; 
		    var _portrait_y = box_y  - 50 + _padding; 
			var target_height = 700; // tinggi karakter yang diinginkan di layar
			var spr_h = sprite_get_height(portrait_left);
			var scale = target_height / spr_h;

		   draw_sprite_ext(portrait_left, 0, _portrait_x, _portrait_y, scale, scale, 0, c_white, speaker_side == "left" ? 1 : 0.5);
		}

		if (portrait_right != noone)
		{
			var _padding = 20; 
		    var _portrait_x = box_x + 1150 + _padding; 
		    var _portrait_y = box_y  - 50 + _padding; 
			var target_height = 700; // tinggi karakter yang diinginkan di layar
			var spr_h = sprite_get_height(portrait_right);
			var scale = target_height / spr_h;

		     draw_sprite_ext(portrait_right, 0, _portrait_x, _portrait_y, scale, scale, 0, c_white, speaker_side == "right" ? 1 : 0.5);
		}
    
	    // 1. Gambar Kotak Dialog Latar Belakang
	    if (sprite_exists(spr_dialogue_box)) {
			draw_set_color(c_yellow);
			draw_sprite_ext(spr_dialogue_box, image_index, box_x, box_y, _xscale, _yscale, 0, c_white, 1);
		} else {
	        // FALLBACK: Gambar kotak hitam sederhana
	        draw_set_alpha(0.8); 
	        draw_set_color(c_black);
	        draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
	        draw_set_alpha(1);
		}

	    // 2. Gambar Portret (Portret/Nama harus selalu digambar, meskipun di mode list)
		if (portrait_sprite != noone && sprite_exists(portrait_sprite)) {
			if(global.tampilan == 0){
		        var _padding = 20; 
		        var _portrait_x = box_x + 150 + _padding; 
		        var _portrait_y = box_y  + 15 + _padding; 
				var target_height = 420; // tinggi karakter yang diinginkan di layar
			    var spr_h = sprite_get_height(portrait_sprite);

			    var scale = target_height / spr_h;
		        draw_sprite_ext(portrait_sprite, 0, _portrait_x, _portrait_y, scale, scale, 0, c_white, 1);
			}
	    }
	    // 3. Gambar Nama Karakter
	    if (dialog_name != "") {
			if(speaker_side == "left"){
		        draw_set_font(-1); 
		        draw_set_color(c_yellow);
		        draw_set_halign(fa_left); 
		        var _name_x = box_width - 200; 
		        var _name_y = box_y ;
				draw_sprite_ext(Name_box, image_index, _name_x + 20, _name_y, -1.5, 1.5, 0, c_white, 1)
		        draw_text(_name_x, _name_y, dialog_name);
		        draw_set_halign(fa_left); // Reset perataan
			}else if(speaker_side == "right"){
				draw_set_font(-1); 
		        draw_set_color(c_yellow);
		        draw_set_halign(fa_left); 
		        var _name_x = box_x + 200; 
		        var _name_y = box_y ;
				draw_sprite_ext(Name_box, image_index, _name_x + 20, _name_y, 1.5, 1.5, 0, c_white, 1)
		        draw_text(_name_x, _name_y, dialog_name);
		        draw_set_halign(fa_left); // Reset perataan
			}else{
				draw_set_font(-1); 
		        draw_set_color(c_yellow);
		        draw_set_halign(fa_left); 
		        var _name_x = box_width - 200; 
		        var _name_y = box_y ;
				draw_sprite_ext(Name_box, image_index, _name_x + 20, _name_y, -1.5, 1.5, 0, c_white, 1)
		        draw_text(_name_x, _name_y, dialog_name);
		        draw_set_halign(fa_left); // Reset perataan
			}
	    }

	    // --- 5. Gambar Teks Dialog Asli (HANYA untuk Kotak Input Jumlah/Typewriter) --
		if(global.tampilan == 0){
	        draw_set_font(-1);
	        draw_set_color(c_white);
        
	        var _DEFAULT_PORTRAIT_WIDTH = 20; 
			var portrait_space = 100
	        var _sprite_width_actual = (portrait_sprite != noone && sprite_exists(portrait_sprite)) ? portrait_space : _DEFAULT_PORTRAIT_WIDTH;
	        var _text_start_x = box_x + _sprite_width_actual + 200 + 24; 
	        var _total_padding_area = _sprite_width_actual + 32; 
	        var _text_area_width = box_width - _total_padding_area; 
	        var _text_start_y = box_y + 36; 

	        draw_text_ext(_text_start_x, _text_start_y, draw_text_display, -1, _text_area_width);
		}else{
			draw_set_font(-1);
	        draw_set_color(c_white);
        
	        var _DEFAULT_PORTRAIT_WIDTH = 20; 
			var portrait_space = 50
	        var _sprite_width_actual = (portrait_sprite != noone && sprite_exists(portrait_sprite)) ? portrait_space : _DEFAULT_PORTRAIT_WIDTH;
	        var _text_start_x = box_x + _sprite_width_actual + 24; 
	        var _total_padding_area = _sprite_width_actual + 32; 
	        var _text_area_width = box_width - _total_padding_area; 
	        var _text_start_y = box_y + 36; 

	        draw_text_ext(_text_start_x, _text_start_y, draw_text_display, -1, _text_area_width);
		}
			
	    
	}
	
	

