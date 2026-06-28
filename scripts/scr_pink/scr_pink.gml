function scr_pink(kartu){
	
	var r = global.Resiko[kartu];
	var ketemu = false;

	for (var i = 0; i < array_length(global.resiko_aktif); i++)
	{
	    if (global.resiko_aktif[i].biaya == r.biaya)
	    {
	        global.resiko_aktif[i].sisa_hari += 7;
	        ketemu = true;
	        break;
	    }
	}

	if (!ketemu)
	{
	    array_push(global.resiko_aktif,{
	        biaya : r.biaya,
	        sisa_hari : 7
	    });
	}
	
	
}