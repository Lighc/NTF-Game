function tile_collision_at(_x, _y)
{
    var tile_data = tilemap_get_at_pixel(collision_tilemap, _x, _y);
    return tile_data != 0;
}

function tile_collision_rect(_x, _y)
{
    var left   = _x + bbox_left - x;
    var right  = _x + bbox_right - x;
    var top    = _y + bbox_top - y;
    var bottom = _y + bbox_bottom - y;

    return (
        tile_collision_at(left, top) ||
        tile_collision_at(right, top) ||
        tile_collision_at(left, bottom) ||
        tile_collision_at(right, bottom)
    );
}

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
var move_dir = image_angle;
var target_speed = 0;

if (keyboard_check(ord("W")))
{
	sprite_index = NTF_Walk
    if (move_speed < 3)
    {
        move_speed += 1;
    }

    target_speed = move_speed;
    move_dir = image_angle;
}
else if (keyboard_check(ord("S")))
{
	sprite_index = NTF_Walk
    if (move_speed < 1.5)
    {
        move_speed += 0.3;
    }
	
    target_speed = move_speed;
    move_dir = image_angle + 180;
}
else if (keyboard_check(vk_nokey))
{
	sprite_index = NTF_Idle
}
else
{
    move_speed = 0;
    target_speed = 0;
}

// Convert speed + direction into x/y movement
var hsp = lengthdir_x(target_speed, move_dir);
var vsp = lengthdir_y(target_speed, move_dir);

// Horizontal collision
if (hsp != 0)
{
    if (!tile_collision_rect(x + hsp, y))
    {
        x += hsp;
    }
    else
    {
        while (!tile_collision_rect(x + sign(hsp), y))
        {
            x += sign(hsp);
        }

        move_speed = 0;
    }
}

// Vertical collision
if (vsp != 0)
{
    if (!tile_collision_rect(x, y + vsp))
    {
        y += vsp;
    }
    else
    {
        while (!tile_collision_rect(x, y + sign(vsp)))
        {
            y += sign(vsp);
        }

        move_speed = 0;
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

// Healthbar