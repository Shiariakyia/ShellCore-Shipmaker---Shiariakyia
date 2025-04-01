/// @description Insert description here
// You can write your code in this editor
if (instance_exists(attached)){
	
x = attached.x - x % 5;
y = attached.y - y % 5;
image_alpha = attached.image_alpha;
} else if (!instance_exists(attached)){
	instance_destroy();
	if (!instance_exists(self))
	var n = array_length(global.weapList);
	for (var i = 0; i < n; i++){
		if (global.weapList[i] == self.id){
			array_delete(global.weapList, i, 1);
			break;
		}
	}
	
}
