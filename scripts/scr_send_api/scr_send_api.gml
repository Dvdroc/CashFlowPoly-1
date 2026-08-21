function scr_send_api() {
    // 1. Alamat Backend
    var _url = "http://localhost:8000/games";
    
    // 2. Siapkan Header
    var _headers = ds_map_create();
    ds_map_add(_headers, "Content-Type", "application/json");
    
    var _players_array = [];
    var _jumlah_pemain = array_length(global.player_data);
    
    // 3. Looping Utama Pemain
    for (var i = 0; i < _jumlah_pemain; i++) {
        var _p_data = global.player_data[i];
        
        var _nama = variable_struct_exists(_p_data, "name") ? _p_data.name : "Player " + string(i+1);
        var _uang = variable_struct_exists(_p_data, "uang") ? _p_data.uang : 0;
        var _tabungan = variable_struct_exists(_p_data, "tabungan") ? _p_data.tabungan : 0;
        
        // PENCARI DATA BARANG ---
        var _ing = 0, _meal = 0, _pri = 0, _sec = 0, _ter = 0, _don = 0, _goals = 0;
        
        // A. Bongkar Inventory (Mencari Bahan Masakan)
        if (variable_struct_exists(_p_data, "inventory")) {
            var _inv = _p_data.inventory;
            if (ds_exists(_inv, ds_type_map)) {
                var _k_inv = ds_map_find_first(_inv);
                while (!is_undefined(_k_inv)) {
                    var _nama_inv = string_lower(_k_inv);
                    // Hitung sebagai bahan baku jika BUKAN pinjaman atau emas
                    if (string_pos("pinjaman", _nama_inv) == 0 && string_pos("emas", _nama_inv) == 0) {
                        _ing += _inv[? _k_inv]; 
                    }
                    _k_inv = ds_map_find_next(_inv, _k_inv);
                }
            }
        }
        
        // B. Bongkar Record (Mencari Kebutuhan & Donasi)
        if (variable_struct_exists(_p_data, "record")) {
            var _rec = _p_data.record;
            if (ds_exists(_rec, ds_type_map)) {
                var _k_rec = ds_map_find_first(_rec);
                while (!is_undefined(_k_rec)) {
                    var _jumlah_item = _rec[? _k_rec];
                    var _nama_item = string_lower(_k_rec);
                    
                    // Deteksi Kebutuhan Primer (Sepatu, Baju, Buku, Mbg)
                    if (string_pos("sepatu", _nama_item) > 0 || string_pos("baju", _nama_item) > 0 || string_pos("buku", _nama_item) > 0 || string_pos("mbg", _nama_item) > 0) {
                        _pri += _jumlah_item;
                    }
                    // Deteksi Kebutuhan Sekunder (Sepeda, Ransel)
                    else if (string_pos("sepeda", _nama_item) > 0 || string_pos("ransel", _nama_item) > 0) {
                        _sec += _jumlah_item;
                    }
                    // Deteksi Kebutuhan Tersier (Jam Tangan, PSP)
                    else if (string_pos("jam", _nama_item) > 0 || string_pos("psp", _nama_item) > 0) {
                        _ter += _jumlah_item;
                    }
                    // Deteksi Donasi Sosial
                    else if (string_pos("donasi", _nama_item) > 0 || string_pos("peduli", _nama_item) > 0) {
                        _don += (_jumlah_item * 10); // Asumsi 1 kartu = 10 koin
                    }
                    // Deteksi Target Finansial (Rumah, dll)
                    else if (string_pos("rumah", _nama_item) > 0 || string_pos("finansial", _nama_item) > 0) {
                        _goals += _jumlah_item;
                    }
                    
                    _k_rec = ds_map_find_next(_rec, _k_rec);
                }
            }
        }
        
        // C. Bongkar Array Makanan Jadi (Pesanan Diklaim)
        if (variable_struct_exists(_p_data, "baked_goods")) {
            var _bg = _p_data.baked_goods;
            if (is_array(_bg)) {
                _meal = array_length(_bg); // Menghitung total olahan yang berhasil dibuat
            }
        }
        
        // D. Kalkulator Hitung Skor Manual (Anti-Crash)
        var _skor_akhir = 0;
        if (variable_instance_exists(id, "skor")) {
            var _kategori_count = array_length(skor);
            for (var k = 0; k < _kategori_count; k++) {
                if (k >= 8) break; 
                if (is_real(skor[k][i])) {
                    _skor_akhir += skor[k][i];
                }
            }
        }
        
        // 4. Bungkus ke Format JSON FastAPI
        var _p_struct = {
            player_name: _nama,
            coins_net_end_game: _uang, 
            ingredients_collected: _ing, 
            meal_orders_claimed: _meal,
            primary_needs_owned: _pri,
            secondary_needs_owned: _sec,
            tertiary_needs_owned: _ter,
            donation_total_coins: _don,
            pension_fund_total: _tabungan,
            life_risk_costs_total: 0, 
            financial_goals_completed: _goals,
            total_score: _skor_akhir
        };
        
        array_push(_players_array, _p_struct);
    }
    
    // 5. Susun Payload Akhir
    var _mode_game = variable_global_exists("mode") ? global.mode : "pemula";
    var _payload = {
        mode: _mode_game, 
        players: _players_array
    };
    
    var _json_string = json_stringify(_payload);
    
    // 6. Tembakkan ke API!
    global.request_id = http_request(_url, "POST", _headers, _json_string);
    ds_map_destroy(_headers);
    
    show_debug_message("Mengirim JSON: " + _json_string);
}