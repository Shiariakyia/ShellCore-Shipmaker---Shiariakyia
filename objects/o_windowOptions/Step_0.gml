/// @description Insert description here
// You can write your code in this editor
getHeightWidth();

DragWindowBox();

btnMusic.boolean = global.MusicEnabled;
function StepEventSettings(){
with (btnMusic){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left))
	{
		if (global.MusicEnabled == true) global.MusicEnabled = false;
		else global.MusicEnabled = true;
	}
	
}
}

for(var j = 0; j < array_length(global.windowBoxes); j++){
		if (global.windowBoxes[j].id != self.id && self.depth == -1
		&& position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), global.windowBoxes[j]) 
		) { 
			return;
			}
			
			}
//ValidateWindowCollision()

StepEventSettings()