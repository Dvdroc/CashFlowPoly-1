/// @description Insert description here
// You can write your code in this editor
if(tampilkan_misi){
	var box_w = 200;
	var box_h = 45;
	var jarak = 40;
	var total_item = 4;
	draw_set_alpha(0.7);
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_alpha(1);
	// hitung tinggi total menu
	var total_h = total_item * jarak;

	// posisi tengah
	x = display_get_gui_width()/2 - box_w/2;
	y = display_get_gui_height()/2 - total_h/2;
	draw_set_color(c_white)
	draw_text(x,y - 25, global.player[global.current_player]);
	draw_text(x, y - 40, "Pilih Misi kebutuhan");

	for (var i = 0; i < total_item; i++)
	{
	    var nama = global.kebutuhan[i+4].name;

	    var yy = y + i * jarak;
		draw_set_color(c_green);
	    draw_rectangle(x, yy, x + box_w, yy + box_h,false);
		draw_set_color(c_lime);
	    draw_rectangle(x, yy, x + box_w, yy + box_h,true);
		draw_set_color(c_white);
	    draw_text(x + 10, yy + 10, nama);

	    if (global.misi_T == i)
	    {
	        draw_text(x + box_w - 20, yy + 10, "<");
	        tampilkan_misi = false;
	    }
	}
}
if(global.tanggal <=25){
	var box_w = 220;
	var box_h = 120; // diperbesar

	var xx = 20;
	var yy = 20;

	// Background
	draw_set_alpha(0.8);
	draw_set_color(c_black);
	draw_roundrect(xx, yy, xx + box_w, yy + box_h, false);

	// Border
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_roundrect(xx, yy, xx + box_w, yy + box_h, true);

	// Text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);

	draw_text(xx + box_w / 2, yy + 20, "HARI KE-" + string(global.tanggal));
	draw_text(xx + box_w / 2, yy + 45, string_upper(global.day));
	draw_text(xx + box_w / 2, yy + 70, "UANG : " + string(global.Uang));
	draw_text(xx + box_w / 2, yy + 95, "KEBAHAGIAAN : " + string(hitung_kebahagiaan()));

	// Reset
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
	draw_set_color(c_white);
}
