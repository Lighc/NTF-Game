// Angle for looking at mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

// Get the tilemap ID once
var lay_id = layer_get_id("Walls");
collision_tilemap = layer_tilemap_get_id(lay_id);

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

// Health
hp = 100;

hit = function(_id, _damage) {
	hp -= _damage
	
	if (hp <= 0)
	{
		instance_destroy();
	}
	
	instance_destroy(_id);
}

// Speed
move_speed = 0;

x_remainder = 0;
y_remainder = 0;

// Very important: disable GameMaker built-in movement
speed = 0;
hspeed = 0;
vspeed = 0;