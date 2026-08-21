if (visible){
	if(global.uiblocking) exit;
	pemain_list = global.player;
	var jumlah_player = array_length(pemain_list);
	var jumlah_kategori = array_length(kategori_skor);

	skor = array_create(jumlah_kategori);

	for (var i = 0; i < jumlah_kategori; i++)
	{
	    skor[i] = array_create(jumlah_player, 0);
	}

	for (var p = 0; p < jumlah_player; p++)
	{
	    /// load data player p
	    var data = global.player_data[p];

	    global.inventory = data.inventory;
	    global.record = data.record;
	    global.Uang = data.uang;
	    global.tabungan = data.tabungan;

	    var poin = array_create(jumlah_kategori);

	    poin[0] = aneka_kebutuhan();
	    poin[1] = set_kebutuhan();
	    poin[2] = cek_misi();
	    poin[3] = juara_peduli();
	    poin[4] = juara_pensiun();
	    poin[5] = tujuan_finansial();
		if(global.mode == "mahir"){
		    poin[6] = pinjaman();
		    poin[7] = emas();
		}else if(global.mode == "pemula"){
			poin[6] = "-"
		    poin[7] = "-"
		}
	    var total = 0;
		if(global.mode == "mahir"){
		    for (var i = 0; i < 8; i++)
		        total += poin[i];
		}else if(global.mode == "pemula"){
			for (var i = 0; i < 6; i++)
		        total += poin[i];
		}
	    poin[8] = total;
	    /// simpan ke tabel skor
	    for (var i = 0; i < jumlah_kategori; i++)
	    {
	        skor[i][p] = poin[i];
	    }
	}
	//log rekap
	var logs = global.match_logs;

	var players = [];

	for (var j = 0; j < array_length(nama); j++)
	{
	    var ingredients_collected = 0;
	    var donation_total_coins = 0;
	    var life_risk_costs_total = 0;
		var meal_orders_claimed = 0;
	    var last_state = undefined;

	    // =====================
	    // LOOP LOG
	    // =====================

	    for (var i = 0; i < array_length(logs); i++)
	    {
	        var log = logs[i];

	        if (log.current_player == nama[j])
	        {
	            var inv = log.player_state.inventory;
	            var rec = log.player_state.record;

	            ingredients_collected +=
	                inv[$ "Nasi"] +
	                inv[$ "Sayur"] +
	                inv[$ "Tahu"] +
	                inv[$ "Telur"] +
	                inv[$ "Daging"];

	            donation_total_coins +=
	                rec[$ "total donasi"];

	            life_risk_costs_total +=
	                rec[$ "kartu merah"] +
	                rec[$ "kartu kuning"] +
	                rec[$ "kartu pink"] +
	                rec[$ "kartu hijau"];
				
				meal_orders_claimed += array_length(log.player_state.baked_goods);

	            // state terakhir
	            last_state = log.player_state;
	        }
	    }

	    // skip kalau kosong
	    if (is_undefined(last_state))
	        continue;

	    var inv = last_state.inventory;
	    var rec = last_state.record;

	    // =====================
	    // FINAL SUMMARY
	    // =====================

	    var final_summary = {

	        "player_name": nama[j],

	        "coins_net_end_game":
	            last_state.uang,

	        "ingredients_collected":
	            ingredients_collected,
				
			"meal_orders_claimed":
				meal_orders_claimed,
				
	        "primary_needs_owned":
	            rec[$ "Sepatu"] +
	            rec[$ "Tepak makan siang"] +
	            rec[$ "Buku"] +
	            rec[$ "Baju"],

	        "secondary_needs_owned":
	            rec[$ "Sepeda"] +
	            rec[$ "Tepak pensil"] +
	            rec[$ "Tablet"] +
	            rec[$ "Ransel"],

	        "tertiary_needs_owned":
	            rec[$ "Jam tangan"] +
	            rec[$ "Komedi putar"] +
	            rec[$ "Game PSP"] +
	            rec[$ "Boneka"],

	        "donation_total_coins":
	            donation_total_coins,

	        "pension_fund_total":
	            last_state.uang +
	            last_state.tabungan +

	            inv[$ "Nasi"] +
	            inv[$ "Sayur"] +
	            inv[$ "Tahu"] +
	            inv[$ "Telur"] +
	            inv[$ "Daging"],

	        "life_risk_costs_total":
	            life_risk_costs_total,

	        "financial_goals_completed":
	            rec[$ "Travelling"] +
	            rec[$ "Rumah"] +
	            rec[$ "Tv dan sofa"] +
	            rec[$ "Kebun"] +
	            rec[$ "Mobil"],
			"total_score": skor[8][j]
	    };

	    array_push(players, final_summary);
	}


	// =====================
	// JSON FINAL
	// =====================

	var export_data = {
	    "mode": global.mode,
	    "players": players
	};


	// =====================
	// WRITE
	// =====================

	var json = json_stringify(export_data, true);

	var file = file_text_open_write(program_directory + "final_summary.json");
	file_text_write_string(file, json);
	file_text_close(file);
}

