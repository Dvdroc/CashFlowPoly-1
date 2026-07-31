function hitung_kebahagiaan()
{
    var total = 0;

    // =========================
    // KEBUTUHAN
    // =========================
    for (var i = 0; i < array_length(global.kebutuhan); i++)
    {
        var nama = global.kebutuhan[i].name;

        if (ds_map_exists(global.record, nama))
        {
            total += global.record[? nama] * global.kebutuhan[i].kebahagiaan;
        }
    }

    // =========================
    // FINANSIAL
    // =========================
    var aktif_finansial = true;

    if (global.mode == "mahir")
    {
        aktif_finansial = (global.inventory[? "Pinjaman"] <= 0);
    }

    if (aktif_finansial)
    {
        for (var i = 0; i < array_length(global.Finansial); i++)
        {
            var nama = global.Finansial[i].name;

            if (ds_map_exists(global.record, nama))
            {
                total += global.record[? nama] * global.Finansial[i].kebahagiaan;
            }
        }
    }

    // =========================
    // DONASI
    // =========================
    for (var i = 0; i < array_length(global.peduli_donasi); i++)
    {
        var nama = global.peduli_donasi[i].name;

        if (ds_map_exists(global.record, nama))
        {
            total += global.record[? nama] * global.peduli_donasi[i].kebahagiaan;
        }
    }

    // =========================
    // DANA PENSIUN
    // =========================
    for (var i = 0; i < array_length(global.dana_pensiun); i++)
    {
        var nama = global.dana_pensiun[i].name;

        if (ds_map_exists(global.record, nama))
        {
            total += global.record[? nama] * global.dana_pensiun[i].kebahagiaan;
        }
    }

    return total;
}