// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ExportJson(argument0){
	try{
	if (argument0 == noone || argument0 == "" || validatePartAndCore() == false) return;
	var save_file = argument0 == "FILE" ? get_save_filename("Text File|*.txt", "") : noone;
	if (save_file != "" && save_file != noone){
		SaveStringToFile((string_last_pos(".txt", save_file) != 0) ? save_file : save_file + ".txt", createDSList());
	}
	
	if (argument0 == "CLIP"){
		clipboard_set_text(createDSList());	
	}
	} catch (_exception){
		show_debug_message("Error: " + string(_exception));
	}
}

function createDSList(){
	var _wrapper = ds_map_create();
	var _parts = ds_list_create();
	var connected_parts = array_create(0);
var n = array_length(global.partList);
var depthSort = function(inst1, inst2){ return inst2.depthNum - inst1.depthNum;	}
array_sort(global.partList, depthSort);
for (var i = 0; i < n; i++){
	var entities = global.partList[i];
	with(entities){
		if (entities.connected == true){
			array_push(connected_parts, entities);
		}
	}
}
	if (instance_exists(o_core))
	with (o_core){
			ds_map_add(_wrapper, "entityName", "Unnamed");
			ds_map_add(_wrapper, "coreSpriteID", switchStringCore(coreAttr.nameCore));
			ds_map_add(_wrapper, "coreShellSpriteID", coreAttr.nameCore);
	}

n = array_length(connected_parts);
array_sort(connected_parts, depthSort);
for (var i = 0; i < n; i++){
	var connected = connected_parts[i];
	with(connected){
		//var _obj = object_get_name(object_index);
		
		
		
		if (object_index == o_sprite){
		var _map = ds_map_create();
		var _location = ds_map_create();
		ds_list_add(_parts, _map);
		ds_list_mark_as_map(_parts, ds_list_size(_parts) - 1);
		var _x = (connected.x - ro_controller.core_x);
		var _y = (connected.y - ro_controller.core_y);
		
		ds_map_add(_location, "x", _x * 0.0266666666666667);
		ds_map_add(_location, "y", _y < 0 ? abs(_y) * 0.0266666666666667 : -_y * 0.0266666666666667);
		ds_map_add_map(_map, "location", _location);
		ds_map_add(_map, "rotation", connected.image_angle > 180 ? -180 + (connected.image_angle - 180) : connected.image_angle);
		ds_map_add(_map, "mirrored", connected.image_xscale == 1 ? false : true);
		
		if (variable_instance_exists(connected, "attribute")) {
			if (connected.attribute != noone){
				ds_map_add(_map, "abilityID", connected.attribute.abilityId == noone ? int64(0) : int64(connected.attribute.abilityId));
				ds_map_add(_map, "tier", connected.attribute.levelAttr == undefined ? int64(0) : int64(connected.attribute.levelAttr));
				ds_map_add(_map, "secondaryData", connected.attribute.secondaryData == noone ? "" : connected.attribute.secondaryData);
			} else {
				ds_map_add(_map, "abilityID", int64(0));
				ds_map_add(_map, "tier", int64(0));
				ds_map_add(_map, "secondaryData", "");
			}
		}
		
		ds_map_add(_map, "partID", connected.partAttr.namePart);
		ds_map_add(_map, "shiny", false);
		ds_map_add(_map, "playerGivenName", "");
		
		}
	}
}

var _dialogue = ds_map_create();
ds_map_add(_dialogue, "m_FileID", int64(0));
ds_map_add(_dialogue, "m_PathID", int64(0));

ds_map_add(_wrapper, "intendedType", int64(0));
ds_map_add_list(_wrapper, "parts", _parts);
ds_map_add_map(_wrapper, "dialogue", _dialogue);
ds_map_add(_wrapper, "useCustomDroneType", false);
ds_map_add(_wrapper, "customDroneType", int64(0));

var _string = json_encode(_wrapper);	
	ds_map_destroy(_wrapper);
	show_debug_message("Ship Saved!");

	return _string;
}

var function switchStringCore(argument0){
	switch(argument0){
		case "groundcarriershell":
		return "groundcarriercore";
		
		case "drone_shell":
		return "drone_light";
		
		case "core1_shell":
		case "core2_shell":
		case "core3weapons_shell":
		case "core3skills_shell":
		case "core3_shell":
		case "core4elite_shell":
		case "core4commando_shell":
		case "core4admiral_shell":
		case "core4captain_shell":
		return "core1_light";
		
		default:
		return "";
	}
}
