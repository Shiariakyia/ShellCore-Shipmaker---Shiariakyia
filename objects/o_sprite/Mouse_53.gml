if (owner == noone){
draggable = true

if (!position_meeting(mouse_x, mouse_y, self)
&& !position_meeting(mouse_x, mouse_y, o_flip_prts) 
&& !position_meeting(mouse_x, mouse_y, o_rotate_prts)){
	selected = false;
}
}
