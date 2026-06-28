	/// @description Inisialisasi Variabel Dialog
// Teks yang akan ditampilkan (gunakan "\n" untuk baris baru)
dialogue_text = "Hari ini enak nya ngapain yah";
list_type = "npc";
dialog_type = "npc";
// Variabel untuk melacak kemajuan ketikan
current_char = 0; // Jumlah karakter yang sudah ditampilkan
is_buy_input = false;
// Kecepatan ketikan (berapa banyak karakter per langkah (step))
char_speed = 0.5; // Nilai float memungkinkan ketikan lebih lambat dari 1 karakter/step
interaction_cooldown = 5;
// Teks yang benar-benar akan digambar di layar
draw_text_display = "";
image_speed = 0.25;
// Variabel untuk mengontrol apakah dialog sedang aktif
dialogue_active = false;

// Posisi kotak dialog (sesuaikan sesuai kebutuhan)
box_x = 32;
if(global.tampilan == 0){
	box_y = display_get_gui_height()/2 - 75;
}else if(global.tampilan != 0){
	box_y = display_get_gui_height() - 160
}
box_width = display_get_gui_width() - 64;
box_height = 150;



source_npc = noone; // ID objek NPC yang memicu dialog
dialog_name = ""; // Nama yang akan ditampilkan (default kosong)
portrait_sprite = noone; // Sprite portret (default noone)
spr_dialogue_box = textbox2;

draw_set_color(c_white);
is_crafting_input = false; // Default: FALSE (bukan kotak input jumlah)
hitung = 0;
// Variabel Pendukung Crafting
recipe_index = -1; 
craft_amount = 1; 
interaction_cooldown = 5; // Penting untuk mencegah double-input
dynamic_height = false;
// --- VARIABEL LIST SCROLL ---
list_data = array_create(0); // WAJIB: Array kosong
memilih = -1
list_selected = 0;
list_select = 0;
scroll_offset = 0;
max_items_visible = 6; 
item_height = 20;
vertical_padding = 80;
stopamout = false;
pesanan_customer = 0;
show_inventory = false;

speaker_side = "left"; // "left" atau "right"

portrait_left = noone;
portrait_right = noone;

name_left = "";
name_right = "";
