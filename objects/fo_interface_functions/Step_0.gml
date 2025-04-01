/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_lcontrol)) {
	if (keyboard_check_pressed (ord("R"))){
		LoadMusicFiles();
		
	}
}

if(room_name != room_get_name(room)){
	instance_destroy(self);	
}


