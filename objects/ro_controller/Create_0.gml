
x = room_width - room_width + 100;
y = room_height - room_height + 100;

jsonValidated = true;
jsonText = undefined;

var red = make_color_rgb(255, 0, 0);
var green = make_color_rgb(0, 255, 0);
var blue = make_color_rgb(0, 128, 255);
var cyan = make_color_rgb(0, 255, 255);
var grey = make_color_rgb(128,128,128);
var yellow = make_color_rgb(255, 255, 0);
var olive = make_color_rgb(128,128,0);
var white = make_color_rgb(255, 255, 255);
ColorArray = [green, yellow, blue, white];

btnBackToMenu = instance_create_depth(room_width / 2, room_height * 0.95, 10, o_button);
btnBackToMenu.image_xscale *= 5; 
btnBackToMenu.buttonText = "HOME MENU";

btnImport = instance_create_depth(room_width - 125, room_height * 0.95, 10, o_button);
btnImport.image_xscale *= 3.5; 
btnImport.buttonText = "IMPORT JSON";
btnImport.matrixColor = [0.0, 1.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 1.0, 0.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0];

btnExport = instance_create_depth(room_width - 50, room_height * 0.95, 10, o_button);
btnExport.image_xscale *= 3.5; 
btnExport.buttonText = "EXPORT JSON";
btnExport.matrixColor = [0.0, 1.0, 0.0, 0.0,
		 0.0, 1.0, 0.0, 0.0,
		 1.0, 0.0, 0.0, 0.0,
		 0.0, 0.0, 0.0, 1.0];

depth = 9;

global_part_index = global.racialPart[global.partArr];
global_weap_index = global.racialWeapon[global.weapArr];
global_core_index = global.racialCore[global.coreArr];

index = 0;
max_index = sprite_get_number(global.racialPart[global.partArr]);

facing = 1;
rotate_angle = 0;

start_index = 4;
partcount = 0;

activeIndex = "None";

btnPrtsNext = instance_create_depth(x + 55, y, -3, o_next);
btnPrtsPrev = instance_create_depth(x + -55, y, -3, o_prev);


btnWeapNext = instance_create_depth(x + 35, y + 175, -3, o_next);
btnWeapPrev = instance_create_depth(x - 35, y + 175, -3, o_prev);

btnAbilNext = instance_create_depth(x + 35, y + 250, -3, o_next);
btnAbilPrev = instance_create_depth(x - 35, y + 250, -3, o_prev);

btnSpwnNext = instance_create_depth(x + 35, y + 325, -3, o_next);
btnSpwnPrev = instance_create_depth(x - 35, y + 325, -3, o_prev);

btnPassNext = instance_create_depth(x + 35, y + 400, -3, o_next);
btnPassPrev = instance_create_depth(x - 35, y + 400, -3, o_prev);

instance_create_depth(x + 25, y + 70, -3, o_btnflip);
instance_create_depth(x - 25, y + 70, -3, o_btnrotate);

var uvs = sprite_get_uvs(global_core_index, global.core_index);
var tex = sprite_get_texture(global_core_index, global.core_index);
var tw = texture_get_texel_width(tex);
var th = texture_get_texel_height(tex);

var lft = uvs[0];
var top = uvs[1];
var rgt = uvs[2];
var bot = uvs[3];

var wdt = (rgt - lft) / tw;
var hgt = (bot - top) / th;

var _height = floor((hgt * abs(cos(2 * pi * 0 / 360))) + (wdt * abs(sin(2 * pi * 0 / 360))));
var _width = floor((wdt * abs(cos(2 * pi * 0 / 360))) + (hgt * abs(sin(2 * pi * 0 / 360))));

var core = instance_create_depth(room_width / 2, room_height / 2, 0, o_core);
core._height = _height;
core._width = _width;
grid = instance_create_depth(room_width / 2, room_height / 2, 3, o_grid);
core_x = core.x;
core_y = core.y;
//core.sprite_index = global.racialCore[global.coreArr];
//core.image_speed = 0;
//core.image_index = global.core_index;
//core.image_angle = rotate_angle;
//core.image_xscale = facing;
PartLevel = 1;


var ScreenShot_Button = instance_create_depth(room_width * 0.95, room_height * 0.03333333333333333, -10, o_btn_shipshot);
var SaveButton = instance_create_depth(room_width * 0.95 + 20, room_height * 0.03333333333333333, -10, o_btn_save);
var LoadButton = instance_create_depth(room_width * 0.95 + 40, room_height * 0.03333333333333333, -10, o_btn_load);
var ClearButton = instance_create_depth(room_width * 0.95, room_height * 0.03333333333333333 + 20, -10, o_btn_clear);
