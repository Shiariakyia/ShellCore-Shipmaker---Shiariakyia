//searching code to apply attributes when load from older save versions 

if(owner == noone){
	
if(attribute == undefined){
	if (w_index == 0) attribute = noone;
	else
					for(var i = 0; i < array_length(global.racialWeapon); i++){
						for(var k = 0; k < array_length(global.racialWeapon[i]); k++){
							var attrData = global.racialWeapon[i][k];
								
								if(w_index == attrData.indexAttr && w_racial == attrData.attributeIndex){
									attribute = attrData;
									show_debug_message(attribute);
									break;
								}
						}
					}
					
					if(attribute == undefined)
					for(var i = 0; i < array_length(global.racialAbility); i++){
						for(var k = 0; k < array_length(global.racialAbility[i]); k++){
							var attrData = global.racialAbility[i][k];
								
								if(w_index == attrData.indexAttr && w_racial == attrData.attributeIndex){
									attribute = attrData;
									show_debug_message(attribute);
									break;
								}
						}
					}
					
				}

if (instance_exists(o_core)){
if (o_core.matrixManipulation == "racial"){
    j = global.coreArr;
} else if (o_core.matrixManipulation == "selection"){
	j = global.matrixManipulation;
}
}
//partAttr = global.part[global.partArr][image_index];
if (partAttr != noone){
partStringID = partAttr.partString;
name = partAttr.namePart;
size = partAttr.sizePart;
flippable = partAttr.flip;

} else {
	var partIndex;
	for (i = 0; i < array_length(global.racialPart); i++){
		if (sprite_index == global.racialPart[i]){
			partIndex = global.part[i];
			break;
		}
	} 
	
	partAttr = partIndex[image_index];
	partStringID = partAttr.partString;
	name = partAttr.namePart;
	size = partAttr.sizePart;
	flippable = partAttr.flip;
}

dis = distance_to_point(mouse_x, mouse_y);

if (grab==false)
{
	exit;
}
else
{
	if (selected == true){
		
	with (o_sprite){
		if (other.id != self.id){
			selected = false;
		}
		
	}
	x = mouse_x - mouse_x % 5 
	y = mouse_y - mouse_y % 5 
	dif_x = (mouse_x - x);  
	dif_y = (mouse_y - y);  
	//mouse_opacity = 2
	
	
	
	xx = mouse_x - dif_x;
	yy = mouse_y - dif_y;
	
	//sortDepthOnLoad();
	}
}

getHeightWidth();

if (connected == true){
	image_alpha = 1;
} else {
	image_alpha = 0.5;
}

	connectionCheck();
}
//Reserved for either spawning a fully built Shellcore into a comic editor or putting them on a combat simulator
else {
	x0 = x - owner.x;
	y0 = y - owner.y;
	x = owner.x + lengthdir_x(x0, owner.image_angle);
	y = owner.y + lengthdir_y(y0, owner.image_angle);
	//image_angle = image_angle - owner.image_angle;
	if(!instance_exists(owner)) instance_destroy(self);
}

	
//Stats
//Stats
//name
//size = global.part[global.partArr][global.part_index][2];
//shell
//core
//energyRegen
//shellRegen