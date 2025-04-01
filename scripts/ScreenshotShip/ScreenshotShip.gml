// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenshotShip(){
	var image_file = get_save_filename("PNG Image File|*.png", "");
	if (image_file != "" && image_file != noone){
	var surf, n, i, w, h, X, Y;
	w = room_width;
	h = room_height;
	surf = surface_create(w, h);
	var connected_weapons = array_create(0);
	if (surface_exists(surf)){
		gpu_set_texfilter(true);
		shader_set(shdr_color_matrix);
		surface_set_target(surf);
		n = array_length(global.partList);
		var depthSort = function(inst1, inst2){
			return inst2.depthNum - inst1.depthNum;	
		}
	array_sort(global.partList, depthSort);
	for(i = 0; i < n; i++){
		var part = global.partList[i];
		X = part.x;
		Y = part.y;
		
		if (part.connected == true){
		draw_sprite_ext(part.sprite_index, part.image_index, X, Y, part.image_xscale, part.image_yscale, part.image_angle, c_white, part.image_alpha);
			if (part.weapon != noone){
				array_push(connected_weapons, part.weapon);
			}
		}
	}
		n = array_length(connected_weapons);
	for(i = 0; i < n; i++){
		var weap = connected_weapons[i];
		X = weap.x;
		Y = weap.y;
		draw_sprite_ext(weap.sprite_index, weap.image_index, X, Y, weap.image_xscale, weap.image_yscale, weap.image_angle, c_white, weap.image_alpha);
	}
	var canvas_w = abs(min_x) + abs(max_x);
	var canvas_h = abs(min_y) + abs(max_y);
	var x_coord = core_x + min_x;
	var y_coord = core_y + min_y;
	var screenshot = sprite_create_from_surface(surf, x_coord,y_coord,canvas_w,canvas_h,false,false,canvas_w / 2, canvas_h / 2);

	//surface_save_part()
	
	sprite_save_strip(screenshot, (string_last_pos(".png", image_file) != 0) ? image_file : image_file+".png");
	sprite_delete(screenshot);
	shader_reset();
	surface_reset_target();
	surface_free(surf);
	}
	}
}