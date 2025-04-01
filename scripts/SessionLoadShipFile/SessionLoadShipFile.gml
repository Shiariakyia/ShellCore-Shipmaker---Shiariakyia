// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SessionLoadShipFile(){
//if (file_exists("shipfile.sccsm")){
	if(instance_exists(o_sprite)){
		with(o_sprite) {
			instance_destroy();
			connectionCheck();
		}
	}
	var _wrapper = LoadJSONFromFile(temp_directory + "shipfile.sccsm");
	show_debug_message(string(_wrapper));
	var _list = _wrapper[? "ROOT"];
	
	for (var i = ds_list_size(_list) -1; i >= 0; i--){
		var _map = _list[| i];	
		
		var _obj = _map[? "obj"];
		
		if (_obj == "o_core"){
			with(o_core){
				if (_map[? "sprite_index"] != sprite_index || _map[? "image_index"] != image_index)
				sprite_index = _map[? "sprite_index"];
				image_index = _map[? "image_index"];
				for(var j = 0; j < array_length(global.racialCore); j++){
					if(global.racialCore[j] == sprite_index){
						global.coreArr = j;
						break;
					}
				}
			    
			   
				connectionCheck();
			}
		} else {
			var create = instance_create_depth(0, 0, 0, o_sprite)
			with(create){
				x = ro_controller.core_x + _map[? "x"];
				y = ro_controller.core_y + _map[? "y"];
				sprite_index = _map[? "sprite_index"];
				image_speed = 0;
				image_index = _map[? "image_index"];
				image_angle = _map[? "image_angle"];
				image_xscale = _map[? "image_xscale"];
				image_yscale = _map[? "image_yscale"];
				depthNum = _map[? "depthNum"];
				type = _map[? "type"];
				w_index = _map[? "w_index"];
				w_racial = _map[? "w_racial"];
				attribute = undefined;
				_height = noone;
				_width = noone;
				wdt = noone;
				hgt = noone;
				just_created = false;
				
				partStringID = _map[? "string_id"];
				for (var ii = 0; ii < array_length(global.part); ii++){
						if (sprite_index == global.racialPart[ii]){
						for(var jj = 0; jj < array_length(global.part[ii]); jj++){
							var sample = global.part[ii][jj];
							if (sample.partString == partStringID) { partAttr = sample;
							//image_index = j;
							break;
							}
						}
							break;
						}
					}
					
				if (partAttr != noone){
					name = partAttr.namePart;
					size = partAttr.sizePart;	
				}
				
				if (w_index > 0){
					insertWeapon();
				}
				
				getHeightWidth();
				connectionCheck();
				
			}	
		}
	}
	ds_map_destroy(_wrapper);
	sortDepthOnLoad();
	show_debug_message("Ship Loaded!" + temp_directory);
	
	//var last = global.partList[0];
	//with(last){
		//depth = 0;	
	//}
//} else {
	//show_debug_message("File not found");
//}
}