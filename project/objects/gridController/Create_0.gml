#macro cell_width 32
#macro cell_height 32
#macro grid_width room_width/cell_width
#macro grid_height room_height/cell_height

grid_start_x = 0
grid_start_y = 0

grid_port_x = ds_list_create()
grid_port_y = ds_list_create()
grid_port_objects = ds_list_create()

grid_items = ds_grid_create(grid_width,grid_height)
grid_objects = ds_grid_create(grid_width,grid_height)

ds_grid_set_region(grid_items,0,0,grid_width,grid_height,-1)
ds_grid_set_region(grid_objects,0,0,grid_width,grid_height,-1)

mp_grid = mp_grid_create(0,0,grid_width,grid_height,cell_width,cell_height)

grid_positions_x = []
grid_positions_y = []
var _x = grid_start_x
var _y = grid_start_y
for(var _w=0;_w<grid_width;_w++) {
	_y = grid_start_y
	for(var _h=0;_h<grid_height;_h++) {
		grid_positions_x[_w] = _x
		grid_positions_y[_h] = _y
		_y += cell_height
	}
	_x += cell_width
}