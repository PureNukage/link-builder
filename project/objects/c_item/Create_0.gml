/*
size_width = 5						//	Set; cells width this item takes up
size_height = 5						//	Set; cells height this item takes up
sprite = s_chainlink				//	Set; sprite for this item
states = states.placement			//	Set; inital state of this item
ports_count = 0						//	Set; holds the number of ports in this item has
*/
	
my_cells_items = ds_grid_create(size_width,size_height)
my_cells_x = []
my_cells_y = []

rotation = 0

//Ports
ports = []						
for(var i=0;i<ports_count;i++) {
	ports[i,port_object] = -1
	ports[i,port_direction] = -1
	ports[i,port_x] = 0
	ports[i,port_y] = 0
}

//Cells
center_cell_x = input.grid_x
center_cell_y = input.grid_y

topleft_cell_x = center_cell_x-floor(size_width/2)
topleft_cell_y = center_cell_y-floor(size_height/2)

bottomright_cell_x = topleft_cell_x + (size_width-1)
bottomright_cell_y = topleft_cell_y + (size_height-1)

placeable = is_placeable()

if (topleft_cell_x > -1 and topleft_cell_x < grid_width+1) and 
(topleft_cell_y > -1 and topleft_cell_y < grid_height+1) and 
(bottomright_cell_x > -1 and bottomright_cell_x < grid_width+1) and
(bottomright_cell_y > -1 and bottomright_cell_y < grid_height+1) {
	var _x, _y
	_x = gridController.grid_positions_x[topleft_cell_x]
	for(var _w=0;_w<size_width;_w++) {
		_y = gridController.grid_positions_y[topleft_cell_y]
		for(var _h=0;_h<size_height;_h++) {
			my_cells_x[_w] = _x
			my_cells_y[_h] = _y
			my_cells_items[# _w, _h] = object_index
			_y += cell_height
		}
		_x += cell_width
	}
}