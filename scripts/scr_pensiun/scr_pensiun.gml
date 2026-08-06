function scr_pensiun(juara, pemain_list)
{
    var jumlah_pemain = array_length(pemain_list);

    for (var i = 0; i < jumlah_pemain; i++)
    {
        if (juara[i] > 0)
        {
            var index = juara[i] - 1;

            if (index < 0 || index >= array_length(global.dana_pensiun))
            {
                show_debug_message(
                    "Index error di juara[" + string(i) + "] = " + string(juara[i])
                );
                continue;
            }

            var nama_donasi = global.dana_pensiun[index].name;

            var record = global.player_data[i].record;

            if (ds_map_exists(record, nama_donasi))
            {
                record[? nama_donasi] += 1;
            }
        }
    }

    global.rekap = true;
    scr_load_player();
}