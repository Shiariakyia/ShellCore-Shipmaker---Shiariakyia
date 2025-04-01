// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadMusicFiles(){
	if (directory_exists(working_directory + "\Musics")){
				var files = [];
				var file_name = file_find_first(string(working_directory) + "/Musics/*", 0);
				show_debug_message(file_name);
				while (file_name != "")
				{
					array_push(files, file_name);
					file_name = file_find_next();
					show_debug_message(file_name);
				}

				file_find_close();
	
				if (array_length(global.MusicFiles) != array_length(files)) global.MusicFiles = files;
	
				for (var i = 0; i < array_length(global.MusicFiles); i++){
					if (files[i] != global.MusicFiles[i]) {
						global.MusicFiles = files;
						return;
				}
			}//set the music files if one file doesn't match with the array
		}
}