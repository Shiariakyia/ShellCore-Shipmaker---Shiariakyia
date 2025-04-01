/// @description Insert description here
// You can write your code in this editor
count = array_length(global.windowBoxes);

function StepEvent(){
with(btnShipmaker){
	global.DefaultCamera = camera_create_view(0, 0, 1400, 900);
	camera_set_default(global.DefaultCamera);
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left))
	{
		//var v_room = Shipmaker_Room;
		//var _cam = room_get_camera(v_room, 0);
		
		for (var i = 0; i< array_length(global.windowBoxes); i++){
			array_delete(global.windowBoxes, i, 1);
		}
		room_goto(Shipmaker_Room);
		
		//window_set_size(1400, 900);
		
		//display_set_gui_size(surface_get_width(application_surface),surface_get_height(application_surface));
		
	}
}

with(btnComicEditor){
	global.DefaultCamera = camera_create_view(0, 0, 1400, 900);
	camera_set_default(global.DefaultCamera);
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left))
	{
		//var v_room = Shipmaker_Room;
		//var _cam = room_get_camera(v_room, 0);
		
		for (var i = 0; i< array_length(global.windowBoxes); i++){
			array_delete(global.windowBoxes, i, 1);
		}
		room_goto(Comic_Room);
		
		//window_set_size(1400, 900);
		
		//display_set_gui_size(surface_get_width(application_surface),surface_get_height(application_surface));
		
	}
}

with(btnUnitEditor){
	global.DefaultCamera = camera_create_view(0, 0, 1400, 900);
	camera_set_default(global.DefaultCamera);
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left))
	{
		//var v_room = Shipmaker_Room;
		//var _cam = room_get_camera(v_room, 0);
		
		for (var i = 0; i< array_length(global.windowBoxes); i++){
			array_delete(global.windowBoxes, i, 1);
		}
		room_goto(Unit_Room);
		
		//window_set_size(1400, 900);
		
		//display_set_gui_size(surface_get_width(application_surface),surface_get_height(application_surface));
		
	}
}

with(btnOptions){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		if(!instance_exists(o_windowOptions)){
			var boxOptions = instance_create_depth(room_width * 0.5, room_height * 0.3, 0, o_windowOptions);
			array_push(global.windowBoxes, boxOptions);
		}
	}
}

with(btnSettings){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		if(!instance_exists(o_windowSettings)){
			var boxSettings = instance_create_depth(room_width * 0.5, room_height * 0.3, 0, o_windowSettings);
			array_push(global.windowBoxes, boxSettings);
		}
	}
}

with(btnExit){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left))
	{
		var temp_file = temp_directory + "shipfile.txt";
	if(file_exists(temp_directory + "shipfile.sccsm")) file_delete(temp_directory + "shipfile.sccsm");
	if(file_exists(temp_file)) file_delete(temp_file);
	
	show_debug_message("All temp files has been deleted");
		game_end();
	}
}
}

if (array_length(global.windowBoxes) == 0){
	StepEvent();
} else{
for (var i = 0; i < array_length(global.windowBoxes); i++){
	
if(!position_meeting(mouse_x, mouse_y, global.windowBoxes[i])){
	count -= 1;
	
} else { count += 1; }

if (count == 0 && global.isGrabbed == false) StepEvent();
}
}