/// @description Insert description here
// You can write your code in this editor
if (selected == true){
if (keyboard_check_pressed("V")){
	if clipboard_has_text()
	{
		str = clipboard_get_text();
		clipboard_set_text("");
	}	
}

if (keyboard_check_pressed("C")){
	if (str != "")
	{
		clipboard_set_text(str);
	}	
}
}
