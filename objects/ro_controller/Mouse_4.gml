//Mouse_Opacity = 0
if (!position_meeting(mouse_x, mouse_y, o_sprite)){
var obj = instance_create_depth (x, y, 0, o_sprite);
obj.sprite_index = global.racialPart[global.partArr];
obj.image_speed = 0;
obj.image_index = index;
obj.image_angle = rotate_angle;
obj.image_xscale = facing;
obj._height = _height;
obj._width = _width;
obj.wdt = wdt;
obj.hgt = hgt;
obj.connected = false;
obj.partAttr = global.part[global.partArr][obj.image_index];
obj.partStringID = obj.partAttr.partString;
obj.partName = obj.partAttr.namePart;
obj.size = obj.partAttr.sizePart;
obj.flippable = obj.partAttr.flip;
switch(ro_controller.activeIndex){
	case "Weapon":
	obj.attribute = global.racialWeapon[global.weapArr][global.w_index % global.w_max_index];
	if (obj.attribute.hasLevel != false) obj.attribute.levelAttr = PartLevel;
	obj.w_index = obj.attribute.indexAttr;
	obj.w_racial = obj.attribute.attributeIndex;
	break;
	case "Ability":
	obj.attribute = global.racialAbility[global.abilArr][global.a_index % global.a_max_index];
	if (obj.attribute.hasLevel != false) obj.attribute.levelAttr = PartLevel;
	obj.w_index = obj.attribute.indexAttr;
	obj.w_racial = obj.attribute.attributeIndex;
	//attribute = "Speed Thrust " + level
	break;
	case "Spawn":
	obj.attribute = global.racialSpawn[global.spwnArr][global.s_index % global.s_max_index];
	if (obj.attribute.hasLevel != false) obj.attribute.levelAttr = PartLevel;
	obj.w_index = obj.attribute.indexAttr;
	obj.w_racial = obj.attribute.attributeIndex;
	//attribute = "Mini Drone"
	break;
	case "Passive":
	obj.attribute = global.racialPassive[global.passArr][global.p_index % global.p_max_index];
	if (obj.attribute.hasLevel != false) obj.attribute.levelAttr = PartLevel;
	obj.w_index = 0;
	obj.w_racial = noone;
	//attribute = "Speed " + level
	break;
	case "None":
	obj.w_index = 0;
	obj.w_racial = noone;
	obj.attribute = noone;
	break;
}

if (obj.w_index > 0){
	with(obj)
	insertWeapon();
}
obj.image_alpha = 0.5;
	with(o_sprite){
		if(other.id != obj.id){
			//depth = -1;
			depthNum += 1;
			//obj.depth = -2;
			obj.depthNum = 1;
		}
	}
sortDepthOnLoad();

}