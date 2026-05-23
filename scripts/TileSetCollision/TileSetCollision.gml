function tile_meeting(_x, _y, _layer) {
    var _tm = layer_tilemap_get_id(_layer);

    var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (_x - x), y);
    var _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (_y - y));
    var _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (_x - x), y);
    var _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (_y - y));

    for (var _xx = _x1; _xx <= _x2; _xx++) {
        for (var _yy = _y1; _yy <= _y2; _yy++) {
            if (tile_get_index(tilemap_get(_tm, _xx, _yy))) {
                return true;
            }
        }
    }

    return false;
}