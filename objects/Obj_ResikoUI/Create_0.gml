// ====== State panel ======
// 0 = panel utama, 1 = sub-panel Jual Emas, 2 = daftar player kekurangan uang,
// 3 = menu aksi utk player terpilih, -1 = tertutup (tidak tampil apa-apa)
mode_ui = 0; // langsung tampilkan Daftar Player Kekurangan Uang duluan
return_mode_ui = 0; // dipakai buat "balik ke mode sebelumnya" dari sub-panel Jual Emas

// ====== Panel utama: 1 tombol "Player Kekurangan Uang" ======
btn_kurang_uang_w = 220;
btn_kurang_uang_h = 45;
// Ukuran umum tombol yg dipakai di beberapa panel (jangan dihapus!)
tombol_h   = 40;
tombol_gap = 10;

// ====== Panel utama: 1 tombol "Player Kekurangan Uang" ======
btn_kurang_uang_w = 220;
btn_kurang_uang_h = 45;

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var center_x = gui_w / 2;
var center_y = gui_h / 2;

var corner_x = gui_w - btn_kurang_uang_w - 20;
var corner_y = gui_h - btn_kurang_uang_h - 20;

var btn_kurang_uang_x = (center_x + corner_x) / 2;
var btn_kurang_uang_y = (center_y + corner_y) / 2;

btn_kurang_uang_rect = {
	x1 : btn_kurang_uang_x,
	y1 : btn_kurang_uang_y,
	x2 : btn_kurang_uang_x + btn_kurang_uang_w,
	y2 : btn_kurang_uang_y + btn_kurang_uang_h
};

btn_kurang_uang_hover = false;

// ====== Sub-panel: Jual Emas ======
emas_panel_w = 320;
emas_panel_h = 280;

emas_panel_x = (display_get_gui_width()  - emas_panel_w) / 2;
emas_panel_y = (display_get_gui_height() - emas_panel_h) / 2;

emas_harga_min  = 5;
emas_harga_max  = 8;
emas_harga_dummy = global.harga_emas;
emas_jumlah_jual = 1;

emas_harga_btn_minus = {
	x1 : emas_panel_x + 30, y1 : emas_panel_y + 80,
	x2 : emas_panel_x + 80, y2 : emas_panel_y + 120
};
emas_harga_btn_plus = {
	x1 : emas_panel_x + emas_panel_w - 80, y1 : emas_panel_y + 80,
	x2 : emas_panel_x + emas_panel_w - 30, y2 : emas_panel_y + 120
};
emas_btn_minus = {
	x1 : emas_panel_x + 30, y1 : emas_panel_y + 150,
	x2 : emas_panel_x + 80, y2 : emas_panel_y + 190
};
emas_btn_plus = {
	x1 : emas_panel_x + emas_panel_w - 80, y1 : emas_panel_y + 150,
	x2 : emas_panel_x + emas_panel_w - 30, y2 : emas_panel_y + 190
};
emas_btn_jual = {
	x1 : emas_panel_x + 20, y1 : emas_panel_y + emas_panel_h - 55,
	x2 : emas_panel_x + emas_panel_w/2 - 5, y2 : emas_panel_y + emas_panel_h - 15
};
emas_btn_batal = {
	x1 : emas_panel_x + emas_panel_w/2 + 5, y1 : emas_panel_y + emas_panel_h - 55,
	x2 : emas_panel_x + emas_panel_w - 20, y2 : emas_panel_y + emas_panel_h - 15
};

emas_hover = -1; // 0=harga minus,1=harga plus,2=jumlah minus,3=jumlah plus,4=jual,5=batal

// ====== Panel: Daftar Player Kekurangan Uang ======
// Dummy data, nanti diganti data player asli (yang uangnya < 0 misalnya)
// ====== Panel: Daftar Player Kekurangan Uang ======
// Dummy data, nanti diganti data player asli yang beneran kekurangan uang
player_kurang_list = global.player;

player_list_panel_w = 380;
player_list_panel_h = 80 + array_length(player_kurang_list) * 50;

player_list_panel_x = (display_get_gui_width()  - player_list_panel_w) / 2;
player_list_panel_y = (display_get_gui_height() - player_list_panel_h) / 2;

player_list_rect = [];

var pl_btn_margin = 15;
var pl_btn_w = player_list_panel_w - (pl_btn_margin * 2);
var pl_btn_x = player_list_panel_x + pl_btn_margin;

for (var i = 0; i < array_length(player_kurang_list); i++){
	var pl_btn_y = player_list_panel_y + 55 + i * 50;

	array_push(player_list_rect, {
		x1 : pl_btn_x, y1 : pl_btn_y,
		x2 : pl_btn_x + pl_btn_w, y2 : pl_btn_y + 40
	});
}

player_list_hover = -1;
player_terpilih   = -1; // index player yang lagi dipilih (dari player_kurang_list)

// ====== Panel: Menu Aksi utk Player Terpilih ======
player_action_panel_w = 380;
player_action_panel_h = 320;

player_action_panel_x = (display_get_gui_width()  - player_action_panel_w) / 2;
player_action_panel_y = (display_get_gui_height() - player_action_panel_h) / 2;

player_action_list = [
	"Jual Kebutuhan",
	"Jual Emas",
	"Pinjam Syariah"
];

player_action_rect = [];

var pa_btn_margin = 15;
var pa_btn_w = player_action_panel_w - (pa_btn_margin * 2);
var pa_btn_x = player_action_panel_x + pa_btn_margin;

for (var i = 0; i < array_length(player_action_list); i++){
	var pa_btn_y = player_action_panel_y + 60 + i * (tombol_h + tombol_gap);

	array_push(player_action_rect, {
		x1 : pa_btn_x, y1 : pa_btn_y,
		x2 : pa_btn_x + pa_btn_w, y2 : pa_btn_y + tombol_h
	});
}

// 2 tombol navigasi di bawah: "Pilih Player Lain" & "Tutup"
player_action_nav_gantiplayer = {
	x1 : pa_btn_x, y1 : player_action_panel_y + player_action_panel_h - 100,
	x2 : pa_btn_x + pa_btn_w, y2 : player_action_panel_y + player_action_panel_h - 60
};
player_action_nav_tutup = {
	x1 : pa_btn_x, y1 : player_action_panel_y + player_action_panel_h - 50,
	x2 : pa_btn_x + pa_btn_w, y2 : player_action_panel_y + player_action_panel_h - 10
};

player_action_hover = -1; 

// ====== Panel: Jual Aneka Kebutuhan ======
kebutuhan_panel_w = 460;
kebutuhan_panel_h = 400;

kebutuhan_panel_x = (display_get_gui_width()  - kebutuhan_panel_w) / 2;
kebutuhan_panel_y = (display_get_gui_height() - kebutuhan_panel_h) / 2;

kebutuhan_row_h   = 40;
kebutuhan_row_gap = 5;
kebutuhan_hover   = -1;

// Area konten (tempat list item digambar & discroll), dibatasi antara judul & tombol Tutup
kebutuhan_content_x1 = kebutuhan_panel_x + 15;
kebutuhan_content_x2 = kebutuhan_panel_x + kebutuhan_panel_w - 15;
kebutuhan_content_y1 = kebutuhan_panel_y + 45;
kebutuhan_content_y2 = kebutuhan_panel_y + kebutuhan_panel_h - 65;

// Scroll
kebutuhan_scroll       = 0;   // offset scroll saat ini (px)
kebutuhan_scroll_speed = 35;  // px per klik wheel
kebutuhan_scroll_max   = 0;   // dihitung ulang tiap frame sesuai jumlah item

// Tombol "Tutup" di bawah panel
kebutuhan_btn_tutup = {
	x1 : kebutuhan_panel_x + 20,
	y1 : kebutuhan_panel_y + kebutuhan_panel_h - 50,
	x2 : kebutuhan_panel_x + kebutuhan_panel_w - 20,
	y2 : kebutuhan_panel_y + kebutuhan_panel_h - 15
};

// ====== Panel: Notifikasi Pinjam Syariah ======
pinjam_panel_w = 340;
pinjam_panel_h = 200;

pinjam_panel_x = (display_get_gui_width()  - pinjam_panel_w) / 2;
pinjam_panel_y = (display_get_gui_height() - pinjam_panel_h) / 2;

pinjam_btn_konfirmasi = {
	x1 : pinjam_panel_x + 20,
	y1 : pinjam_panel_y + pinjam_panel_h - 60,
	x2 : pinjam_panel_x + pinjam_panel_w/2 - 5,
	y2 : pinjam_panel_y + pinjam_panel_h - 20
};

pinjam_btn_batal = {
	x1 : pinjam_panel_x + pinjam_panel_w/2 + 5,
	y1 : pinjam_panel_y + pinjam_panel_h - 60,
	x2 : pinjam_panel_x + pinjam_panel_w - 20,
	y2 : pinjam_panel_y + pinjam_panel_h - 20
};

pinjam_hover = -1; // 0 = konfirmasi, 1 = batal

