/// @description Insert description here
// You can write your code in this editor

global_core_index = global.racialCore[race];

uvs = sprite_get_uvs(global_core_index, index);
tex = sprite_get_texture(global_core_index, index);
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
		game_restart();
		for (var i = 0; i < array_length(global.partList); i++){
			array_delete(global.partList, i, 1);
			array_delete(global.statusCons, i, 1);
		}
		
	}
}
