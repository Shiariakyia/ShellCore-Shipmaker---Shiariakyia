function global_variables() {
	partsData();
	global.racialPart[0] = s_parts_verdantGreen;
	global.racialPart[1] = s_parts_defectsYellow;
	global.racialPart[2] = s_parts_corelingsBlue;
	global.racialPart[3] = unknown;

	global.racialCore[0] = s_cores_verdantGreen;
	global.racialCore[1] = s_cores_defectsYellow;
	global.racialCore[2] = s_cores_corelingBlue;

	//global.racialWeapon[0] = s_wpn_verdantGreen;
	//global.racialWeapon[1] = s_wpn_defectsYellow;
	//global.racialWeapon[2] = s_wpn_corelingBlue;
	
	global.racialWeapon[0] = global.attributeWeap[0];
	global.racialWeapon[1] = global.attributeWeap[1];
	global.racialWeapon[2] = global.attributeWeap[2];
	
	global.racialAbility[0] = global.attributeAbil[0];
	//global.racialAbility[1] = s_ability;
	//global.racialAbility[2] = s_ability;
	
	global.racialSpawn[0] = global.attributeSpwn[0];
	//global.racialSpawn[1] = noone;
	//global.racialSpawn[2] = noone;
	
	global.racialPassive[0] = global.attributePass[0];
	//global.racialPassive[1] = noone;
	//global.racialPassive[2] = noone;

	global.coreArr = 0;
	global.partArr = 0;
	global.weapArr = 0;
	global.abilArr = 0;
	global.spwnArr = 0;
	global.passArr = 0;

	global.inverted = false;

	

	global.coreSkips = [];
	global.partSkips = [3];
	global.weapSkips = [];

	global.race[0] = "Verdant Confederation";
	global.race[1] = "Refitted Defects";
	global.race[2] = "Native Corelings";
	global.race[3] = "Chnono Corelings";
	global.race[4] = "Olive Scavengers";
	global.race[5] = "Elite Armada";	

	FontsData();
	
	global.activeIndex = ["Ability", "Spawn", "Weapon", "Passive"];

	global.w_index = 0
	global.w_max_index = array_length(global.racialWeapon[global.weapArr]);
	//global.w_max_index = sprite_get_number(global.racialWeapon[global.weapArr]);
	
	global.a_index = 0
	global.a_max_index = array_length(global.racialAbility[global.abilArr]);
	//global.a_max_index = sprite_get_number(global.racialAbility[global.abilArr]);
	
	global.s_index = 0
	global.s_max_index = array_length(global.racialSpawn[global.spwnArr]);
	
	global.p_index = 0
	global.p_max_index = array_length(global.racialPassive[global.passArr]);

	global.core_index = 4;
	global.core_max_index = sprite_get_number(global.racialCore[global.coreArr]);

	global.partList = [];
	global.weapList = [];
	global.statusCons = [];
	global.partCount = 0;
	
}

function global_matrix_indexes() {
	global.matrixIndex = [
		//Verdant:
		[1.0, 0.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 0.0, 1.0, 0.0,
		 0.0, 0.0, 0.0, 1.0], 
	 
		 //Defect:
		[0.0, 1.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 1.0, 0.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0], 
	 
		 //Coreling:
		[1.0, 0.0, 0.0, 0.0,
		 0.45, 0.5, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0], 
	 
		//Chronos:
		[1.0, 0.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0], 
	 
		//Scavenger:
		[0.34, 0.5, 0.2, 0.0,
		 0.34, 0.5, 0.17, 0.0,
		 0.55, 0.0, 0.58, 0.0,
		 0.0, 0.0, 0.0, 1.0], 
	 
		//Infected:
		[0.0, 1.0, 0.0, 0.0,
		 1.0, 0.0, 0.0, 0.0,
		 1.0, 0.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0], 

	];

	global.matrixManipulation = 0;

	global.matrixOpposite = [5, 2]; //for shell part denial indication when off-limit
}

function validateJson(argument0){
	var open_file = argument0;
	var temp_file = temp_directory + "shipfile.txt";
	show_debug_message(string(temp_file));
	try {
		var _filename = !file_exists(open_file) ? temp_file : open_file; // Regex: .*?(^[A-Z]{1}+:\\)
	
		var _buffer = _filename == noone ? buffer_load(temp_file) : buffer_load(_filename);
		
		
		var _string = _filename == noone ? buffer_read(_buffer, buffer_string) : buffer_read(_buffer, buffer_string);	
		show_debug_message("Value: " + _string);
		tj_decode(_string);
		
		if (string_length(tj_error_text) != 0 ) return false;
		
	} catch(_exception){
		show_debug_message("Json Validation Error: " + string(_exception)
		+ "\nString Result: \n" + string(_string)
		);
		return false;
	} finally {
		if (_buffer != noone && buffer_exists(_buffer)) buffer_delete(_buffer);
	}
	return true;
}

function LoadJSONFromFile(argument0){
	var _filename = file_exists(argument0) == true ? argument0 : noone;
	
	var _buffer = _filename == noone ? noone : buffer_load(_filename);
	var _string = _filename == noone ? argument0 : buffer_read(_buffer, buffer_string);
	if (_buffer != noone && buffer_exists(_buffer)) buffer_delete(_buffer);
	
	var _json = json_decode(_string);
	return _json;
}

function SaveStringToFile(argument0, argument1){
	var _filename = argument0;
	var _string = argument1;
	
	var _buffer = buffer_create( string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write( _buffer, buffer_string, _string);
	buffer_save( _buffer, _filename);
	buffer_delete( _buffer);
}

function validatePartAndCore(){
	try {
	for (var i = 0; i < array_length(global.partList); i++){
		if (instance_exists(global.partList[i])){
		var subject = global.partList[i];
		
		if (subject.connected == true){
			if (variable_instance_exists(subject, "coreAttr")){
				if (subject.coreAttr.nameCore == "") return false;	
			}
			if (variable_instance_exists(subject, "partAttr")){
				if (subject.partAttr.namePart == "") return false;
			}
			if (variable_instance_exists(subject, "attribute")){
				if (subject.attribute != noone && subject.attribute != undefined){
					if (subject.attribute.abilityId == noone) return false;
				}
			}
		}
		}
	}
	
	} catch (_exception){
		show_debug_message("Validate Error: " + string(_exception));
		return false;
	}
	
	return true;
}
