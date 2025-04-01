/// @description Insert description here
// You can write your code in this editor

if(attached != noone && !instance_exists(attached)) { return; }


function DrawText(){
	draw_set_halign(fa_middle);
		draw_set_valign(fa_center);
		draw_set_font(global.font04b03b_6);
		var _string = draw_text_color(x, y + 18, hoverText, c_white, hoverTextColor, c_white, hoverTextColor, 1);
		//draw_rectangle(mouse_x - (string_width(string(_string)) * 6 + 10),
						//mouse_y - (string_height(string(_string)) * 2),
						//mouse_x + (string_width(string(_string)) * 6 + 10),
						//mouse_y + (string_height(string(_string)) * 2),
						//true
						//);
}


function repeatititiveDrawEvent1(){
		if(position_meeting(mouse_x, mouse_y, self))
		{
			DrawText();
		}
}

shader_set(shdr_color_matrix);


shader_params = shader_get_uniform(shdr_color_matrix, "M");
shader_set_uniform_matrix_array(shader_params, matrixColor);
draw_self();
shader_reset();

draw_set_font(global.font04b03_6);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	draw_text_color(self.x, self.y, buttonText, c_white, c_white, c_white, c_white, 1);



if(hoverText != ""){
	if (persistentText == true) {
		DrawText();
		return;
	}
	if (array_length(global.windowBoxes) == 0){
	repeatititiveDrawEvent1();
	} else {
		if (attached == noone){
	for (var i = 0; i < array_length(global.windowBoxes); i++){
		if (count == 0 && global.isGrabbed == false){
		repeatititiveDrawEvent1();			
				}
			}
		} else {
			for(var j = 0; j < array_length(global.windowBoxes); j++){
		if ((place_meeting(attached.x, attached.y, global.windowBoxes[j]) || position_meeting(attached.x, attached.y, global.windowBoxes[j]))
		&& attached.depth == -1 && attached.selected == false
		&& global.windowBoxes[j].id != attached.id
		&& place_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), global.windowBoxes[j]) 
		) return;
		
		}
			if (place_meeting(mouse_x, mouse_y, attached)){
				repeatititiveDrawEvent1();			
			}
		}
	}
}

