draw_set_alpha(0.7);
draw_set_color(c_black);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);

var row_h = 32;
var col_kategori = 420;
var col_w = 160;

var jumlah_player = array_length(pemain_list);
var jumlah_kategori = array_length(kategori_skor);

/// ukuran tabel
var table_w = col_kategori + (jumlah_player * col_w);
var table_h = (jumlah_kategori + 1) * row_h;

/// posisi tengah layar
var start_x = (display_get_gui_width() - table_w) / 2;
var start_y = (display_get_gui_height() - table_h) / 2;

draw_set_color(c_white);
draw_set_font(-1);


/// Judul
draw_set_halign(fa_left);
draw_text(start_x, start_y - 60, "Skor Poin Kebahagiaan");


/// Header pemain
for (var p = 0; p < jumlah_player; p++)
{
    var px = start_x + col_kategori + (p * col_w);

    draw_rectangle(px, start_y, px + col_w, start_y + row_h, true);

    draw_set_halign(fa_center);
    draw_text(px + col_w/2, start_y + 6, pemain_list[p]);
}


/// Baris kategori
for (var i = 0; i < jumlah_kategori; i++)
{
    y = start_y + (i + 1) * row_h;

    draw_set_halign(fa_left);
    draw_text(start_x + 10, y + 8, kategori_skor[i]);

    /// Kolom skor pemain
    for (var p = 0; p < jumlah_player; p++)
    {
        x = start_x + col_kategori + (p * col_w);

        draw_rectangle(x, y, x + col_w, y + row_h, true);

        draw_set_halign(fa_center);
        draw_text(x + col_w/2, y + 8, string(skor[i][p]));
    }
}
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