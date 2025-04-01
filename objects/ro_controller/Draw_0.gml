
x = x - x % 5;
y = y - y % 5;
gpu_set_texfilter(true);
draw_set_font(global.font04b03);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
shader_set(shdr_color_matrix);
matrix = global.matrixIndex[j];
shader_params = shader_get_uniform(shdr_color_matrix, "M");
shader_set_uniform_matrix_array(shader_params, matrix);
draw_sprite_ext(global.racialPart[global.partArr], index, x, y, facing, 1, rotate_angle, c_white, 1);

//draw_text(x + 10, y + 500, global.partList);
race_weapon = global.racialWeapon[global.weapArr][global.w_index % global.w_max_index];
race_ability = global.racialAbility[global.abilArr][global.a_index % global.a_max_index];
race_spawn = global.racialSpawn[global.spwnArr][global.s_index % global.s_max_index];
race_passive = global.racialPassive[global.passArr][global.p_index % global.p_max_index];
//draw_sprite_general(s_parts, index, 25, 25, sprite_get_width(s_parts), sprite_get_height(s_parts), x, y, 1, 1, rotate_angle, c_white, c_white, c_white, c_white, 1);
if(activeIndex == "Weapon"){
	
draw_sprite(race_weapon.attributeIndex, race_weapon.indexAttr, x, y);
} else if (activeIndex == "Ability"){
draw_sprite(race_ability.attributeIndex, race_ability.indexAttr, x, y);
} else if (activeIndex == "Spawn"){
		draw_sprite(race_spawn.attributeIndex, race_spawn.indexAttr, x, y);
}
shader_reset();
draw_text_color(x + 75, y - 75, global.race[global.coreArr], c_white, c_white, c_white, c_white, 1);

draw_rectangle(x + 50, y + 50, x - 50, y - 50, true);
draw_rectangle_color(x + 48, y + 48, x - 48, y - 48, ColorArray[global.coreArr], ColorArray[k], ColorArray[global.coreArr], ColorArray[k], true);

shader_set(shdr_color_matrix);
draw_sprite(race_weapon.attributeIndex, race_weapon.indexAttr, x + 0, y + 175);
shader_reset();

draw_rectangle((x + 0) + 25, (y + 175) + 25, (x + 0) - 25, (y + 175) - 25, true);
draw_rectangle_color((x + 0) + 23, (y + 175) + 23, (x + 0) - 23, (y + 175) - 23, ColorArray[global.weapArr], ColorArray[global.coreArr], ColorArray[global.weapArr], ColorArray[global.coreArr], true);
draw_set_font(global.font04b03_6);
draw_text(x, y+210, "WEAPON");
if (race_weapon.nameAttr != ""){
	if(race_weapon.hasLevel != false){
	draw_text(x, y+217, string_upper(race_weapon.nameAttr) + " " + string(PartLevel));
	}
	else draw_text(x, y+217, string_upper(race_weapon.nameAttr));
}

shader_set(shdr_color_matrix);
draw_sprite(race_ability.attributeIndex, race_ability.indexAttr, x + 0, y + 250);
shader_reset();

draw_rectangle((x + 0) + 25, (y + 250) + 25, (x + 0) - 25, (y + 250) - 25, true);
draw_rectangle_color((x + 0) + 23, (y + 250) + 23, (x + 0) - 23, (y + 250) - 23, ColorArray[global.weapArr], ColorArray[global.coreArr], ColorArray[global.weapArr], ColorArray[global.coreArr], true);
draw_set_font(global.font04b03_6);
draw_text(x, y+285, "ABILITY");
if (race_ability.nameAttr != ""){
	if(race_ability.hasLevel != false){
	draw_text(x, y+292, string_upper(race_ability.nameAttr) + " " + string(PartLevel));
	}
	else draw_text(x, y+292, string_upper(race_ability.nameAttr));
}

if (global.s_index > 0) draw_sprite(race_spawn.iconIndex, race_spawn.iconImgIndex, x + 0, y + 325);

draw_rectangle((x + 0) + 25, (y + 325) + 25, (x + 0) - 25, (y + 325) - 25, true);
draw_rectangle_color((x + 0) + 23, (y + 325) + 23, (x + 0) - 23, (y + 325) - 23, ColorArray[global.weapArr], ColorArray[global.coreArr], ColorArray[global.weapArr], ColorArray[global.coreArr], true);
draw_set_font(global.font04b03_6);
draw_text(x, y+360, "SPAWN");
if (race_spawn.nameAttr != ""){
	if(race_spawn.hasLevel != false){
	draw_text(x, y+367, string_upper(race_spawn.nameAttr) + " " + string(PartLevel));
	}
	else draw_text(x, y+367, string_upper(race_spawn.nameAttr));
}

if (global.p_index > 0) draw_sprite(race_passive.iconIndex, race_passive.iconImgIndex, x + 0, y + 400);

draw_rectangle((x + 0) + 25, (y + 400) + 25, (x + 0) - 25, (y + 400) - 25, true);
draw_rectangle_color((x + 0) + 23, (y + 400) + 23, (x + 0) - 23, (y + 400) - 23, ColorArray[global.weapArr], ColorArray[global.coreArr], ColorArray[global.weapArr], ColorArray[global.coreArr], true);
draw_set_font(global.font04b03_6);
draw_text(x, y+435, "PASSIVE");
if (race_passive.nameAttr != ""){
	if(race_passive.hasLevel != false){
	draw_text(x, y+442, string_upper(race_passive.nameAttr) + " " + string(PartLevel));
	}
	else draw_text(x, y+442, string_upper(race_passive.nameAttr));
}

//draw_text(x + 150, y + 75, string(max_x) + " " + string(max_y) + " " + string(min_x) + " " + string(min_y));
Horizontal = ""; Vertical = "";
if(mouse_x - core_x < 0) {Horizontal = "W";}
else if(mouse_x - core_x == 0){Horizontal = "M"}
else {Horizontal = "E"}
if(mouse_y - core_y < 0) {Vertical = "N";}
else if(mouse_y - core_y == 0){Vertical = "M"}
else {Vertical = "S"}


if (mouse_x - core_x == 0 && mouse_y - core_y == 0){
	draw_set_font(global.font04b03b);
	draw_text(x, y + 100, "C");
	//draw_set_font(global.font04b03);
	draw_text(x, y + 125, string(0));
} else {
	draw_set_font(global.font04b03b);
	draw_text(x - 30, y + 100, Horizontal);
	draw_text(x + 30, y + 100, Vertical);
	//draw_set_font(global.font04b03);
	draw_text(x - 30, y + 125, string(abs(mouse_x - core_x)));
	draw_text(x + 30, y + 125, string(abs(mouse_y - core_y)));
}


//if (min_x != noone && min_y != noone && max_x != noone && max_y != noone)
//draw_rectangle(core_x + max_x, core_y + max_y, core_x + min_x, core_y + min_y, true);
draw_set_halign(fa_left);
draw_set_font(global.font04b03_6);
var text = 
string("\u00F0F0CREDITS:/\n\n"+
"\u00F0FFSPRITES ASSETS:/\n"+
"\u00F090FLASHBACKER/ \u00FAAF(SCC SKIRMISH, SCC EP1, SCC EP2 SPRITES)/\n"+
"SHIARIAKYIL \u00FAAF(MAJORITY OF ALL THE CORE SPRITES OF OTHER RACES)/\n"+
"YLLOK \u00FAAF(DRAWING SPRITES PARTS FOR THE CORELING, SCAVENGER, YELLOW DEFECTS)/\n"+
"FOEFEAR \u00FAAF(ADDITIONAL PIXELIZED SPRITES DERIVED FROM SCC REMASTERED PROJECT)/\n\n"+
"\u00F0FFPROGRAMMING:/\n"+
"ORMANUS \u00FAAF(PROVIDE A FEW ASSISTANCES IN THE FIRST STAGE OF DEVELOPING)/\n"+
"SHIARIAKYIL \u00FAAF(STILL TRYING TO FIGURE OUT HOW TO CODE AND SET UP THINGS)/\n\n"+
"\u00F0F0AUTHOR OF THIS PROGRAM:/\n"+
"SHIARIAKYIL (AKA \u00F0F8SHELL-CORE/)");
//draw_text(room_width * 0.03, room_height * 0.9, "CREDITS:\n\nSPRITES ASSETS: \nFLASHBACKER (SCC SKIRMISH, SCC EP2)\nSHIARIAKYIL\nYLLOK\nFOEFEAR\n\nPROGRAMMING:\nORMANUS (PROVIDE ASSISTANCE IN THE FIRST STAGE OF DEVELOPING)\nSHIARIAKYIL (AKA SHELL-CORE)");
draw_text_special(room_width * 0.03, room_height * 0.9, text, global.font04b03_6, c_white, -1, -1, 1, -1, 0, 0, 1);

draw_set_halign(fa_center);
if (position_meeting(mouse_x, mouse_y, o_btn_shipshot))
{
	draw_text(room_width * 0.95 + 20, room_height * 0.02 - 10, "GENERATE IMAGE");
}

if (position_meeting(mouse_x, mouse_y, o_btn_clear))
{
	draw_text(room_width * 0.95 + 20, room_height * 0.02 - 10, "CLEAR PARTS");
}

if (position_meeting(mouse_x, mouse_y, o_btn_load))
{
	draw_text(room_width * 0.95 + 20, room_height * 0.02 - 10, "LOAD DESIGN");
}

if (position_meeting(mouse_x, mouse_y, o_btn_save))
{
	draw_text(room_width * 0.95 + 20, room_height * 0.02 - 10, "SAVE DESIGN");
}
var _distY = mouse_y - y;
var _distX = mouse_x - x;

	if((_distY > (175 - 25) && _distY < (175 + 25) && _distX > (0 - 25) && _distX < (0 + 25)) ||
	(position_meeting(mouse_x, mouse_y, btnWeapNext) || position_meeting(mouse_x, mouse_y, btnWeapPrev))){ 
		draw_rectangle_color((x + 0) + 21, (y + 175) + 21, (x + 0) - 21, (y + 175) - 21, ColorArray[global.coreArr], ColorArray[global.coreArr], ColorArray[global.coreArr], ColorArray[global.coreArr], true);
	}
	if((_distY > (250 - 25) && _distY < (250 + 25) && _distX > (0 - 25) && _distX < (0 + 25)) ||
	(position_meeting(mouse_x, mouse_y, btnAbilNext) || position_meeting(mouse_x, mouse_y, btnAbilPrev))){ 
		draw_rectangle_color((x + 0) + 21, (y + 250) + 21, (x + 0) - 21, (y + 250) - 21, ColorArray[global.coreArr], ColorArray[global.coreArr], ColorArray[global.coreArr], ColorArray[global.coreArr], true);
	}
	if((_distY > (325 - 25) && _distY < (325 + 25) && _distX > (0 - 25) && _distX < (0 + 25)) ||
	(position_meeting(mouse_x, mouse_y, btnSpwnNext) || position_meeting(mouse_x, mouse_y, btnSpwnPrev))){ 
		draw_rectangle_color((x + 0) + 21, (y + 325) + 21, (x + 0) - 21, (y + 325) - 21, ColorArray[global.coreArr], ColorArray[global.coreArr], ColorArray[global.coreArr], ColorArray[global.coreArr], true);
	}
	if((_distY > (400 - 25) && _distY < (400 + 25) && _distX > (0 - 25) && _distX < (0 + 25)) ||
	(position_meeting(mouse_x, mouse_y, btnPassNext) || position_meeting(mouse_x, mouse_y, btnPassPrev))){ 
		draw_rectangle_color((x + 0) + 21, (y + 400) + 21, (x + 0) - 21, (y + 400) - 21, ColorArray[global.coreArr], ColorArray[global.coreArr], ColorArray[global.coreArr], ColorArray[global.coreArr], true);
	}
	
	
	
	
	draw_set_halign(fa_center); draw_set_valign(fa_middle); draw_set_font(global.font04b03b_6);
	
	//Status
	var drawValidatePartAndCore = validatePartAndCore() == true ? 
	draw_text_color(btnExport.x , btnExport.y + 15, "VALIDATED", make_color_rgb(0, 255, 0), make_color_rgb(0, 255, 0), make_color_rgb(0, 255, 0), make_color_rgb(0, 255, 0), 1) : 
	draw_text_color(btnExport.x , btnExport.y + 15, "INVALIDED", c_red, c_red, c_red, c_red, 1);
	
	var function validClipboard(){
		var getValidatedClip = jsonValidated ? draw_text_color(btnImport.x , btnImport.y + 15, "FORMATTABLE", make_color_rgb(0, 255, 0), make_color_rgb(0, 255, 0), make_color_rgb(0, 255, 255), make_color_rgb(0, 255, 0), 1) :
		draw_text_color(btnImport.x , btnImport.y + 15, "UNPARSEABLE", make_color_rgb(255, 255, 0), make_color_rgb(255, 255, 0), make_color_rgb(255, 255, 0), make_color_rgb(0, 255, 0), 1);
		
		return getValidatedClip;
	}
	
	var drawValidateJson = clipboard_has_text() && clipboard_get_text() != "" && clipboard_get_text() != noone ? 
    validClipboard() : draw_text_color(btnImport.x , btnImport.y + 15, "NONEXISTENT", make_color_rgb(255, 255, 255), make_color_rgb(255, 255, 255), make_color_rgb(125, 125, 125), make_color_rgb(100, 100, 100), 1);
		
	//Hover over buttons
	if(position_meeting(mouse_x, mouse_y, btnImport)) draw_text(room_width * 0.5, room_height * 0.9,
	"LEFT CLICK TO IMPORT FROM YOUR OWN COPY PASTE CLIPBOARD\n" +
	"SHIFT + LEFT CLICK TO IMPORT JSON THROUGH A TEXT OR A JSON FILE");
	
	if(position_meeting(mouse_x, mouse_y, btnExport)) draw_text(room_width * 0.5, room_height * 0.9,
	"LEFT CLICK TO COPY THEM INTO YOUR CLIPBOARD (CTRL+V TO PASTE THEM ELSEWHERE)\n" +
	"SHIFT + LEFT CLICK TO EXPORT YOUR REMASTERED FORMATTABLE JSON TO A TEXT FILE");
	
