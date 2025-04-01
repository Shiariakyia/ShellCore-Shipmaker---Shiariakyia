if (owner == noone){
grab = false
just_created = false;
//depth = -2;

if (selected == true){
	if (flippable == true) { with (instance_create_depth(x, y, -10, o_flip_prts)){
		attached = other.id;
		selected = other.selected;
		spr_width = other.x + other.wdt - (other.wdt * 0.25);
		spr_height = other.y + other.hgt - (other.hgt * 0.25);
	}
	}
	
	with (instance_create_depth(x, y, -10, o_rotate_prts)){
		attached = other.id;
		selected = other.selected;
		spr_width = other.x + other.wdt - (other.wdt * 0.25);
		spr_height = other.y + other.hgt - (other.hgt * 0.25);
	}
}
}
