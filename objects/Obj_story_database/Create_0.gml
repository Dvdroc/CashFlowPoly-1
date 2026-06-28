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
	        // ubah string sprite jadi asset index
	        dialog_array[j][1] = asset_get_index(dialog_array[j][1]);
	    }

	    global.story[$ story_id] = dialog_array;
	}
}