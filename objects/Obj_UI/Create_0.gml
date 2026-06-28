pemain_list = global.player
aktivitas_list = ["Jual Makanan","Beli Bahan","Kerja Lepas","Beli Kebutuhan","Tujuan Finansial","Pinjaman", "Asuransi"];

menu_list = [];

pemain_selected = 0;

input_delay = 0;
input_delay_max = 15; // 2 detik
/// BARIS ATAS
aktivitas_selected = 0;
menu_selected = -1;
menu_scroll = 0;

/// BARIS BAWAH
aktivitas_selected2 = 0;
menu_selected2 = -1;
menu_list2 = [];
menu_scroll2 = 0;

dropdown_open = -1;

yslot_1 = display_get_gui_height() - 250;
yslot_1heinght = yslot_1 + 40;

/// posisi baris kedua
yslot_2 = yslot_1 + 60;
yslot_2heinght = yslot_2 + 40;

box_x = 32;
box_y = display_get_gui_height() - 310;
box_width = display_get_gui_width() - 64;
box_height =300;

portrait_sprite = GO;

spr_dialogue_box = textbox2;

visible_items = 5; // jumlah item terlihat
visible_items2 = 4;
go = false;
last_input = -1
input_text = "";
input_active = false;
input_tabungan = false;
input_tabungan1 = false
disable = false;
disable2 = false;
max_value = 15;

input_x1 = 600;
input_y1 = 400;
input_x2 = 750;
input_y2 = 440;

ok_x1 = 760;
ok_y1 = 400;
ok_x2 = 830;
ok_y2 = 440;

cancel_x1 = 840;
cancel_y1 = 400;
cancel_x2 = 930;
cancel_y2 = 440;

fin_slot_active = -1;
tampilan = false
