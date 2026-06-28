/// @description Insert description here
// You can write your code in this editor
// Update alpha
alpha_value += fade_speed * fade_direction;

// Batasi agar tetap 0-1
if (alpha_value > 1) alpha_value = 1;
if (alpha_value < 0) alpha_value = 0;
