if(!visible) exit;

	if (is_array(dialog_lines) && !global.dialog_open && dialog_index == 0 ) {
	        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);

	        if (!d.dialogue_active && dialog_index < array_length(dialog_lines)) {
	            global.dialog_open = true;
	            image_speed = 0;
	            image_index = 0;

	            d.dialogue_active = true;
	            d.dialogue_text = dialog_lines[dialog_index];
				d.portrait_sprite = index_sprite;
	            d.dialog_name = index_name;
				dialog_index++;
	        } 
	    }
	if (keyboard_check_pressed(ord("F")) || mouse_check_button_pressed(mb_left) && !global.dialog_open){
		if (is_array(dialog_lines)) {
	        var d = instance_create_layer(0, 0, "GUI", obj_dialogue);

	        if (!d.dialogue_active && dialog_index < array_length(dialog_lines)) {
	            global.dialog_open = true;
	            image_speed = 0;
	            image_index = 0;

	            d.dialogue_active = true;
	            d.dialogue_text = dialog_lines[dialog_index];
	            d.dialog_name = ""
				dialog_index++;
	        } 
	        else if (!d.dialogue_active && dialog_index >= array_length(dialog_lines)) {
	            //dialog_index = 0;
	            //global.dialog_open = false;

			
	        }
	    }
	}

