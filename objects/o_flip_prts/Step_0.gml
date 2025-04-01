/// @description Insert description here
// You can write your code in this editor
if (position_meeting(mouse_x, mouse_y, self))
{
	image_index = 1;
	x = trueX;
	y = trueY;
}
else
{
	image_index = 0;	
	x = trueX;
	y = trueY;
}

if (instance_exists(attached)){
	
x = (attached.x + 15) - x % 5;
y = spr_height - y % 5;


	if (attached.selected = false){
	instance_destroy();
	}
} 

if (!instance_exists(attached)){
	instance_destroy();
}

