// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getHeightWidth(){
	uvs = sprite_get_uvs(self.sprite_index, self.image_index);
	tex = sprite_get_texture(self.sprite_index, self.image_index);
	tw = texture_get_texel_width(tex);
	th = texture_get_texel_height(tex);

	lft = uvs[0];
	top = uvs[1];
	rgt = uvs[2];
	bot = uvs[3];

	wdt = (rgt - lft) / tw;
	hgt = (bot - top) / th;

	_height = floor((hgt * abs(cos(2 * pi * image_angle / 360))) + (wdt * abs(sin(2 * pi * image_angle / 360))));
	_width = floor((wdt * abs(cos(2 * pi * image_angle / 360))) + (hgt * abs(sin(2 * pi * image_angle / 360))));
}