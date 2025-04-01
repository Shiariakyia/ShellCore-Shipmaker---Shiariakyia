/// @description Insert description here
// You can write your code in this editor
global_variables();
global_matrix_indexes();

show_debug_message("Directory is: " + working_directory);

LoadMusicFiles();
MusicFiles = global.MusicFiles;

room_name = (room_get_name(room));

if(global.MusicEnabled == true){
	if(room_name == "Shipmaker_Room")
	audio_play_sound(music_wc1, 10, true);
}
