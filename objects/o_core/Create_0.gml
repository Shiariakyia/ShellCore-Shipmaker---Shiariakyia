x = x - x % 5;
y = y - y % 5;

depthNum = 0;
selected = false;
selected_core = noone;
i = 0;
//status = "connected";
type = "core";
image_speed = 0;
image_index = global.core_index;
connected = true;
weapon = noone;
coreAttr = global.core[global.coreArr][image_index];
size = coreAttr.sizeCore;
name = coreAttr.nameCore;
coreStringID = coreAttr.coreString;
array_push(global.partList, self.id);

name_selection = 0;
c_matrixby = ["racial", "selection"];
matrixManipulation = c_matrixby[i];
//array_push(global.statusCons, self.id.status);

inComic = false;
