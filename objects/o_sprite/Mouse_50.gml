/// @description Insert description here
// You can write your code in this editor
if (owner == noone && just_created == true){
	
	selected = true;
	if (selected == true)
	with (o_sprite){
		if (other.id != self.id){
			selected = false;
		}
	}
	x = mouse_x - mouse_x % 5 
	y = mouse_y - mouse_y % 5 
	dif_x = (mouse_x - x);  
	dif_y = (mouse_y - y);  
	xx = mouse_x - dif_x;
	yy = mouse_y - dif_y;
	
	getHeightWidth();
	
	if (connected == true){
	image_alpha = 1;
	} else {
	image_alpha = 0.5;
	}
	if (room == Shipmaker_Room) connectionCheck();
}