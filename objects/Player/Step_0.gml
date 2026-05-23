// Bullet Spawner Attachment
array_foreach(attached, function(_item)
{
	var _x = lengthdir_x(_item.len, _item.dir + image_angle);	
	var _y = lengthdir_y(_item.len, _item.dir + image_angle);
	
	_item.inst.x = x + _x;
	_item.inst.y = y + _y;
	_item.inst.image_angle = image_angle;
})

// Rotation towards the mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

// Movement
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

// Shooting
if (mouse_check_button(mb_left)) and (ammo > 0)
{
	if fire_cooldown <= 0
	{
		var b = instance_create_depth(BulletSpawn.x, BulletSpawn.y, 5, Bullet)
		b.speed = 10;
		b.direction = BulletSpawn.image_angle;
		
		fire_cooldown = fire_cooldown_max;
		ammo -= 1
	}
}

if fire_cooldown > 0
{
	fire_cooldown -= 1;
}

// Reloading
if (keyboard_check(ord("R")))
{
	if (mags > 0)
	{
		ammo = 30
		mags -=1
	}
}

// Collision
if (tile_meeting(x, y, layer_get_id("Walls")))
{
	speed = 0;
}