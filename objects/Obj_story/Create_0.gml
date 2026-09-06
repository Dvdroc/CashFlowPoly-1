dialogue = noone
instance_create_layer(0, 0, "GUI", Obj_story_database);
	asset = ["Alisa", "Rechard", "Reno", "Siti"]
	index_sprite = asset_get_index(asset[global.current_player]);
	nama = global.player
	index_name = nama[global.current_player]
	
	
// =========================
// READ TRIGGER.JSON
// =========================

var file_trigger = file_text_open_read("Trigger.json");

var trigger_text = "";

while (!file_text_eof(file_trigger))
{
    trigger_text += file_text_readln(file_trigger);
}

file_text_close(file_trigger);

global.trigger = json_parse(trigger_text);
// =========================
// CHECK ALL TRIGGER
// =========================

var trigger_names = variable_struct_get_names(global.trigger);

for (var i = 0; i < array_length(trigger_names); i++)
{
    var story_id = trigger_names[i];

    var trig = global.trigger[$ story_id];

    var valid = true;


    // =========================
    // UANG
    // =========================

    if (variable_struct_exists(trig, "uang_min"))
    {
        valid = valid && (global.Uang >= trig.uang_min);
    }

    if (variable_struct_exists(trig, "uang_max"))
    {
        valid = valid && (global.Uang <= trig.uang_max);
    }


    // =========================
    // EMAS
    // =========================

    if (variable_struct_exists(trig, "emas_min"))
    {
        valid = valid && (global.inventory[? "Emas"] >= trig.emas_min);
    }

    if (variable_struct_exists(trig, "emas_max"))
    {
        valid = valid && (global.inventory[? "Emas"] <= trig.emas_max);
    }
	
	// =========================
    // PINJAMAN
    // =========================

    if (variable_struct_exists(trig, "pinjaman_min"))
    {
        valid = valid && (global.inventory[? "Pinjaman"] >= trig.pinjaman_min);
    }

    if (variable_struct_exists(trig, "pinjaman_max"))
    {
        valid = valid && (global.inventory[? "Pinjaman"] <= trig.pinjaman_max);
    }
	  
	// =========================
	// TERSIER
	// =========================
	
	
	if (variable_struct_exists(trig, "sepatu_min"))
	{
	    valid = valid && (global.record[? "Sepatu"] >= trig.sepatu_min);
		
	}

	if (variable_struct_exists(trig, "sepatu_max"))
	{
	    valid = valid && (global.record[? "Sepatu"] <= trig.sepatu_max);
	}

	if (variable_struct_exists(trig, "tepak_makan_siang_min"))
	{
	    valid = valid && (global.record[? "Tepak makan siang"] >= trig.tepak_makan_siang_min);
	}

	if (variable_struct_exists(trig, "tepak_makan_siang_max"))
	{
	    valid = valid && (global.record[? "Tepak makan siang"] <= trig.tepak_makan_siang_max);
	}

	if (variable_struct_exists(trig, "buku_min"))
	{
	    valid = valid && (global.record[? "Buku"] >= trig.buku_min);
	}

	if (variable_struct_exists(trig, "buku_max"))
	{
	    valid = valid && (global.record[? "Buku"] <= trig.buku_max);
	}

	if (variable_struct_exists(trig, "baju_min"))
	{
	    valid = valid && (global.record[? "Baju"] >= trig.baju_min);
	}

	if (variable_struct_exists(trig, "baju_max"))
	{
	    valid = valid && (global.record[? "Baju"] <= trig.baju_max);
	}
	
	
	// =========================
	// KERJA LEPAS
	// =========================
	
	if (variable_struct_exists(trig, "kerja_min"))
    {
        valid = valid && (global.inventory[? "Kerja lepas"] >= trig.kerja_min);
    }

    if (variable_struct_exists(trig, "kerja_max"))
    {
        valid = valid && (global.inventory[? "Kerja lepas"] <= trig.kerja_max);
    }
	
	// =========================
	// PREMIER
	// =========================

	if (variable_struct_exists(trig, "jam_tangan_min"))
	{
	    valid = valid && (global.record[? "Jam tangan"] >= trig.jam_tangan_min);
	}

	if (variable_struct_exists(trig, "jam_tangan_max"))
	{
	    valid = valid && (global.record[? "Jam tangan"] <= trig.jam_tangan_max);
	}

	if (variable_struct_exists(trig, "komedi_putar_min"))
	{
	    valid = valid && (global.record[? "Komedi putar"] >= trig.komedi_putar_min);
	}

	if (variable_struct_exists(trig, "komedi_putar_max"))
	{
	    valid = valid && (global.record[? "Komedi putar"] <= trig.komedi_putar_max);
	}

	if (variable_struct_exists(trig, "game_psp_min"))
	{
	    valid = valid && (global.record[? "Game PSP"] >= trig.game_psp_min);
	}

	if (variable_struct_exists(trig, "game_psp_max"))
	{
	    valid = valid && (global.record[? "Game PSP"] <= trig.game_psp_max);
	}

	if (variable_struct_exists(trig, "boneka_min"))
	{
	    valid = valid && (global.record[? "Boneka"] >= trig.boneka_min);
	}

	if (variable_struct_exists(trig, "boneka_max"))
	{
	    valid = valid && (global.record[? "Boneka"] <= trig.boneka_max);
	}
	
	// =========================
	// SEKUNDER
	// =========================

	if (variable_struct_exists(trig, "sepeda_min"))
	{
	    valid = valid && (global.record[? "Sepeda"] >= trig.sepeda_min);
	}

	if (variable_struct_exists(trig, "sepeda_max"))
	{
	    valid = valid && (global.record[? "Sepeda"] <= trig.sepeda_max);
	}

	if (variable_struct_exists(trig, "tepak_pensil_min"))
	{
	    valid = valid && (global.record[? "Tepak pensil"] >= trig.tepak_pensil_min);
	}

	if (variable_struct_exists(trig, "tepak_pensil_max"))
	{
	    valid = valid && (global.record[? "Tepak pensil"] <= trig.tepak_pensil_max);
	}

	if (variable_struct_exists(trig, "tablet_min"))
	{
	    valid = valid && (global.record[? "Tablet"] >= trig.tablet_min);
	}

	if (variable_struct_exists(trig, "tablet_max"))
	{
	    valid = valid && (global.record[? "Tablet"] <= trig.tablet_max);
	}

	if (variable_struct_exists(trig, "ransel_min"))
	{
	    valid = valid && (global.record[? "Ransel"] >= trig.ransel_min);
	}

	if (variable_struct_exists(trig, "ransel_max"))
	{
	    valid = valid && (global.record[? "Ransel"] <= trig.ransel_max);
	}
	
	// =========================
	// FINANSIAL
	// =========================

	if (variable_struct_exists(trig, "travelling_min"))
	{
	    valid = valid && (global.record[? "Travelling"] >= trig.travelling_min);
	}

	if (variable_struct_exists(trig, "travelling_max"))
	{
	    valid = valid && (global.record[? "Travelling"] <= trig.travelling_max);
	}

	if (variable_struct_exists(trig, "rumah_min"))
	{
	    valid = valid && (global.record[? "Rumah"] >= trig.rumah_min);
	}

	if (variable_struct_exists(trig, "rumah_max"))
	{
	    valid = valid && (global.record[? "Rumah"] <= trig.rumah_max);
	}

	if (variable_struct_exists(trig, "tv_dan_sofa_min"))
	{
	    valid = valid && (global.record[? "Tv dan sofa"] >= trig.tv_dan_sofa_min);
	}

	if (variable_struct_exists(trig, "tv_dan_sofa_max"))
	{
	    valid = valid && (global.record[? "Tv dan sofa"] <= trig.tv_dan_sofa_max);
	}

	if (variable_struct_exists(trig, "kebun_min"))
	{
	    valid = valid && (global.record[? "Kebun"] >= trig.kebun_min);
	}

	if (variable_struct_exists(trig, "kebun_max"))
	{
	    valid = valid && (global.record[? "Kebun"] <= trig.kebun_max);
	}

	if (variable_struct_exists(trig, "mobil_min"))
	{
	    valid = valid && (global.record[? "Mobil"] >= trig.mobil_min);
	}

	if (variable_struct_exists(trig, "mobil_max"))
	{
	    valid = valid && (global.record[? "Mobil"] <= trig.mobil_max);
	}
	
	// =========================
	// DONASI
	// =========================

	if (variable_struct_exists(trig, "donasi_juara_1_min"))
	{
	    valid = valid && (global.record[? "donasi juara 1"] >= trig.donasi_juara_1_min);
	}

	if (variable_struct_exists(trig, "donasi_juara_1_max"))
	{
	    valid = valid && (global.record[? "donasi juara 1"] <= trig.donasi_juara_1_max);
	}

	if (variable_struct_exists(trig, "donasi_juara_2_min"))
	{
	    valid = valid && (global.record[? "donasi juara 2"] >= trig.donasi_juara_2_min);
	}

	if (variable_struct_exists(trig, "donasi_juara_2_max"))
	{
	    valid = valid && (global.record[? "donasi juara 2"] <= trig.donasi_juara_2_max);
	}

	if (variable_struct_exists(trig, "donasi_juara_3_min"))
	{
	    valid = valid && (global.record[? "donasi juara 3"] >= trig.donasi_juara_3_min);
	}

	if (variable_struct_exists(trig, "donasi_juara_3_max"))
	{
	    valid = valid && (global.record[? "donasi juara 3"] <= trig.donasi_juara_3_max);
	}
	
	
	// =========================
	// PENSIUN
	// =========================

	if (variable_struct_exists(trig, "pensiun_juara_1_min"))
	{
	    valid = valid && (global.record[? "pensiun juara 1"] >= trig.pensiun_juara_1_min);
	}

	if (variable_struct_exists(trig, "pensiun_juara_1_max"))
	{
	    valid = valid && (global.record[? "pensiun juara 1"] <= trig.pensiun_juara_1_max);
	}

	if (variable_struct_exists(trig, "pensiun_juara_2_min"))
	{
	    valid = valid && (global.record[? "pensiun juara 2"] >= trig.pensiun_juara_2_min);
	}

	if (variable_struct_exists(trig, "pensiun_juara_2_max"))
	{
	    valid = valid && (global.record[? "pensiun juara 2"] <= trig.pensiun_juara_2_max);
	}

	if (variable_struct_exists(trig, "pensiun_juara_3_min"))
	{
	    valid = valid && (global.record[? "pensiun juara 3"] >= trig.pensiun_juara_3_min);
	}

	if (variable_struct_exists(trig, "pensiun_juara_3_max"))
	{
	    valid = valid && (global.record[? "pensiun juara 3"] <= trig.pensiun_juara_3_max);
	}
	
	// =========================
	// KEBUTUHAN POKOK
	// =========================

	if (variable_struct_exists(trig, "nasi_min"))
	{
	    valid = valid && (global.inventory[? "Nasi"] >= trig.nasi_min);
	}

	if (variable_struct_exists(trig, "nasi_max"))
	{
	    valid = valid && (global.inventory[? "Nasi"] <= trig.nasi_max);
	}

	if (variable_struct_exists(trig, "sayur_min"))
	{
	    valid = valid && (global.inventory[? "Sayur"] >= trig.sayur_min);
	}

	if (variable_struct_exists(trig, "sayur_max"))
	{
	    valid = valid && (global.inventory[? "Sayur"] <= trig.sayur_max);
	}

	if (variable_struct_exists(trig, "tahu_min"))
	{
	    valid = valid && (global.inventory[? "Tahu"] >= trig.tahu_min);
	}

	if (variable_struct_exists(trig, "tahu_max"))
	{
	    valid = valid && (global.inventory[? "Tahu"] <= trig.tahu_max);
	}

	if (variable_struct_exists(trig, "telur_min"))
	{
	    valid = valid && (global.inventory[? "Telur"] >= trig.telur_min);
	}

	if (variable_struct_exists(trig, "telur_max"))
	{
	    valid = valid && (global.inventory[? "Telur"] <= trig.telur_max);
	}

	if (variable_struct_exists(trig, "daging_min"))
	{
	    valid = valid && (global.inventory[? "Daging"] >= trig.daging_min);
	}

	if (variable_struct_exists(trig, "daging_max"))
	{
	    valid = valid && (global.inventory[? "Daging"] <= trig.daging_max);
	}
	
	// =========================
	// MAKANAN YANG TERJUAL
	// =========================
	
	if (variable_struct_exists(trig, "makanan_terjual_min"))
	{
	    valid = valid && (array_length(global.baked_goods) >= trig.makanan_terjual_min);
	}

	if (variable_struct_exists(trig, "makanan_terjual_max"))
	{
	    valid = valid && (array_length(global.baked_goods) <= trig.makanan_terjual_max);
	}


    // =========================
    // PLAYER
    // =========================

    if (variable_struct_exists(trig, "player"))
    {
        valid = valid && (global.current_player == trig.player);
    }
	
	if (variable_struct_exists(trig, "hari_min"))
    {
        valid = valid && (global.tanggal >= trig.hari_min);
    }
	
	if (variable_struct_exists(trig, "hari_max"))
    {
        valid = valid && (global.tanggal <= trig.hari_max);
    }


    // =========================
    // PLAY STORY
    // =========================
	if (valid && global.misi_T !=-1)
	{
		if (variable_struct_exists(global.story, story_id))
		{
			dialogue = global.story[$ story_id];
			
			dialog_index = 0;
			global.tampilan_sebelumnya = global.tampilan;
			
			global.tampilan = 5;
			variable_struct_remove(global.story, story_id);
			
			break;
		}
	}
}

dialog_index = 0;