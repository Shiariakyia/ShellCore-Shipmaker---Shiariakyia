/// @description Insert description here
// You can write your code in this editor
shader_set(shdr_color_matrix);

matrix = global.matrixIndex[j];
shader_params = shader_get_uniform(shdr_color_matrix, "M");
shader_set_uniform_matrix_array(shader_params, matrix);
draw_self();
shader_reset();
depth = 0;