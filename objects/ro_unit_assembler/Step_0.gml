/// @description Insert description here
// You can write your code in this editor

with(btnBackToMenu){
	
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left))
	{
		game_restart();
		for (var i = 0; i < array_length(global.partList); i++){
			array_delete(global.partList, i, 1);
			array_delete(global.statusCons, i, 1);
		}
		
	}
}
