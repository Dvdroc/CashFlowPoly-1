// ====== Panel Input Nama Pemain & Kelompok ======
panel_w = 420;
panel_h = 420;

panel_x = (display_get_gui_width()  - panel_w) / 2;
panel_y = (display_get_gui_height() - panel_h) / 2;

// --- Data nama pemain (default sesuai global.player yang lama) ---
nama_pemain = ["Pemain 1", "Pemain 2", "Pemain 3", "Pemain 4"];
nama_kelompok = "";

field_h   = 40;
field_gap = 15;
field_margin = 20;

// --- Precompute posisi tiap field input (nama pemain + nama kelompok) ---
field_rect = [];

var fw = panel_w - (field_margin * 2);
var fx = panel_x + field_margin;

for (var i = 0; i < array_length(nama_pemain); i++){
	var fy = panel_y + 60 + i * (field_h + field_gap);

	array_push(field_rect, {
		x1 : fx, y1 : fy,
		x2 : fx + fw, y2 : fy + field_h
	});
}

// Field nama kelompok, diletakkan di bawah 4 field nama pemain
var kelompok_y = panel_y + 60 + array_length(nama_pemain) * (field_h + field_gap) + 15;

field_kelompok_rect = {
	x1 : fx, y1 : kelompok_y,
	x2 : fx + fw, y2 : kelompok_y + field_h
};

// --- State fokus input ---
// -1 = tidak ada yang fokus, 0..3 = index nama_pemain, 4 = nama_kelompok
active_field = -1;

// --- Tombol Mulai ---
btn_mulai = {
	x1 : panel_x + field_margin,
	y1 : kelompok_y + field_h + 30,
	x2 : panel_x + panel_w - field_margin,
	y2 : kelompok_y + field_h + 30 + 45
};

btn_mulai_hover = false;
global.nama_selesai = false;