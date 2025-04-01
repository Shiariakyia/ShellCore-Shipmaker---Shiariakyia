/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
image_index = 2;
follow = 0;
depth = -3;
selected = false;
mouseover = false;

for(var i = 0; i < array_length(global.windowBoxes); i++){
		if (global.windowBoxes[i].id != self.id){
			with(global.windowBoxes[i]){
				depth = -1;
			}
		}
	}
	

