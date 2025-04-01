/// @description Insert description here
// You can write your code in this editor
var temp_file = temp_directory + "shipfile.txt";
if(clipboard_has_text()) {
	if (jsonText != clipboard_get_text()) { jsonText = clipboard_get_text()
		
		SaveStringToFile(temp_file, jsonText);
	var performValidation = validateJson(temp_file);
	if (jsonValidated != performValidation){
		jsonValidated =  performValidation;
	}
		
	}
}

max_index = sprite_get_number(global_part_index);
global.w_max_index = array_length(global.racialWeapon[global.weapArr]);
global.a_max_index = array_length(global.racialAbility[global.abilArr]);
global.core_max_index = sprite_get_number(global_core_index);

k = global.partArr;
var _distY = mouse_y - y;
var _distX = mouse_x - x;

if(mouse_check_button_pressed(mb_left)){
	if((_distY > (175 - 25) && _distY < (175 + 25) && _distX > (0 - 25) && _distX < (0 + 25))){ 
		if(global.w_index > 0) activeIndex = "Weapon";
		else activeIndex = "None";
	}
	if(_distY > (250 - 25) && _distY < (250 + 25) && _distX > (0 - 25) && _distX < (0 + 25)){ 
		if(global.a_index > 0) activeIndex = "Ability";
		else activeIndex = "None";
	}
	if(_distY > (325 - 25) && _distY < (325 + 25) && _distX > (0 - 25) && _distX < (0 + 25)){ 
		if(global.s_index > 0) activeIndex = "Spawn";
		else activeIndex = "None";
	}
	if(_distY > (400 - 25) && _distY < (400 + 25) && _distX > (0 - 25) && _distX < (0 + 25)){ 
		if(global.p_index > 0) activeIndex = "Passive";
		else activeIndex = "None";
	}
}

if(mouse_wheel_up()){
	if((_distY > (175 - 25) && _distY < (175 + 25) && _distX > (0 - 25) && _distX < (0 + 25)) ||
		(_distY > (250 - 25) && _distY < (250 + 25) && _distX > (0 - 25) && _distX < (0 + 25)) ||
		(_distY > (325 - 25) && _distY < (325 + 25) && _distX > (0 - 25) && _distX < (0 + 25)) ||
		(_distY > (400 - 25) && _distY < (400 + 25) && _distX > (0 - 25) && _distX < (0 + 25))
	) {
		PartLevel++;
		PartLevel %= 3 + 1;
		if (PartLevel == 0) PartLevel = 1;
		}
} else if (mouse_wheel_down()){
	if((_distY > (175 - 25) && _distY < (175 + 25) && _distX > (0 - 25) && _distX < (0 + 25)) ||
		(_distY > (250 - 25) && _distY < (250 + 25) && _distX > (0 - 25) && _distX < (0 + 25)) ||
		(_distY > (325 - 25) && _distY < (325 + 25) && _distX > (0 - 25) && _distX < (0 + 25)) ||
		(_distY > (400 - 25) && _distY < (400 + 25) && _distX > (0 - 25) && _distX < (0 + 25))
	) {
		PartLevel = (PartLevel + 3 - 1) % 3;
		if (PartLevel == 0) PartLevel = 3;
		}
}


for (var i = 0; i < array_length(global.partSkips); i++){
	if (global.partArr = global.partSkips[i]){
		global.partArr = (global.partArr + 1) % array_length(global.racialPart);
	}
}

for (var i = 0; i < array_length(global.weapSkips); i++){
	if (global.weapArr = global.weapSkips[i]){
		global.weapArr = (global.weapArr + 1) % array_length(global.racialWeapon);
	}
}

for (var i = 0; i < array_length(global.coreSkips); i++){
	if (global.coreArr = global.coreSkips[i]){
		global.coreArr = (global.coreArr + 1) % array_length(global.racialCore);
	}
}

getShipDimensionSize();
		

uvs = sprite_get_uvs(global_part_index, index);
tex = sprite_get_texture(global_part_index, index);
tw = texture_get_texel_width(tex);
th = texture_get_texel_height(tex);

lft = uvs[0];
top = uvs[1];
rgt = uvs[2];
bot = uvs[3];

wdt = (rgt - lft) / tw;
hgt = (bot - top) / th;

_height = floor((hgt * abs(cos(2 * pi * rotate_angle / 360))) + (wdt * abs(sin(2 * pi * rotate_angle / 360))));
_width = floor((wdt * abs(cos(2 * pi * rotate_angle / 360))) + (hgt * abs(sin(2 * pi * rotate_angle / 360))));

with(btnBackToMenu){
	
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left))
	{
		SessionSaveShipFile();
		game_restart();
		for (var i = 0; i < array_length(global.partList); i++){
			array_delete(global.partList, i, 1);
			array_delete(global.statusCons, i, 1);
		}
		
	}
}

with(btnImport){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left))
	{
		var copy_clipboard = clipboard_has_text() && !keyboard_check_direct(vk_shift) && clipboard_get_text() != noone ? temp_file : noone;
		var open_file = keyboard_check_direct(vk_shift) ? get_open_filename("Json File|*.json|Text File|*.txt", "") : copy_clipboard;
		if(open_file != noone) ImportJson(open_file);
		
		if(copy_clipboard != noone && ro_controller.jsonValidated) clipboard_set_text(noone);
	} 
}

with(btnExport){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left))
	{
		ExportJson(keyboard_check_direct(vk_shift) ? "FILE" : "CLIP");	
		
		
	}
}

if (instance_exists(o_core)){
if (o_core.matrixManipulation == "racial"){
    j = global.coreArr;
} else if (o_core.matrixManipulation == "selection"){
	j = global.matrixManipulation;
}
}

function NextPart(){
	with(ro_controller){
		index = (index + 1) % max_index;
	}
}

function PrevPart(){
	ro_controller.index = (ro_controller.index + ro_controller.max_index - 1) % ro_controller.max_index;
}

function NextWeap(){
	global.w_index = (global.w_index + 1) % global.w_max_index;
	if (global.w_index == 0)
	ro_controller.activeIndex = "None";
}

function PrevWeap(){
	global.w_index = (global.w_index + global.w_max_index - 1) % global.w_max_index;
	if (global.w_index == 0)
	ro_controller.activeIndex = "None";
}

function NextAbil(){
	
	global.a_index = (global.a_index + 1) % global.a_max_index;
	if (global.a_index == 0)
	ro_controller.activeIndex = "None";
}

function PrevAbil(){
	
	global.a_index = (global.a_index + global.a_max_index - 1) % global.a_max_index;
	if (global.a_index == 0)
	ro_controller.activeIndex = "None";
}

function NextSpwn(){
	
	global.s_index = (global.s_index + 1) % global.s_max_index;
	if (global.s_index == 0)
	ro_controller.activeIndex = "None";
}

function PrevSpwn(){
	
	global.s_index = (global.s_index + global.s_max_index - 1) % global.s_max_index;
	if (global.s_index == 0)
	ro_controller.activeIndex = "None";
}

function NextPass(){
	
	global.p_index = (global.p_index + 1) % global.p_max_index;
	if (global.p_index == 0)
	ro_controller.activeIndex = "None";
}

function PrevPass(){
	
	global.p_index = (global.p_index + global.p_max_index - 1) % global.p_max_index;
	if (global.p_index == 0)
	ro_controller.activeIndex = "None";
}

with (btnPrtsNext){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		NextPart();
	}
}

with (btnPrtsPrev){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		PrevPart();
	}
}

with (btnWeapNext){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		ro_controller.activeIndex = "Weapon";
		NextWeap();
	}
}

with (btnWeapPrev){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		ro_controller.activeIndex = "Weapon";
		PrevWeap();
	}
}

with (btnAbilNext){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		ro_controller.activeIndex = "Ability";
		NextAbil();
	}
}

with (btnAbilPrev){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		ro_controller.activeIndex = "Ability";
		PrevAbil();
	}
}

with (btnSpwnNext){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		ro_controller.activeIndex = "Spawn";
		NextSpwn();
	}
}

with (btnSpwnPrev){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		ro_controller.activeIndex = "Spawn";
		PrevSpwn();
	}
}

with (btnPassNext){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		ro_controller.activeIndex = "Passive";
		NextPass();
	}
}

with (btnPassPrev){
	if (position_meeting(mouse_x, mouse_y, self) && mouse_check_button_released(mb_left)){
		ro_controller.activeIndex = "Passive";
		PrevPass();
	}
}