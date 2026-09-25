if (!variable_global_exists("story"))
{
    // buka file
    var file = file_text_open_read("Story.json");

    var json_text = "";

    // baca semua isi file
    while (!file_text_eof(file))
    {
        json_text += file_text_readln(file);
    }

    file_text_close(file);

    // ubah JSON jadi ds_map/array
    global.story = json_parse(json_text);
	var keys = variable_struct_get_names(global.story);

	for (var i = 0; i < array_length(keys); i++)
	{
	    var story_id = keys[i];

	    var dialog_array = global.story[$ story_id];

	    // loop semua dialog
	    for (var j = 0; j < array_length(dialog_array); j++)
	    {
			
			// ubah nama karakter jadi nama pemain asli
            if (dialog_array[j][0] == "Alisa")
            {
                dialog_array[j][0] = global.player[0];
            }
            else if (dialog_array[j][0] == "Rechard")
            {
                dialog_array[j][0] = global.player[1];
            }
            else if (dialog_array[j][0] == "Reno")
            {
                dialog_array[j][0] = global.player[2];
            }
            else if (dialog_array[j][0] == "Siti")
            {
                dialog_array[j][0] = global.player[3];
            }
	        // ubah string sprite jadi asset index
	        dialog_array[j][1] = asset_get_index(dialog_array[j][1]);
			// Background
            dialog_array[j][4] = asset_get_index(dialog_array[j][4]);
	    }

	    global.story[$ story_id] = dialog_array;
	}
}