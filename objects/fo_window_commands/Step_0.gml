/// @description Insert description here
// You can write your code in this editor
if(window_command_check(window_command_close)){
	var temp_file = temp_directory + "shipfile.txt";
	if(file_exists(temp_directory + "shipfile.sccsm")) file_delete(temp_directory + "shipfile.sccsm");
	if(file_exists(temp_file)) file_delete(temp_file);
	
	show_debug_message("All temp files has been deleted");
	game_end();
}

if(window_command_check(window_command_minimize)){
	window_command_run(window_command_minimize);	
}

if (window_command_check(window_command_restore)) {
    if (window_get_height() == 0) {
        // Restoring from minimized state
        window_command_run(window_command_restore);
    }
}