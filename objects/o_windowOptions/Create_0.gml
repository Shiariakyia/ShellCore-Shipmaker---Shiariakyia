/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
image_index = 0;
follow = 0;
depth = -2;
selected = false;
mouseover = false;
for(var i = 0; i < array_length(global.windowBoxes); i++){
		if (global.windowBoxes[i].id != self.id){
			with(global.windowBoxes[i]){
				depth = -1;
			}
		}
	}
	
btnMusic = instance_create_depth(x, y, depth, o_button);
btnMusic.attached = self.id;
btnMusic.Xposition = -125;
btnMusic.Yposition = -40;
btnMusic.hoverText = "MUSIC";
btnMusic.persistentText = true;