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
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    draw_set_color(c_white);

    /// Mouse
    draw_text(20, 20, "Mouse : " + string(mx) + " , " + string(my));

    /// INVENTORY
    draw_text(100, 70, "=== INVENTORY ===");

    var keys_inv = ds_map_keys_to_array(global.inventory);

    for (var i = 0; i < array_length(keys_inv); i++)
    {
        var key = keys_inv[i];
        var value = global.inventory[? key];

        draw_text(100, 100 + i * 18, string(key) + " : " + string(value));
    }


    /// RECORD
    draw_text(300, 70, "=== RECORD ===");

    var keys_rec = ds_map_keys_to_array(global.record);

    for (var j = 0; j < array_length(keys_rec); j++)
    {
        var key = keys_rec[j];
        var value = global.record[? key];

        draw_text(300, 100 + j * 18, string(key) + " : " + string(value));
    }


    /// GAME INFO
    draw_text(550, 80,  "Uang : " + string(global.Uang));
    draw_text(550, 100, "Tabungan : " + string(global.tabungan));
    draw_text(550, 120, "Hari : " + string(global.day));
    draw_text(550, 140, "Activity : " + string(global.activity_points));
    draw_text(550, 160, "Pekan : " + string(global.pekan));
}