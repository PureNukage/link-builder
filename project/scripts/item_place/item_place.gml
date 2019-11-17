/// @param grid_w
/// @param grid_h
/// @param item_type
/// @param size_width
/// @param size_height
/// @param sprite

var _grid_x = argument[0]
var _grid_y = argument[1]
var _item_type = argument[2]
var _size_width = argument[3]
var _size_height = argument[4]
var _sprite = argument[5]

//	Place type into grid
var _x = _grid_x - floor(_size_width/2)
var _y = _grid_y - floor(_size_height/2)
	
for(var size_w=0;size_w<_size_width;size_w++) {
	_y = _grid_y - floor(_size_height/2)
	for(var size_h=0;size_h<_size_height;size_h++) {
		if _x > -1 and _y > -1 {
			gridController.grid[# _x, _y] = _item_type
		}
		_y++
	}
	_x++
}

var _x = 0
var _y = 0

_x = (_grid_x*cell_width)+cell_width
_y = (_grid_y*cell_height)+cell_height


//_x = (_grid_x*cell_width) + floor(_size_width/2)*cell_width
//_y = (_grid_y*cell_height) + floor(_size_height/2)*cell_height
var _item = instance_create_layer(_x,_y,"Instances",_item_type)
_item.sprite_index = _sprite
_item.grid_x = _grid_x
_item.grid_y = _grid_y