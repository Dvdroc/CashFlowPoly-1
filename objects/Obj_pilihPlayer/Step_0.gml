var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

hover = -1;

var gui_w = display_get_gui_width();
var start_x = (gui_w - box_w) / 2;

for(var i=0; i<array_length(pilihan); i++)
{
    y = start_y + i*(box_h + spacing);

    if(point_in_rectangle(mx,my,start_x,y,start_x+box_w,y+box_h))
    {
        hover = i;

        if(mouse_check_button_pressed(mb_left))
        {
            global.max_player = i + 2;

            room_goto(Room_InputNama);
        }
    }
}