// --- Tombol titik tiga (SELALU digambar, baik panel terbuka atau tidak) ---
draw_set_color(btn_hover ? col_btn_bg_hover : col_btn_bg);
draw_roundrect_color(btn_x, btn_y, btn_x + btn_size, btn_y + btn_size, col_btn_bg, col_btn_bg, false);
draw_set_color(col_btn_border);
draw_roundrect_color(btn_x, btn_y, btn_x + btn_size, btn_y + btn_size, col_btn_border, col_btn_border, true);

var _cx = btn_x + btn_size / 2;
var _cy = btn_y + btn_size / 2;
var _dot_r = 2.5;
var _gap = 8;

draw_set_color(col_dots);
draw_circle(_cx, _cy - _gap, _dot_r, false);
draw_circle(_cx, _cy,        _dot_r, false);
draw_circle(_cx, _cy + _gap, _dot_r, false);

// --- Kalau panel belum dibuka, berhenti di sini ---
if (!panel_open) exit;
draw_set_alpha(0.6);
draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

draw_set_color(col_panel_bg);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, false);
draw_set_color(col_panel_bd);
draw_rectangle(panel_x, panel_y, panel_x + panel_w, panel_y + panel_h, true);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(close_x + close_btn_size/2, close_y + close_btn_size/2, "X");
panel_h = (menu_mode == "load") ? 400 : 320;
draw_set_color(menu_mode == "save" ? col_tab_active : col_tab_idle);
draw_rectangle(panel_x, panel_y, panel_x + tab_w, panel_y + tab_h, false);
draw_set_color(menu_mode == "load" ? col_tab_active : col_tab_idle);
draw_rectangle(panel_x + tab_w, panel_y, panel_x + panel_w, panel_y + tab_h, false);

draw_set_color(col_text);
draw_text(panel_x + tab_w/2, panel_y + tab_h/2, "SAVE");
draw_text(panel_x + tab_w + tab_w/2, panel_y + tab_h/2, "LOAD");

draw_set_halign(fa_left);
var _slot_start = (menu_mode == "load") ? 0 : 1;

for (var _i = _slot_start; _i <= save_slot_count; _i++) {
    var _sx1 = panel_x + 20;
    var _sx2 = panel_x + panel_w - 20;
    var _sy1 = slot_top + (_i - _slot_start) * (slot_h + slot_gap);
    var _sy2 = _sy1 + slot_h;
    var _has_data = save_slot_exists(_i);
	if (menu_mode == "load" && _has_data && !save_slot_matches_mode(_i)) {
	    _has_data = false; // dianggap kosong kalau beda mode
	}
    var _hover = point_in_rectangle(mouse_gui_x, mouse_gui_y, _sx1, _sy1, _sx2, _sy2);
    var _bg_col = _has_data ? (_hover ? col_slot_hover : col_slot_bg) : col_slot_empty;
    draw_set_color(_bg_col);
    draw_rectangle(_sx1, _sy1, _sx2, _sy2, false);
    draw_set_color(col_panel_bd);
    draw_rectangle(_sx1, _sy1, _sx2, _sy2, true);
    draw_set_color(col_text);
    draw_set_valign(fa_top);
    draw_text(_sx1 + 16, _sy1 + 10, (_i == 0) ? "Auto-Save" : ("Slot " + string(_i)));
    draw_set_valign(fa_bottom);
    if (_has_data) {
	    var _info = get_slot_info(_i);
	    draw_set_color(col_text_dim);
	    draw_text(_sx1 + 16, _sy2 - 10, _info.room_name + "  |  " + _info.save_date + "  |  " + _info.mode);
	} else if (save_slot_exists(_i)) {
	    // ada data tapi beda mode
	    draw_set_color(make_color_rgb(120, 80, 80));
	    draw_text(_sx1 + 16, _sy2 - 10, "Mode berbeda");
	} else {
	    draw_set_color(col_text_dim);
	    draw_text(_sx1 + 16, _sy2 - 10, "Kosong");
	}
}

if (message_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_yellow);
    draw_text(panel_x + panel_w/2, panel_y + panel_h - 20, message_text);
}

if (show_confirm) {
    var _box_w = 300;
    var _box_h = 140;
    var _box_x = panel_x + (panel_w - _box_w) / 2;
    var _box_y = panel_y + (panel_h - _box_h) / 2;

    draw_set_color(make_color_rgb(20,20,28));
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
    draw_set_color(col_panel_bd);
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);

    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var _msg = (menu_mode == "save")
        ? "Timpa data di Slot " + string(confirm_slot) + "?"
        : "Muat data dari Slot " + string(confirm_slot) + "?";
    draw_text(_box_x + _box_w/2, _box_y + 35, _msg);

    draw_set_color(make_color_rgb(60,150,80));
    draw_rectangle(_box_x + 30, _box_y + 90, _box_x + 130, _box_y + 125, false);
    draw_set_color(c_white);
    draw_text(_box_x + 80, _box_y + 107, "Ya");

    draw_set_color(make_color_rgb(150,60,60));
    draw_rectangle(_box_x + 170, _box_y + 90, _box_x + 270, _box_y + 125, false);
    draw_set_color(c_white);
    draw_text(_box_x + 220, _box_y + 107, "Batal");
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);