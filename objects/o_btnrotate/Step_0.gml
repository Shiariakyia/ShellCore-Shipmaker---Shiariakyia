/// @description Insert description here
// You can write your code in this editor
if (!position_meeting(mouse_x, mouse_y, o_sprite) && (position_meeting(mouse_x, mouse_y, self) || grab_r=true))
{
	image_index = 1;
}
else
{
	image_index = 0;	
}

if (grab_r==false)
{
	exit;
}
else
{
	
	x = mouse_x - x % 5
	y = mouse_y - y % 5
}