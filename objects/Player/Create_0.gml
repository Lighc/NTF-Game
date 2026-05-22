// Angle for looking at mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

walls = layer_tilemap_get_id("Floor")

// Gun Cooldown
fire_cooldown = 0;
fire_cooldown_max = 5;

// Attaching BulletSpawner to Player Sprite
attached = [];
add_attached = function (_inst)
{
	array_push(attached, {
		inst: _inst,
		len: point_distance(x, y, _inst.x, _inst.y),
		dir: point_direction(x, y, _inst.x, _inst.y)
	})
}

add_attached(BulletSpawn);

// Ammo
mags = 15;
ammo = 30;