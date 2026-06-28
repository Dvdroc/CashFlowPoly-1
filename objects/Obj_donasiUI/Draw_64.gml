var panel_w = 200;
var panel_h = 260;
var spacing = 20;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);



for(var p=0; p<array_length(pemain_list); p++){
    var px = ui_x + p * (panel_w + spacing);

    draw_set_color(c_black);
    draw_rectangle(px,ui_y,px+panel_w,ui_y+panel_h,false);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(px + panel_w/2, ui_y + 20, pemain_list[p]);
	
	
    // tombol juara
    for(var j=1;j<=3;j++)
    {
        var bx1 = px + 20;
        var by1 = ui_y + 80 + (j * 40);
        var bx2 = bx1 + 160;
        var by2 = by1 + 35;

        var hover = point_in_rectangle(mx,my,bx1,by1,bx2,by2);

        if(juara[p] == j)
            draw_set_color(make_color_rgb(0,200,0));
        else if(hover)
            draw_set_color(make_color_rgb(0,255,150));
        else
            draw_set_color(make_color_rgb(0,140,0));

        draw_rectangle(bx1,by1,bx2,by2,false);

        draw_set_color(c_white);
        draw_text((bx1+bx2)/2,by1+8,"JUARA "+string(j));
		
    }

    // hasil
    draw_set_halign(fa_center);

    if(juara[p] != -1)
    {
        draw_text(px+panel_w/2,ui_y+230,
        pemain_list[p]+" : Juara "+string(juara[p]));
    }
}
if (input_active)
{
    draw_set_color(c_black);
    draw_rectangle(400,300,600,350,false);

    draw_set_color(c_white);
    draw_text(420,310,"Masukkan Donasi:");
    draw_text(420,330,input_text);
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