ui_x = 200;
ui_y = 150;

pemain_list = global.player;

juara = [-1,-1,-1,-1];
var panel_w = 200;
var spacing = 20;
var total_w = (panel_w * array_length(pemain_list)) + (spacing * (array_length(pemain_list)-1));

ui_x = (display_get_gui_width() - total_w) / 2;
ui_y = (display_get_gui_height() - 260) / 2;
donasi = array_create(array_length(pemain_list), -1);

input_player = -1;
input_text = "";
input_active = false;