
asset = ["Alisa", "Rechard", "Reno", "Siti"]
next_sprite = asset_get_index(asset[global.current_player]);
nama = ["Alisa", "Rechard", "Reno", "Siti"]
next_name = nama[global.current_player]
dialog_index = 0;

sprite_index = next_sprite;
image_index = 0;

target_x = room_width / 2;
target_y = room_height / 2;

x = room_width + 300;
y = target_y;

image_alpha = 0;

image_xscale = 0.9;
image_yscale = 0.9;

state = 0;
timer = room_speed;