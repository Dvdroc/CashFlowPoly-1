
	if (is_array(dialogue) && !global.dialog_open && dialog_index == 0 ) {
	        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);
			
	        if (!d.dialogue_active && dialog_index < array_length(dialogue)) {
	            global.dialog_open = true;
				d.dialogue_active = true;
	            var current = dialogue[dialog_index];
				d.dialog_name = current[0];
				if(current[2] == "left"){
					d.portrait_left = current[1];
				}else{
					d.portrait_right = current[1];
				}
				d.speaker_side = current[2];
				d.dialogue_text = current[3];
				dialog_index++;
	        }
	    }
	if (keyboard_check_pressed(ord("F")) || mouse_check_button_pressed(mb_left) && !global.dialog_open){
		if (is_array(dialogue)) {
			var d = instance_create_layer(0, 0, "GUI", obj_dialogue);
			
	        if (!d.dialogue_active && dialog_index < array_length(dialogue)) {
	            global.dialog_open = true;
				d.dialogue_active = true;
	            var current = dialogue[dialog_index];
				d.dialog_name = current[0];
				if(current[2] == "left"){
					d.portrait_left = current[1];
				}else{
					d.portrait_right = current[1];
				}
				d.speaker_side = current[2];
				d.dialogue_text = current[3];
				dialog_index++;
	        }else if (!d.dialogue_active && dialog_index >= array_length(dialogue)) {
		            dialog_index = 0;
		            global.dialog_open = false;
					global.tampilan = global.tampilan_sebelumnya
					room_restart()
				}
		}
	}

