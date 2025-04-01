/// @description Insert description here
// You can write your code in this editor
gpu_set_texfilter(true);

shader_set(shdr_color_matrix);
//Plan: adding if else clause related to part limit over the matrix variable
matrix = global.matrixIndex[j];
shader_params = shader_get_uniform(shdr_color_matrix, "M");
shader_set_uniform_matrix_array(shader_params, matrix);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
//draw_set_font(global.font04b03b_10);
//draw_set_color(c_white);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);

//draw_text(x ,y,depthNum);


draw_set_font(global.font04b03_6);
//draw_text(x, y +30, self.id);

shader_reset();
depth = depthNum;
//if (selected == true){
	//draw_rectangle(x - wdt * 0.5, y - hgt * 0.5, x + wdt * 0.5, y + hgt * 0.5, 1);
	//draw_point(x - wdt * 0.5, y - hgt * 0.5);
//}
