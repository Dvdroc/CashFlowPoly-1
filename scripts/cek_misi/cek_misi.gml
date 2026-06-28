function cek_misi(){
    var punya_P = false;
    var punya_S = false;
    var punya_T = false;

    var target_T = global.kebutuhan[global.misi_T + 4].name;

    for (var i = 0; i < array_length(global.kebutuhan); i++)
    {
        var nama = global.kebutuhan[i].name;
        var type = global.kebutuhan[i].type;

        if (ds_map_exists(global.record,nama))
        {
            if (global.record[? nama] > 0)
            {
                if (type == "P") punya_P = true;
                if (type == "S") punya_S = true;

                if (type == "T" && nama == target_T)
                    punya_T = true;
            }
        }
    }

    if(punya_P && punya_S && punya_T) return true
	else return false
}