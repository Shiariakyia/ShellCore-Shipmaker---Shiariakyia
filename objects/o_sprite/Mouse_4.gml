if (owner == noone){
selected = true;
if draggable==true{
	if (selected == true)
	grab=true;
}
else if draggable==false{
	exit;}

instance_destroy(o_flip_prts); //delete an object called o_flip_prts
instance_destroy(o_rotate_prts); //delete like ^
//connectionCheck();

if(depthNum == 1 && selected == true) { return; } else if (depthNum != 1 && selected == true) {
	depthNum = 1;
	with(o_sprite){
	if(other.selected == true && self.id != other.id)
		depthNum++;
	}
	sortDepthOnLoad();
	
	
}
}
