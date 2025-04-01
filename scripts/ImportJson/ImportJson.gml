// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ImportJson(argument0){
	if (argument0 == noone || argument0 == "") return;
	var validated = ro_controller.jsonValidated;
	
	if validated == false return;
	
	var open_file = argument0;
		
	if(instance_exists(o_sprite)){
		with(o_sprite) {
			instance_destroy();
			connectionCheck();
		}
	}
	var _wrapper = LoadJSONFromFile(open_file);
	var _part = _wrapper[? "parts"];
	
	var _coresprite = _wrapper[? "coreShellSpriteID"]; 
	
	with(o_core){
		for (var i = 0; i < array_length(global.core); i++){
			for (var j = 0; j < array_length(global.core[i]); j++){
				var sample = global.core[i][j];
				if (!is_array(sample.nameCore)) {
					if (sample.nameCore == _coresprite){
						sprite_index = global.racialCore[i];
						image_index = j;
						break;
					}
				}
				else {
					for (var k = 0; k < array_length(sample.nameCore); k++){
						if (sample.nameCore[k] == _coresprite){
							name_selection = k;
							sprite_index = global.racialCore[i];
							image_index = j;
							break;
						}
					}
				}
			}
		}
	}
	
	for (var i = ds_list_size(_part) -1; i >= 0; i--){
		var create = instance_create_depth(0, 0, 0, o_sprite);
		var _map = _part[| i];	
		var _location = _map[? "location"];
		
		with (create){
			x = ro_controller.core_x + round(_location[? "x"] * 37.5);
			var _invertedY = round(_location[? "y"] * 37.5) > 0 ? 
			round(_location[? "y"] * 37.5) * -1 : abs(round(_location[? "y"] * 37.5))
			y = ro_controller.core_y + _invertedY;
			//show_debug_message(string(y));
			sprite_index = global.racialPart[0];
				image_speed = 0;
				image_angle += _map[? "rotation"];
				image_xscale = _map[? "mirrored"] == true ? -1 : 1;
				type = "part";
				
				var attributeList = [global.attributeAbil, global.attributeWeap, global.attributeSpwn, global.attributePass];
				for (var ii = 0; ii < array_length(attributeList); ii++){
					for	(var jj = 0; jj < array_length(attributeList[ii]); jj++){
						for (var kk = 0; kk < array_length(attributeList[ii][jj]); kk++){
							var _abilityId = is_array(attributeList[ii][jj][kk].abilityId) ? attributeList[ii][jj][kk].abilityId[0] : attributeList[ii][jj][kk].abilityId;
							if (_abilityId == _map[? "abilityID"]){
								attribute = attributeList[ii][jj][kk];
								break;
							}
						}
					}
					if (attribute != noone) break;
				}
				
				attribute.levelAttr = _map[? "tier"] == 0 ? undefined : _map[? "tier"];
				secondaryData = _map[? "secondaryData"] == "" ? noone : _map[? "secondaryData"];
				w_index = attribute.indexAttr;
				w_racial = attribute.attributeIndex;
				
				_height = noone;
				_width = noone;
				wdt = noone;
				hgt = noone;
				just_created = false;
				
				for (var ii = 0; ii < array_length(global.part); ii++){
						if (sprite_index == global.racialPart[ii]){
						for(var jj = 0; jj < array_length(global.part[ii]); jj++){
							var sample = global.part[ii][jj];
							if (sample.namePart == _map[? "partID"]) {
								partAttr = sample;
								image_index = jj;
								break;
							}
						}
							w_racial = ii;
							break;
						}
					}
					
				if (partAttr != noone){
					partStringID = partAttr.partString;
					name = partAttr.namePart;
					size = partAttr.sizePart;	
				}
				
				if (w_index > 0){
					insertWeapon();
				}
				
				getHeightWidth();
				connectionCheck();
		}
		
		//var _obj = _map[? "obj"];
		
	}
	//ds_map_destroy(_part);
	ds_map_destroy(_wrapper);
	sortDepthOnLoad();
	show_debug_message("Ship Loaded!");
	
	//}
}