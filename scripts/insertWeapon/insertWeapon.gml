// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function insertWeapon(){
	
	with (instance_create_depth(x,y, -5, o_wpn)) {
    //image_angle = other.direction;
	sprite_index = other.w_racial;
	image_speed = 0;
	image_index = other.w_index;
	image_alpha = other.image_alpha;
    attached = other.id;
	other.weapon = self.id;
    //offsetDir = x - other.x;
    //offsetDist = y - other.y;
    //initialAngle = 0;
	}
	
}