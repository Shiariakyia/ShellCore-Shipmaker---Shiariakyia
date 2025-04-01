dis = distance_to_point(mouse_x, mouse_y);
if dis< other.dis
{
draggable = true
other.draggable = false
}
else{
draggable = choose(true,false)
if draggable == true
{
other.draggable = false
}
else{
other.draggable = true
}
}
