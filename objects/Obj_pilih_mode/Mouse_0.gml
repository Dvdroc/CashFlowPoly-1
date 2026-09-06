if (!global.nama_selesai) exit;
if (!instance_exists(obj_mugshot)){
	if (image_index == 0)
		global.mode = "pemula";
	else if (image_index == 1)
		global.mode = "mahir";
	

	instance_create_depth(0, 0, 0, Obj_flash);
	var mue = instance_create_depth(-1000, room_height/2, 0, obj_mugshot);
	mue.image_index = image_index;
}