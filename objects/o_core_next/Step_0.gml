/// @description Insert description here
// You can write your code in this editor
if (instance_exists(attached)){

	if (attached.selected = false){
	instance_destroy();
	}
} 

if (!instance_exists(attached)){
	instance_destroy();
}