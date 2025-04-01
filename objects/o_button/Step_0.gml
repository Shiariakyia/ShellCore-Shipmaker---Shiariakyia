/// @description Insert description here
// You can write your code in this editor

count = array_length(global.windowBoxes);
if(attached != noone){
	if(!instance_exists(attached)) { instance_destroy(self); return; }
	x = attached.x + Xposition;
	y = attached.y + Yposition;
	if (attached.depth == -3) depth = -4;
	if (attached.depth == -1) depth = -2;
	
}

if (boolean != noone){
	if (boolean == true) image_index = 4;
			else image_index = 0;
}

function StepEvent(){
	if (!mouse_check_button(mb_left) ){
	if (position_meeting(mouse_x, mouse_y, self))
	{
		if (boolean != noone){
			if (boolean == true) image_index = 3;
			else image_index = 1;
		} else
		image_index = 1;
	}
	else if (!position_meeting(mouse_x, mouse_y, self))
	{
		if (boolean != noone){
			if (boolean == true) image_index = 4;
			else image_index = 0;
		} else
		image_index = 0;	
	}
}
}


if (array_length(global.windowBoxes) == 0){
	StepEvent();
} else {
	if(attached == noone){
for (var i = 0; i < array_length(global.windowBoxes); i++){
	if(!position_meeting(mouse_x, mouse_y, global.windowBoxes[i])){
	count -= 1;
	} else { count += 1; }
	if (count == 0 && global.isGrabbed == false){
	
		StepEvent();
		}
	}
	} else {
		for(var j = 0; j < array_length(global.windowBoxes); j++){
		if (global.windowBoxes[j].id != attached.id && attached.depth == -1
		&& position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), global.windowBoxes[j]) 
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
			StepEvent();
		}
	}
}

