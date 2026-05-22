if (instance_exists(Player))
{
    var target_x = Player.x - cam_w / 2;
    var target_y = Player.y - cam_h / 2;

    // Keep camera inside the room
    target_x = clamp(target_x, 0, room_width - cam_w);
    target_y = clamp(target_y, 0, room_height - cam_h);

    camera_set_view_pos(cam, target_x, target_y);
}