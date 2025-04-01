/// @description Insert description here
// You can write your code in this editor

gpu_set_texfilter(true);
draw_set_font(global.font04b03);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
shader_set(shdr_color_matrix);

draw_sprite_ext(global.racialCore[race], index, x, y, 1, 1, 0, c_white, 1);

shader_reset();

