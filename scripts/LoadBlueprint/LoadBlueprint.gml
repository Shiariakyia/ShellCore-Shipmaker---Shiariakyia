// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadBlueprint(){
	var open_file = get_open_filename("SCCSM Ship File|*.sccsm", "");
if (file_exists(open_file) && open_file != ""){
	if(instance_exists(o_sprite)){
		with(o_sprite) {
			if (o_sprite.attached == selected_core.id)
			instance_destroy();
			//connectionCheck();
		}
	}
	var _wrapper = LoadJSONFromFile(open_file);
	var _list = _wrapper[? "ROOT"];
	
	for (var i = ds_list_size(_list) -1; i >= 0; i--){
		var _map = _list[| i];	
		
		var _obj = _map[? "obj"];
		
		
		if (_obj == "o_core"){
			with(selected_core){
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
				x = selected_core.x + _map[? "x"];
				y = selected_core.y + _map[? "y"];
				sprite_index = _map[? "sprite_index"];
				image_speed = 0;
				if (_map [? "image_index"] > sprite_get_number(_map[? "sprite_index"]) - 1) {
					image_index = 0;
				} else {
					image_index = _map[? "image_index"];
				}
				image_angle = _map[? "image_angle"];
				image_xscale = _map[? "image_xscale"];
				image_yscale = _map[? "image_yscale"];
				depthNum = _map[? "depthNum"];
				type = _map[? "type"];
				w_index = _map[? "w_index"];
				w_racial = _map[? "w_racial"];
				attribute = _map[? "attribute"];
				
				_height = noone;
				_width = noone;
				wdt = noone;
				hgt = noone;
				just_created = false;
				owner = selected_core.id;
				
				if (w_index > 0){
					insertWeapon();
				}
				
				getHeightWidth();
				//connectionCheck();
				
			}	
		}
	}
	ds_map_destroy(_wrapper);
	sortDepthOnLoad();
	show_debug_message("Ship Loaded!");
	
	}
}