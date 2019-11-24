moved = false

size_width = 5
size_height = 5
my_cells_items = ds_grid_create(size_width,size_height)
my_cells_x = []
my_cells_y = []

center_cell_x  = gridController.grid_mouse_w
center_cell_y = gridController.grid_mouse_h

topleft_cell_x = center_cell_x-floor(size_width/2)
topleft_cell_y = center_cell_y-floor(size_height/2)

var _x, _y
_x = gridController.grid_positions_x[topleft_cell_x]
for(var _w=0;_w<size_width;_w++) {
	_y = gridController.grid_positions_y[topleft_cell_y]
	for(var _h=0;_h<size_height;_h++) {
		my_cells_x[_w] = _x
		my_cells_y[_h] = _y
		my_cells_items[# _w, _h] = node
		_y += cell_height
	}
	_x += cell_width
}

sprite = s_chainlink

states = states.placement