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

	var color_box = c_gray;

	switch(warna)
	{
		case "hijau": color_box = make_color_rgb(60,170,80); break;
		case "merah": color_box = make_color_rgb(200,60,60); break;
		case "pink":  color_box = make_color_rgb(255,120,180); break;
		case "kuning":color_box = make_color_rgb(240,210,60); break;
	}

	// hitung jumlah kartu
	var jumlah = 0;
	for (var i=0;i<array_length(global.Resiko);i++)
	{
		if global.Resiko[i].warna == warna
		{
			jumlah++;
		}
	}

	var box_h = 40 + jumlah * card_h;

	draw_set_color(color_box);
	draw_rectangle(box_x,box_y,box_x+box_w,box_y+box_h,false);

	draw_set_color(c_black);
	draw_text(box_x+10,box_y+6,string_upper(warna));

	y = box_y + 30;

	for (var i=0;i<array_length(global.Resiko);i++)
	{
		var kartu = global.Resiko[i];

		if kartu.warna == warna
		{
			var color_card = color_box;

			// highlight hover
			if point_in_rectangle(mx,my,box_x+5,y,box_x+box_w-5,y+card_h)
			{
				color_card = merge_color(color_box,c_white,0.35);
			}

			draw_set_color(color_card);
			draw_rectangle(box_x+5,y,box_x+box_w-5,y+card_h,false);

			draw_set_color(c_black);
			draw_text(box_x+12,y+6,kartu.name);

			if variable_struct_exists(kartu,"biaya")
			{
				draw_text(box_x+200,y+6,string(kartu.biaya));
			}

			y += card_h;
		}
	}

	x_offset += box_w + 25;
}
if (global.testing)
{
	var start_x = 150;
	var start_y = 50;
	var jarak_x = 300; // jarak antar player ke samping

	for (var i = 0; i < array_length(global.player_data); i++)
	{
	    var data = global.player_data[i];
    
	    x = start_x + i * jarak_x;
	    y = start_y;

	    // === HEADER PLAYER ===
	    var status = (i == global.current_player) ? " (AKTIF)" : "";
	    draw_text(x, y, "=== PLAYER " + string(i) + status + " ===");

	    // === INFO UTAMA ===
	    draw_text(x, y + 20, "Uang: " + string(data.uang));
	    draw_text(x, y + 40, "Tabungan: " + string(data.tabungan));
	    draw_text(x, y + 60, "Misi: " + string(data.misi_T));

	    // === INVENTORY ===
	    draw_text(x, y + 80, "Inventory:");

	    var keys_inv = ds_map_keys_to_array(data.inventory);

	    for (var k = 0; k < array_length(keys_inv); k++)
	    {
	        var key = keys_inv[k];
	        var val = data.inventory[? key];

	        draw_text(x, y + 100 + k * 15, key + ": " + string(val));
	    }

	    // === RECORD ===
	    var offset_record = 100 + array_length(keys_inv) * 15 + 20;
	    draw_text(x, y + offset_record, "Record:");

	    var keys_rec = ds_map_keys_to_array(data.record);

	    for (var j = 0; j < array_length(keys_rec); j++)
	    {
	        var key = keys_rec[j];
	        var val = data.record[? key];

	        draw_text(x, y + offset_record + 20 + j * 15, key + ": " + string(val));
	    }

	    // === BAKED GOODS ===
	    var offset_baked = offset_record + 20 + array_length(keys_rec) * 15 + 20;
	    draw_text(x, y + offset_baked, "Baked:");

	    for (var b = 0; b < array_length(data.baked_goods); b++)
	    {
	        draw_text(x, y + offset_baked + 20 + b * 15, string(data.baked_goods[b]));
	    }

	    // === ASURANSI ===
	    if (array_length(data.asuransi) > 0)
	    {
	        var offset_asuransi = offset_baked + 20 + array_length(data.baked_goods) * 15 + 20;
	        draw_text(x, y + offset_asuransi, "Asuransi:");

	        for (var a = 0; a < array_length(data.asuransi); a++)
	        {
	            draw_text(x, y + offset_asuransi + 20 + a * 15, string(data.asuransi[a].name));
	        }
	    }
	}
}