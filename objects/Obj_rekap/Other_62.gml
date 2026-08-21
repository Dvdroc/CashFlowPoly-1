// Mengecek apakah ini adalah balasan dari API yang kita tembak
if (async_load[? "id"] == global.request_id) {
    var _status = async_load[? "http_status"];
    
    if (_status == 201 || _status == 200) {
        show_debug_message("BERHASIL! Data masuk ke Dashboard Streamlit!");
        show_message("Data permainan berhasil dikirim ke Dosen/Guru!");
		game_end()
    } else {
        var _pesan_error = async_load[? "result"];
        show_debug_message("GAGAL! Pesan dari server: " + string(_pesan_error));
        show_message("Gagal mengirim data. Cek koneksi server.");
    }
}