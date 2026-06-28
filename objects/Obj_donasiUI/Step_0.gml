if (visible){

	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);

	if mouse_check_button_pressed(mb_left)
	{
	    for(var p=0; p<array_length(pemain_list); p++)
	    {
	        var px = ui_x + (p * 220); // jarak antar panel

	        for(var j=1; j<=3; j++)
	        {
	            var bx1 = px + 20;
	            var by1 = ui_y + 80 + (j * 40);
	            var bx2 = bx1 + 160;
	            var by2 = by1 + 35;

	            if point_in_rectangle(mx,my,bx1,by1,bx2,by2)
	            {
	                juara[p] = j;
					input_player = p;
					input_text = "";
					if(global.tanggal > 25){
						input_active = false;
					}else{
						input_active = true;
					}
	            }
	        }
	    }
	}

	var semua_pilih = true;
	var total = false;
	var jumlah_pemain = array_length(pemain_list)
	for (var i = 0; i < jumlah_pemain; i++){
		if( jumlah_pemain >= 3) total = true;
	    if (juara[i] == -1)
	    {
	        semua_pilih = false;
	        break;
		
	    }
	}

var semua_donasi = true;

for (var i = 0; i < array_length(donasi); i++)
{
    if (donasi[i] == -1)
    {
        semua_donasi = false;
        break;
    }
}

	if (semua_pilih){
		if(global.tanggal > 25){
			scr_pensiun(juara,pemain_list);
		}else{ 
			scr_donasi(juara, pemain_list, donasi);
			global.tampilan = 0;
		}
		global.activity_points = 0
	    room_restart();
	}
	var j1 = false;
	var j2 = false;
	var j3 = false;
	if(global.tanggal > 25){
		for (var i = 0; i < array_length(juara); i++)
				{
				    if (juara[i] == 1) j1 = true;
				    if (juara[i] == 2) j2 = true;
				    if (juara[i] == 3) j3 = true;
				}
	}
	if (input_active)
	{
	    input_text = keyboard_string;

	    // hanya angka
	    var clean = "";
	    for (var i = 1; i <= string_length(input_text); i++)
	    {
	        var c = string_char_at(input_text, i);
	        if (c >= "0" && c <= "9")
	            clean += c;
	    }

	    input_text = clean;

	    if (keyboard_check_pressed(vk_enter))
	    {
	        if (input_text != "")
	        {
	            var jumlah = real(input_text);
				for (var i = 0; i < array_length(juara); i++)
				{
				    if (juara[i] == 1) j1 = true;
				    if (juara[i] == 2) j2 = true;
				    if (juara[i] == 3) j3 = true;
				}

	            donasi[input_player] = jumlah;

	            keyboard_string = "";
	            input_text = "";

	            input_active = false;
	            input_player = -1;
	        }
	    }
	}
	if (total && j1 && j2 && j3){
		if(global.tanggal > 25){
			scr_pensiun(juara,pemain_list);
		}else{ 
			scr_donasi(juara, pemain_list, donasi);
			global.tampilan = 0;
		}
		global.activity_points = 0
	    room_restart();
	}
}