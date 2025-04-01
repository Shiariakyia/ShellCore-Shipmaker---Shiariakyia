// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadShipFile(){
	var open_file = get_open_filename("SCCSM Ship File|*.sccsm", "");
if (file_exists(open_file) && open_file != ""){
	var validated = validateJson(open_file);
	
	if validated == false return;
	
	if(instance_exists(o_sprite)){
		with(o_sprite) {
			instance_destroy();
			connectionCheck();
		}
	}
	var _wrapper = LoadJSONFromFile(open_file);
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
						if (!ds_map_exists(_map, "string_id"))
						for (jj = 0; jj < array_length(global.OldCoreData[j]); jj++){
							var sample = global.OldCoreData[j][jj];
							if (_map[? "image_index"] == sample.ID) {
								coreAttr = sample.ReturnCoreData;
								coreStringID = coreAttr.coreString;
								break;
							}	
						} else { 
							coreStringID = _map[? "string_id"];
							for(jj = 0; jj < array_length(global.core[j]); jj++){
							var sample = global.core[j][jj];
							if (sample.coreString == coreStringID) { coreAttr = sample;
							image_index = jj;
							break;
							}
						}
						}
						name = coreAttr.nameCore;
						size = coreAttr.sizeCore;
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
				if (!ds_map_exists(_map, "string_id")) {
					var reloc, raceIndex;
					var ii, jj;
					for (ii = 0; ii < array_length(global.OldPartData); ii++){
						if (sprite_index == global.racialPart[ii]){
							raceIndex = global.part[ii];
						for (jj = 0; jj < array_length(global.OldPartData[ii]); jj++){
							var sample = global.OldPartData[ii][jj];
							if (_map[? "image_index"] == sample.ID) {reloc = sample;
							break;
							}
						}
						break;
						}
					}
					partAttr = reloc.ReturnPartData;
					partStringID = partAttr.partString;
					name = partAttr.namePart;
					size = partAttr.sizePart;
					for(ii = 0; ii < array_length(raceIndex); ii++){
						if (partAttr == raceIndex[ii]) { image_index = ii;
						break;
						}
					}
					
				} else {
					var ii, jj;
					partStringID = _map[? "string_id"];
					for (ii = 0; ii < array_length(global.part); ii++){
						if (sprite_index == global.racialPart[ii]){
						for(jj = 0; jj < array_length(global.part[ii]); jj++){
							var sample = global.part[ii][jj];
							if (sample.partString == partStringID) { partAttr = sample;
							image_index = jj;
							name = partAttr.namePart;
							size = partAttr.sizePart;
							break;
							}
						}
							break;
						}
					}
					
				}
				
				image_angle = _map[? "image_angle"];
				image_xscale = _map[? "image_xscale"];
				image_yscale = _map[? "image_yscale"];
				depthNum = _map[? "depthNum"];
				type = _map[? "type"];
				w_index = _map[? "w_index"];
				w_racial = _map[? "w_racial"];
				attribute = undefined; //_map[? "attribute"];
				
				_height = noone;
				_width = noone;
				wdt = noone;
				hgt = noone;
				just_created = false;
				
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
	show_debug_message("Ship Loaded!");
	
	}
}