// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function connectionCheck(){
	for (var i = 0; i < array_length(global.partList); i++){
		if (!instance_exists(global.partList[i])) {
			array_delete(global.partList, i, 1);
			array_delete(global.statusCons, i, 1);
			ro_controller.partcount--;
		}
	}
	var openList = [];
	i = 0;
	while(i < array_length(global.partList)){
		
		with(global.partList[i]){
			if (type == "core"){
				global.statusCons[i] = "connected";
				array_push(openList, self.id);
			} else if (size > o_core.size){
				global.statusCons[i] = "forbidden";
				self.connected = false;
			} else {
				global.statusCons[i] = "disconnected";
                self.connected = false;
            }
				var part = other.id;
				if (self.id != part && self.id != noone){
					var ProxX = x - other.x;
					var ProxY = y - other.y;
					ProxX = ProxX > 0 ? ProxX : -ProxX;
					ProxY = ProxY > 0 ? ProxY : -ProxY;
					
					var p_width = part._width;
					var p_height = part._height;
					var _widthOffset = (_width + p_width) * 0.5;
					var _heightOffset = (_height + p_height) * 0.5;
					if place_meeting(x,y, part){
						if(ProxX < _widthOffset * 0.5 && ProxY < _heightOffset * 0.5)
						{
							global.statusCons[i] = "overlapped";
							part.connected = false;
							return;
						}
					}
				} 
		}
		i++;
	}
	var k = 0;
	while(k < array_length(openList)){
		i = 0;
		var entity = openList[k];
		while (i < array_length(global.partList)){
			var own = global.partList[i];
			if(own != entity){
				with(entity){
					with(own){
						if(global.statusCons[i] == "disconnected"){
							ProxX = own.x - entity.x;
							ProxY = own.y - entity.y;
							ProxX = ProxX > 0 ? ProxX : -ProxX;
							ProxY = ProxY > 0 ? ProxY : -ProxY;
							_widthOffset = (entity._width + own._width) * 0.5;
							_heightOffset = (entity._height + own._height) * 0.5;
							if place_meeting(x,y, entity){
								if(ProxX < _widthOffset && ProxY < _heightOffset)
								{
									own.connected = true;
									global.statusCons[i] = "connected";
									array_push(openList, own);
								}
							}
						} 
					}
				}
				
				
			}
			i++;
		}
		k++;
	}
	
	i = 0;
	while (i < array_length(global.statusCons)){
		own = global.partList[i];
		with(own){
		if(global.statusCons[i] == "connected")
            {
               self.connected = true;
			   self.image_alpha = 1;
            }
            else if(global.statusCons[i] == "disconnected")
            {
               self.connected = false;
			   self.image_alpha = 0.5;
            }
            else if(global.statusCons[i] == "forbidden")
            {
               self.connected = false;
			   self.image_alpha = 0.5;
            }
		}
        i++;
	}
	array_delete(openList, 0, array_length(openList));
	
}