function scr_drawGrid() {
	var w = 1;
	draw_set_color(c_dkgray);
	depth = 10;
	for (var i = 0; i < room_height; i += 20){
		draw_line_width(0, i, room_width, i, w);	
	}

	for (var i = 0; i < room_width; i += 20){
		draw_line_width(i, 0, i, room_height, w);	
	}


}
