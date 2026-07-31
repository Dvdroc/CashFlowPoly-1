var panel_w = 360;
var panel_h = 250;

// panel background
draw_set_color(c_black);
draw_rectangle(ui_x, ui_y, ui_x + panel_w, ui_y + panel_h, false);

// judul
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(ui_x + panel_w/2,ui_y + 35, global.player[global.current_player]);
draw_text(ui_x + panel_w/2, ui_y + 20, "MARKET EMAS");
// harga
draw_set_halign(fa_left);
draw_text(ui_x + 40, ui_y + 80, "Harga : " + string(global.harga_emas));

// tombol - harga
draw_set_color(c_red);
draw_rectangle(ui_x + 150, ui_y + 70, ui_x + 180, ui_y + 100, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(ui_x + 165, ui_y + 76, "-");

// tombol + harga
draw_set_color(c_green);
draw_rectangle(ui_x + 190, ui_y + 70, ui_x + 220, ui_y + 100, false);
draw_set_color(c_white);
draw_text(ui_x + 205, ui_y + 76, "+");

draw_set_halign(fa_left);

// emas yang dimiliki
draw_text(ui_x + 40, ui_y + 115, "Emas : " + string(global.inventory[? "Emas"]));

// quantity
draw_text(ui_x + 40, ui_y + 150, "Jumlah : " + string(quantity));

// tombol - quantity
draw_set_color(c_red);
draw_rectangle(ui_x + 150, ui_y + 140, ui_x + 180, ui_y + 170, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(ui_x + 165, ui_y + 146, "-");

// tombol + quantity
draw_set_color(c_green);
draw_rectangle(ui_x + 190, ui_y + 140, ui_x + 220, ui_y + 170, false);
draw_set_color(c_white);
draw_text(ui_x + 205, ui_y + 146, "+");

draw_set_halign(fa_left);

// tombol BELI
draw_set_color(c_green);
draw_rectangle(ui_x + 40, ui_y + 180, ui_x + 160, ui_y + 230, false);
draw_set_color(c_white);
draw_text(ui_x + 100, ui_y + 195, "BELI");

// tombol JUAL
draw_set_color(c_red);
draw_rectangle(ui_x + 200, ui_y + 180, ui_x + 320, ui_y + 230, false);
draw_set_color(c_white);
draw_text(ui_x + 260, ui_y + 195, "JUAL");

draw_set_halign(fa_left);

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