draggable = false
grab = false
selected = false;
overlapping = false
just_created = true;
connected = false;
xx = x - x % 5 = 0
yy = y - y % 5 = 0
//tw = 0;
//th = 0;
depthNum = 1;
dif_x = 0;  
dif_y = 0;  
weapon = noone;
type = "part";
attribute = noone;
owner = noone;
flippable = true;

dis = distance_to_point(mouse_x, mouse_y);

if (instance_exists(o_core)){
if (o_core.matrixManipulation == "racial"){
    j = global.coreArr;
} else if (o_core.matrixManipulation == "selection"){
	j = global.matrixManipulation;
}
}

array_push(global.partList, self.id);
size = 0;
partName = "";
partStringID = "";
secondaryData = noone;
partAttr = noone;

rotation = image_angle;
if (instance_exists(ro_controller)) ro_controller.partcount++;
sortDepthOnLoad();
//connectionCheck();


