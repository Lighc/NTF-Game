image_angle = point_direction(x, y, mouse_x, mouse_y);
if (keyboard_check(ord("W")))
{
	if (speed < 3)
	{
		speed += 1;
	}
	
	direction = image_angle;
}
else
{
	if (keyboard_check(ord("S")))
{
	if (speed < 1.5)
	{
		speed += 0.3;
	}
	
	direction = image_angle - 180;
	}
	else
	{
		speed = 0;	
	}
}
