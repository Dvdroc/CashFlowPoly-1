function scr_get_misi_aktif(player_index)
{
	var player_key = string(player_index);

	if (!variable_struct_exists(global.quest_chain, player_key))
	{
		return noone; // pemain ini gak punya rantai quest
	}

	var chain = global.quest_chain[$ player_key];

	for (var i = 0; i < array_length(chain); i++)
	{
		var quest_entry = chain[i];
		var story_id    = quest_entry.id;

		// Quest ini masih ada di global.story -> berarti INI quest yang aktif sekarang
		if (variable_struct_exists(global.story, story_id))
		{
			return {
				nama       : quest_entry.nama,
				story_id   : story_id,
				index_ke   : i + 1,               // quest ke berapa (1-based, buat ditampilin)
				total      : array_length(chain)  // total quest pemain ini
			};
		}
	}

	// Semua quest di chain sudah selesai
	return {
		nama     : "Semua misi selesai!",
		story_id : "",
		index_ke : array_length(chain),
		total    : array_length(chain)
	};
}