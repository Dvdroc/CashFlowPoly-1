function scr_send_api() {
    var _url = "http://localhost:8000/games";
    
    // 2. Siapkan Header
    var _headers = ds_map_create();
    ds_map_add(_headers, "Content-Type", "application/json");
    
    // 3. Tarik data akurat hasil buatan Obj_rekap
    if (!variable_global_exists("final_summary_payload")) {
        show_debug_message("ERROR: global.final_summary_payload belum siap!");
        ds_map_destroy(_headers);
        return;
    }
    
    // Karena export_data menggunakan nested struct, gunakan trik parse/stringify untuk clone
    var _payload_string = json_stringify(global.final_summary_payload);
    var _payload = json_parse(_payload_string);
    
    // 4. SUNTIKKAN NAMA KELOMPOK (Fitur Baru)
    var _nama_kelompok = variable_global_exists("nama_kelompok") ? global.nama_kelompok : "Kelompok Tanpa Nama";
    variable_struct_set(_payload, "group_name", _nama_kelompok);
    
    // 5. Ubah menjadi string JSON final
    var _json_string = json_stringify(_payload);
    
    // 6. Tembakkan ke API Server!
    global.request_id = http_request(_url, "POST", _headers, _json_string);
    ds_map_destroy(_headers);
    
    show_debug_message("Mengirim JSON Akurat: " + _json_string);
}