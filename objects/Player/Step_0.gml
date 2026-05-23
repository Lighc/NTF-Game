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
// Always keep built-in movement disabled
speed = 0;
hspeed = 0;
vspeed = 0;


// Input
var move_dir = 0;
var moving = false;

if (keyboard_check(ord("W")))
{
    move_speed = min(move_speed + 1, 3);
    move_dir = image_angle;
    moving = true;
}
else if (keyboard_check(ord("S")))
{
    move_speed = min(move_speed + 0.3, 1.5);
    move_dir = image_angle + 180;
    moving = true;
}
else
{
    move_speed = 0;
}


// Calculate movement
if (moving)
{
    var dx = lengthdir_x(move_speed, move_dir);
    var dy = lengthdir_y(move_speed, move_dir);

    // Add fractional movement
    x_remainder += dx;
    y_remainder += dy;

    var move_x = round(x_remainder);
    var move_y = round(y_remainder);

    x_remainder -= move_x;
    y_remainder -= move_y;


    // Move horizontally, one pixel at a time
    var sx = sign(move_x);

    repeat (abs(move_x))
    {
        if (!place_meeting(x + sx, y, collision_tilemap))
        {
            x += sx;
        }
        else
        {
            x_remainder = 0;
            break;
        }
    }


    // Move vertically, one pixel at a time
    var sy = sign(move_y);

    repeat (abs(move_y))
    {
        if (!place_meeting(x, y + sy, collision_tilemap))
        {
            y += sy;
        }
        else
        {
            y_remainder = 0;
            break;
        }
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
if (place_meeting(x, y, collision_tilemap))
{
	move_speed = 0;	
}