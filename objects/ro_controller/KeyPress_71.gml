/// @description Insert description here
// You can write your code in this editor
if (instance_exists(grid)){
	instance_destroy(grid);	
} else if (!instance_exists(grid)){
	grid = instance_create_depth(room_width / 2, room_height / 2, 3, o_grid);	
}