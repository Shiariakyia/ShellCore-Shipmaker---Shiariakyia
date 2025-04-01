// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sortDepthOnLoad(){
	
	var depthSort = function(inst1, inst2){ return inst2.depthNum - inst1.depthNum;	}
	array_sort(global.partList, depthSort);
	var i;
	var n = array_length(global.partList);
	for (var i = 0; i < n; i++){
	var shellparts = global.partList[i];
		with(shellparts){
			depthNum = abs(i - n) - 1;
		}
	}
}