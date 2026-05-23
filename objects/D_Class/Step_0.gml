if (instance_exists(Player))
{
	angle = point_direction(x, y, Player.x, Player.y)
	image_angle = angle;
	
	bullet_cd -=1;

	if (bullet_cd <= 0)
	{
		var b = instance_create_depth(x, y, 5, EnemyBullet)
		b.speed = 10;
		b.direction = image_angle;
		bullet_cd = bullet_cd_max;
	}
	
	distance_to_player = point_distance(x, y, Player.x, Player.y)
	
	if (distance_to_player >= 500)
	{
		move_towards_point(Player.x, Player.y, 2.5)
	}
}