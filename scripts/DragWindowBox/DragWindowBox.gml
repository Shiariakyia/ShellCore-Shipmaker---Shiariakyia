// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DragWindowBox(){
	//if (position_meeting(mouse_x, mouse_y, self)) mouseover = true else mouseover = false;
	if device_mouse_check_button_pressed(0, mb_left)
{
	for(var j = 0; j < array_length(global.windowBoxes); j++){
		if (place_meeting(x, y, global.windowBoxes[j]) 
		&& depth == -1 && selected == false
		&& global.windowBoxes[j].id != self.id
		&& position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), global.windowBoxes[j]) 
		) return;
	}
if (position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self) && global.isGrabbed == false)
{
	 //validates stack-over window boxes
	var neg_width = 0 + self._width;
	var neg_height = 0 - self._height;
	var _distY = mouse_y - self.y;
	var _distX = mouse_x - self.x;
	
	if(_distX > (neg_width / 2 - 15) && _distX < (neg_width / 2)){
		if(_distY < (neg_height / 2 + 12.5) && _distY > (neg_height / 2))
		for(var i = 0; i < array_length(global.windowBoxes); i++){
			if (global.windowBoxes[i] == self.id){
				array_delete(global.windowBoxes, i, 1);
				instance_destroy(self);
				return;
			}	
		}
		
	}
	
	if(_distY < (neg_height / 2 + 25) && _distY > (neg_height / 2)){
	for(var i = 0; i < array_length(global.windowBoxes); i++){
		
		if (global.windowBoxes[i].id != self.id){
			with(global.windowBoxes[i]){
					depth = -1;
					selected = false;
			}
			depth = -3;
			selected = true;
		} 
	}
	
dx=device_mouse_x_to_gui(0)-x
dy=device_mouse_y_to_gui(0)-y
follow=1
global.isGrabbed = true;
}
}
}

if device_mouse_check_button_released(0, mb_left)
{
if (position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), self))
{
follow=0
global.isGrabbed = false
}
}

if (follow==1)
{
	
x=device_mouse_x_to_gui(0)-dx
y=device_mouse_y_to_gui(0)-dy
} 
}