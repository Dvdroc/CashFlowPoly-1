function scr_pensiun(juara, pemain_list){
   var jumlah_pemain = array_length(pemain_list);

    for (var i = 0; i < jumlah_pemain; i++){
        if (juara[i] > 0)
        {
            var index = juara[i] - 1;
            var nama_donasi = global.dana_pensiun[index].name;

            var record = global.player_data[i].record;

            if (ds_map_exists(record, nama_donasi))
            {
                record[? nama_donasi] += 1;
            }
        }
    }
	global.rekap = true;
    // update player aktif supaya global.record ikut berubah
    scr_load_player();
}