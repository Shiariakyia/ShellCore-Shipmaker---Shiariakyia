/// @description Insert description here
// You can write your code in this editor
if (!position_meeting(mouse_x, mouse_y, o_core)){
var obj = instance_create_depth (x, y, 0, o_core);
obj.inComic = true;
obj.sprite_index = global.racialCore[race];
obj.image_speed = 0;
obj.image_index = index;
obj.image_angle = rotate_angle;
obj._height = _height;
obj._width = _width;
obj.wdt = wdt;
obj.hgt = hgt;
}
