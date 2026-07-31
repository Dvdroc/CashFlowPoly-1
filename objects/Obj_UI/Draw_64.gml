var _xscale = box_width / sprite_get_width(spr_dialogue_box);
var _yscale = box_height / sprite_get_height(spr_dialogue_box);
    
// ===============================
// BACKGROUND
// ===============================

if (sprite_exists(spr_dialogue_box)) {
	draw_sprite_ext(spr_dialogue_box, image_index, box_x, box_y, _xscale, _yscale, 0, c_white, 1);
} 
else 
{
	draw_set_alpha(0.8); 
	draw_set_color(c_black);
	draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
	draw_set_alpha(1);
}



// ===============================
// PORTRAIT
// ===============================

if (portrait_sprite != noone && sprite_exists(portrait_sprite)) {

	var _padding = 20; 
	var _portrait_x = box_width - _padding - 200; 
	var _portrait_y = box_y + 30 + _padding; 

	draw_sprite_ext(portrait_sprite, 0, _portrait_x, _portrait_y, 0.4, 0.4, 0, c_white, 1);

}



// ===============================
// PEMAIN
// ===============================

draw_set_color(c_dkgray);
draw_rectangle(200,yslot_1,350,yslot_1heinght,false);

draw_set_color(c_white);
draw_text(210,yslot_1 + 10,pemain_list[global.current_player]);



// ===============================
// BARIS ATAS
// ===============================

// aktivitas
draw_set_color(c_dkgray);
draw_rectangle(400,yslot_1,550,yslot_1heinght,false);

draw_set_color(c_white);
draw_text(410,yslot_1 + 10,aktivitas_list[aktivitas_selected]);


// menu
if(!(aktivitas_selected == 4 && aktivitas_selected2 == 4)){
	draw_set_color(c_dkgray);
	draw_rectangle(600,yslot_1,750,yslot_1heinght,false);

	draw_set_color(c_white);

	if(menu_selected == -1){
		draw_text(610,yslot_1 + 10,"Pilih");
	}
	else{
		draw_text(610,yslot_1 + 10,menu_list[menu_selected].name);
	}
}


// ===============================
// DROPDOWN PEMAIN
// ===============================

if dropdown_open == 0
{
	for (var i=0;i<array_length(pemain_list);i++)
	{
		y = yslot_1heinght + i*30;
		
		draw_set_color(c_dkgray);
		draw_rectangle(200,y,350,y+30,false);

		draw_set_color(c_white);
		draw_text(210,y+5,pemain_list[i]);
	}
}



// ===============================
// DROPDOWN AKTIVITAS ATAS
// ===============================

if dropdown_open == 1
{
	for (var i = 0; i < visible_items; i++){
		var index = i + menu_scroll;
		if index >= array_length(aktivitas_list) break;
		y = yslot_1heinght + i*30;
		
		draw_set_color(c_dkgray);
		draw_rectangle(400,y,550,y+30,false);

		draw_set_color(c_white);
		draw_text(410,y+5,aktivitas_list[index]);
	}
}



// ===============================
// DROPDOWN MENU ATAS
// ===============================

if dropdown_open == 2
{
	for (var i = 0; i < visible_items; i++){
	    var index = i + menu_scroll;
	    if index >= array_length(menu_list) break;

	    y = yslot_1heinght + i * 30;

	    var text_color = c_white;

	    if (aktivitas_selected == 4)
	    {
	        if (global.tabungan < menu_list[index].harga)
	        {
	            text_color = c_gray;
	        }
	    }
	    else if (aktivitas_selected == 0)
	    {
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
	            text_color = c_gray;
	        }
	    }else if (aktivitas_selected != 2 && aktivitas_selected != 5){
			if ( aktivitas_selected == 6 &&  (global.Uang < menu_list[index].harga || global.asuransi[0].kondisi)){
	            text_color = c_gray;
	        }else if (global.Uang < menu_list[index].harga){
	            text_color = c_gray;
	        }
		}

	    draw_set_color(c_dkgray);
	    draw_rectangle(600,y,750,y+30,false);

	    draw_set_color(text_color);
	    draw_text(610,y+5, menu_list[index].name);
	}
}

// ===============================
// INPUT TABUNGAN
// ===============================

if(input_tabungan1 && !disable && last_input == 1){

	draw_set_color(c_dkgray);
	draw_rectangle(input_x1,input_y1,input_x2,input_y2,false);

	draw_set_color(c_white);
	draw_text(input_x1+10,input_y1+10,input_text);

	draw_set_color(c_dkgray);
	draw_rectangle(ok_x1,ok_y1,ok_x2,ok_y2,false);

	draw_set_color(c_white);
	draw_text(ok_x1+15,ok_y1+10,"OK");

	draw_set_color(c_dkgray);
	draw_rectangle(cancel_x1,cancel_y1,cancel_x2,cancel_y2,false);

	draw_set_color(c_white);
	draw_text(cancel_x1+5,cancel_y1+10,"Cancel");

}
if(input_tabungan && !disable2 && last_input == 3){

	draw_set_color(c_dkgray);
	draw_rectangle(input_x1,input_y1,input_x2,input_y2,false);

	draw_set_color(c_white);
	draw_text(input_x1+10,input_y1+10,input_text);

	draw_set_color(c_dkgray);
	draw_rectangle(ok_x1,ok_y1,ok_x2,ok_y2,false);

	draw_set_color(c_white);
	draw_text(ok_x1+15,ok_y1+10,"OK");

	draw_set_color(c_dkgray);
	draw_rectangle(cancel_x1,cancel_y1,cancel_x2,cancel_y2,false);

	draw_set_color(c_white);
	draw_text(cancel_x1+5,cancel_y1+10,"Cancel");

}



// ===============================
// DEBUG
// ===============================
if (global.testing)
{
	var start_x = 150;
	var start_y = 50;
	var jarak_x = 300; // jarak antar player ke samping
	draw_set_color(c_dkgray);
	draw_rectangle(0,0, room_width, room_height,false)
	draw_set_color(c_white)
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
	            draw_text(x, y + offset_asuransi + 20 + a * 15, string(data.asuransi[a].kondisi));
	        }
	    }
	}
}