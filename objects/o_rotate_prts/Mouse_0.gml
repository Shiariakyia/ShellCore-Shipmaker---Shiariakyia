/// @description Insert description here
// You can write your code in this editor

grab_r = true;



with(attached){
	dir = point_direction(x, y, mouse_x, mouse_y);
	image_angle = dir-dir % 15;
    _height = floor((hgt * abs(cos(2 * pi * image_angle / 360))) + (wdt * abs(sin(2 * pi * image_angle / 360))));
	_width = floor((wdt * abs(cos(2 * pi * image_angle / 360))) + (hgt * abs(sin(2 * pi * image_angle / 360))));
	
	rotation = image_angle;
	
	connectionCheck();
	//sprIndex = self.sprite_index;
	//setSprX = -self.wdt * 0.5;
	//setSprY = -self.hgt * 0.5;
	
	//sprite_set_offset(sprIndex, setSprX, setSprY);
}