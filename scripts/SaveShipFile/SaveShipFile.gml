// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveShipFile(){
var save_file = get_save_filename("SCCSM Ship File|*.sccsm", "");
if (save_file != "" && save_file != noone){
var _root_list = ds_list_create();
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

n = array_length(connected_parts);
array_sort(connected_parts, depthSort);
for (var i = 0; i < n; i++){
	var connected = connected_parts[i];
	with(connected){
		var _map = ds_map_create();
		ds_list_add(_root_list, _map);
		ds_list_mark_as_map(_root_list, ds_list_size(_root_list) - 1);
		
		var _obj = object_get_name(object_index);
		ds_map_add(_map, "obj", _obj);
		ds_map_add(_map, "x", x - ro_controller.core_x);
		ds_map_add(_map, "y", y - ro_controller.core_y);
		ds_map_add(_map, "sprite_index", sprite_index);
		if (variable_instance_exists(connected, "coreStringID")) ds_map_add(_map, "string_id", coreStringID);
		if (variable_instance_exists(connected, "partStringID")) ds_map_add(_map, "string_id", partStringID);
		ds_map_add(_map, "image_index", image_index);
		ds_map_add(_map, "image_angle", image_angle);
		ds_map_add(_map, "image_xscale", image_xscale);
		ds_map_add(_map, "image_yscale", image_yscale);
		ds_map_add(_map, "depthNum", abs(i - n) - 1); 
		ds_map_add(_map, "type", type);
		if (variable_instance_exists(connected, "attribute")) ds_map_add(_map, "attribute", attribute);
		if (variable_instance_exists(connected, "w_index")) ds_map_add(_map, "w_index", w_index);
		if (variable_instance_exists(connected, "w_racial")) ds_map_add(_map, "w_racial", w_racial);
	}
}

var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "ROOT", _root_list);

var _string = json_encode(_wrapper);
SaveStringToFile((string_last_pos(".sccsm", save_file) != 0) ? save_file : save_file + ".sccsm", _string);

ds_map_destroy(_wrapper);
show_debug_message("Ship Saved!");
}
}