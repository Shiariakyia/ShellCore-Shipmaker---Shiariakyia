/// @description Insert description here
// You can write your code in this editor
sprite_index = global.racialCore[global.coreArr];

if (inComic) selected_core = self.id;

matrixManipulation = c_matrixby[i];

if (matrixManipulation == "racial"){
    j = global.coreArr;
} else if (matrixManipulation == "selection"){
	j = global.matrixManipulation;
}

getHeightWidth();

if (selected == true){
	with (instance_create_depth(x - wdt / 1.5, y, -3, o_selectors)){
		attached = other.id;
		selected = other.selected;
		wdt = other.wdt;
		hgt = other.hgt;
		imgIndex = other.image_index;
		image_angle = -180;
	}
	
	with (instance_create_depth(x + wdt / 1.5, y, -3, o_selectors)){
		attached = other.id;
		selected = other.selected;
		wdt = other.wdt;
		hgt = other.hgt;
		imgIndex = other.image_index;
	}
	
	with (instance_create_depth(x, y - hgt / 1.5, -3, o_selectors)){
		attached = other.id;
		selected = other.selected;
		wdt = other.wdt;
		hgt = other.hgt;
		imgIndex = other.image_index;
		image_angle = 90;
	}
	
	with (instance_create_depth(x, y + hgt / 1.5, -3, o_selectors)){
		attached = other.id;
		selected = other.selected;
		wdt = other.wdt;
		hgt = other.hgt;
		imgIndex = other.image_index;
		image_angle = -90;
	}
}

if (keyboard_check_pressed(ord("C"))){
image_index = global.core_index;
}

shader_set(shdr_color_matrix);
//shader_params = 
shader_get_uniform(shdr_color_matrix, "cMatrixArray");
//shader_set_uniform_matrix_array(shader_params, matrix_array);
draw_self();
shader_reset();

if (connected == false){
	image_alpha = 0.5;	
} else {
	image_alpha = 1;	
}


connected = true;
//Stats
//name
coreAttr = global.core[global.coreArr][image_index];
size = coreAttr.sizeCore;
name = is_array(coreAttr.nameCore) ? coreAttr.nameCore[name_selection] : coreAttr.nameCore;
coreStringID = coreAttr.coreString;
//shell
//core
//energyRegen
//shellRegen