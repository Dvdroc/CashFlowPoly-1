/// @description Inisialisasi Sistem Crafting

if (!variable_global_exists("recipes")) {
	
	/// PLAYER SYSTEM

	global.player = ["Pemain 1","Pemain 2","Pemain 3","Pemain 4"];
	global.current_player = 0;
	global.match_logs = array_create(0);
	var pcount = array_length(global.player);

	global.player_data = array_create(pcount);

	for (var i = 0; i < pcount; i++)
	{
	    var inv = ds_map_create();

	    ds_map_add(inv, "Nasi", 0);
	    ds_map_add(inv, "Sayur", 0);
	    ds_map_add(inv, "Tahu", 0);
	    ds_map_add(inv, "Telur", 0);
	    ds_map_add(inv, "Daging", 0);
		if(global.mode == "mahir"){
			ds_map_add(inv, "Emas", 1);
			ds_map_add(inv, "Pinjaman", 1);
		}

	    var rec = ds_map_create();

	    ds_map_add(rec, "Sepatu", 0);
		ds_map_add(rec, "Tepak makan siang", 0);
		ds_map_add(rec, "Buku", 0);
		ds_map_add(rec, "Baju", 0);

		/// premier
		ds_map_add(rec, "Jam tangan", 0);
		ds_map_add(rec, "Komedi putar", 0);
		ds_map_add(rec, "Game PSP", 0);
		ds_map_add(rec, "Boneka", 0);

		/// sekunder
		ds_map_add(rec, "Sepeda", 0);
		ds_map_add(rec, "Tepak pensil", 0);
		ds_map_add(rec, "Tablet", 0);
		ds_map_add(rec, "Ransel", 0);

		/// finansial
		ds_map_add(rec, "Travelling", 0);
		ds_map_add(rec, "Rumah", 0);
		ds_map_add(rec, "Tv dan sofa", 0);
		ds_map_add(rec, "Kebun", 0);
		ds_map_add(rec, "Mobil", 0);
		
		//kerja lepas
		ds_map_add(rec, "Kerja lepas", 0);

		// donasi
		ds_map_add(rec, "donasi juara 1", 0);
		ds_map_add(rec, "donasi juara 2", 0);
		ds_map_add(rec, "donasi juara 3", 0);
		ds_map_add(rec, "total donasi", 0);

		// pensiun
		ds_map_add(rec, "pensiun juara 1", 0);
		ds_map_add(rec, "pensiun juara 2", 0);
		ds_map_add(rec, "pensiun juara 3", 0);
		
		//kartu resiko
		ds_map_add(rec, "kartu hijau", 0);
		ds_map_add(rec, "kartu kuning", 0);
		ds_map_add(rec, "kartu merah", 0);
		ds_map_add(rec, "kartu pink", 0);
	
		var asur = array_create(0);

		if (global.mode == "mahir") {
		    array_push(asur, {name: "beli asuransi", harga: 1, kondisi: true});
		}

	    global.player_data[i] =
	    {
	        uang : 20,
	        tabungan : 0,
	        misi_T : -1,
	        inventory : inv,
	        record : rec,
	        baked_goods : array_create(0),
			asuransi : asur
	    };
	}
    // === A. Daftar Resep (Hanya untuk referensi) ===
    // Struktur: name, required (array bahan), count (jumlah yang dihasilkan)
    global.recipes = array_create(0);
	global.tampilan_sebelumnya = 0
	global.player_sebelumnya = 0
	//2 bahan
	array_push(global.recipes,{
		name: "Nasi goreng",
		required: [
			{bahan: "Telur", jumlah: 1},
			{bahan: "Nasi", jumlah: 1}
		],
		count: 1,
		harga: 15
	});
	
	array_push(global.recipes,{
		name: "Soto daging",
		required: [
			{bahan: "Daging", jumlah: 1},
			{bahan: "Telur", jumlah: 1}
		],
		count: 1,
		harga: 17
	});
	
	array_push(global.recipes,{
		name: "Tahu campur",
		required: [
			{bahan: "Daging", jumlah: 1},
			{bahan: "Tahu", jumlah: 1}
		],
		count: 1,
		harga: 16
	});
	
	array_push(global.recipes,{
		name: "Semanggi Suroboyo",
		required: [
			{bahan: "Sayur", jumlah: 2}
		],
		count: 1,
		harga: 14
	});
	
	array_push(global.recipes,{
		name: "Lontong balap",
		required: [
			{bahan: "Sayur", jumlah: 1},
			{bahan: "Nasi", jumlah: 1}
		],
		count: 1,
		harga: 15
	});
	
	//3 bahan
	array_push(global.recipes,{
		name: "Sego penyet",
		required: [
			{bahan: "Telur", jumlah: 1}, 
			{bahan: "Tahu", jumlah: 1},               
			{bahan: "Nasi", jumlah: 1}                        
		],
		count: 1,
		harga: 22
	});
	
	array_push(global.recipes,{
		name: "Nasi pecel",
		required: [
			{bahan: "Tahu", jumlah: 1}, 
			{bahan: "Sayur", jumlah: 1},               
			{bahan: "Nasi", jumlah: 1}                        
		],
		count: 1,
		harga: 20
	});
	
	array_push(global.recipes,{
		name: "Sate Klopo",
		required: [
			{bahan: "Daging", jumlah: 2},                
			{bahan: "Nasi", jumlah: 1}                        
		],
		count: 1,
		harga: 26
	});
	
	array_push(global.recipes,{
		name: "Tahu telor",
		required: [
			{bahan: "Telur", jumlah: 2},                
			{bahan: "Tahu", jumlah: 1}                        
		],
		count: 1,
		harga: 25
	});
	
	array_push(global.recipes,{
		name: "Rawon",
		required: [
			{bahan: "Daging", jumlah: 1}, 
			{bahan: "Telur", jumlah: 1},               
			{bahan: "Tahu", jumlah: 1}                        
		],
		count: 1,
		harga: 24
	});
	
	//4 bahan
	array_push(global.recipes,{
		name: "Rujak cingur",
		required: [
			{bahan: "Daging", jumlah: 1}, 
			{bahan: "Tahu", jumlah: 1},               
			{bahan: "Sayur", jumlah: 1},                      
			{bahan: "Nasi", jumlah: 1},                
		],
		count: 1,
		harga: 28
	});
	
	array_push(global.recipes,{
		name: "Gado gado",
		required: [
			{bahan: "Telur", jumlah: 1}, 
			{bahan: "Tahu", jumlah: 1},               
			{bahan: "Sayur", jumlah: 1},                      
			{bahan: "Nasi", jumlah: 1},                
		],
		count: 1,
		harga: 26
	});
	
	array_push(global.recipes,{
		name: "Nasi campur",
		required: [
			{bahan: "Daging", jumlah: 1}, 
			{bahan: "Telur", jumlah: 1},               
			{bahan: "Sayur", jumlah: 1},                      
			{bahan: "Nasi", jumlah: 1},                
		],
		count: 1,
		harga: 28
	});
	
    global.inventory = ds_map_create();

	ds_map_add(global.inventory, "Nasi", 0);
    ds_map_add(global.inventory, "Sayur", 0);
    ds_map_add(global.inventory, "Tahu", 0);
    ds_map_add(global.inventory, "Telur", 0);
    ds_map_add(global.inventory, "Daging", 0);
	if(global.mode == "mahir"){
		ds_map_add(global.inventory, "Emas", 1);
		ds_map_add(global.inventory, "Pinjaman", 1);
	}
	
	
    // === C. Daftar Kue yang Sudah Dibuat (OUTPUT) ===
	global.baked_goods = array_create(0)
	global.resiko_aktif = array_create(0);

}

tampilkan_misi = true

if (!variable_global_exists("Uang")) {
	global.Uang = 20;
	global.tabungan = 0;
	global.tampilan = 5;
	global.misi_T = -1;
}

if (!variable_global_exists("kebahagiaan")) {
	global.kebahagiaan = 0;
}
// hari
if (!variable_global_exists("day")) {
	global.day = "senin";
	global.tanggal = 1;
	global.activity_points = 2;
	global.hargapoko = false
	global.testing = false;
	global.uiblocking = false;
	global.pekan = 0
	global.rekap = false;
}


if(!variable_global_exists("bahan_baku")){
	global.bahan_baku = array_create(0);

	// Bahan dasar
	array_push(global.bahan_baku,{name: "Nasi", harga_dasar: 1, harga: 1});
	array_push(global.bahan_baku,{name: "Sayur",harga_dasar: 2, harga: 2});
	array_push(global.bahan_baku,{name: "Tahu",harga_dasar: 3, harga: 3});
	array_push(global.bahan_baku,{name: "Telur",harga_dasar: 4, harga: 4});
	array_push(global.bahan_baku,{name: "Daging",harga_dasar: 5, harga: 5});
	
	if(global.mode == "mahir"){
		global.inventasi = array_create(0);
		array_push(global.inventasi,{name: "Emas"});
	
		global.pinjamanan = array_create(0);
		array_push(global.pinjamanan, {name: "Pinjaman", harga: 10, kebahagiaan: - 15});
		array_push(global.pinjamanan, {name: "Bayar Pinjaman", harga: -10, kebahagiaan: 0});
	}
	global.kerjalepas = array_create(0);
	array_push(global.kerjalepas, {name: "Kerja Lepas", harga: 1})
	
	if(global.mode == "mahir"){
		global.asuransi = array_create(0);
		array_push(global.asuransi, {name: "beli asuransi", harga: 1, kondisi: true});
	}

}

if(!variable_global_exists("Kebutuhan")){
	global.kebutuhan = array_create(0);
	//Tersier 
	array_push(global.kebutuhan,{name: "Sepatu",type: "P", harga: 2, kebahagiaan: 1});
	array_push(global.kebutuhan,{name: "Tepak makan siang",type: "P", harga: 2, kebahagiaan: 1});
	array_push(global.kebutuhan,{name: "Buku",type: "P", harga: 2, kebahagiaan: 1});
	array_push(global.kebutuhan,{name: "Baju",type: "P", harga: 3, kebahagiaan: 2});
	
	//premier
	array_push(global.kebutuhan,{name: "Jam tangan",type: "T", harga: 6, kebahagiaan: 5});
	array_push(global.kebutuhan,{name: "Komedi putar",type: "T", harga: 7, kebahagiaan: 6});
	array_push(global.kebutuhan,{name: "Game PSP",type: "T", harga: 6, kebahagiaan: 5});
	array_push(global.kebutuhan,{name: "Boneka",type: "T", harga: 7, kebahagiaan: 6});
	
	//skudner
	array_push(global.kebutuhan,{name: "Sepeda",type: "S", harga: 4, kebahagiaan: 3});
	array_push(global.kebutuhan,{name: "Tepak pensil",type: "S", harga: 5, kebahagiaan: 4});
	array_push(global.kebutuhan,{name: "Tablet",type: "S", harga: 4, kebahagiaan: 3});
	array_push(global.kebutuhan,{name: "Ransel",type: "S", harga: 4, kebahagiaan: 3});
}

if(!variable_global_exists("Finansial")){
	global.Finansial = array_create(0);
	array_push(global.Finansial,{name: "Travelling", harga: 30, kebahagiaan: 28});
	array_push(global.Finansial,{name: "Rumah", harga: 35, kebahagiaan: 35});
	array_push(global.Finansial,{name: "Tv dan sofa", harga: 25, kebahagiaan: 20});
	array_push(global.Finansial,{name: "Kebun", harga: 28, kebahagiaan: 25});
	array_push(global.Finansial,{name: "Mobil", harga: 32, kebahagiaan: 32});
}

if(!variable_global_exists("Resiko")){
	global.Resiko = array_create(0);
	
	
	// Kartu Hijau - Pendidikan
	array_push(global.Resiko,{name:"Wisuda kelulusan", biaya:6, warna:"hijau"});
	array_push(global.Resiko,{name:"Study tour", biaya:4, warna:"hijau"});
	array_push(global.Resiko,{name:"Ekstrakulikuler anak", biaya:3, warna:"hijau"});
	array_push(global.Resiko,{name:"Tahun ajaran baru", biaya:5, warna:"hijau"});

	// Kartu Hijau - Kesehatan
	array_push(global.Resiko,{name:"Sakit perut", biaya:3, warna:"hijau"});
	array_push(global.Resiko,{name:"Sakit gigi", biaya:4, warna:"hijau"});
	array_push(global.Resiko,{name:"Sakit asam lambung", biaya:4, warna:"hijau"});
	array_push(global.Resiko,{name:"Depresi", biaya:3, warna:"hijau"});

	// Kartu Hijau - Kendaraan
	array_push(global.Resiko,{name:"Ganti aki", biaya:3, warna:"hijau"});
	array_push(global.Resiko,{name:"Ganti oli", biaya:3, warna:"hijau"});
	array_push(global.Resiko,{name:"Mobil kebakaran", biaya:6, warna:"hijau"});
	array_push(global.Resiko,{name:"Ban bocor", biaya:3, warna:"hijau"});

	// Kartu Hijau - Toko
	array_push(global.Resiko,{name:"Beli peralatan dapur", biaya:3, warna:"hijau"});
	array_push(global.Resiko,{name:"Gudang terbakar", biaya:6, warna:"hijau"});


	// Kartu Merah
	array_push(global.Resiko,{name:"Bencana banjir", biaya:3, warna:"merah"});
	array_push(global.Resiko,{name:"Pemadaman listrik", biaya:3, warna:"merah"});


	// Kartu Pink
	array_push(global.Resiko,{name:"BBM naik", biaya:1, warna:"pink"});
	array_push(global.Resiko,{name:"Panenan melimpah", biaya:-1, warna:"pink"});



	// Kartu Kuning
	array_push(global.Resiko,{name:"Investasi emas", warna:"kuning"});
	array_push(global.Resiko,{name:"Ulang tahun", biaya:4, warna:"kuning"});
	array_push(global.Resiko,{name:"Menang undian", biaya:2, warna:"kuning"});
}

if (!variable_global_exists("record")){
	global.record = ds_map_create();

	/// tersier
	ds_map_add(global.record, "Sepatu", 0);
	ds_map_add(global.record, "Tepak makan siang", 0);
	ds_map_add(global.record, "Buku", 0);
	ds_map_add(global.record, "Baju", 0);

	/// premier
	ds_map_add(global.record, "Jam tangan", 0);
	ds_map_add(global.record, "Komedi putar", 0);
	ds_map_add(global.record, "Game PSP", 0);
	ds_map_add(global.record, "Boneka", 0);

	/// sekunder
	ds_map_add(global.record, "Sepeda", 0);
	ds_map_add(global.record, "Tepak pensil", 0);
	ds_map_add(global.record, "Tablet", 0);
	ds_map_add(global.record, "Ransel", 0);
	
	/// finansial
	ds_map_add(global.record, "Travelling", 0);
	ds_map_add(global.record, "Rumah", 0);
	ds_map_add(global.record, "Tv dan sofa", 0);
	ds_map_add(global.record, "Kebun", 0);
	ds_map_add(global.record, "Mobil", 0);
	
	// donasi
	ds_map_add(global.record, "donasi juara 1", 0);
	ds_map_add(global.record, "donasi juara 2", 0);
	ds_map_add(global.record, "donasi juara 3", 0);
	ds_map_add(global.record, "total donasi", 0);
	
	//pensiun
	ds_map_add(global.record, "pensiun juara 1", 0);
	ds_map_add(global.record, "pensiun juara 2", 0);
	ds_map_add(global.record, "pensiun juara 3", 0);
	
	//kerja
	ds_map_add(global.record, "Kerja lepas", 0);
	
	//kartu resiko
	ds_map_add(global.record, "kartu hijau", 0);
	ds_map_add(global.record, "kartu kuning", 0);
	ds_map_add(global.record, "kartu merah", 0);
	ds_map_add(global.record, "kartu pink", 0);
}

if(!variable_global_exists("peduli_donasi")){
	global.peduli_donasi = array_create(0);
	global.dana_pensiun = array_create(0);
	
	array_push(global.peduli_donasi, {name: "donasi juara 1", kebahagiaan: 7});
	array_push(global.peduli_donasi, {name: "donasi juara 2", kebahagiaan: 5});
	array_push(global.peduli_donasi, {name: "donasi juara 3", kebahagiaan: 2});
	
	array_push(global.dana_pensiun, {name: "pensiun juara 1", kebahagiaan: 5});
	array_push(global.dana_pensiun, {name: "pensiun juara 2", kebahagiaan: 3});
	array_push(global.dana_pensiun, {name: "pensiun juara 3", kebahagiaan: 1});
}

// obj_game_manager Create Event
my_font = font_add("Arial", 15, false, false, 0, 0);

// cek jika poin sudah 0
if (global.activity_points <= 0 && global.current_player == 0 && global.tampilan != 1) {
	if (global.tampilan == 2 && global.day != "sabtu")
        exit;
	if(global.day == "senin"){
		global.day = "selasa";
		global.tanggal += 1;
	}else if(global.day == "selasa"){
		global.day = "rabu";
		global.tanggal += 1;
	}else if(global.day == "rabu"){
		global.day = "kamis";
		global.tanggal += 1;
	}else if(global.day == "kamis"){
		global.day = "jumat";
		global.tanggal += 1;
		global.tampilan = 3;
	}else if(global.day == "jumat"){
		if(global.mode == "pemula"){
			global.day = "senin";
			global.tampilan = 0;
			global.tanggal += 3;
			global.tampilan = 0;
		}else {
			global.day = "sabtu";
			global.tampilan = 2;
			global.tanggal += 1;
			global.tampilan = 2;
		}
	}else if(global.mode != "pemula" && global.day == "sabtu"){
		global.day = "senin";
		global.tanggal += 2;
	}
	global.activity_points = 2
	instance_create_depth(
	    room_width / 2,
	    room_height / 2,
	    -9999,
	    obj_day_transition
	);
	if (array_length(global.resiko_aktif) > 0){
		for(var i = 0; i< array_length(global.resiko_aktif); i++){
			global.resiko_aktif[i].sisa_hari -= 1;
		}
	}
}

var json = json_stringify(global.match_logs, true);

var file = file_text_open_write(
   program_directory + "match_log.json"
);

file_text_write_string(file, json);
file_text_close(file);


