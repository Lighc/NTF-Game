image_angle = point_direction(x, y, mouse_x, mouse_y);
if (keyboard_check(ord("W")))
{
	if (speed < 5)
	{
		speed += 2;
	}
	
	direction = image_angle;
}
else
{
	speed = 0;
}

if (keyboard_check(ord("S")))
{
	if (speed > 0)
	{
		speed -= 0.1;
	}
}