/// @description Insert description here
// You can write your code in this editor
if (!position_meeting(mouse_x, mouse_y, self)
//&& !position_meeting(mouse_x, mouse_y, o_core_prev)
){
selected = false;
} else
{
	if (instance_exists(o_sprite)){
	if (o_sprite.selected != true)
selected = true;
	} else {
selected = false;	
	}
}

if (selected == true) {
		with (o_sprite){
			selected = false;
			other.selected = true;
		}
}