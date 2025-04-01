if (place_meeting(x, y, ro_controller) && just_created == false)
{
	instance_destroy(self.id, false);
	if (!instance_exists(self))
	connectionCheck();
}