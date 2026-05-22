f_hit = function(_id, _damage) {
	hp -= _damage
	
	if (hp <= 0)
	{
		instance_destroy();
	}
	
	instance_destroy(_id);
}

hp = 100;