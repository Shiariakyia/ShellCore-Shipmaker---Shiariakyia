/// @description Insert description here
// You can write your code in this editor

	
if (instance_exists(attached)){
	if (position_meeting(mouse_x, mouse_y, self) || grab_r=true)
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

	if (grab_r==false)
	{
		
		x = (attached.flippable == true ? attached.x - 15 : attached.x) - x % 5;
		y = spr_height - y % 5;

	
	if (!fixed_coord = true){
		reset_x = x;
		reset_y = y;
		}
	}
	else
	{
		fixed_coord = true;
		x = mouse_x - x % 5;
		y = mouse_y - y % 5;
	}
	
	if (attached.selected = false){
	instance_destroy();
	}
}
if (!instance_exists(attached)){
	instance_destroy();
}

