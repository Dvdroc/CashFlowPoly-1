// --- State: apakah panel besar sedang terbuka ---
panel_open = false;

// --- Konfigurasi save ---
save_slot_count = 3;


// --- State UI panel ---
menu_mode      = "save";
selected_slot  = -1;
show_confirm   = false;
confirm_slot   = -1;
message_text   = "";
message_timer  = 0;

mouse_gui_x = 0;
mouse_gui_y = 0;

// --- Tombol titik tiga (selalu tampil, kanan atas) ---
btn_size = 40;
btn_x = display_get_gui_width() - btn_size - 16;
btn_y = 16;
btn_hover = false;

// --- Layout panel besar ---
panel_w   = 480;
panel_h   = 380;
panel_x   = (display_get_gui_width()  - panel_w) / 2;
panel_y   = (display_get_gui_height() - panel_h) / 2;

tab_w = panel_w / 3;
tab_h = 48;

slot_h    = 72;
slot_gap  = 10;
slot_top  = panel_y + tab_h + 20;

close_btn_size = 32;
close_x = panel_x + panel_w - close_btn_size - 10;
close_y = panel_y + 10;

// --- Warna ---
col_panel_bg   = make_color_rgb(30, 30, 40);
col_panel_bd   = make_color_rgb(80, 80, 100);
col_tab_active = make_color_rgb(70, 110, 200);
col_tab_idle   = make_color_rgb(50, 50, 65);
col_slot_bg    = make_color_rgb(45, 45, 60);
col_slot_hover = make_color_rgb(65, 65, 90);
col_slot_empty = make_color_rgb(38, 38, 50);
col_text       = c_white;
col_text_dim   = make_color_rgb(160, 160, 175);

col_btn_bg       = make_color_rgb(35, 35, 48);
col_btn_bg_hover = make_color_rgb(55, 55, 75);
col_btn_border   = make_color_rgb(90, 90, 115);
col_dots         = c_white;

function save_slot_matches_mode(_slot) {
    var _info = get_slot_info(_slot);
    if (is_undefined(_info)) return false;
    if (!variable_struct_exists(_info, "mode")) return false; // save lama tanpa data mode
    return (_info.mode == global.mode);
}
function save_slot_exists(_slot) {
    var _path = working_directory + "save/" + "slot" + string(_slot) + ".sav";
    return file_exists(_path);
}

function get_slot_info(_slot) {
    var _path = working_directory + "save/" + "slot" + string(_slot) + ".sav";
    if (!file_exists(_path)) return undefined;
    var _file = file_text_open_read(_path);
    var _json = "";
    while (!file_text_eof(_file)) {
        _json += file_text_readln(_file);
    }
    file_text_close(_file);
    try {
        return json_parse(_json);
    } catch (_e) {
        return undefined;
    }
}


function delete_save_slot(_slot) {
    var _path = working_directory + "save/" + "slot" + string(_slot) + ".sav";
    if (file_exists(_path)) {
        file_delete(_path);
        show_message_popup("Slot " + string(_slot) + " dihapus");
    }
}

function show_message_popup(_text) {
    message_text  = _text;
    message_timer = room_speed * 2;
}