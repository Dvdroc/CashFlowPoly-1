if (global.tampilan == 0) {
    Obj_UI.visible = true;
    Obj_ResikoUI.visible = false;
	Obj_InvestasiUI.visible = false;
	Obj_donasiUI.visible = false;
	Obj_prolog.visible = true;
	Obj_rekap.visible = false;
	Obj_story.visible = false;
}
if (global.tampilan == 1) {
    Obj_UI.visible = false;
    Obj_ResikoUI.visible = true;
	Obj_InvestasiUI.visible = false;
	Obj_donasiUI.visible = false;
	Obj_prolog.visible = false;
	Obj_rekap.visible = false;
	Obj_story.visible = false;
}
if (global.tampilan == 2){
	Obj_UI.visible = false;
	Obj_ResikoUI.visible = false;
	Obj_InvestasiUI.visible = true;
	Obj_donasiUI.visible = false;
	Obj_prolog.visible = false;
	Obj_rekap.visible = false;
	Obj_story.visible = false;
}
if (global.tampilan == 3){
	Obj_UI.visible = false;
	Obj_ResikoUI.visible = false;
	Obj_InvestasiUI.visible = false;
	Obj_donasiUI.visible = true;
	Obj_prolog.visible = false;
	Obj_rekap.visible = false;
	Obj_story.visible = false;
}
if (global.tampilan == 4){
	Obj_UI.visible = false;
	Obj_ResikoUI.visible = false;
	Obj_InvestasiUI.visible = false;
	Obj_donasiUI.visible = false;
	Obj_prolog.visible = false;
	Obj_rekap.visible = true;
	Obj_story.visible = false;
}
if (global.tampilan == 5) {
    Obj_UI.visible = false;
    Obj_ResikoUI.visible = false;
	Obj_InvestasiUI.visible = false;
	Obj_donasiUI.visible = false;
	Obj_prolog.visible = false;
	Obj_rekap.visible = false;
	Obj_story.visible = true;
}
if(global.tanggal > 25){
	if(global.rekap == false){
		global.tampilan = 3
	}else global.tampilan = 4;
}
for (var i = 0; i < array_length(global.bahan_baku); i++){
    var base = global.bahan_baku[i].harga_dasar;
	
	
	for(var j = 0; j < array_length(global.resiko_aktif); j++){
		
	    if(global.resiko_aktif[j].sisa_hari > 0){
			var efek = global.resiko_aktif[j].biaya
	        global.bahan_baku[i].harga = base + efek;
			
	    }
	    else{
	        global.bahan_baku[i].harga = base;
	    }
	}
}
if (keyboard_check_pressed(ord("Q"))){
	global.testing = !global.testing
}

if (tampilkan_misi)
{
	if(global.uiblocking) exit;
	if(global.misi_T != -1) tampilkan_misi = false
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);

	var box_w = 200;
	var box_h = 30;
	var jarak = 40;
	var total_item = 4;

	x = display_get_gui_width()/2 - box_w/2;
	y = display_get_gui_height()/2 - (total_item * jarak)/2;

	if (mouse_check_button_pressed(mb_left))
	{
	    for (var i = 0; i < total_item; i++)
	    {
			var yy = y + i * jarak;

	        if point_in_rectangle(mx, my, x, yy, x + box_w, yy + box_h)
	        {
	            global.misi_T = i;
				if(global.current_player == 3 ) global.tampilan = 0;
				scr_next_player()
				room_restart();
	        }
	    }
	}
}
