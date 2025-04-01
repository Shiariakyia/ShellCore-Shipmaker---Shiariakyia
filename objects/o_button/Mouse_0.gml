/// @description Insert description here
// You can write your code in this editor
if(attached != noone && !instance_exists(attached)) { return; }

if (array_length(global.windowBoxes) == 0){
	if (position_meeting(mouse_x, mouse_y, self)){
	image_index = 3;
	}
} else{
if (attached == noone){
if (count == 0 && global.isGrabbed == false){
	
		if (position_meeting(mouse_x, mouse_y, self)){
			image_index = 3;
		}
	} 
} else {
	for(var j = 0; j < array_length(global.windowBoxes); j++){
		if (global.windowBoxes[j].id != attached.id && attached.depth == -1
		&& place_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), global.windowBoxes[j]) 
		) {
			if (boolean != noone){
				if (boolean == true) image_index = 4;
				else image_index = 0;
			}
			else image_index = 0;
			return;
			}
		}
		
		if (place_meeting(mouse_x, mouse_y, attached)){
			if (position_meeting(mouse_x, mouse_y, self)){
			image_index = 3;
			}
		}
	}
}