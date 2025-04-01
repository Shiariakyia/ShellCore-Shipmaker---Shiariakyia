// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getShipDimensionSize(){
	max_x = noone; min_x = noone;
	max_y = noone; min_y = noone;
	
	var n = array_length(global.partList);
	if (n != 0)
	for(var i = 0; i < n; i++){
	var part = global.partList[i];
	
		var X = part.x - (room_width / 2);
		var Y = part.y - (room_height / 2);
		
		if (part.connected == true){
		var _minX = X - floor(part._width / 1.5);
		var _minY = Y - floor(part._height / 1.5);
		var _maxX = X + floor(part._width / 1.5);
		var _maxY = Y + floor(part._height / 1.5);
			if (_minX < min_x || min_x == noone) min_x = _minX ;
			if (_minY < min_y || min_y == noone) min_y = _minY ;
			if (_maxX > max_x || max_x == noone) max_x = _maxX ;
			if (_maxY > max_y || max_y == noone) max_y = _maxY ;
		}
}
}