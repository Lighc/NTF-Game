f_hit = function(_id, _damage) {
	hp -= _damage
	
	if (hp <= 0)
	{
		instance_destroy();
	}
	
	instance_destroy(_id);
}

hp = 100;

ammo = 15;
mags = 10;

angle = 0;

bullet_cd = 30;
bullet_cd_max = 30;

var lay_id = layer_get_id("Walls");
collision_tilemap = layer_tilemap_get_id(lay_id);