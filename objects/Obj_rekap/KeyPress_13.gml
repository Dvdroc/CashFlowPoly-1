// Mengecek apakah layar rekap sudah benar-benar aktif (Game Over)
if (visible == true && global.tampilan == 4) {
    // Jika benar sudah Game Over, baru kirim data ke API
    scr_send_api();
} else {
    // Jika ditekan sebelum waktunya, abaikan saja (bisa dilihat di console)
    show_debug_message("Tombol Enter ditekan, tapi game belum selesai. Data tidak dikirim.");
}