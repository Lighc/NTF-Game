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
}