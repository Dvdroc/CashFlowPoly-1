if (visible)
{
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    //=========================================
    // PILIH JUARA
    //=========================================
    if (mouse_check_button_pressed(mb_left))
    {
        for (var p = 0; p < array_length(pemain_list); p++)
        {
            var px = ui_x + (p * 220);

            for (var j = 1; j <= 4; j++)
            {
                var bx1 = px + 20;
                var by1 = ui_y + 80 + (j * 40);
                var bx2 = bx1 + 160;
                var by2 = by1 + 35;

                if (point_in_rectangle(mx, my, bx1, by1, bx2, by2))
                {
                    if (global.tanggal <= 25)
                    {
                        // Sudah selesai input donasi -> tidak boleh diubah lagi
                        if (donasi[p] != -1)
                            break;

                        // Sedang input pemain lain
                        if (input_active)
                        {
                            if (p != input_player)
                                break;
                        }
                        else
                        {
                            // Mulai input pemain ini
                            input_player = p;
                            input_text = "";
                            keyboard_string = "";
                            input_active = true;
                        }
                    }

                    // Selama belum Enter masih boleh ganti juara
                    juara[p] = j;
                    break;
                }
            }
        }
    }

    //=========================================
    // INPUT DONASI
    //=========================================
    if (input_active)
    {
        input_text = keyboard_string;

        var clean = "";

        for (var i = 1; i <= string_length(input_text); i++)
        {
            var c = string_char_at(input_text, i);

            if (c >= "0" && c <= "9")
                clean += c;
        }

        input_text = clean;

        if (keyboard_check_pressed(vk_enter))
        {
            if (input_text != "")
            {
                donasi[input_player] = real(input_text);

                keyboard_string = "";
                input_text = "";

                input_active = false;
                input_player = -1;

                //---------------------------------
                // Cek semua donasi
                //---------------------------------
                var semua_donasi = true;

                for (var i = 0; i < array_length(donasi); i++)
                {
                    if (donasi[i] == -1)
                    {
                        semua_donasi = false;
                        break;
                    }
                }

                //---------------------------------
                // Cek Juara 1,2,3
                //---------------------------------
                var j1 = false;
                var j2 = false;
                var j3 = false;

                for (var i = 0; i < array_length(juara); i++)
                {
                    if (juara[i] == 1) j1 = true;
                    if (juara[i] == 2) j2 = true;
                    if (juara[i] == 3) j3 = true;
                }

                //---------------------------------
                // Semua selesai
                //---------------------------------
                if (semua_donasi && j1 && j2 && j3)
                {
                    scr_donasi(juara, pemain_list, donasi);

                    global.tampilan = 0;
                    global.activity_points = 0;

                    room_restart();
                }
            }
        }
    }

    //=========================================
    // MODE PENSIUN
    //=========================================
    if (global.tanggal > 25)
    {
        var j1 = false;
        var j2 = false;
        var j3 = false;

        for (var i = 0; i < array_length(juara); i++)
        {
            if (juara[i] == 1) j1 = true;
            if (juara[i] == 2) j2 = true;
            if (juara[i] == 3) j3 = true;
        }

        if (j1 && j2 && j3)
        {
            scr_pensiun(juara, pemain_list);

            global.activity_points = 0;
            room_restart();
        }
    }
}