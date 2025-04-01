/// @description Insert description here
// You can write your code in this editor

grab_r = true;

with(ro_controller){
	dir = point_direction(x, y, mouse_x, mouse_y);
	rotate_angle = dir-dir % 15;
}